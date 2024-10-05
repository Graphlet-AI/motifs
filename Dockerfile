# Dockerfile for a PySpark / Senzing environment with Python 3.12. The image is based on the 
# miniconda3 image and installs OpenJDK 17, Spark 3.5.1 with Hadoop 3 and Scala 2.13 and Poetry. 
# Poetry then installs the Python dependencies specified in the pyproject.toml/poetry.lock files
FROM continuumio/miniconda3:main

RUN apt update && \
    apt-get install -y curl apt-transport-https openjdk-17-jdk-headless wget build-essential git jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-arm64

# Set environment variables
ENV SPARK_VERSION=3.5.3
ENV HADOOP_VERSION=3
ENV SCALA_VERSION=2.13

# Download and install Spark
RUN wget -O spark.tgz https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}-scala${SCALA_VERSION}.tgz && \
    tar -xvzf spark.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}-scala${SCALA_VERSION} /opt/spark && \
    rm spark.tgz
ENV SPARK_HOME=/opt/spark

# Install Python packages via Poetry
WORKDIR /motifs
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"
COPY pyproject.toml poetry.lock /motifs/
RUN poetry config virtualenvs.create false && \
    poetry config installer.max-workers 10 && \
    poetry install --no-dev --no-interaction --no-ansi -vvv && \
    poetry cache clear pypi --all -n

# Create a non-root user to run things
RUN useradd -m ubuntu && \
    chown -R ubuntu:ubuntu /motifs

# Warpify any subshells - https://warp.dev
COPY config/warp.sh /home/ubuntu/
RUN cat /home/ubuntu/warp.sh >> /home/ubuntu/.bashrc

USER ubuntu

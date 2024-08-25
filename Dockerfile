# Usar a imagem base do OpenJDK com Python
FROM openjdk:8-jdk-slim

# Definir variáveis de ambiente para o Spark
ENV SPARK_VERSION=3.4.1
ENV HADOOP_VERSION=3
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin

# Instalar dependências
RUN apt-get update && \
    apt-get install -y curl python3 python3-pip && \
    apt-get clean

# Baixar e instalar o Spark com verificação
RUN curl -fSL "https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz" -o /tmp/spark.tgz && \
    mkdir -p /opt/spark && \
    tar -xzvf /tmp/spark.tgz -C /opt/spark --strip-components=1 && \
    rm /tmp/spark.tgz

# Instalar PySpark e Jupyter
RUN pip3 install pyspark jupyter

# Diretório de trabalho
WORKDIR /app

# Copiar arquivos do projeto para o container
COPY . /app

# Expor portas necessárias
EXPOSE 7077 8080 8888

# Comando para rodar o Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]


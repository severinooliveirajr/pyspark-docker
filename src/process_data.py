from pyspark.sql import SparkSession
from pyspark.sql.functions import lit, col
from pyspark.sql import functions as F 

# Inicializar a SparkSession
spark = SparkSession.builder \
    .appName("PySpark Data Processing") \
    .master("local[*]") \
    .getOrCreate()

# Ler o arquivo TXT
df = spark.read.csv("data/input.txt", header=True, sep=",")

# Exibir o DataFrame original
df.show()

# Enriquecer o DataFrame com algumas colunas adicionais
# Suponhamos que queremos adicionar uma coluna com um valor fixo e outra com uma transformação
df_enriched = df.withColumn("idade", F.floor(F.months_between(F.current_date(), F.to_date(col("data_nascimento")))/12))

# Exibir o DataFrame enriquecido
df_enriched.show()

# Salvar o DataFrame enriquecido em um arquivo Parquet
df_enriched.write.parquet("data/enriched_data.parquet")

# Parar a SparkSession
spark.stop()


from pyspark.sql import SparkSession

# Initialize Spark session
spark = SparkSession.builder.appName("RepartitionExample").getOrCreate()

# Create a sample DataFrame from a list of tuples
data = [
    ("Alice", "HR", 3000),
    ("Bob", "IT", 4000),
    ("Cathy", "Finance", 3500),
    ("David", "IT", 4200),
    ("Eva", "HR", 3100),
    ("Frank", "Finance", 3300)
]

columns = ["name", "department", "salary"]

df = spark.createDataFrame(data, columns)

# Check original number of partitions
print("Original partitions:", df.rdd.getNumPartitions())

# Repartition the DataFrame to 4 partitions
df_repart = df.repartition(4)

print("Partitions after repartition:", df_repart.rdd.getNumPartitions())

# Repartition based on a column (e.g., department)
df_by_dept = df.repartition(3, df["department"])

print("Partitions after repartition by column:", df_by_dept.rdd.getNumPartitions())

# Show a sample result
df_by_dept.show()

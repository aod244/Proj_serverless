import localstack_client.session as boto3

conn = c.lient('s3')
AWS_REGION = "eu-north-1"

client = boto3.client("s3", region_name=AWS_REGION)

response = client.list_buckets()

print("Listing Amazon S3 Buckets:")

for bucket in response['Buckets']:
    print(f"-- {bucket['Name']}")
import localstack_client.session as boto3

client = boto3.client('s3')

bucket_name = input("Podaj nazwe wiaderka: ")
location = {'LocationConstraint': 'eu-north-1'}

response = client.create_bucket(Bucket=bucket_name, CreateBucketConfiguration=location)

print("Wiaderko zostalo stworzone :)")

response = client.list_buckets()

print("Listing Amazon S3 Buckets:")

for bucket in response['Buckets']:
    print(f"-- {bucket['Name']}")
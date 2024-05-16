import boto3

# Let's use Amazon S3
s3 = boto3.resource('s3')

# Print out bucket names
for bucket in s3.buckets.all():
    print(bucket.name)

    # Upload a new file
with open('test.jpg', 'rb') as data:
    s3.Bucket('abbeybototest').put_object(Key='test.jpg', Body=data)

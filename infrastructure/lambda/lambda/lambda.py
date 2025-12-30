import boto3
import json
import os 

kinesis = boto3.client("kinesis")
STREAM = os.environ.get("STREAM")

def handler(event, context):    
    # Kinesis processing
    results = []
    print("Event: ", event)
    print("================")
    print("Stream: ", STREAM)
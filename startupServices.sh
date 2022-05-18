#!/bin/bash
# Configure localstack aws services with examples

sleep 30
aws --endpoint-url=http://awsLocalStack:4566 sqs create-queue --queue-name demoQueue
aws --endpoint-url=http://awsLocalStack:4566 sns create-topic --name demoTopic
aws --endpoint-url=http://awsLocalStack:4566 sqs list-queues
aws --endpoint-url=http://awsLocalStack:4566 sns list-topics
aws --endpoint-url=http://awsLocalStack:4566 dynamodb create-table --cli-input-json file://dynamodbTables/test.json
aws --endpoint-url=http://awsLocalStack:4566 dynamodb list-tables
aws --endpoint-url=http://awsLocalStack:4566 sns publish --topic-arn arn:aws:sns:sa-east-1:000000000000:demoTopic --message "Hello World"
aws --endpoint-url=http://awsLocalStack:4566 sns publish --topic-arn arn:aws:sns:sa-east-1:000000000000:demoTopic --message file://sns/message.txt
tail -f /dev/null
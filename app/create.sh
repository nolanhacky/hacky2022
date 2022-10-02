aws cloudformation create-stack \
--stack-name CloudformationPOC \
--template-body file://webapp.yml \
--parameters file://parameters.json \
--region=us-east-1 \
--capabilities CAPABILITY_NAMED_IAM
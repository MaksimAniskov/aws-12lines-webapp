set CLOUDFORMATION_STACK_NAME=aws-12lines-webapp
set TMP_ARTIFACTS_BUCKET=aniskov.cloudformation-artifacts
set AWS_CLI_PARAMS=--region eu-west-1 --profile maksimaniskovMaksim

aws %AWS_CLI_PARAMS% cloudformation package --template-file CloudFormation.yml --s3-bucket %TMP_ARTIFACTS_BUCKET% --output-template-file CloudFormation-packaged.yml
aws %AWS_CLI_PARAMS% cloudformation deploy --template-file CloudFormation-packaged.yml --stack-name %CLOUDFORMATION_STACK_NAME% --capabilities CAPABILITY_IAM
aws %AWS_CLI_PARAMS% cloudformation describe-stacks --stack-name %CLOUDFORMATION_STACK_NAME%

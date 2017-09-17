set USER_POOL_ID=eu-west-1_xxxxxxxxx
set COGNITO_CLIENT_ID=xxxxxxxxxxxxxxxxxxxxxxxxxx
set USER_POOL_DOMAIN=12lines-webapp
set CALLBACK_URL=https://aniskov.com/aws-12lines-webapp/
set AWS_CLI_PARAMS=--region eu-west-1 --profile maksimaniskovMaksim

aws %AWS_CLI_PARAMS% cognito-idp update-user-pool --user-pool-id %USER_POOL_ID% --auto-verified-attributes email --verification-message-template file://verification-message-template.json --policies file://policies.json
aws %AWS_CLI_PARAMS% cognito-idp update-user-pool-client --user-pool-id %USER_POOL_ID% --client-id %COGNITO_CLIENT_ID% --supported-identity-providers COGNITO --callback-urls "[\"%CALLBACK_URL%\"]" --logout-urls "[\"%CALLBACK_URL%\"]" --allowed-o-auth-flows code --allowed-o-auth-scopes openid
aws %AWS_CLI_PARAMS% cognito-idp create-user-pool-domain --user-pool-id %USER_POOL_ID% --domain %USER_POOL_DOMAIN%

TENANT_ID="7e3a37b3-c173-4b4c-95b0-59c3231790d5"
SUBSCRIPTION_ID="6f4bd109-9efb-46c7-8fe8-4750d5256f98"

az login -t $TENANT_ID --use-device-code
az account set -s $SUBSCRIPTION_ID
az account show

NUM=$RANDOM
LOCATION="eastus"
PREFIX="iotc"
RESOURCE_GROUP_NAME="$PREFIX-$NUM"
APP_NAME="$PREFIX-app-$NUM"
APP_TEMPLATE_NAME="iotc-meter"
USER_EMAIL="$NUM@contoso.com"

az group create -l $LOCATION -n $RESOURCE_GROUP_NAME
az iot central app create -g $RESOURCE_GROUP_NAME -n $APP_NAME -s $APP_NAME --template $APP_TEMPLATE_NAME

# If you and the subscription are created in the same $TENANT_ID, skip these steps.
# If you are not created in $TENANT_ID, find your $HOME_TENANT_ID login again to get "correct" token.
# 
# az login -t $HOME_TENANT_ID --use-device-code
# az account show

az rest -m put -u https://$APP_NAME.azureiotcentral.com/api/users/$NUM \
--url-parameters api-version=1.0 \
--resource https://apps.azureiotcentral.com \
--body \
'{
    "type": "email",
    "roles": [
        {
            "role": "ca310b8d-2f4a-44e0-a36e-957c202cd8d4"
        }
    ],
    "email": "'$USER_EMAIL'"
}'
TENANT_ID="7e3a37b3-c173-4b4c-95b0-59c3231790d5"
SUBSCRIPTION_ID="6f4bd109-9efb-46c7-8fe8-4750d5256f98"

az login -t $TENANT_ID --use-device-code
az account set -s $SUBSCRIPTION_ID
az account show

NUM=$RANDOM
LOCATION="eastus"
PREFIX="iotc-template"
RESOURCE_GROUP_NAME="$PREFIX-$NUM"
APP_NAME="$PREFIX-app-$NUM"
APP_TEMPLATE_NAME="iotc-meter"
USER_EMAIL="$NUM@contoso.com"

az group create -l $LOCATION -n $RESOURCE_GROUP_NAME

az group deployment create \
    --name "$PREFIX-deployment-$NUM" \
    --resource-group $RESOURCE_GROUP_NAME \
    --template-file "template.json" \
    --parameters "location=$LOCATION" \
                 "name=$APP_NAME" \
                 "manifest=$APP_TEMPLATE_NAME" \
                 "user=$USER_EMAIL"
# Azure IoTCentral

The example `create.sh` shows how to automate below steps programmatically without using the UX:

1. Azure login
2. Pick subscription
3. Create iotcentral app (control plane)
4. Add a user (data plane)
5. Create a simulated device (data plane)


---

# ARM Template 

The example `deploy.sh` shows how to create multiple users during app creation time using arm template:

1. Azure login
2. Pick subscription
3. Create iotcentral app and additional users via arm template (control plane)
4. Create devices (data plane)

---


### Azure IoT Central REST API reference
https://docs.microsoft.com/en-us/rest/api/iotcentral/
# Ejecutar Terraform
1. Nos ubicamos en la carpeta del main.tf
2. Debemos abrir nuestra cuenta de azure

```
az login
```
- cuando se cierre el navegador, en la consola se mostrará los datos de la subscripcion
```
[
    {
        "cloudName": "<CLOUD-NAME>",
        "homeTenantId": "<HOME-TENANT-ID>",
        "id": "<SUBSCRIPTION-ID>",
        "isDefault": true,
        "managedBy Tenants": [],
        "name": "<SUBSCRIPTION-NAME>",
        "state": "Enabled",
        "tenantId": "<TENANT-ID>",
        "user": {
            "name": "<YOUR-USERNAME@DOMAIN.COM>",
            "type": "user"
        }
    }
]
```
- vamos a enviar el id de la subscription

```
az account set --subscription "<SUBSCRIPTION-ID>"
```
- Un servicio principal es una aplicacion dentro de Azure Active Directory con los tokens de autenticación que terraform necesita para realizar acciones en su nombre. Actualice el <SUBSCRIPTION_ID> con el ID de suscripción que especificó en el paso anterior
```
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
```
```
Creating 'Contributor' role assignment under scope '/subscriptions/<SUBSCRIPTION_ID>
The output includes credentials that you must protect. Be sure that you do not include these crede

{
    "appId": "xxxxXXX-XXX-XXXX-XXXX-XXXXXXXXXX",
    "displayName": "azure-cli-2022-xxxx",
    "password": "XXXXXXXXXXXXXXXXX",
    "tenant": "XXXXX-XXXX-XXXXX-XXXX-XXXXX"
}
```

- Creamos las variables de entorno

Linux
```
export ARM_CLIENT_ID="<SERVICE PRINCIPAL_APPID>"
export ARM_CLIENT_SECRET="<SERVICE PRINCIPAL_PASSWORD>"
export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
export ARM_TENANT_ID="<TENANT_ID>"
```
 Windows

```
$env: ARM_CLIENT_ID="<SERVICE_PRINCIPAL_APPID>"
$env: ARM_CLIENT_SECRET="<SERVICE PRINCIPAL_PASSWORD>"
$env: ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
$env: ARM_TENANT_ID="<TENANT_ID>"
```

3. Podemos iniciar el proyecto en terraform, nos ubicamos en la carpeta raiz

```
terraform init
```

```
terraform plan
```

```
terraform apply
```
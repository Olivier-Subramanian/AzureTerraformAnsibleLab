 variable subscription_id {
     description = "Azure Subscription Id"
     default = "ee3982b8-8edd-4051-b350-4168df355082"
 }

 variable client_id {
     description = "The appId of the Service Principal for use with Terraform"
     default = "94c160e3-3caa-4bc7-b8ef-312420ab3eaa"
 }

 variable client_secret {
     description = "The password of the Service Principal for use with Terraform"
     default = "50f81831-059a-4e92-bb68-d6dac2206b46"
 }

variable tenant_id {
    description = "The Tenant id for the Azure Subscription"
    default = "72f988bf-86f1-41af-91ab-2d7cd011db47"
}

variable StudentId {
    description = "The unique number for the student in this Lab (1-254)"
    default = "100"
}

variable azure_region {
    description = "The azure region to deploy to e.g., northeurope"
    default = "westeurope"
}

variable admin_password {
    description = "The administrator password for the VMs"
    default = "demo@password01"
}
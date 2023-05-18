// The name of the workloard that is being deployed. Up to 10 characters long. This wil be used as part of the naming convention (i.e. as defined here: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming) 
workloadName = "lzaaca"
//The name of the environment (e.g. "dev", "test", "prod", "preprod", "staging", "uat", "dr", "qa"). Up to 8 characters long.
environment                           = "dev"
tags                                  = {}
spokeResourceGroupName                = ""
vnetAddressPrefixes                   = ["10.1.0.0/22"]
infraSubnetAddressPrefix              = "10.1.0.0/23"
infraSubnetName                       = "snet-infra"
privateEndpointsSubnetAddressPrefix   = "10.1.2.0/24"
applicationGatewaySubnetAddressPrefix = "10.1.3.0/24"
selfHostedRunnerAddressPrefix         = "10.1.4.0/24"
hubVnetId                             = "<Hub VNET ID>"
securityRules = [
  {
    "name" : "Allow_Internal_AKS_Connection_Between_Nodes_And_Control_Plane_UDP",
    "description" : "internal AKS secure connection between underlying nodes and control plane..",
    "protocol" : "Udp",
    "sourceAddressPrefix" : "VirtualNetwork",
    "sourcePortRange" : "*",
    "destinationAddressPrefix" : "AzureCloud.eastus",
    "destinationPortRanges" : ["1194"],
    "access" : "Allow",
    "priority" : 100,
    "direction" : "Outbound"
  },
  {
    "name" : "Allow_Internal_AKS_Connection_Between_Nodes_And_Control_Plane_TCP",
    "description" : "internal AKS secure connection between underlying nodes and control plane..",
    "protocol" : "Tcp",
    "sourceAddressPrefix" : "VirtualNetwork",
    "sourcePortRange" : "*",
    "destinationAddressPrefix" : "AzureCloud.eastus",
    "destinationPortRanges" : ["9000"],
    "access" : "Allow",
    "priority" : 110,
    "direction" : "Outbound"
  },
  {
    "name" : "Allow_Azure_Monitor",
    "description" : "Allows outbound calls to Azure Monitor.",
    "protocol" : "Tcp",
    "sourceAddressPrefix" : "VirtualNetwork",
    "sourcePortRange" : "*",
    "destinationAddressPrefix" : "AzureCloud.eastus",
    "destinationPortRanges" : ["443"],
    "access" : "Allow",
    "priority" : 120,
    "direction" : "Outbound"
  },
  {
    "name" : "Allow_Outbound_443",
    "description" : "Allowing all outbound on port 443 provides a way to allow all FQDN based outbound dependencies that don't have a static IP",
    "protocol" : "Tcp",
    "sourceAddressPrefix" : "VirtualNetwork",
    "sourcePortRange" : "*",
    "destinationAddressPrefix" : "*",
    "destinationPortRanges" : ["443"],
    "access" : "Allow",
    "priority" : 130,
    "direction" : "Outbound"
  },
  {
    "name" : "Allow_NTP_Server",
    "description" : "NTP server",
    "protocol" : "Udp",
    "sourceAddressPrefix" : "VirtualNetwork",
    "sourcePortRange" : "*",
    "destinationAddressPrefix" : "*",
    "destinationPortRanges" : ["123"],
    "access" : "Allow",
    "priority" : 140,
    "direction" : "Outbound"
  },
  {
    "name" : "Allow_Container_Apps_control_plane",
    "description" : "Container Apps control plane",
    "protocol" : "Tcp",
    "sourceAddressPrefix" : "VirtualNetwork",
    "sourcePortRange" : "*",
    "destinationAddressPrefix" : "*",
    "destinationPortRanges" : ["5671", "5672"],
    "access" : "Allow",
    "priority" : 150,
    "direction" : "Outbound"
  }
]

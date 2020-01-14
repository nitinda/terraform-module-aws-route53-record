# Terraform Module : terraform-module-aws-route53-record


## General

_This module may be used to create_ **_Route53 Record_** _resources in AWS cloud provider......_



---


## Prerequisites

_This module needs_ **_Terraform 0.12.19_** _or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._



---


## Features Branches

_Below we are able to check the resources that are being created as part of this module call:_

* **_Route53 Record_**


---

## Usage

## Using this repo

_To use this module, add the following call to your code:_

_Example for_ **_Public Route53 Zone Domain_**

```tf


module "autoscaling_group" {
  source = "git::https://github.com/nitinda/terraform-module-aws-route53-zone.git?ref=master"

  providers = {
    aws = aws.services
  }
  
  name          = "example.test.org"
  comment       = "Route53 Zone"
  force_destroy = true
  tags          = var.tags
}


```



---

## Inputs

_The variables required in order for the module to be successfully called from the deployment repository are the following:_


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|
| **_zone\_id_** | _The ID of the hosted zone_ | _string_ | **_Required_** |
| **_name_** | _The name of the record_ | _string_ | **_Required_** |
| **_type_** | _The record type_ | _string_ | **_Required_** |
| **_ttl_** | _The TTL of the record_ | _number_ | **_Required_** |
| **_records_** | _A string list of records_ | _string_ | **_Required_** |
| **_failover\_routing\_policy_** | _A block indicating the routing behavior_ | _map(string)_ | **_Optional_** |
| **_geolocation\_routing\_policy_** | _A block indicating the routing behavior_ | _map(string)_ | **_Optional_** |
| **_latency\_routing\_policy_** | _A block indicating the routing behavior_ | _map(string)_ | **_Optional_** |
| **_weighted\_routing\_policy_** | _A block indicating the routing behavior_ | _map(string)_ | **_Optional_** |




## Outputs

* **_zone\_id_**
* **_name\_servers_**




### Usage

_In order for the variables to be accessed on module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```

_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
data.terraform_remote_state.<module_name>.<output_variable_name>

```


## Authors
_Module maintained by Module maintained by the -_ **_Nitin Das_**

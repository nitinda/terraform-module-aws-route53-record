variable "zone_id" {
  description = "The ID of the hosted zone to contain this record"
}

variable "name" {
  description = "The name of the record"
}

variable "type" {
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT"
}

variable "ttl" {
  description = "The TTL of the record"
  type        = number
}

variable "records" {
  description = "A string list of records. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add \"\" inside the Terraform configuration string."
}

variable "set_identifier" {
  description = "Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted"
  default      = null
}

variable "health_check_id" {
  description = "The health check the record should be associated with"
  default      = null
}

variable "alias" {
  description = "An alias block. Conflicts with ttl and records"
  type        = map(string)
  default     = {}
}

variable "failover_routing_policy" {
  description = "A block indicating the routing behavior when associated health check fails"
  type        = any
  default     = {}
}

# variable "geolocation_routing_policy" {
#   description = "A block indicating a routing policy based on the geolocation of the requestor"
#   type        = map(string)
#   default     = {}
# }

variable "latency_routing_policy" {
  description = "A block indicating a routing policy based on the latency between the requestor and an AWS region"
  type        = any
  default     = {}
}

variable "weighted_routing_policy" {
  description = "A block indicating a weighted routing policy"
  type        = any
  default     = {}
}

variable "multivalue_answer_routing_policy" {
  description = "Set to true to indicate a multivalue answer routing policy. Conflicts with any other routing policy."
  type        = bool
  default     = false
}

variable "allow_overwrite" {
  description = "Allow creation of this record in Terraform to overwrite an existing record, if any."
  type        = bool
  default     = false
}


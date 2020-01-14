variable "zone_id" {
  description = "The ID of the hosted zone to contain this record"
}

variable "name" {
  description = "The name of the record"
}

variable "type" {
  description = "The record type"
}

variable "ttl" {
  description = "description"
  type        = number
}

variable "records" {
  description = "A string list of records"
  type        = list(string)
}

variable "failover_routing_policy" {
  description = "A block indicating the routing behavior when associated health check fails"
  type        = map(string)
  default     = []
}

variable "geolocation_routing_policy" {
  description = "A block indicating a routing policy based on the geolocation of the requestor"
  type        = map(string)
  default     = []
}

variable "latency_routing_policy" {
  description = "A block indicating a routing policy based on the latency between the requestor and an AWS region"
  type        = map(string)
  default     = []
}

variable "weighted_routing_policy" {
  description = "A block indicating a weighted routing policy"
  type        = map(string)
  default     = []
}
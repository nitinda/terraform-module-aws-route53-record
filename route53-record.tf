resource "aws_route53_record" "route53_record" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  ttl     = var.ttl
  records = var.records
  
  ## Weighted routing
  dynamic "weighted_routing_policy" {
    for_each = length(var.weighted_routing_policy) == 0 ? [] : var.weighted_routing_policy
    content {
      weight = weighted_routing_policy.value.weight
    }
  }

  ## Failover routing
  dynamic "failover_routing_policy" {
    for_each = length(var.failover_routing_policy) == 0 ? [] : var.failover_routing_policy
    content {
      type = failover_routing_policy.value.type
    }
  }
  
  ## Geolocation routing
  dynamic "geolocation_routing_policy" {
    for_each = length(var.geolocation_routing_policy) == 0 ? [] : var.geolocation_routing_policy
    content {
      continent   = lookup(geolocation_routing_policy.value, "continent", null)
      country     = lookup(geolocation_routing_policy.value, "country", null)
      subdivision = lookup(geolocation_routing_policy.value, "subdivision", null)
    }
  }

  ## Latency routing
  dynamic "latency_routing_policy" {
    for_each = length(var.latency_routing_policy) == 0 ? [] : var.latency_routing_policy
    content {
      region = latency_routing_policy.value.region
    }
  }
}
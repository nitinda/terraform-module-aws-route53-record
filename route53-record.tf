resource "aws_route53_record" "route53_record" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  ttl     = var.ttl
  records = var.records
  
  dynamic "alias" {
    for_each = var.alias
    content {
      evaluate_target_health = alias.value.evaluate_target_health
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
    }
  }
  set_identifier = var.set_identifier

  ## Weighted routing
  dynamic "weighted_routing_policy" {
    for_each = var.weighted_routing_policy
    content {
      weight = weighted_routing_policy.value.weight
    }
  }

  ## Failover routing
  dynamic "failover_routing_policy" {
    for_each = var.failover_routing_policy
    content {
      type = lookup(failover_routing_policy.value, "type", null)
    }
  }

  # ## Geolocation routing
  # dynamic "geolocation_routing_policy" {
  #   for_each = var.geolocation_routing_policy == {} ? [] : [var.geolocation_routing_policy]
  #   content {
  #     continent   = lookup(geolocation_routing_policy.value, "continent", null)
  #     country     = lookup(geolocation_routing_policy.value, "country", null)
  #     subdivision = lookup(geolocation_routing_policy.value, "subdivision", null)
  #   }
  # }

  # ## Latency routing
  # dynamic "latency_routing_policy" {
  #   for_each = var.latency_routing_policy == {} ? [] : [var.latency_routing_policy]
  #   content {
  #     region = lookup(latency_routing_policy.value, "region", null)
  #   }
  # }
}


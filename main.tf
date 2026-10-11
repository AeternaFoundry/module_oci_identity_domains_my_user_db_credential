resource "oci_identity_domains_my_user_db_credential" "identity_domains_my_user_db_credentials" {
  for_each = var.identity_domains_my_user_db_credentials

  db_password                  = each.value.db_password
  idcs_endpoint                = each.value.idcs_endpoint
  schemas                      = each.value.schemas
  authorization                = each.value.authorization
  description                  = each.value.description
  expires_on                   = each.value.expires_on
  ocid                         = each.value.ocid
  resource_type_schema_version = each.value.resource_type_schema_version
  status                       = each.value.status

  dynamic "tags" {
    for_each = each.value.tags != null ? each.value.tags : []
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "user" {
    for_each = each.value.user != null ? [each.value.user] : []
    content {
      ocid  = user.value.ocid
      value = user.value.value
    }
  }
}


#############################################################################
### Resource manifests for 3 namespaces reusing the application naming    ###
### feel free to change anything and to implement any function or method  ###
#############################################################################



resource "kubernetes_namespace" "test" {
metadata{  
  
  for_each  = var.apps    ### interation with elements
 ### for_each = {for i, val in local.apps3: i => val}
  ###for_each  = toset(var.apps)
  ###name  = each.value                                          ### need interation with values 
  }
}

/*

resource "kubernetes_namespace" "map" {
  for_each      = local.apps3
  name = each.value
  ###name               = each.key
  name           = each.value.name
  tier           = each.value.tier
  owner           = each.value.owner
  serviceClass           = each.value.serviceClass
  storage_class      = "REGIONAL"
  bucket_policy_only = each.value.bucket_policy_only
}
*/

/*resource "kubernetes_secret" "apps" {     ### use secret to protect data (7)
  metadata {
    name = "basic-auth"
  }

  data = {
    "database_pass" = var.secret_app.database_pass
    "auth"     = "base64encode"
  }
}
*/





/*
resource "kubernetes_namespace" "app1" {
  metadata {
    name = var.app1.name
    labels = {
      name  = var.app1.name
      tier  = var.app1.tier
      owner = var.app1.owner
    }
    annotations = {
      "serviceClass"       = var.app1.serviceClass
      "loadBalancer/class" = true
    }
  }
}

resource "kubernetes_namespace" "app2" {
  metadata {
    name = var.app2.name
    labels = {
      name  = var.app2.name
      tier  = var.app2.tier
      owner = var.app2.owner
    }
    annotations = {
      "serviceClass"       = var.app2.serviceClass
      "loadBalancer/class" = true
    }
  }
}

resource "kubernetes_namespace" "app3" {
  metadata {
    name = var.app3.name
    labels = {
      name  = var.app3.name
      tier  = var.app3.tier
      owner = var.app3.owner
    }
    annotations = {
      "serviceClass"       = var.app3.serviceClass
      "loadBalancer/class" = false
    }
  }
}
*/

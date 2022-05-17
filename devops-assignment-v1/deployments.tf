#############################################################################
### Deployment manifests for 3 applications (frontend, backend, database) ###
### feel free to change anything and to implement any function or method  ###
#############################################################################


resource "kubernetes_deployment" "app1" {
  metadata {
    name      = var.app1.name
    namespace = var.app1.name
    labels = {
      name = var.app1.name
      tier = var.app1.tier
    }
  }
  spec {
    selector {
      match_labels = {
        name = var.app1.name
        tier = var.app1.tier
      }
    }
    template {
      metadata {
        name = var.app1.name
        labels = {
          name = var.app1.name
          tier = var.app1.tier
        }
      }
      spec {
        container {
          name  = var.app1.name
          image = "nginx"
          resources {          ### manage resources for pods (4)
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

/*
resource "kubernetes_horizontal_pod_autoscaler" "example" {
  metadata {
    name = "terraform-autoscale"
  }

  spec {
    max_replicas = 10
    min_replicas = 8

    scale_target_ref {
      kind = "Deployment"
      name = "MyApp"
    }
  }
}

*/
resource "kubernetes_deployment" "app2" {
  metadata {
    name      = var.app2.name
    namespace = var.app2.name
    labels = {
      name = var.app2.name
      tier = var.app2.tier
    }
  }
  spec {
    selector {
      match_labels = {
        name = var.app2.name
        tier = var.app2.tier
      }
    }
    template {
      metadata {
        name = var.app2.name
        labels = {
          name = var.app2.name
          tier = var.app2.tier
        }
      }
      spec {
        container {
          name  = var.app2.name
          image = "nginx"
          resources {          ### manage resources for pods (4)
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "app3" {
  metadata {
    name      = var.app3.name
    namespace = var.app3.name
    labels = {
      name = var.app3.name
      tier = var.app3.tier
    }
  }
  spec {
    selector {
      match_labels = {
        name = var.app3.name
        tier = var.app3.tier
      }
    }
    template {
      metadata {
        name = var.app3.name
        labels = {
          name = var.app3.name
          tier = var.app3.tier
        }
      }
      spec {
        container {
          name  = var.app3.name
          image = "mongo"
            resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
           
            } 
          }
        }
      }
    }
  }
}

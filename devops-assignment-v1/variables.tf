variable "workspace_to_environment_map" {     ###multi-environment (6)
  type = map(string)
  default = {
    dev     = "dev"
    qa      = "qa"
    staging = "staging"
    production    = "production"
  }
}


variable "secret_app"{      ###protect sensitive data(7)
  type = map(string)
  description = "encoded password"
  sensitive = true	
  default = {
     "database_pass" = "lfjddkfmdc"
  }
}



variable "apps"{                        ### ( mission 2)
  type = map(list(string))
  description = "app name and lable and annotations here"
  default = {
	  "name" = ["stream_fronted","stream_backend" , "stream_databse"]
	  "tier" = ["web", "api", "shared"]
	  "owner" = ["product_1","product_2", "product_3"] 
	  "serviceClass" = ["web-frontend","web-backend","database"]
    	"loadBalancer/class" = ["external","internal","disabled"]
	 }  
}

/*

locals {
  apps3 = {
    "app1"  = {
	  name = "stream-frontend"
	  tier = "web"
	  owner = "product"
	  serviceClass = "web-frontend"
    	  loadBalancer = "external"
  },
    "app2"   = {
	  name = "stream-backend"
	  tier = "api"
	  owner = "product"
	  serviceClass       = "web-backend"
    	loadBalancer = "internal" 
  },
    "app3" = {
  	name = "stream-database"
  	tier = "shared"
  	owner = "product"
  	serviceClass       = "database"
      	loadBalancer = "disabled" 
    },
  }
}

*/


/*variable "apps2"{                        ### ( mission 2)
  type = set(variable)
  description = "apps  stuff "
  default = {
	  var.app1,
	  var.app2,
	  var.app3,
	 }  
}*/
/*
variable "apps"{
  type=set(string)
  description="??"
  default = [
    "app1",
    "app2",
    "app3",
  ]
}

*/

### namespace variables for app1
variable "app1"{                          ###reduce variable count (1)
  type = map(string)
  description = "app name and lable and annotations here"
  default = {
	  "name" = "stream-frontend"
	  "tier" = "web"
	  "owner" = "product"
	  "serviceClass" = "web-frontend"
    	  "loadBalancer/class" = "external"
  }     
}


### namespace variables for app2

variable "app2"{
  type = map(string)
  description = "app name and lable and annotations here"
  default = {
	  "name" = "stream-backend"
	  "tier" = "api"
	  "owner" = "product"
	  "serviceClass"       = "web-backend"
    	"loadBalancer/class" = "internal" 
  }
}
### namespace variables for app3

variable "app3"{
  type = map(string)
  description = "app name and lable and annotations here"
  default = {
  	"name" = "stream-database"
  	"tier" = "shared"
  	"owner" = "product"
  	"serviceClass"       = "database"
      	"loadBalancer/class" = "disabled" 
  }   
}	  
	  

  

variable "acl_frontend" {
  description = "access allowed from this source"
  type = map(object({
    ingress  = string
    egress   = string
    port     = string
    protocol = string
  }))
  default = {
    frontend = {
      ingress  = "stream-backend"
      egress   = "0.0.0.0/0"
      port     = "23452"   ### any/tcp for the internal communication of the REST API server (3)
      protocol = "TCP"
    }
  }
}

variable "acl_backend" {
  description = "access allowed from this source"
  type = map(object({
    ingress = string
    egress  = string
    port     = string
    protocol = string
  }))
  default = {
    backend = {
      ingress  = "stream-frontend"
      egress   = "172.17.0.0/24"
      port     = "80"
      protocol = "TCP"

    }
  }
}

variable "acl_database" {
  description = "access allowed from this source"
  type = map(object({
    ingress = string
    egress  = string
    port     = string
    protocol = string
  }))
  default = {
    database = {
      ingress  = "stream-backend"
      egress   = "172.17.0.0/24"
      port     = "27017"
      protocol = "TCP"
    }
  }
}

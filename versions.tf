terraform {
    cloud {
        organization ="LCC-personalSite"
        workspaces {
            name ="wildrydes-webapp-terraform"
        }

    }
    required_providers {
        aws= {
            source = "hashicorp/aws"
            version = "~>4.55"
        }
    }
    required_version = ">= 1.2.0"

}
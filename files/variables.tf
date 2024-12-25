###cloud vars

variable "cloud_id" {
  type        = string
  default     = "b1g0togg4o2vkjsh19cb"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g7fnugh0okc75bvd84"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

###family

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство"
}

###net vars

variable "vpc_name" {
  type        = string
  default     = "net"
  description = "Net name"
}

    ###web
variable "zone_web" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_web" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_web" {
  type        = string
  default     = "subnet_web"
  description = "Subnet name"
}

    ###db
variable "zone_db" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_name_db" {
  type        = string
  default     = "subnet_db"
  description = "Subnet name"
}

variable "default_cidr_db" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKtXehh5Upeqat+r3OsC1VIh2Rnma/menCG/w9RxlX4r lex@lex-virtualbox"
#   description = "ssh-keygen -t ed25519"
# }

variable "test" {
  type          = list(map(list(string)))
  default       = [
    {
      "dev1" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
        "10.0.1.7"
      ]
    },
    {
      "dev2" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
        "10.0.2.29"
      ]
    },
    {
      "prod1" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
        "10.0.1.30"
      ]
    }
  ]
}
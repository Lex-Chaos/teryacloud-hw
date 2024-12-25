variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Название машины"
}

variable "vm_web_plantform_id" {
  type        = string
  default     = "standard-v3"
  description = "Платформа машины"
}

# variable "vm_web_cores" {
#   type        = number
#   default     = 2
#   description = "Количество ядер"
# }

# variable "vm_web_memory" {
#   type        = number
#   default     = 1
#   description = "Объём памяти"
# }

# variable "vm_web_core_fraction" {
#   type        = number
#   default     = 20
#   description = "Процент использования"
# }

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемость"
}

variable "vm_web_nat" {
  type        = bool
  default     = false
  description = "nat"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Название машины"
}

variable "vm_db_plantform_id" {
  type        = string
  default     = "standard-v3"
  description = "Платформа машины"
}

# variable "vm_db_cores" {
#   type        = number
#   default     = 2
#   description = "Количество ядер"
# }

# variable "vm_db_memory" {
#   type        = number
#   default     = 2
#   description = "Объём памяти"
# }

# variable "vm_db_core_fraction" {
#   type        = number
#   default     = 20
#   description = "Процент использования"
# }

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемость"
}

variable "vm_db_nat" {
  type        = bool
  default     = false
  description = "nat"
}

variable "virtmashs_resources" {
  description = "Ресурсы для всех ВМ"
  type        = map(map(number))
  default     = {
    vm_web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    vm_db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "metadata" {
  description = "ssh ключ"
  type        = map(string)
  default     = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKtXehh5Upeqat+r3OsC1VIh2Rnma/menCG/w9RxlX4r lex@lex-virtualbox"    
  }
}
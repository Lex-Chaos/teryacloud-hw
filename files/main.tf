resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_web" {
  name           = var.vpc_name_web
  zone           = var.zone_web
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_web
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = var.vpc_name_db
  zone           = var.zone_db
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_db
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_gateway" "nat_gateway" {
  # folder_id      = "<идентификатор_каталога>"
  name = "test-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  # folder_id      = "<идентификатор_каталога>"
  name       = "test-route-table"
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family #"ubuntu-2004-lts"
}

###instance-web
resource "yandex_compute_instance" "platform_web" {
  name        = local.vm_web_name # var.vm_web_name
  platform_id = var.vm_web_plantform_id
  zone        = var.zone_web
  resources {
    cores         = var.virtmashs_resources.vm_web.cores
    memory        = var.virtmashs_resources.vm_web.memory
    core_fraction = var.virtmashs_resources.vm_web.core_fraction
    # cores         = var.vm_web_cores
    # memory        = var.vm_web_memory
    # core_fraction = var.vm_web_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_web.id
    nat       = var.vm_web_nat
  }

  metadata = var.metadata
  # metadata = {
  #   serial-port-enable = 1
  #   ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  # }
}

###instance-db
resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name # var.vm_db_name
  platform_id = var.vm_db_plantform_id
  zone        = var.zone_db
  resources {
    cores         = var.virtmashs_resources.vm_db.cores
    memory        = var.virtmashs_resources.vm_db.memory
    core_fraction = var.virtmashs_resources.vm_db.core_fraction
    # cores         = var.vm_db_cores
    # memory        = var.vm_db_memory
    # core_fraction = var.vm_db_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_db_nat
  }

  metadata = var.metadata
  # metadata = {
  #   serial-port-enable = 1
  #   ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  # }
}

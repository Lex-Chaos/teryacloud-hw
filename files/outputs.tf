output "VitrMashns" {
  value       = {
    vm_1_name = yandex_compute_instance.platform_web.name
    vm_1_ip   = yandex_compute_instance.platform_web.network_interface.0.nat_ip_address
    vm_1_fqdn = yandex_compute_instance.platform_web.fqdn
    vm_2_name = yandex_compute_instance.platform_db.name
    vm_2_ip   = yandex_compute_instance.platform_db.network_interface.0.nat_ip_address
    vm_2_fqdn = yandex_compute_instance.platform_db.fqdn
  }
  description = "VM's params"
#   depends_on  = []
}

output "test" {
  value = var.test
}
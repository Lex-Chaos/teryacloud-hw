locals {
  first_name = "netology-develop-platform"
  sub_name_web   = "web"
  sub_name_db    = "db"
  vm_web_name    = "${local.first_name}-${local.sub_name_web}"
  vm_db_name    = "${local.first_name}-${local.sub_name_db}"
}

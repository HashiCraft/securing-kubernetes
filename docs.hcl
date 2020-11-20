docs "docs" {
  path  = "./docs"
  port  = 8888
  open_in_browser = true

  index_title = "Index"
  index_pages = [
    "index",
    "prepare_hack",
    "execute_hack",
    "exploit_host",
    "vault_intro",
    "vault_postgres",
    "vault_auth",
    "vault_policy",
    "vault_injection",
    "lateral_movement",
    "consul_intro",
    "consul_intentions",
    "override_permissions",
    "consul_acl"
  ]

  network {
    name = "network.cloud"
  }
}
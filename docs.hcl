docs "docs" {
  path  = "./docs"
  port  = 8888
  open_in_browser = true

  index_title = "Index"
  index_pages = [ 
    "index",
    "prepare_hack",
    "execute_hack",
    "exploit_host"
  ]

  network {
    name = "network.cloud"
  }
}
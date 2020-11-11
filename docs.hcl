docs "docs" {
  path  = "./docs"
  port  = 8888
  open_in_browser = true

  index_title = "Index"
  index_pages = [ 
    "index",
    "hacking"
  ]

  network {
    name = "network.cloud"
  }
}
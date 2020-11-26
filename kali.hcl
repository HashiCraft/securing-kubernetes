container "kali" {
  image {
    name = "shipyardrun/kali:v0.0.3"
  }

  command = ["/entrypoint.sh"]

  network { 
    name = "network.cloud"
  }
}

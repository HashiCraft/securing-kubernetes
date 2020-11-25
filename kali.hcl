container "kali" {
  image {
    name = "shipyardrun/kali:v0.0.2"
  }

  command = ["/entrypoint.sh"]

  network { 
    name = "network.cloud"
  }
}

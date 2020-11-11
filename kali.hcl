container "kali" {
  image {
    name = "shipyardrun/kali:v0.0.1"
  }

  command = ["/entrypoint.sh"]

  network { 
    name = "network.cloud"
  }
}
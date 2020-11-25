k8s_config "apps" {
  cluster = "k8s_cluster.kubernetes"
  #depends_on = ["helm.consul"]

  paths = [
    "./k8s_config/insecure/search.yaml",
    "./k8s_config/insecure/payments.yaml",
    "./k8s_config/insecure/database.yaml"
  ]

  wait_until_ready = true
}

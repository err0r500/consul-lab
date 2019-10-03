services = {
  name = "echo"
  port = 5678
  connect = {
    sidecar_service = {
      checks = [
        {
          Name = "Connect Sidecar Listening"
          docker_container_id = "container_id"
          ttl = "10s"
        }
      ]
    }
  }
}


service {
  name = "echo"
  port = 5678
  connect = {
    sidecar_service = {
      checks = [
        {
          Name = "Connect Sidecar Listening"
          alias_service = "echo"
        }
      ]
      port = 20000
    }
  }
}
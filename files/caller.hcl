service {
  name = "caller"
  port = 9000
  connect {
    sidecar_service {
      proxy {
        upstreams = [
          {
            destination_name = "echo"
            local_bind_port = 12345
          }
        ]
      }
    }
  }
}


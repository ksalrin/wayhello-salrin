project = "hello-world"

app "hello-world" {
  labels = {
      "service" = "hello-world"
  }

  build {
    use "docker" {
    }
    registry {
        use "docker" {
          image = "ksalrin/hello-world"
          tag = "v3"
          encoded_auth = filebase64("./dockerAuth.json")
        }
    }
 }

  deploy { 
    use "kubernetes" {
    probe_path = "/"
    }
  }

  release {
    use "kubernetes" {
    }
  }
}

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
          tag = "v4"
          encoded_auth = filebase64("./dockerAuth.json")
        }
    }
 }

  deploy { 
    use "exec" {
      command = ["helm", "install", "hello-world", "./hello-world", "--namespace", "tools"]
    }
  }

}

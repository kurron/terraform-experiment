provider "docker" {
    host = "tcp://127.0.0.1:2375/"
}

resource "docker_image" "data-image" {
    name = "busybox:latest"
    keep_updated = true
}

resource "docker_container" "data-container" {
    image = "${docker_image.data-image.latest}"
    name = "data-container"
#   command = "list of strings"
    dns = ["8.8.8.8", "8.8.4.4"] 
    env = ["A=a", "B=b"] 
#   links = "set of strings"
    hostname = "data-container"
    domainname = "kurron.org"
    must_run = false 
    ports = {
        internal = 80
        external = 8080
#       ip = "192.168.1/24"
#       protocol = "tcp"
    }
    publish_all_ports = false 
#   volumes = {
#       from_container = "The container where the volume is coming from"
#       container_path = "The path in the container where the volume will be mounted"
#       host_path = "The path on the host where the volume is coming from"
#       read_only = true 
#   } 
}


resource "aws_instance" "dockeros" {
	ami =                  lookup(var.image, var.selectami)
	instance_type =        "${var.instancetype}"
	security_groups =      "${var.SG_ids}"
	tags = {
		Name = "Dockeros1"
	}
	key_name =               "${var.keyname}"
	subnet_id =              "${var.subnetid}"

	connection {
		type =        "ssh"
		user =        "ec2-user"
		private_key =  file("/Users/ankit/Downloads/virginia.pem")
		host =        aws_instance.dockeros.public_ip
	}
	provisioner "remote-exec" {
		inline = [
			"sudo yum install docker -y",
			"sudo systemctl start docker",
			"sudo systemctl enable docker",
            "sudo docker pull centos:latest"
		]
	}
}

output "Instance_ip" {
	value = aws_instance.dockeros.public_ip
}

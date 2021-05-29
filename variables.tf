variable "SG_ids" {
	type = list
	default = ["sg-0cc9f3f371c74ed31"]
}

variable "selectami" {}

variable "image" {
	type = map
	default = {
		ami2 = "ami-0d5eff06f840b45e9"
		redhat = "ami-06178cf087598769c"
		ubuntu = "ami-0194c3e07668a7e36"
		windows = "ami-0ae15c1544cd06ac8" 
	}
}

variable "instancetype" {
	type = string
	default = "t2.large"
}

variable "subnetid" {
    type = string
    default = "subnet-cae95595"
}

variable "keyname" {
	type = string
	default = "virginia"
}
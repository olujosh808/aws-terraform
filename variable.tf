#Variable Declarations
variable "ami" {
  type = string
  default = "ami-0533f2ba8a1995cf9"
}

variable "key-name" {
  type = string
  default = "deployer-key"
}

variable "public_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDn+kFh1T3zZdksCcuGO8sb5SCMAwu5EGNQS8PWraxCH4VoF3h8x3tBeC+Bww1wPEhCOsATP/W2dMxlp4BAzJIo2lXL89l9DtiekCokrijM/2xpGGiemwzv1beJ3cmOdViOudhQCblCRzWVzyMpjk+N9LW4g+ck9E5di4Ikq4rIGSv0mYmo2SwrEI49Ot8g55pNACuGdwl6vhuuGyOx6yGy4x3zMQqlzPryT6gracgtxbkQ56y0KTVqlFadMQEyPqxNh6mneWQB/tC8k6rYrtJVBxuYeGjMrzIC6MK7HXLXonMfkya0pF7/VzpW5yss4zO1cnoivzPuidd2iew+VZRc8limEQQbYrLK+JaZXwHxf9LWsl+mvUNtA7rIadllTGJ/FAPgyanbrDmn73UNUQr+SY+cEP5vSdn+IrWp0uFYqt1hw5GbRxhyaHWLGsizcciRdYAp0ZL6cDt5Qf+gxFclVnSNGgdgevDgK5BqapmluuIiDP5UaznEnx+62E9Rc3M= user@DESKTOP-5ESTAPL"
}
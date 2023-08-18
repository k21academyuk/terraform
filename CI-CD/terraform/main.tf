provider "aws" {
  region     = "us-west-2" # Replace with your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-04e35eeae7a7c5883" # Replace with your desired AMI
  instance_type = "t2.micro"
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

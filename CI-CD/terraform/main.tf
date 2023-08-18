provider "aws" {
  region     = "us-west-2" # Replace with your desired region
  access_key = "AKIARXDJLHU3BFDOHZUS"
  secret_key = "/E/EsLkBGsmo1aE+7UTM/xw1RkfiYEHZDrs9rjzI"
}

resource "aws_instance" "example" {
  ami           = "ami-04e35eeae7a7c5883" # Replace with your desired AMI
  instance_type = "t2.micro"
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

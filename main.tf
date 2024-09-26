variable "components" {
  default = ["frontend", "catalogue", "cart", "user", "shipping", "payment", "dispatch" ]
}

resource "aws_instance" "instance" {
  count                  = length(var.components)
  ami                    = "ami-098d8b074faf7bc92"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-00b26069c926d674a"]
  tags = {
    Name = var.components[count.index]
  }
}

resource "aws_route53_record" "record" {
  count   = length(var.components)
  name    = var.components[count.index]
  type    = "A"
  zone_id = "Z069282029EAN7Z8L8I3R"
  records = [aws_instance.instance[count.index].private_ip]
  ttl     = 3
}
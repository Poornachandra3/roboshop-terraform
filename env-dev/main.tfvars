env = "dev"
instance_type= "t3.small"
zone_id = "Z069282029EAN7Z8L8I3R"


#VPC INPUTS
vpc_cidr_block    = "10.10.0.0/24"
default_vpc_id    = "vpc-0ec2789c6e316019b"
default_vpc_cidr  = "172.31.0.0/16"
default_route_table_id ="rtb-0e224fd90f379ab69"

frontend_subnets     = [ "10.10.0.0/27", "10.10.0.32/27" ]
backend_subnets      = [ "10.10.0.64/27", "10.10.0.96/27" ]
db_subnets           = [ "10.10.0.128/27", "10.10.0.160/27" ]
public_subnets       = ["10.10.0.192/27", "10.10.0.224/27"]
availability_zones   = [ "us-east-1a", "us-east-1b" ]
bastion_nodes        = ["172.31.84.23/32"]
prometheus_nodes     = ["172.31.84.218/32"]
certificate_arn      = "arn:aws:acm:us-east-1:976739212096:certificate/ef3e9969-d76d-4c52-bcb1-9896857da033"
kms_key_id           = "arn:aws:kms:us-east-1:976739212096:key/3f9273f6-8de5-45d1-80f4-eb3f43127813"


#ASG
max_capacity = 5
min_capacity = 1



docdb = {
  main = {
    family         = "docdb4.0"
    instance_class = "db.t3.medium"
    instance_count = 1
    engine_version = "4.0.0"


  }
}

rds = {
  main = {
    allocated_storage   = 20
    engine_version      = "5.7.44"
    family              = "mysql5.7"
    instance_class      = "db.t3.micro"
    skip_final_snapshot = true
    storage_type        = "gp3"
  }
}

rabbitmq = {
  main = {
    component     = "rabbitmq"
    instance_type = "t3.small"
  }
}
#tfvars files are used to define variables. e.g. terraform plan -var-file <terraform.tfvars filename>
#terraform.auto.tfvars files get loaded automatically.
aws_access_key = "XXXXXXXX"
aws_secret_key = "XXXXXXXXXXXXXXXX"
aws_region     = "us-east-1"
client     = "Max"
publicsubnets = ["10.1.1.0/24","10.1.2.0/24","10.1.3.0/24"]
privatesubnets = ["10.1.10.0/24","10.1.20.0/24","10.1.30.0/24"]
azs = ["us-east-1a","us-east-1b","us-east-1c"]
image = "ami-0cff7528ff583bf9a"
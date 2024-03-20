## Localhost

### You need these commands
* MacOS - via `brew`
```bash
# aws cli
# https://formulae.brew.sh/formula/awscli
brew install awscli

# terraform cli
# https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew update
brew upgrade hashicorp/tap/terraform
terraform -help plan
```

### .env
* in Docker directory make `.env` file from `env.local.example`
* set personal access token for authentication to github packages

### Start app locally
* make shell scripts executable
```bash
chmod +x docker/*.sh
```
* build app
```bash
cd docker && ./local-build-image.sh
```
* push app do github packages
```bash
cd docker && ./local-push-image.sh
```
* start app
```bash
cd docker && ./local-start-app.sh
```
### venv
* lightweight “virtual environments”, each with their own independent set of Python packages
* install requirements
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```


## Production
* make EC2 instance with Ubuntu using terraform

## Prerequisites
* created a key-pair in AWS for access to instance
* PEM file and download it into project
* change permission of the `.pem` file (from AWS key-pair)
```bash
chmod 0400 PEM_FILE
``` 

## Terraform
* source: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build (follow prerequisites)
* commands for using in provision machine
```bash
aws configure # configure aws secure connection

# TERRAFORM ----------------------------------------------
terraform init # init configuration and establish connection

# BEFORE APPLY!!!
terraform validate # check syntax of code *.tf
terraform fmt # format code
terraform plan # dry-run apply - show changes what will aply

terraform apply # 3 2 1 - Lift off!

terraform destroy # destroy the instance
```

### Run the app
* connect to AWS instance using ssh (in case you choose `Ubuntu` os then)
```bash
ssh -i PEM_FILE_PATH ubuntu@public_ip
```

* install Docker and configure
```bash
git clone https://github.com/maiok/project-w.git
```

* configure .env file and set empty variables
```bash
cd project-w/docker
cp .env.prod.example .env
```

* install Docker and configure
```bash
cd project-w/docker
./prod-init-instance.sh
```

* start the project
```bash
cd project-w/docker
./prod-start-app.sh
```

### manually install Packages on AWS instance (or use docker/prod-init-instance.sh)

#### Docker
* update the system
```bash
sudo apt-get update
```
* install git
```bash
sudo apt install git
```
* install docker
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
* add docker to the user to use it without sudo
```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```

Origin from: https://github.com/RajKKapadia/YouTube-Python-Flask-AWS-Docker
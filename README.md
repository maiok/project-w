## Localhost

#### .env
* in Docker directory make `.env` file from `env.local.example`
* set personal access token for authentication to github packages

#### Start app locally
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

## AWS

* make EC2 instance with Ubuntu
* set key-pair to access with PEM file and download it into project
* change permission of the `.pem` file (from AWS key-pair)
    ```bash
    chmod 0400 PEM_FILE
    ``` 
* connect to remote server using ssh
    in case you choose `Ubuntu` os then
    ```bash
    ssh -i PEM_FILE ubuntu@public_ip
    ```

### Install Packages on AWS instance
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
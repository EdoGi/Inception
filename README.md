# Project Inception

Welcome to the Project Inception repository! This project involves setting up a multi-container environment using Docker and Docker Compose to deploy a WordPress website with a MariaDB database. The project focuses on developing containerization skills and managing various components of a web application.

## Usage

1. **Clone Repository:** Clone this repository to your local machine.

    ```bash
    git clone <repository_url>
    cd project-inception
    ```

2. **Install Docker:** Install Docker and Docker Compose if not already installed on your system.

3. **Set Up Directories and Permissions:** Run the following Makefile command to create the required data directories and set appropriate permissions:

    ```bash
    make create_dir
    ```

4. **Build and Start Services:** Build and start the Docker services using the following Makefile command:

    ```bash
    make up
    ```

5. **Access WordPress:** Open your web browser and navigate to `https://login.42.fr`, replacing `login` with your actual login. You should see the configured WordPress website.

### Additional Makefile Commands

- `make build`: Build the Docker images.
- `make down`: Stop and remove the Docker containers and images.
- `make clean`: Remove Docker containers, images, and volumes.
- `make fclean`: Perform a complete cleanup, including removing data directories and performing Docker system pruning.
- `make re`: Clean and then rebuild the project.
- `make list`: List all running containers in the project.
- `make logs`: View logs of all containers in the project.
- `make info`: Display information about images, containers, networks, and volumes used in the project.

Please note that some commands may require superuser (sudo) privileges. Adjust the Makefile as necessary to match your setup.

## Concept and Learning

- Containerization: Learn how to containerize applications using Docker.
- Multi-Container Environment: Set up and manage multiple containers using Docker Compose.
- WordPress and MariaDB: Deploy a WordPress website with a MariaDB database.
- Networking: Understand how Docker networks enable communication between containers.
- Docker Volumes: Utilize Docker volumes to persist data and configuration.
- NGINX and SSL/TLS: Configure NGINX as a reverse proxy with SSL/TLS encryption.
- Dockerfile Creation: Write Dockerfiles to create custom container images.
- Makefile Usage: Automate tasks and manage the project using Makefile commands.

By completing this project, you'll enhance your skills in containerization, orchestration, networking, and system administration, all of which are valuable in modern software development and deployment.

## License

This project is licensed under the [MIT License](LICENSE).
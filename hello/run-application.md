## Running the Application

This application is packaged as a Docker container and can be run using a shell script, `app-run.sh`.

### Prerequisites

- Docker: The application is packaged as a Docker container, so you will need Docker installed on your machine. You can download Docker from the [official website](https://www.docker.com/get-started).

### Running the Script

The `app-run.sh` script is used to run the Docker container. Before you can run this script, you will need to give it execute permissions. You can do this with the following command:

```bash
chmod u+x app-run.sh
```

This command adds execute permissions for the user who owns the file. After running this command, you should be able to execute the `app-run.sh` script.

To run the script, use the following command:

```bash
./app-run.sh
```

This command runs the `app-run.sh` script, which in turn runs the Docker container.

If you encounter any issues while running the script, make sure that Docker is running and that you have the necessary permissions to run Docker commands.

To grant an access to yur account
```bash
sudo usermod -aG docker $USER
```
Start docker daemon
```bash
# Check if the daemon is active or not
sudo systemctl is-active docker
# If the daemon is not active then run it
sudo systemctl start docker
# or do it in single command
sudo systemctl is-active docker || sudo systemctl start docker
```
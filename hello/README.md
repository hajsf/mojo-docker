## Dockerfile

Here's a line-by-line explanation of your Dockerfile:

```Dockerfile
FROM mojo-sdk:r0.6 as builder
```
This line is pulling the `mojo-sdk` Docker image with the tag `r0.6` from Docker Hub. The `as builder` part is naming this stage of the build `builder`, which can be used to refer to this stage in later parts of the Dockerfile.

```Dockerfile
WORKDIR /app
```
This line is setting the working directory inside the Docker container to `/app`. All subsequent `RUN`, `CMD`, `ENTRYPOINT`, `COPY`, and `ADD` commands will be run relative to this directory.

```Dockerfile
COPY main.mojo /app/main.mojo
```
This line is copying the `main.mojo` file from your local machine (the Docker build context) to the `/app/main.mojo` path inside the Docker container.

```Dockerfile
RUN /root/.modular/pkg/packages.modular.com_mojo/bin/mojo build /app/main.mojo
```
This line is running the `mojo build /app/main.mojo` command inside the Docker container. This command is building the `main.mojo` file.

```Dockerfile
FROM ubuntu:24.04
```
This line is starting a new build stage and pulling the `ubuntu` Docker image with the tag `24.04` from Docker Hub.

```Dockerfile
WORKDIR /app
```
This line is setting the working directory inside the Docker container to `/app`.

```Dockerfile
COPY --from=builder /app/main /app/main
```
This line is copying the `/app/main` file from the `builder` stage to the `/app/main` path in the current stage.

```Dockerfile
RUN chmod +x /app/main
```
This line is running the `chmod +x /app/main` command inside the Docker container. This command is making the `/app/main` file executable.

```Dockerfile
CMD ["/app/main"]
```
This line is setting the default command that will be executed when the Docker container is run. In this case, the `/app/main` file will be executed.

## Docker image build and run

Below is how to build and run the container:

1. `docker build -t my-app-minimal -f Dockerfile.minimal --no-cache .`

   This command is used to build a Docker image.
   - `-t my-app-minimal`: This option specifies the name (and optionally a tag in the `name:tag` format) for the image. In this case, the image will be named `my-app-minimal`.
   - `-f Dockerfile.minimal`: This option allows you to specify a Dockerfile other than the default `Dockerfile`. In this case, it's using `Dockerfile.minimal`.
   - `--no-cache`: This option tells Docker to build the image from scratch and not use any cached layers from previous builds of this image.
   - `.`: This is the build context – the local directory that Docker will use for the build. Docker will look for the Dockerfile and any files that are `COPY` or `ADD`ed in this directory.

2. `docker run --rm my-app-minimal`

   This command is used to run a Docker container from an image.
   - `--rm`: This option tells Docker to automatically remove the container when it exits. This is useful to prevent your system from getting cluttered with old, stopped containers.
   - `my-app-minimal`: This is the name of the Docker image to run. In this case, it's running a container from the `my-app-minimal` image that was built in the previous step.

3. (Optional) you can create a shell file and use it to run the docker command, but you need to ensure the permission to be provided
   The app-run.sh
   ```bash
   $ chmod u+x app-run.sh
   $ ./app-run.sh
   ``` 
   

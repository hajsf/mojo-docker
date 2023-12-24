fn main():
    print("Hello from Mojo 🔥")

# Get the specific container IF
# docker ps -aqf "name=container_name"
# Ex. $  docker ps -aqf "name=mojo-sdk"

# Run a command using existing container
# docker exec -it container_ID_or_name /bin/bash
# Ex. $  docker exec -it mojo-sdk /bin/bash
# Ex. $  docker exec -it 1e57de7aa4e5 /bin/bash


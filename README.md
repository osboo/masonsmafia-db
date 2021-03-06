# masonsmafia-db
Repo for dockerized database container

# Run the container

    docker network create mynet
    docker run -d -p 3306:3306 \
    --env "MYSQL_ROOT_PASSWORD=<PASSWORD>" \
    --env "MYSQL_HOST=<CONTAINER NAME>" \
    --name <CONTAINER NAME> \
    --volume <LOCAL PATH>:/var/lib/mysql \
    --net mynet \
    osboo/masonsmafia-db

# Initialization
If `<LOCAL PATH>` contains data then the container works with it. If there is a need in firsr database initialization (fresh install or running in testing envrironment) then following command should be executed:

    docker exec -it -e MYSQL_ROOT_PASSWORD=<PASSWORD> <CONTAINER NAME> coffee src/server/init.coffee
    
# Initialization for tests
Before each Mocha tests run the database should be initialized. Please also note that the container volume should be stateless so it must be cleaned after each test run.
Command to inititialize the database in test env:

    docker exec -it -e MYSQL_ROOT_PASSWORD=<PASSWORD> -e MASONS_ENV=TEST <CONTAINER NAME> coffee src/server/init.coffee

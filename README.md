# TrinityCore
### Docker version of TrinityCore

You will need to provision your database. Below are the commands you can use to create the user, databases and privileges required. There is also a guide here: [TrinityCore - Database Installation](https://trinitycore.atlassian.net/wiki/spaces/tc/pages/2130092/Databases+Installation)

You can do this easily by issuing the commands via docker exec and attaching to the db container and running the mysql commands

````
CREATE USER 'trinity'@'%' IDENTIFIED BY  'trinity';
CREATE DATABASE `world` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE `characters` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE `auth` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON `world` . * TO 'trinity'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `characters` . * TO 'trinity'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `auth` . * TO 'trinity'@'%' WITH GRANT OPTION;
````

You will also need to extract all the maps and data from a working copy of the World of Warcraft 3.3.5a client, details of how to extract can be found here: [TrinityCore - Server Setup](https://trinitycore.atlassian.net/wiki/spaces/tc/pages/2130046/Server+Setup)

Once you have these steps complete, you can use the docker-compose.yml provided to provision the environment. You will need to move the extracted maps and data (dbc, maps, mmaps, vmaps) into the data directory contained within this project. You will also need to modify the configs as required to ensure they match your requirements.

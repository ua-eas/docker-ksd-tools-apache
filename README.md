# Description

This container is a simple Apache server used to proxy traffic to other Docker containers running on the tools box. The assumtion is that we are using linking to allow the apache container to communicate with the other tools containers.

This means we should use standard names for deploying the tools containers so the linking works properly and we have the coorect domain names setup automatically for us in the /etc/hosts file.

Currently we have the following tools containers configured for apache to proxy traffic to:

| Tool    | Docker Name       | Docker Image   | Tag    | GitHub Project/Branch  |
|---------|-------------------|----------------|--------|------------------------|
| Jenkins | ksd-tools-jenkins | [easksd/jenkins](https://registry.hub.docker.com/repos/easksd/) | latest |                        |

## Environment Variables

The following environment variables need to be set for this container:

- KUALI_TOOLS_SERVERNAME - ServerName (url) variable for kuali tools

## Command

Here is an example command to run this container:

``` sh
$ docker run -d \ 
    -p 80:80 \
    -e "KUALI_TOOLS_SERVERNAME=ka-tools.mosaic.arizona.edu"
    --name ksd-tools-apache \
    --link ksd-tools-jenkins \
    easksd/tools-apache \
    /usr/sbin/apache2ctl -D FOREGROUND
 ```
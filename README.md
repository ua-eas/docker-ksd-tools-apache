# Description

This container is a simple Apache server used to proxy traffic to other Docker containers running on the tools box. The assumtion is that we are using linking to allow the apache container to communicate with the other tools containers.

The base container for this project is the [easksd/apache](https://registry.hub.docker.com/repos/easksd/apache/). This is where the startup script is defined. Please also see that project for other configuration requirements.

This means we should use standard names for deploying the tools containers so the linking works properly and we have the coorect domain names setup automatically for us in the /etc/hosts file.

Currently we have the following tools containers configured for apache to proxy traffic to:

| Tool    | Docker Name       | Docker Image   | Tag    | GitHub Project/Branch  |
|---------|-------------------|----------------|--------|------------------------|
| Jenkins | ksd-tools-jenkins | [easksd/jenkins](https://registry.hub.docker.com/repos/easksd/) | latest |                        |
| Nexus | ksd-tools-nexus | [sonatype/nexus](https://registry.hub.docker.com/u/sonatype/nexus/) | oss |

## Environment Variables

The following environment variables need to be set for this container:

- SERVER_NAME - ServerName (url) variable for kuali tools. See the [base project](https://github.com/ua-eas/docker-apache) documentation for more info.

## Volumes

In the base project we define a volume for the security directory. This contains secure keys required for shib to work. The security share should be mounted on the host and shared with the container at /security

## Command

Here is an example command to run this container:

``` sh
$ docker run -d \ 
    -p 80:80 \
    -e "SERVER_NAME=ka-tools.mosaic.arizona.edu"
    --name ksd-tools-apache \
    --link ksd-tools-jenkins \
    -v /kuali-configs/security/tools/apache/:/security
    easksd/tools-apache \
    /start_apache.sh
 ```

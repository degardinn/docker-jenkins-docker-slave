# Jenkins JNLP slave with Docker in Docker image

[`ndegardin/jenkins-docker-slave`](https://hub.docker.com/r/ndegardin/jenkins-docker-slave/)

A [Jenkins](https://jenkins-ci.org) slave embedding *Docker* and using *JNLP* to establish connection.

See [Jenkins Distributed builds](https://wiki.jenkins-ci.org/display/JENKINS/Distributed+builds) for more info.

## Purpose

The purpose of this image is to run *Docker*-capable slaves in the *AWS ECS* cloud, allowing to achieve a *Docker*-backed continuous integration/deployment platform, deploying containerized projects into a *AWS ECS* cloud.
The deployment scenario is the following:
- *Github/bitbucket* hook running a Jenkins build task upon *Git* tag being pushed
- The *Jenkins* build task pulls the sources and builds a container based on the project *Dockerfile*
- If available, a test script is executed and can build a test project task using docker-compose and project embedded fixtures
- On success, the project container is pushed into *AWS ECR*, with a *Docker* tag corresponding to the *Git* tag
- Optionally, a *Jenkins* deployment task can then run to udpate the corresponding *ECS service*, using this new container

To achieve such a scenario, containers can't be run directly on instances embedding ECS instances without using the AWS API, hence the need to run them inside another container.
Using a Docker enabled slave helps to avoid execution conflicts and simplifies returning a clean environment.

## Configuration specifics

See the base image 

## Additional tools

This container embeds **docker** and **docker-compose**. It has to run in privileged mode for these tools to be working.

## Configuration specifics and running

See the base image for instructions: [`jenkinsci/jnlp-slave`](https://hub.docker.com/r/jenkinsci/jnlp-slave/)
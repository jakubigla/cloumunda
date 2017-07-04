# Cloumunda (Cloudera + Camunda)

Integration of big data apps from Cloudera with workflow automation tool Camunda
  
## Prerequisites

The only requirement here are Docker stack and VirtualBox
* https://docs.docker.com/engine/installation/
* https://www.virtualbox.org/wiki/Downloads

## Setup

```bash
make
```

## Build

```bash
make build
```

## Run

```bash
make run
```
After some moment, the Camunda app should be available at: http://camunda.ons/camunda

Login credentials:
login: `demo`
password: `demo`


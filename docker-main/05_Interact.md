# Docker - Practise 5


## Execute the container interactively
Sometimes, we may need to connect to an image on the command line, before any execution is in place, for which we will be using the `docker container run` but with the flag `-it` for interactive, specifying the shell we would like to use. Not all the operating system images have the same shells, so here are some versions to test. This is Amazon Linux 2:
```bash
docker container run --rm -it amazonlinux:latest /bin/bash
```

When finished, we just need to type the command `exit` to stop the container. This command is to be used on all the examples below:
```bash
exit
```

This is for Debian:
```bash
docker container run --rm -it debian:latest /bin/bash
```

This is for Alpine:
```bash
docker container run --rm -it alpine:latest /bin/sh
```

This is for Manjaro:
```bash
docker container run --rm -it manjarolinux/base /bin/bash
```

Now we can check how many different images we have in our box or session with `docker images`:
```bash
docker images
```

If our Host machine were a Windows, we could use the command `docker pull` to download the image, but it will fail on Linux:
```bash
docker pull mcr.microsoft.com/windows/servercore:ltsc2019
docker pull mcr.microsoft.com/windows/servercore:ltsc2022
```


## Modify Hostnames and containers during execution
This would be normally done to easily control the data used in our container orchestrator:
```bash
docker container run --rm -it --hostname docker1 --name debian debian:latest /bin/bash
hostname
exit
hostname
```


## Inspect existing Docker images
With command `docker image inspect` we can get vualable information related to a particular image:
```bash
docker pull julibcn/get-sh-it-done:latest
docker image inspect julibcn/get-sh-it-done:latest
```

In addition, we can do a history check to see how it was created with the command `docker history`:
```bash
docker history julibcn/get-sh-it-done:latest
```


## Connect interactively to a running container
We have checked how to run a container in an interactive manner, mainly for testing. However, we can also connect to a running container as interaction for troubleshooting or debugging with the command `docker exec -it`:
```bash
docker container run --rm -d -p44444:80 julibcn/get-sh-it-done:latest
docker ps
docker exec -it container_id /bin/bash
exit
docker container stop container_id
```

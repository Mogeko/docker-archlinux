# docker-archlinux

[![Docker Status](https://img.shields.io/docker/cloud/build/mogeko/archlinux.svg?label=Docker)](https://hub.docker.com/r/mogeko/archlinux)

An archlinux image that can be logged in with ssh

## Usage
Copy and paste to pull this image:

```
$ docker pull mogeko/archlinux
```

Run `mogeko/archlinux`:

```
$ docker run -itd -p 2222:22 -v $HOME:/home/host --name arch mogeko/archlinux
```

Entering the container (to update root password):

```
$ dockr exec -it arch bash
[root@xxxxxxxxxxxx /]# passwd root
New password: <enter your password>
Retype new password: <enter your password again>
passwd: password updated successfully
[root@xxxxxxxxxxxx /]# exit
```

Log in `ssh`:

```
$ ssh -p 2222 root@127.0.0.1
```


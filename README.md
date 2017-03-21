Jekyll Docker Container
===

This container will create or run a jekyll blog. This container is suitable for local development use
and also any automated building of a blog on a build system like Jenkins that could use a container to 
build, it is not recommended for production use of serving a blog.

## Setup

First, add your local user to docker group:
```bash
sudo usermod -aG docker YOURUSERNAME
```

Pull image ([from Hub](https://registry.hub.docker.com/u/dgutierrez1287/jekyll)):
```bash
docker pull dgutierrez1287/jekyll
```
or build:
```bash
docker build -t dgutierrez1287/jekyll .
```

Place the runJekyll.sh somwhere in your path


## Usage

Make sure when you are 

### Create
This will create a new blog in the current working directory using jekyll new. The container will run
creating the blog on the mounted volume and then will stop and be removed.

To create a new blog, this will create a folder that will contain the new jekyll blog with the all the
default files.
```bash
runJekyll.sh create [blog_name]
```

### Serve
This will serve a jekyll blog that is in a subdirectory of the current working directory and will be
served on localhost of the host machine. There is an option for serving on the default port of 4000,
and for you to pick a custom point to avoid conflicts for ports. The container will serve actively
in the forground and can be stopped and removed with Control-C from the terminal.

To serve the blog on the default host port of 4000.
```bash
runJekyll.sh serve [blog_name]
```

To serve the blog on a specific host port.
```bash
runJekyll.sh serve [blog_name] [port_numnber]
```

### Build
This will build a blog in a subdirectory of the current working directory using jekyll build. This will
create a _site directory in the directory of the blog that will contain the site that can be deployed.
The container to do the build will run doing the build to the blog on the mounted volume and then stop 
and be removed.

To build a blog in a subdirectory
```bash
runJekyll.sh build
```

## User Feedback

### Issues
This image is created and maintained as a best effort. Please feel free to contact me and 
let me know any issues that come up with the image or make an issue on the 
[Github page](https://github.com/dgutierrez1287/docker-jekyll)

### Contributing 
You are invited to contribute any new features or fixes; and I am happy to receive pull 
requests.

## Disclaimer
This docker image and code is provided without warrenty of any kind, the creator(s) and contributors do 
their best to test and ensure stability but can make no warrenty about this code or image. The 
creator(s) reccomend you test the current release and all other releases of this code and image before
before using this on a production blog.



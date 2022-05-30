# grabsite-docker README
## Status
* WIP, not adequetely tested.

Dockerfile builds.

* TODO: job-start script.
* TODO: resume-halted-job script.
* TODO: prove entrypoint & disk-limiter scripts work properly.
* TODO: Allow changing config via env vars e.g. disk%.
* TODO: modify to use a wip and a done dir, so that rsync and similar can easily looped to keep disk from overfilling.
* TODO: Finish implimenting git-based version naming scheme.
* TODO: Document things.

## Building
Clone repo:
```
$ git glone REPO_URL grab-site-docker
$ cd grab-site-docker
```

Creating the image from dockerfile:
```
$ chmod -v +x build-image.sh
$ sudo ./build-image.sh
```


## Usage


Creating the container from image:
```
$ chmod -v +x init-container.sh
$ sudo whoami && ./init-container.sh
```
(HACK: this way ownership of created dirs goes to logged in user, via caching sudo authority.)

Starting the container:
```
```

Running a job:
```
$ sudo ./gs.sh GRAB_SITE_ARGS...
```

Accessing the files from your job:
```
ls -lahQF "dl"
```

## Layout
`grabsite-image/` - Files needed for creating image.



# Docker Container for Google Datastore emulator

The gcloud suite has an emulator for Google Datastore, which is great for testing locally how to run code against their APIs.

However, it is not very useful if you want to run in a containerized environment, and want to test how the whole thing behaves. Hence this container.

The emulator will try to update automatically every time container start.

# How to use

```
$ docker pull kinok/google-datastore-emulator:latest
$ docker run -it --name datastore-emulator -p 8043:8043 kinok/google-datastore-emulator:latest
```

Now you need to run the equivalent of the ```$(gcloud beta emulators datastore env-init)``` command

```
$ export DATASTORE_EMULATOR_HOST=localhost:8043
```

Now you can use the standard APIs such as [gcloud-python](https://github.com/googlecloudplatform/gcloud-python) to interact with it.

# ENV VARIABLES / TWEAKS

## Persistence/Full Memory
You can use persistence by setting `FULL_MEMORY` environment variable to `false`
Otherwise full memory mode will be use.

## Data Store

You can bind a volume to /data (by default) in the container to get resilient data.

```
$ docker run -it --name datastore-emulator -p 8043:8043 -v /path/to/my/data/folder:/data kinok/google-datastore-emulator:latest
```

Default container data folder can be changed through `DATA_DIR` environment variable to any folder you prefer.

## Project
`projectId` is need for some language of gcloud sdk, by default it is set to `dev`, you can override it using `CLOUDSDK_CORE_PROJECT` environment variable

## Port

You can also change the port where the emulator runs by editing the `HOST_PORT` environment variable.

## Logs

The emulator logs in container stout.
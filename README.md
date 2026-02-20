# Set up the BCL Convert environment
This repository has minimul docker image for [bclconvert](https://support.illumina.com/sequencing/sequencing_software/bcl-convert.html).

## Requirements
- [Docker](https://docs.docker.com/engine/install/ubuntu/)

## Build  
1. Download `bclconvert.Dockerfile` from this repo.
2. Run the following commnad:  
`docker build -f bclconvert.Dockerfile -t bclconvert .`
  -f: path to Dockerfile  
  -t: container name  
3. To verify that the image was built correctly, run:  
`docker run --rm bclconvert -V`  
This will print the BCL Convert version.
  --rm: remove the container after the command finishes.  
  -V: a option of bclconvert printing the version.  

## Run
### 1. Run in CLI.
Run the following command (e.g., for NovaSeq X Plus):  
```
docker run --rm \
  --user "$(id -u)":"$(id -g)" \
  -v "$mount_path":/data \
  bclconvert \
  --bcl-input-directory /data \
  --output-directory /data/${out_path} \
  --no-sample-sheet true \
  --no-lane-splitting true \
  --force
```  
  --user: to make it executable  
  -v: mount the directory of host PC (local PC). The path to virtual directory is /data.  
  --bcl-input-directory: path to input directory in virtual directory.  
  --output-directory: path to output directory in virtual directory.  
  --no-sample-sheet: do not use sample sheet.  
  --no-lane-splitting: do not split lanes.  
  --force: force overwrite output directory.  

### 2. Run interactively
Run the following command:  
```
docker run --rm -it \                                                
  --entrypoint /bin/bash \
  -v "$mount_path:/data" \
  bclconvert
```

## Maintainance
- Please change the following variables in `bclconvert.Dockerfile`:  
  - In line4, `ARG BCL_RPM="bcl-convert-4.2.7-2.el8.x86_64.rpm"`  

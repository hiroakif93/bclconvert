# Set up the BCL Convert environment
This repository has minimul docker image for [bclconvert](https://support.illumina.com/sequencing/sequencing_software/bcl-convert.html).

## Requirements
- [Docker](https://docs.docker.com/engine/install/ubuntu/)

## Files
- `bclconvert.Dockerfile`: Dockerfile for the bclconvert image.  
- `bclconvert_docker.sh`: Shell script for running bclconvert in Docker.  
- `Dummy.csv`: Dummy sample sheet for undemultiplexing.  
- (Option) `docker_compose.ver/bclconvert_from_yml.sh`: Shell script for running bclconvert in Docker using docker-compose.  
- (Option) `docker_compose.ver/bclconvert.yml`: Docker Compose file for running bclconvert in Docker.  

## Build  
1. Download `bclconvert.Dockerfile` from this repo.
2. Run the following commnad in the repo directory:  
`docker build -f bclconvert.Dockerfile -t bclconvert .`
  `-f`: path to Dockerfile  
  `-t`: container name  
3. To verify that the image was built correctly, run:  
`docker run --rm bclconvert -V`  
This will print the BCL Convert version.
  `--rm`: remove the container after the command finishes.  
  `-V`: a option of bclconvert printing the version.  

## Run
### 1. Run in CLI.
Run the following command for getting undemultiplexing fastq:  
```
docker run --rm \
  -v "${MOUNT_PATH}:/data" \
  --user "$(id -u):$(id -g)" \
  bclconvert \
  --bcl-input-directory /data \
  --output-directory "/data/${OUT_PATH}" \
  --no-lane-splitting true \
  --force \
  --sample-sheet /opt/Dummy.csv
```  
  `--user`: to make it executable  
  `-v`: mount the directory of host PC (local PC). The path to virtual directory is /data.  
  `--bcl-input-directory`: path to input directory which containing RunInfo.xml in virtual directory.  
  `--output-directory`: path to output directory in virtual directory.  
  `--no-lane-splitting`: do not split lanes.  
  `--force`: force overwrite output directory.  
  `--sample-sheet`: If you requires undemultiplex fastq, Use /opt/Dummy.csv. 

If you can get dummy sample fastq, you can delete them with:  
`rm ${OUT_PATH}/DUMMY*`

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

## Trouble shooting
- ERROR: "Too many open files"
  - Add `--ulimit nofile=1048576:1048576` to the `docker run` command.
  ```
  docker run --rm \
  -v "${MOUNT_PATH}:/data" \
  --user "$(id -u):$(id -g)" \
  --ulimit nofile=1048576:1048576 \
  bclconvert \
  --bcl-input-directory /data \
  --output-directory "/data/${OUT_PATH}" \
  --no-lane-splitting true \
  --force \
  --sample-sheet /opt/Dummy.csv
  ```
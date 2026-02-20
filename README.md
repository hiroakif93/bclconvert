# Set up the BCL Convert environment
This repository has minimul docker image for [bclconvert](https://help.dragen.illumina.com/product-guide/dragen-v4.4/bcl-conversion).

## Requirements
- [Docker](https://docs.docker.com/engine/install/ubuntu/)

## Build  
1. Download `bclconvert.Dockerfile` from this repo.
2. Run the following commnad:  
`docker build -f bclconvert.Dockerfile -t bclconvert .`
3. To verify that the image was built correctly, run:  
`docker run --rm bclconvert -V`  
This will print the BCL Convert version.

## Run
Run the following command (e.g., for NovaSeq X Plus):
```
docker run --rm \
  -v "$mount_path" \
  bclconvert \
  --bcl-input-directory /data/. \
  --output-directory /data/${out_path} \
  --no-sample-sheet true \
  --no-lane-splitting true \
  --force
```

## Maintain
- Please change the following variables in `bclconvert.Dockerfile`:
  - In line4, `ARG BCL_RPM="bcl-convert-4.2.7-2.el8.x86_64.rpm"`
  

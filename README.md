# Establish bclconvert environemtnt

## Requirements
- Docker  
https://docs.docker.com/engine/install/ubuntu/

## Build  
1. Download bclconvert.Dockerfile
2. Run the following commnad  
`docker build -f bclconvert.Dockerfile -t bclconvert .`
3. To verify that the image was built correctly, run:  
`docker run --rm bclconvert -V`  
Then you can confirm bclconvert version.

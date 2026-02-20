
mount_path="/home/user/RUN_FOLDER"
out_path="FASTQ_undmx"

##################3
docker run --rm \
  -v "$mount_path" \
  bclconvert \
  --bcl-input-directory /data/. \
  --output-directory /data/${out_path} \
  --no-sample-sheet true \
  --no-lane-splitting true \
  --force
  

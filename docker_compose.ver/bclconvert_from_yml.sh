
export MOUNT_PATH="/home/user/RUN_FOLDER"
export UID="$(id -u)"
export GID="$(id -g)"

OUT_PATH="FASTQ_undmx"

##################
docker compose -f bclconvert.yml \
  run --rm \
  bclconvert -V \
  --bcl-input-directory /data/. \
  --output-directory /data/${OUT_PATH} \
  --no-sample-sheet true \
  --no-lane-splitting true \
  --force
  

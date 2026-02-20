
MOUNT_PATH="/home/user/RUN_FOLDER"
OUT_PATH="FASTQ_undmx"

##################
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

rm ${OUT_PATH}/DUMMY*
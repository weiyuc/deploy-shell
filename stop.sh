PID=$(cat ./pid/pid.log)
kill -9 "$PID"
echo "pid: $PID was killed."

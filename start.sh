BASE_PATH=$(cd `dirname $0`; pwd)
PID_DIR="$BASE_PATH/pid"

if [ ! -d "$PID_DIR" ]; then
    mkdir "$PID_DIR"
fi

PID_FILE="$PID_DIR/pid.log"

if [ ! -f "$PID_FILE" ]; then
    touch "$PID_FILE"
else
    echo "" > "$PID_FILE"
fi

PIDS=""
nohup java -Xms256M -Xmx256M -jar webchat-backend-msg-1.0.1.jar >/dev/null 2>&1 &
PID=$!
echo "webchat-backend-msg is start ok, pid: $PID"
PIDS="$PIDS $PID"

echo "$PIDS" > "$PID_FILE"

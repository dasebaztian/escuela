#!/bin/bash
PCS=$(ps aux --sort=pcpu | awk -v num="$1" '$3 > num {print $2}')
for PID in "${PCS[@]}"; do
		echo "$PID"
        kill -9"$PID"
done

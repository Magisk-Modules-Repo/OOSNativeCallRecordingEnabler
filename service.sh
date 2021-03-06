#!/system/bin/sh
# This script will be executed in late_start service mode

# Wait until the settings service is available
i=0
settings > /dev/null 2>&1
until [ $? -eq 255 ]
do
    sleep 5
    i=$((i+1))
    # If settings is not ready after 2 minutes, stop
    if [ $i -gt 24 ]
    then
        exit 1
    fi

    settings > /dev/null 2>&1
done

settings put global op_voice_recording_supported_by_mcc 1

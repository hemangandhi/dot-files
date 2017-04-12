VOLUME="Loud"
BATTERY="Burning"
TIME="Now"
while :;
do
    VOLUME="$(amixer | grep "Front Left:" | head -1 | awk '{print $5, $6}')"
    BATTERY="$(acpi | awk '{print $3, $4, $5}')"
    TIME="$( zdump /usr/share/zoneinfo/America/New_York | awk '{$1=e; print}';)"
    echo "$VOLUME && $BATTERY >> $TIME"
    sleep 1;
done

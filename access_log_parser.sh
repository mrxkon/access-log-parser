#!/bin/bash

# vars
LOGFILE="/var/web/site/logs/access.log"

# functions
get_response_codes_count() {
	echo "==========================="
	echo "Response Codes (count code)"
	echo "==========================="
	awk '{print $9}' $LOGFILE | sort | uniq -c | sort -rn
	echo ""
}

get_404_ips() {
	echo "======================"
	echo "Top 10: 404 (count IP)"
	echo "======================"
	awk '($9 ~ /404/)' $LOGFILE | awk '{print $1}' | sort | uniq -c | sort -rn | head -n 10
	echo ""
}

get_404_uri() {
	echo "======================="
	echo "Top 10: 404 (count uri)"
	echo "======================="
	awk '($9 ~ /404/)' $LOGFILE | awk '{print $7}' | sort | uniq -c | sort -rn | head -n 10
	echo ""
}

get_200_ips() {
	echo "======================"
	echo "Top 10: 200 (count IP)"
	echo "======================"
	awk '($9 ~ /200/)' $LOGFILE | awk '{print $1}' | sort | uniq -c | sort -rn | head -n 10
	echo ""
}

get_top_uris() {
	echo "======================"
	echo "Top 10: URIs (count URI)"
	echo "======================"
	awk '{print $7}' $LOGFILE | sort | uniq -c | sort -rn | head -n 10
	echo ""
}

# execute
get_response_codes_count
get_404_ips
get_404_uri
get_200_ips
get_top_uris
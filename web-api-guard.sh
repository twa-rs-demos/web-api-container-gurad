#! /usr/bin/env bash


is_web-api_alive() {
	[[ 1 = $( docker ps | grep assembly_web-api_1  | wc -l) ]] && return 0
	return 1;
}


restart_web-api() {
	docker restart assembly_web-api_1 
}



while true; do 
	if  ! is_web-api_alive ; then 
		restart_web-api
	fi
	echo sleep  
	sleep 2s    # 控制休眠时间
done


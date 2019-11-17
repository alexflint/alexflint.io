run:
	# the use of hostname below is for running on pixelbook
	hugo server \
	--bind 0.0.0.0 \
	--baseURL http://$(shell hostname -I):1313/ \
	--disableFastRender


# first set the right project:
#  gcloud config set project alexflint-io

# one-off setup steps
#  gsutil mb gs://www.alexflint.io
#  gsutil web set -m index.html gs://www.alexflint.io 

LOCALHOST := $(shell hostname -I | cut -d' ' -f2)

localhost:
	@echo "$(LOCALHOST)"

run:
	# the use of hostname below is for running on pixelbook
	hugo server \
	--bind 0.0.0.0 \
	--baseURL http://$(LOCALHOST):1313/ \
	--disableFastRender

build:
	# build the static site and store it in /public
	hugo

deploy: build
	# build and deploy static assets to GCS (see config.toml)
	hugo deploy
	# make sure all files in the bucket are publicly readable
	gsutil iam ch allUsers:objectViewer gs://www.alexflint.io

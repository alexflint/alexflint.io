
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

configure-app:
	# update the Digital Ocean app with the configuration in digitalocean.yaml
	doctl apps update dcd972c2-ff60-4fbc-bba2-6f97f778d11e --spec digitalocean.yaml

deploy:
	@echo "To deploy this website, push it to Github and it will be deployed by Digital Ocean App Platform."

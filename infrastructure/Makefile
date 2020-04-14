update:
	gcloud deployment-manager deployments update static-site \
	--config static-site.yaml

create:
	gcloud deployment-manager deployments create static-site \
	--config static-site.yaml

delete:
	gcloud deployment-manager deployments delete static-site \
	--config static-site.yaml

describe:
	gcloud deployment-manager deployments describe static-site

show-dns:
	gcloud dns record-sets list --zone alexflint-io

show-nameservers:
	gcloud dns managed-zones describe alexflint-io \
	--format=flattened | grep nameServers

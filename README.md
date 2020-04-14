## DNS setup

The domain alexflint.io is a registered through AWS. I looked into transferring it to Google Domains but it would cost me an extra $60 to do that. So instead it's registered through AWS but using Cloud DNS nameservers:
```
ns-cloud-c1.googledomains.com
ns-cloud-c2.googledomains.com
ns-cloud-c3.googledomains.com
ns-cloud-c4.googledomains.com
```

The Cloud DNS recordsets are all controlled through deployment manager -- see `infrastructure/static-site.yaml`.

To make a DNS change, just edit that file and run `make update' in the `infrastructure` dir.

I should eventually manage the bucket itself through deployment manager too.

The file `infrastructure/setup.sh' logs commands that I ran through gcloud that cannot be managed via deployment manager (e.g. enabling APIs).
## Personal site - 2026
>[dorajambor.com](http://dorajambor.com)

Static HTML site. No build step.

### Deployment

The site is hosted on **AWS S3 + CloudFront** (not GitHub Pages / Vercel — the
GitHub repo is source backup only):

- **S3 bucket:** `dorajambor.com` (static website hosting, `us-east-1`)
- **CloudFront distribution:** `E35LC4U2ZWH60G` — serves `dorajambor.com` + `www.dorajambor.com`
- **AWS account:** `686951232080`

To deploy after editing the HTML/assets:

```bash
./deploy.sh
```

This uploads the site files to S3 and invalidates the CloudFront cache so
changes appear at https://dorajambor.com within a minute or two. Requires the
AWS CLI configured with credentials for the account above.

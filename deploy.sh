#!/usr/bin/env bash
#
# Deploy the static site to AWS S3 + CloudFront.
#
# Uploads the site files to the dorajambor.com S3 bucket and invalidates the
# CloudFront cache so changes go live at https://dorajambor.com immediately.
#
# Requires: awscli configured with credentials for account 686951232080.
#
set -euo pipefail

BUCKET="dorajambor.com"
DISTRIBUTION_ID="E35LC4U2ZWH60G"

# Files that make up the site. Add new pages/assets here as needed.
FILES=(
  "index.html"
  "contact.html"
  "favicon.svg"
  "speaking-slush.webp"
)

cd "$(dirname "$0")"

echo "==> Uploading site files to s3://${BUCKET}/"
for f in "${FILES[@]}"; do
  if [[ -f "$f" ]]; then
    # Set an explicit content-type for HTML so browsers render it correctly.
    if [[ "$f" == *.html ]]; then
      aws s3 cp "$f" "s3://${BUCKET}/${f}" --content-type "text/html"
    else
      aws s3 cp "$f" "s3://${BUCKET}/${f}"
    fi
  else
    echo "    (skipping missing file: $f)"
  fi
done

echo "==> Invalidating CloudFront distribution ${DISTRIBUTION_ID}"
aws cloudfront create-invalidation \
  --distribution-id "${DISTRIBUTION_ID}" \
  --paths "/*" \
  --query "Invalidation.{Id:Id,Status:Status}" \
  --output table

echo "==> Done. Live at https://dorajambor.com (edge cache refreshes within a minute or two)."

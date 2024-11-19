<powershell>
Read-S3Object -BucketName fcc-demo-hello-world-artifacts -Key hello-${ME}.zip -File hello-${ME}.zip
Expand-Archive -Path hello-${ME}.zip -DestinationPath c:\hello
</powershell>
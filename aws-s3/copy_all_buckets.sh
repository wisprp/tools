#!/usr/bin/env bash
# 
# for authorization initialize ~/.aws/credentials profile
#    [source-aws-profile]
#    aws_access_key_id=KEY
#    aws_secret_access_key=SECRET
#    region=us-east-1
#
# alternatively define environment variables AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION
#

export AWS_PROFILE=source-aws-profile
export target_bucket=target-bucket


backup_dir=${AWS_PROFILE}-s3-backups
mkdir ${backup_dir}

buckets=$(aws s3 ls | cut -d' ' -f3)


for source_bucket in ${source_buckets}
    do 
    echo ${source_bucket}
    aws s3 sync s3://${bucket}/ s3://${target_bucket}/${backup_dir}/${bucket} # add & for parrallenling in bg
    done


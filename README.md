# AWS Terraform Simple Lab (S3 + DynamoDB)

## What this project does
This is a minimal Terraform lab that demonstrates:
- Using a **non-root IAM user** (with MFA)
- Terraform lifecycle: `fmt`, `validate`, `init`, `plan`, `apply`, `destroy`
- Creating and safely destroying AWS resources

## Resources created
- **S3 bucket** (private, public access blocked)
- **S3 object**: `hello.txt`
- **DynamoDB table** (PAY_PER_REQUEST, partition key `pk`)

## Prerequisites
- AWS account
- IAM user (non-root) with permissions for S3 and DynamoDB
- AWS CLI configured (`aws configure`)
- Terraform installed

## How to run

### 1. Generate a unique bucket name
```bash
BUCKET="sunay-tf-simple-lab-$(date +%Y%m%d)-$RANDOM"
echo "$BUCKET"

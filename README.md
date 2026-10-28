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
```

### 2. Pass the bucket name to Terraform

```bash
export TF_VAR_bucket_name="$BUCKET"
```

Terraform reads the `TF_VAR_bucket_name` environment variable and uses its value for the required `bucket_name` input variable declared in `variables.tf`.

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Check formatting and validate

```bash
terraform fmt -check
terraform validate
```

If the formatting check reports differences, run `terraform fmt` and check again.

### 5. Review the execution plan

```bash
terraform plan
```

Review the planned resources before deploying.

### 6. Apply the configuration

```bash
terraform apply
```

Type `yes` when prompted, after checking the proposed changes.

### 7. View Terraform outputs

```bash
terraform output
```

The configuration exposes the following outputs:

- `bucket_name`
- `object_key`
- `dynamodb_table`

## Cleanup

Remove the infrastructure when you have finished testing:

```bash
terraform destroy
```

Review the destruction plan before confirming.

**Note:** `hello.txt` is managed by Terraform, so `terraform destroy` deletes it before deleting the bucket. If you upload other files to the bucket manually, empty the bucket first, otherwise the bucket deletion fails.

## Learning outcomes

This lab demonstrates:

- Working with AWS using non-root IAM credentials
- Deploying S3 and DynamoDB resources using Terraform
- Passing variable values through environment variables
- Understanding Terraform state and outputs
- Using the Terraform lifecycle to create and destroy infrastructure

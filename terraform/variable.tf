variable "bucketName" {
  type    = string
  default = "wiaderko"
}

variable "objectKey" {
  type    = string
  default = "test"
}

variable "aclType" {
  type    = string
  default = "private"
}


variable "indexFile" {
  type    = string
  default = "index.html"
}

variable "errorFile" {
  type    = string
  default = "error.html"
}

variable "awsSource" {
  type    = string
  default = "hashicorp/aws"
}

variable "awsVersion" {
  type    = string
  default = "~> 3.27"
}

variable "policyDocumentPrincipalsType" {
  type    = string
  default = "AWS"
}

variable "policyDocumentPrincipalsIndentifiers" {
  type    = list(string)
  default = ["123456789012"]
}

variable "policyDocumentPrincipalsActions" {
  type    = list(string)
  default = [
    "s3:GetObject",
    "s3:ListBucket",
  ]
}

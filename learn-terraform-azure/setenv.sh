#!/usr/bin/env bash

TF_VERSION="0.14.11"
TF_DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"
TF_BIN_DIR="/usr/local/terraform"

info() {
    echo $1
}

upgradeTerraform() {
    info "Downloading ${TF_DOWNLOAD_URL}"
    curl -s ${TF_DOWNLOAD_URL} > ${TF_BIN_DIR}/terraform_${TF_VERSION}_linux_amd64.zip
    info "Exctracting ${TF_BIN_DIR}/terraform_${TF_VERSION}_linux_amd64.zip"
    unzip -p ${TF_BIN_DIR}/terraform_${TF_VERSION}_linux_amd64.zip > ${TF_BIN_DIR}/terraform

}

upgradeTerraform
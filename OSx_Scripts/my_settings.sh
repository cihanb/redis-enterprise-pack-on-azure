#!/bin/sh

# The MIT License (MIT)
#
# Copyright (c) 2015 Redis Labs
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# Script Name: settings.sh
# Author: Cihan Biyikoglu - github:(cihanb)

##rp settings
#total nodes in cluster
rp_total_nodes=4
#ubuntu 14 image for rp server. version can be 4.0 or later
#NOTE: builds upload to azure storage : "azure storage blob upload -f ~/Downloads/redislabs-4.5.0-15-trusty-amd64.tar --container rpbuilds -a rpbuilds -k 5GoKRscF0i9M1/7GktC+JeBQIqKK42p4Q48wIb3ZSfMSL1AVG3EGZf4C6H5YJBQAPVb+kaEKhHOqqptqr8StWA=="
#NOTE: build download from azure storage: "https://rpbuilds.blob.core.windows.net/rpbuilds/redislabs-4.5.0-15-trusty-amd64.tar" 
#NOTE: public builds come from "https://s3.amazonaws.com/rlec-downloads/4.5.0/Redis-Pack-4.5.0-40-trusty-amd64.tar"
rp_download="https://rpbuilds.blob.core.windows.net/rpbuilds/redislabs-5.0.0-12-trusty-amd64.tar"
rp_binary="redislabs-5.0.0-12-trusty-amd64.tar"
#cluster name
rp_fqdn="cluster.rp.local"
#add a license file if one exists. free license will be used if none is specified.
rp_license_file="~/rp_license.txt"
#TODO: change this username
rp_admin_account_name="cihan@redislabs.com"
#TODO: change this password
rp_admin_account_password="redislabs123"


##azure settings
#TODO: use "azure login -u account" +  "azure account show" to get  account and subscriptionid
azure_account="cb@cihangirbhotmail.onmicrosoft.com"
azure_subscription_id="3d01005f-455d-4430-b930-8455310e1f65"
#TODO: certs for ssh. use ssh-keygen to generate the keys - public and private
vm_auth_cert_public="~/.ssh/id_rsa.pub"
vm_auth_cert_private="~/.ssh/id_rsa"
#prefix to use for the VM name for all nodes 
vm_name_prefix="rlec"
#vnet name to keeps azure vms in the same subnet 
vnet_name="cb_private1" 
#azure service name for all nodes
service_name="cbase-service"
#region where to provision all nodes
region="'west US'"
#number of data-disks to attach - check the max data-disk allowed on each SKU
data_disk_count=1
#size of the data-disk in GB max is 1023
data_disk_size=1023


##jumpbox settings
#disable jumpbox: set to 1 to diable jumpbox. jumpbox is provisioned for security reasons. you may need to open 8443 and other rp server ports to the public internet without it. 
disable_jumpbox=1
#image to use for the jumpbox. using windows server by default
jumpbox_image_name="a699494373c04fc0bc8f2bb1389d6106__Windows-Server-2012-Datacenter-20160329-en.us-127GB.vhd"
#jumpbox vm sku to use. 
jumpbox_vm_sku="Standard_D2"
#TODO: change this username
jumpbox_vm_admin_account_name="rl_vmadmin"
#TODO: change this password
jumpbox_vm_admin_account_password="redisl@bs123"

##cluster settings
#ubuntu OS image to use on azure
rp_vm_image_name="b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_4-LTS-amd64-server-20160314-en-us-30GB"
#cluster vm sku to use. Standard_D2 can be used as the minimum HW. 
rp_vm_sku="Standard_D11"
#rp cluster vm admin account name
rp_vm_admin_account_name="rl_vmadmin"

#misc settings
#this will enable removing the .ssh/known_hosts file under MacOS. The file gets in the way of reprovisioning the same node names for the cluster.
remove_known_hosts=1
#enable fast delete will supress confirmation on deletes of each VM. do this only if you are certain delete will not harm your existing VMs and you have tried the script multiple times.
enable_fast_delete=1
#enable fast restart will supress confirmation on restarts of each VM. do this only if you are certain restart will not harm your existing VMs and you have tried the script multiple times.
enable_fast_restart=1
#enable fast start will supress confirmation on start of each VM. do this only if you are certain start will not harm your existing VMs and you have tried the script multiple times.
enable_fast_start=1
#enable fast shutdown will supress confirmation on shutdowns of each VM. do this only if you are certain shutdown will not harm your existing VMs and you have tried the script multiple times.
enable_fast_shutdown=1
#print colors
info_color="\033[1;32m"
warning_color="\033[0;33m"
error_color="\033[0;31m"
no_color="\033[0m"

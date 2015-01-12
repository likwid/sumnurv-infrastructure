# Creating a highly available VPC with public/private subnets

## Create the VPC
* CIDR: 172.22.0.0/16
* Name: Example VPC

## Create the subnets

* __Public Subnet #1__
  * CIDR: 172.22.10.0/24
  * Name: Public #1
  * AZ  : us-east-1b

* __Public Subnet #2__
* CIDR: 172.22.11.0/24
* Name: Public #2
* AZ  : us-east-1c

* __Private Subnet #1__
* CIDR: 172.22.100.0/24
* Name: Private #1
* AZ  : us-east-1b

* __Private Subnet #2__
* CIDR: 172.22.101.0/24
* Name: Private #2
* AZ  : us-east-1c

## Create Internet Gateway

## Create Public Route Table

## Create Private Route Table

## Associate Public #1 and Public #2 with Public Route Table

## Associate Private #1 and Private #2 with Private Route Table

## Add 0.0.0.0/0 - Internet Gateway Route to Public Route Table

## Create NAT Instance in Public #1

## Disable source/destination checking on NAT instance

## Add 0.0.0.0/0 - NAT Instance to Private Route Table 

## Add private instance to test with

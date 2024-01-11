# VPC(Virtual Private Cloud) id - vpc-0139594508f73dd40
# subnet - subnet-00cf5af48d79250ff
# ami(Amazon Machine Image) - ami-0005e0cfe09cc9050
# security group id - sg-0bd5fb93569289c02
# key name - 0712mac.pem

# get information about instances
# aws ec2 describe-instances


aws ec2 run-instances --image-id ami-0c7217cdde317cfec \
--count 1 --instance-type t2.micro \
--key-name 0712mac \
--security-group-ids sg-0fdb6e4eb4d7c35e8 \
--subnet-id subnet-04c57ca40448e6767
# Jenkins/slave & wildfly instalation
That repository created for make wildfly and Jenkins with slave faster instalation. all manipulations in this manual will be carried out in the AWS

# Control node seting up
At first you need to install git and clone repository
For git instalation go to https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
and take information about instalation on you operation system 

clone repository command:
git clone https://github.com/YevheniiHryshkovets/IaC.git
```
https://git-scm.com/book/en/v2/Getting-Started-Installing-Git 
```
Then you need to install terraform. Take more information about instalation on your OS there:
https://developer.hashicorp.com/terraform/install

And use your IAM credentials to authenticate AWS:
```
export AWS_ACCESS_KEY_ID=<your access key>
export AWS_SECRET_ACCESS_KEY=<your secret access key>
```

# Infrastructure seting up

At first open /terraform directory

next use initial terraform cammand:
```
terraform init
```

For checking more description about instances run:
```
terraform plan
```
For start instancess creation use that simple command, and don't forget type "yes" when terraform asc you about that:
```
terraform apply
```

In case when you need to destroy infrastructure in AWS you can run command below
```
terraform destroy
```




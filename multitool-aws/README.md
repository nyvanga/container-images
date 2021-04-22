# Multitool for AWS

AWS CLI v1 is installed as described [here](https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html)!

Run on docker: ```docker run -it --rm -v $HOME/.aws:/root/.aws --name multitool-aws nyvanga/multitool-aws```

Maybe put in some aliases in your .bashrc file:
```
alias aws-dev='docker run -it --rm -v $HOME/.aws_dev:/root/.aws --entrypoint /usr/local/bin/aws --name aws-dev nyvanga/multitool-aws'
alias aws-qa='docker run -it --rm -v $HOME/.aws_qa:/root/.aws --entrypoint /usr/local/bin/aws --name aws-qa nyvanga/multitool-aws'
```

And then run your commands as always, but choose the environment easy, and without resorting to 'profiles'.
```
aws-dev s3api list-buckets
```

## Test build

First run: ```docker-compose up -d --build --no-cache```

Then to access the container: ```docker-compose exec -- test_build_multitool_aws bash```

It will volume mount your ```$HOME/.aws``` folder into the container, so make sure it has the right AWS config and credentials.

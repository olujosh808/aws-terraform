output pip {
    value=aws_instance.web_instance.public_ip
    description = "The value of the elp to the ec2 instance"
}

output arn {
    value=aws_instance.web_instance.arn
    description = "The value of the ARN of the ec2 instance"
}
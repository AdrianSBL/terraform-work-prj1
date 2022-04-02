resource "aws_security_group_rule" "ssh" {
 
    type             = "ingress"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    #cidr_blocks      = ["84.195.131.135/32"]
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "sg-07f82bb60214af622"     
}


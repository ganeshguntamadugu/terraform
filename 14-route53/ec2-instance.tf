#To create ec2-instance using variables
resource "aws_instance" "expense" {
    count = length(var.instance_names) #Here length is a function it will create based on the length of the list
    ami = var.ami_id
    instance_type = var.instance_id
    vpc_security_group_ids = [aws_security_group.sg_expense.id]
    tags = merge ( #This is function
        var.common_tags,
        {
            Name = var.instance_names[count.index] #Here it will create 3 different instance using count.index
            Component = var.instance_names[count.index]
        }
    )
}


#To create Security group using variables
resource "aws_security_group" "sg_expense" {
    name = var.sg_name
    description = var.sg_description

    #inbound rule
    #below are called ingress block in terraform
    ingress{
        description = var.ingress_descr
        from_port = var.ingress_port_number
        to_port = var.ingress_port_number
        protocol = var.ingress_protocol
        cidr_blocks = var.sg_cidr_blocks
    }

    #outbound rule
    #below are called ingress block in terraform
    egress{
        description = var.egress_descr
        from_port = var.egress_port_number
        to_port = var.egress_port_number
        protocol = var.egress_protocol
        cidr_blocks = var.sg_cidr_blocks
    }

    tags = merge ( #This is function
        var.common_tags,
        {
            Name = "Expense" #Here it will create 3 different instance using count.index
            Component = "Expense"
        }
    )
}


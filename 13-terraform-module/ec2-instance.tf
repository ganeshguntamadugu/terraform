#Module user / Root module

module "ec2" {
    source = "../12-module-demo"
    # Here below instance is variable expected by module, not arguments of resource definition
    # We can also create variables or else we can directly use values here
    instance = var.instance_something
    ami_id = var.ami_id_something
}
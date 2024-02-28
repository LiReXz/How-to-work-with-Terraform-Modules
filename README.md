Working with Terraform Modules

This repository is an example that demonstrates how to work with Terraform modules to manage cloud infrastructure. The project structure is organised to address different types of resources, such as compute, network and identity and access (IAM).

Project Structure

|-- main.tf
|-- variables.tf
|-- outputs.tf
|-- compute/
|   |-- main.tf
|   |-- resources.tf
|   |-- locals.tf
|   |-- outputs.tf
|-- network/
|   |-- main.tf
|   |-- resources.tf
|   |-- locals.tf
|   |-- outputs.tf
|-- iam/
|   |-- main.tf
|   |-- resources.tf
|   |-- locals.tf
|   |-- outputs.tf

Home folder:

    main.tf:
        Main file in the root directory. It is the first file that Terraform checks when it is launched.
        Defines providers, access keys and declares dependencies between modules. It is also used to transfer variables from one module to another.

    variables.tf:
        Only saved for the root directory.
        Defines variables used in the main.tf file.


Module directories:

    compute/, network/, iam/:
        Subdirectories for each resource type.
        They contain:
        
            main.tf:
                Dependencies with other modules (if any) are declared.

            resources.tf:
                All resources to be built are declared. This can be done in a single file (this or main.tf), or a file can be used for each group of resources as shown in the example code (vpcs.tf, subnets.tf, route_tables.tf, ...).
            
            outputs.tf:
                Defines as variables the values that you want to export to other modules.
            
            locals.tf:
                Only saved for the module directory.
                Defines variables used in the module files.

Development Process

    1. Variables and Dependencies:
        In main.tf of the root directory, define providers, access keys and declare dependencies between modules.
        Use variables defined in variables.tf to keep the configuration modular and customisable.
        In each module

    2. Modules:
        Divide your infrastructure into subdirectories compute/, network/, iam/ (example).
        In each subdirectory, use main.tf(if depends on any othe module), locals.tf(to save your local variables of the module), outputs.tf(to export variables to another module) and other ".tf" files to define specific resources.

    3. Variables Transfer:
        In outputs.tf in the modules directory, define outputs that contain values you need to pass between modules.
        In inputs.tf in the modules directory, define empty variables to collect the value of variables from other modules.
        The transfer of variables takes place in the main.tf file in the project's main directory. In this file, inside the block where the module to which we want to pass the variables is defined, we use the syntax module_variable_name = module.module_from_which_the_variable_will_be_collected.variable_name to perform the transfer.
        
        In a practical example, the steps would be as follows:
    
        1. In the Source Module (Subdirectory 1):

            In the module containing the variables you want to pass (e.g. network/), define the variables and create outputs in the outputs.tf file.
            Example (network/outputs.tf):

            output "example1-vpc-id" {  // Can be any other descriptive name
                value = aws_vpc.example1-vpc.id
            }

        2. In the Target Module (Subdirectory 2):

            In the module that needs to use those variables (e.g. compute/), create an inputs.tf file and define the input variables.
            Example (compute/inputs.tf):

            variable "example1-vpc-id" {  // Can be any other descriptive name
                description = "ID of the VPC obtained from the network module"
            }

        3. In the Main or Root File:

        In the main.tf file or in the root directory, you can reference both modules and connect the output variables to the input variables.
        Example (main.tf):

        module "network" {
            source = "./network"
            // Other compute module configurations
        }

        module "compute" {
            source = "./compute"
            example1-vpc-id = module.network.example1-vpc-id
            // Other network module configurations
        }


    4. Resource Examples:
        Some examples are presented in each module on how to define some AWS resources exporting some values from a module to other.
        A lot of fields should be filled with the correct information depending on your project needs.
        Refer to the official HashiCorp Terraform documentation for specific details on defining resources: Terraform Documentation.

Additional Notes

    Modules that do not depend on any other module do not need a main.tf file(or you can define resources directly in main.tf file).
    Modules that do not need to export any value to another module do not need outputs.tf file.
    Modules that do not need to pick up the value of any variable from another module do not need inputs.tf file
    Make sure to avoid circular dependencies between modules to avoid problems during deployment.
    

Explore and enjoy working with Terraform!
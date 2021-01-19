provider "aws" {
  region                  = "ca-central-1"
  shared_credentials_file = "/home/rahul-optit/.aws/credentials"
  profile                 = "ca"
}
resource "aws_launch_template" "devtoolslaunchtemplate" {
  name = "devtoolslaunchtemplate"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
      volume_type = "gp2"

    }
  }
  iam_instance_profile {
    name = "prodca-iam-instance-profile"
  }

  image_id      = "ami-0ab2f1116d02c2ec1"
  user_data     = "${base64encode(file("devtool.sh"))}"
  instance_type = "t2.micro"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
  }

  placement {
    availability_zone = "ca-central-1a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "devtools"
    }
  }
}
resource "aws_autoscaling_group" "bar" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.devtoolslaunchtemplate.id
    version = "$Latest"
  }
}
resource "aws_launch_template" "ingesterjobslaunchtemplate" {
  name = "ingesterjobslaunchtemplate"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
      volume_type = "gp2"

    }
  }
  iam_instance_profile {
    name = "prodca-iam-instance-profile"
  }

  image_id      = "ami-0ab2f1116d02c2ec1"
  user_data     = "${base64encode(file("ingester.sh"))}"
  instance_type = "t2.micro"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
  }

  placement {
    availability_zone = "ca-central-1a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ingesterjobs"
    }
  }
}
resource "aws_autoscaling_group" "ingesterjobs" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.ingesterjobslaunchtemplate.id
    version = "$Latest"
  }
}
resource "aws_launch_template" "aggregationslaunchtemplate" {
  name = "aggregationslaunchtemplate"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
      volume_type = "gp2"

    }
  }
  iam_instance_profile {
    name = "prodca-iam-instance-profile"
  }

  image_id      = "ami-0ab2f1116d02c2ec1"
  user_data     = "${base64encode(file("aggregations.sh"))}"
  instance_type = "t2.micro"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
  }

  placement {
    availability_zone = "ca-central-1a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "aggregations"
    }
  }
}
resource "aws_autoscaling_group" "aggregations" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.aggregationslaunchtemplate.id
    version = "$Latest"
  }
}
resource "aws_launch_template" "daemons1launchtemplate" {
  name = "daemons1launchtemplate"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
      volume_type = "gp2"

    }
  }
  iam_instance_profile {
    name = "prodca-iam-instance-profile"
  }

  image_id      = "ami-0ab2f1116d02c2ec1"
  user_data     = "${base64encode(file("daemons1.sh"))}"
  instance_type = "t2.micro"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
  }

  placement {
    availability_zone = "ca-central-1a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "daemons1"
    }
  }
}
resource "aws_autoscaling_group" "daemons1" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.daemons1launchtemplate.id
    version = "$Latest"
  }
}
resource "aws_launch_template" "daemons2launchtemplate" {
  name = "daemons2launchtemplate"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
      volume_type = "gp2"

    }
  }
  iam_instance_profile {
    name = "prodca-iam-instance-profile"
  }

  image_id      = "ami-0ab2f1116d02c2ec1"
  user_data     = "${base64encode(file("daemons2.sh"))}"
  instance_type = "t2.micro"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
  }

  placement {
    availability_zone = "ca-central-1a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "daemons2"
    }
  }
}
resource "aws_autoscaling_group" "daemons2" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.daemons2launchtemplate.id
    version = "$Latest"
  }
}
resource "aws_launch_template" "daemons3launchtemplate" {
  name = "daemons3launchtemplate"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
      volume_type = "gp2"

    }
  }
  iam_instance_profile {
    name = "prodca-iam-instance-profile"
  }

  image_id      = "ami-0ab2f1116d02c2ec1"
  user_data     = "${base64encode(file("daemons3.sh"))}"
  instance_type = "t2.micro"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
  }

  placement {
    availability_zone = "ca-central-1a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "daemons3"
    }
  }
}
resource "aws_autoscaling_group" "daemons3" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.daemons3launchtemplate.id
    version = "$Latest"
  }
}
resource "aws_launch_template" "daemons4launchtemplate" {
  name = "daemons4launchtemplate"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
      volume_type = "gp2"

    }
  }
  iam_instance_profile {
    name = "prodca-iam-instance-profile"
  }

  image_id      = "ami-0ab2f1116d02c2ec1"
  user_data     = "${base64encode(file("daemons4.sh"))}"
  instance_type = "t2.micro"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
  }

  placement {
    availability_zone = "ca-central-1a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "daemons4"
    }
  }
}
resource "aws_autoscaling_group" "daemons4" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.daemons4launchtemplate.id
    version = "$Latest"
  }
}
resource "aws_launch_template" "ingesterclientlaunchtemplate" {
  name = "ingesterclientlaunchtemplate"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
      volume_type = "gp2"

    }
  }
  iam_instance_profile {
    name = "prodca-iam-instance-profile"
  }

  image_id      = "ami-0ab2f1116d02c2ec1"
  user_data     = "${base64encode(file("ingesterclient.sh"))}"
  instance_type = "t2.micro"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
  }

  placement {
    availability_zone = "ca-central-1a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ingesterclient"
    }
  }
}
resource "aws_autoscaling_group" "ingesterclient" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.ingesterclientlaunchtemplate.id
    version = "$Latest"
  }
}
resource "aws_launch_template" "pyamidisagglaunchtemplate" {
  name = "pyamidisagglaunchtemplate"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
      volume_type = "gp2"

    }
  }
  iam_instance_profile {
    name = "prodca-iam-instance-profile"
  }

  image_id      = "ami-0d6d536a37610d8b8"
  user_data     = "${base64encode(file("pyamidisagg.sh"))}"
  instance_type = "t2.micro"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
  }

  placement {
    availability_zone = "ca-central-1a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "pyamidisagg"
    }
  }
}
resource "aws_autoscaling_group" "pyamidisagg" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.pyamidisagglaunchtemplate.id
    version = "$Latest"
  }
}
resource "aws_launch_template" "pyamidisaggprioritylaunchtemplate" {
  name = "pyamidisaggprioritylaunchtemplate"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 30
      volume_type = "gp2"

    }
  }
  iam_instance_profile {
    name = "prodca-iam-instance-profile"
  }

  image_id      = "ami-0bce8a610d475d0f0"
  user_data     = "${base64encode(file("pyamidisaggpriority.sh"))}"
  instance_type = "t2.micro"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
  }

  placement {
    availability_zone = "ca-central-1a"
  }


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "pyamidisaggpriority"
    }
  }
}
resource "aws_autoscaling_group" "pyamidisaggpriority" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.pyamidisaggprioritylaunchtemplate.id
    version = "$Latest"
  }
}

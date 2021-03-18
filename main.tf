provider "aws" {
  region                  = "ca-central-1"
  shared_credentials_file = "/home/rahul-optit/.aws/credentials"
  profile                 = "ca"
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
  instance_type = "m4.xlarge"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
    security_groups             = ["sg-0a3db65a3dad9644f"]

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
resource "aws_autoscaling_group" "ingesterjobs-od-asg-prodca" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.ingesterjobslaunchtemplate.id
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
  instance_type = "m4.xlarge"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
    security_groups             = ["sg-0a3db65a3dad9644f"]

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
resource "aws_autoscaling_group" "ingesterclient-od-asg-prodca" {
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
  instance_type = "m4.xlarge"
  key_name      = "prodca"

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = "subnet-0b203fd84612bcbd1"
    security_groups             = ["sg-0a3db65a3dad9644f"]

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
resource "aws_autoscaling_group" "pyamidisagg-od-asg-prodca" {
  availability_zones = ["ca-central-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  launch_template {
    id      = aws_launch_template.pyamidisagglaunchtemplate.id
    version = "$Latest"
  }
}

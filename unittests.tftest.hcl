#2 unit testing
run "name_validation"{
  command = plan

  assert {
    condition = module.instance.ec2_instance_tags["Name"] == "${var.name}"
    error_message = "TEST_ERROR: Instance name is not as expected"
  }
}
package main

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"

  not resource.change.after.tags["Name"]
  msg = sprintf("Missing 'Name' tag for resource: %s", [resource.address])
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"

  not resource.change.after.tags["Owner"]
  msg = sprintf("Missing 'Owner' tag for resource: %s", [resource.address])
}


#deny[msg] {
#  resource := input.resource_changes[_]
#  resource.type == "aws_instance"
#
#  not resource.change.after.tags["Name"]
#  msg = sprintf("Missing 'Name' tag for resource: %s", [resource.address])
#}
#
#deny[msg] {
#  resource := input.resource_changes[_]
#  resource.type == "aws_instance"
#
#  not resource.change.after.tags["Environment"]
#  msg = sprintf("Missing 'Environment' tag for resource: %s", [resource.address])
#}
#
#deny[msg] {
#  resource := input.resource_changes[_]
#  resource.type == "aws_instance"
#
#  not resource.change.after.tags["Owner"]
#  msg = sprintf("Missing 'Owner' tag for resource: %s", [resource.address])
#}
#
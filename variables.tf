variable "me" {
  description = "Value of the suffix for the EC2 instance and other resources"
  type        = string
  # there is not default value, it must be done on the commmand line in the GH action
}
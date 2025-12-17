variable "ssh_key" {
  description = "My SSH public key"
  type        = string
  default     = "AAAAC3NzaC1lZDI1NTE5AAAAINg5o7zyC0gskWFcIg/GmLw8eihX5Ju0dASDKwjmeoVK"
}
variable "password" {
  description = "my PVE password"
  type        = string
}

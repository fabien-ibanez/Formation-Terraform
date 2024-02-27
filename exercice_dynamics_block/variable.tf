variable "allow" {
  description = "list of values"
  type = list(object({
    protocol           = string
    ports              = list(string)
  }))
}
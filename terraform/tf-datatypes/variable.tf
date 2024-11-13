# String variable
variable "example_string" {
  description = "An example of a string variable"
  type        = string
  default     = "ruchit0903"
}

# Number variable
variable "example_number" {
  description = "An example of a number variable"
  type        = number
  default     = 42
}

# Boolean variable
variable "example_bool" {
  description = "An example of a boolean variable"
  type        = bool
  default     = true
}

# List variable
variable "example_list" {
  description = "An example of a list variable"
  type        = list(string)
  default     = ["apple", "banana", "cherry"]
}

# Map variable
variable "example_map" {
  description = "An example of a map variable"
  type        = map(string)
  default     = {
    name  = "ruchit"
    email = "ruchit_test@gmail.com"
  }
}

# Set variable
variable "example_set" {
  description = "An example of a set variable"
  type        = set(string)
  default     = ["aws", "azure", "gcp"]
}

# Object variable
variable "example_object" {
  description = "An example of an object variable"
  type = object({
    name    = string
    age     = number
    is_user = bool
  })
  default = {
    name    = "Alice"
    age     = 30
    is_user = true
  }
}

# Tuple variable
variable "example_tuple" {
  description = "An example of a tuple variable"
  type        = tuple([string, number, bool])
  default     = ["Terraform", 101, true]
}

# Any variable (can take any type of value)
variable "example_any" {
  description = "An example of an any variable"
  type        = any
  default     = "This can be any type"
}

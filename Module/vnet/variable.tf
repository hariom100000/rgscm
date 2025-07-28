variable "vnet-name1" {
 type = map(object({
   name = string
   location = string
   rgname = string
   address_space = list(string)
 }))
}
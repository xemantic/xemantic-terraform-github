variable "owner" {
  type = string
  description = "GitHub user/organization containing the repository"
}

variable "repository" {
  type = string
  description = "GitHub repository name"
}

variable "description" {
  type = string
  description = "Repository description"
}

variable "private" {
  type = bool
  description = "Is this a private repository (public by default)"
  default = false
}

variable "pages_url" {
  description = "CNAME for GitHub pages"
  type        = string
  default     = null
}

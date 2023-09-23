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

variable "homepage_url" {
  type = string
  description = "URL of a page describing the project."
  default = null
}

variable "pages_url" {
  description = "CNAME for GitHub pages"
  type        = string
  default     = null
}

variable "has_downloads" {
  type = bool
  default = false
}

variable "has_issues" {
  type = bool
  default = false
}


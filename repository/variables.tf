variable "owner" {
  description = "GitHub user/organization containing the repository"
  type        = string
}

variable "name" {
  description = "GitHub repository name"
  type        = string
}

variable "description" {
  description = "Repository description"
  type        = string
}

variable "private" {
  description = "Is this a private repository (public by default)"
  type        = bool
  default     = false
}

variable "homepage_url" {
  description = "URL of a page describing the project"
  type        = string
  default     = null
}

variable "pages_url" {
  description = "CNAME for GitHub pages"
  type        = string
  default     = null
}

variable "has_issues" {
  description = "Set to `true` to enable the GitHub Issues features on the repository"
  type        = bool
  default     = false
}

variable "has_discussions" {
  description = "Set to `true` to enable GitHub Discussions on the repository"
  type        = bool
  default     = false
}

variable "has_projects" {
  description = " Set to `true` to enable the GitHub Projects features on the repository. Per the GitHub documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error."
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = " Set to true to enable the GitHub Wiki features on the repository."
  type        = bool
  default     = false
}

variable "license_template" {
  description = "Use the [name of the template](https://github.com/github/choosealicense.com/tree/gh-pages/_licenses) without the extension. For example, \"mit\" or \"mpl-2.0\"."
  type        = string
  default     = null
}

variable "topics" {
  description = "The list of topics of the repository"
  type        = list(string)
  default     = null
}

variable "branch_protection" {
  description = "Set to `true` to enable repository branch protection. For `private` repos on free plan it should be `false`"
  type        = bool
  default     = true
}

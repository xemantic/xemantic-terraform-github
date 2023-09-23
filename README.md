# xemantic-terraform-github
Opinionated Terraform modules to manage GitHub

In case of GitHub repository creation it comes with defaults
more suitable for our purposes, therefore less verbose
and it also creates default branch protection rule for
each repository.

## Usage

Add this to your `.tf` file:

```terraform
module "github_repository_foo" { 
  source = "git@github.com:xemantic/xemantic-terraform-github.git//repository"
  owner = "<<your-github-account-or-organization>>"
  repository = "foo"
  description = "My foo repo"
}
```

Check out [repository/variables.tf](repository/variables.tf) for
all the possible parameters.

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  owner = var.owner
}

resource github_repository this {
  name                 = var.repository
  description          = var.description
  vulnerability_alerts = true
  has_wiki             = false
  dynamic "pages" {
    for_each = var.pages_url != null ? [1] : []
    content {
      build_type = "legacy"
      cname      = var.pages_url
      source {
        branch = "main"
        path   = "/"
      }
    }
  }
}

resource github_branch_protection main {
  repository_id                   = github_repository.this.id
  pattern                         = "main"
  allows_deletions                = false
  allows_force_pushes             = false
  blocks_creations                = false
  enforce_admins                  = false
  force_push_bypassers            = []
  lock_branch                     = false
  push_restrictions               = []
  require_conversation_resolution = false
  require_signed_commits          = false
  required_linear_history         = false
}

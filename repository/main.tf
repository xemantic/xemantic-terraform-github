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
  name                   = var.name
  description            = var.description
  vulnerability_alerts   = true
  homepage_url           = var.homepage_url
  visibility             = var.private ? "private" : "public"
  has_issues             = var.has_issues
  has_discussions        = var.has_discussions
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  has_downloads          = false
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = false
  allow_auto_merge       = false
  delete_branch_on_merge = true
  auto_init              = true
  license_template       = var.license_template
  allow_update_branch    = true
  topics                 = var.topics
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
  repository_id                   = github_repository.this.node_id
  pattern                         = "main"
  allows_deletions                = false
  allows_force_pushes             = false
  blocks_creations                = false
  enforce_admins                  = false
  force_push_bypassers            = []
  lock_branch                     = false
  push_restrictions               = []
  require_conversation_resolution = true
  require_signed_commits          = false
  required_linear_history         = true
}

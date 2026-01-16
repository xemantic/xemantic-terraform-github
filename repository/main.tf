terraform {
  required_version = ">= 1.6.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  owner = var.owner
}

resource "github_repository" "this" {
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

resource "github_repository_ruleset" "main" {
  count       = var.branch_protection ? 1 : 0
  name        = "main-branch-protection"
  repository  = github_repository.this.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    deletion                = true
    non_fast_forward        = true
    required_linear_history = true

    pull_request {
      required_approving_review_count   = 1
      required_review_thread_resolution = true
      dismiss_stale_reviews_on_push     = true
      require_last_push_approval        = true
      allowed_merge_methods             = ["squash"]
    }

    dynamic "required_status_checks" {
      for_each = var.required_status_check != null ? [1] : []
      content {
        strict_required_status_checks_policy = true

        required_check {
          context = var.required_status_check
        }
      }
    }
  }
}

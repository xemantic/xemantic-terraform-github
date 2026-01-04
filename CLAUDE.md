# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Terraform module for creating GitHub repositories with opinionated defaults. It provides a reusable `repository` module that creates GitHub repos with:

- Vulnerability alerts enabled
- Squash merge only (no merge commits or rebases)
- Auto-delete branches on merge
- Auto-init enabled
- Optional repository ruleset on `main` with PR reviews, conversation resolution, and linear history required

## Architecture

The module lives in the `repository/` directory:
- `main.tf` - Core resources: `github_repository` and `github_repository_ruleset`
- `variables.tf` - Input variables (owner, name, description, visibility, features, branch_protection)
- `outputs.tf` - Exports `repository_id`

Uses the `integrations/github` provider (~> 6.0).

## Usage as a Module

This repo is meant to be consumed as a Git-sourced Terraform module:

```terraform
module "my_repo" {
  source = "git@github.com:xemantic/xemantic-terraform-github.git//repository"
  owner = "your-org"
  name = "repo-name"
  description = "Description"
}
```

## Key Configuration Notes

- `branch_protection` defaults to `true` but must be `false` for private repos on free GitHub plans (rulesets have the same plan restrictions as the legacy branch protection)
- `private` defaults to `false` (public visibility)
- Features like `has_issues`, `has_wiki`, `has_discussions`, `has_projects` all default to `false`
# Create one repository for each team,issues enabled
resource "github_repository" "sample_demo_repos" {
  count                  = "${length(var.gh_teams)}"
  name                   = "${var.gh_teams[count.index]}_repo"
  description            = "${var.gh_teams[count.index]} repository"
  allow_squash_merge     = "false"
  auto_init              = "true"
  has_issues             = "true"
  delete_branch_on_merge = "true"
}

# Create labels
resource "github_issue_label" "label_repos" {
  count       = "${length(var.gh_teams)}"
  repository  = "${var.gh_teams[count.index]}_repo"
  name        = "Bug and Feature issue"
  color       = "${var.gh_color_labels}"
  depends_on  = ["github_repository.sample_demo_repos"]
  description = "may the force be with you" 
}

# Set protection
resource "github_branch_protection" "users_repos" {
  count                             = "${length(var.gh_teams)}"
  repository                        = "${var.gh_teams[count.index]}_repo"
  branch                            = "master"
  enforce_admins                    = "true"
  required_pull_request_reviews     = {
    require_code_owner_reviews      = true
    required_approving_review_count = 2
  }
}

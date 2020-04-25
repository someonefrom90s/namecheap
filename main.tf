# Github auth
provider "github" {
  token        = "${var.gh_token}"
  organization = "${var.gh_org}"
}

# Teams and members
module "teams" {
  source              = "modules/teams"
  team_managers       = "${var.team_managers}"
  team_devops         = "${var.team_devops}"
  team_frontend       = "${var.team_frontend}"
  team_infrastructure = "${var.team_infrastructure}"
  all_users           = "${var.all_users}"
  gh_teams            = "${var.gh_teams}"
}

# Repositories
module "repositories" {
  source    = "modules/repositories"
  gh_teams  = "${var.gh_teams}"
  gh_token  = "${var.gh_token}"
  gh_org    = "${var.gh_org}"
}

## Add a collaborator to a repository
#resource "github_repository_collaborator" "users_repos" {
#  count      = "${length(var.gh_users)}"
#  repository = "${var.gh_users[count.index]}_repo"
#  username   = "${var.gh_users[count.index]}"
#  permission = "push"
#  depends_on = ["github_repository.users_repos"]
#}
#
## Create labels
#resource "github_issue_label" "users_repos" {
#  count      = "${length(var.gh_users) * length(var.gh_labels) * var.gh_labels_enable}"
#  repository = "${var.gh_users[count.index / length(var.gh_labels)]}_repo"
#  name       = "${var.gh_labels[(count.index) % length(var.gh_labels)]}"
#  color      = "${var.gh_color_labels}"
#  depends_on = ["github_repository.users_repos"]
#}
#
#resource "github_issue_label" "users_repost" {
#  count      = "${length(var.gh_users) * var.gh_task_count  * var.gh_labels_enable}"
#  repository = "${var.gh_users[count.index / var.gh_task_count]}_repo"
#  name       = "Task-${(count.index) % var.gh_task_count + 1}"
#  color      = "${var.gh_color_tasks}"
#  depends_on = ["github_repository.users_repos"]
#}

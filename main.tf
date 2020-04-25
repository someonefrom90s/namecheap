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

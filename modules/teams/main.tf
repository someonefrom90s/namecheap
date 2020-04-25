#Create teams (DevOps, Infrastructure, Frontend, Managers) with members in them
# https://github.com/hashicorp/terraform/issues/2114 didnt have enough time to make it work for membership part so I commented
#resource "github_team" "teams" {
#  count       = "${length(var.gh_teams)}" 
#  name        = "${var.gh_teams[count.index]}"
#  id          = "${var.gh_teams[count.index]}"
#  description = "${var.gh_teams[count.index]} team"
#  privacy     = "closed"
#}

# Create Teams by one by because of nested variables as I mentioned at the top
resource "github_team" "devops" {
  name        = "devops"
  description = "Devops team"
  privacy     = "closed"
}

resource "github_team" "managers" {
  name        = "managers"
  description = "managers team"
  privacy     = "closed"
}

resource "github_team" "frontend" {
  name        = "frontend"
  description = "frontend team"
  privacy     = "closed"
}

resource "github_team" "infrastructure" {
  name        = "infrastructure"
  description = "infrastructure team"
  privacy     = "closed"
}


# Add users to the organization
resource "github_membership" "membership_for_users" {
  count    = "${length(var.all_users)}"
  username = "${var.all_users[count.index]}"
  role     = "member"
}
  
# Add users to teams
resource "github_team_membership" "devops_membership" {
  team_id  = "${github_team.devops.id}"
  count    = "${length(var.team_devops)}"
  username = "${var.team_devops[count.index]}"
  role     = "member"
}

resource "github_team_membership" "managers_membership" {
  team_id  = "${github_team.managers.id}"
  count    = "${length(var.team_managers)}"
  username = "${var.team_managers[count.index]}"
  role     = "member"
}

resource "github_team_membership" "frontend_membership" {
  team_id  = "${github_team.frontend.id}"
  count    = "${length(var.team_frontend)}"
  username = "${var.team_frontend[count.index]}"
  role     = "member"
}

resource "github_team_membership" "infrastructure_membership" {
  team_id  = "${github_team.infrastructure.id}"
  count    = "${length(var.team_infrastructure)}"
  username = "${var.team_infrastructure[count.index]}"
  role     = "member"
}

# Teams repo
resource "github_team_repository" "team_devops_repo" {
  team_id  = "${github_team.devops.id}"
  repository = "devops_repo"
  permission = "admin"
}

resource "github_team_repository" "team_frontend_repo" {
  team_id  = "${github_team.frontend.id}"
  repository = "frontend_repo"
  permission = "admin"
}

resource "github_team_repository" "team_managers_repo" {
  team_id  = "${github_team.managers.id}"
  repository = "managers_repo"
  permission = "admin"
}

resource "github_team_repository" "team_infrastructure_repo" {
  team_id  = "${github_team.infrastructure.id}"
  repository = "infrastructure_repo"
  permission = "admin"
}

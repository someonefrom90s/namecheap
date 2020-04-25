variable "team_managers" {
  description = "List with admin users in GitHub Organization"
  type        = "list"
  default     = []
}

variable "team_devops" {
  description = "List with limited users in GitHub Organization"
  type        = "list"
  default     = []
}

variable "team_frontend" {
  description = "List with limited users in GitHub Organization"
  type        = "list"
  default     = []
}

variable "team_infrastructure" {
  description = "List with limited users in GitHub Organization"
  type        = "list"
  default     = []
}

variable "gh_teams" {
  description = "List with limited users in GitHub Organization"
  type        = "list"
  default     = []
}

variable "all_users" {
  description = "All users"
  type        = "list"
  default     = []
}

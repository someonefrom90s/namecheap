variable "gh_token" {
  description = "GitHub token"
}

variable "gh_org" {
  description = "GitHub Organization"
}

variable "gh_teams" {
  type        = "list"
  default     = ["kaan", "oguz"]
}

variable "team_managers" {
  type        = "list"
  default     = []
}

variable "team_devops" {
  type        = "list"
  default     = []
}

variable "team_frontend" {
  type        = "list"
  default     = []
}

variable "team_infrastructure" {
  type        = "list"
  default     = []
}

variable "all_users" {
  description = "All users"
  type        = "list"
  default     = []
}

variable "gh_task_count" {
  description = "Tasks count"
  default     = 10
}

variable "gh_color_labels" {
  description = "Labels color"
  default     = "00CCCC"
}

variable "gh_color_tasks" {
  description = "Task labels color"
  default     = "CC6600"
}

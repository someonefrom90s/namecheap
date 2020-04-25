variable "gh_token" {
  description = "GitHub token"
}

variable "gh_org" {
  description = "GitHub Organization"
}

variable "gh_labels" {
  description = "List with labels for each repo"
  type        = "list"
  default     = ["SomeTopic", "OtherTopic", "aa"]
}

variable "gh_teams" {
  description = "List with admin users in GitHub Organization"
  type        = "list"
  default     = ["kaan", "oguz"]
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

variable "gh_labels_enable" {
  description = "Enable labels"
  default     = 1
}

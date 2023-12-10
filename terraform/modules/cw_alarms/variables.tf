variable "alarm_threshold" {
  description = "Alert threshold to be defined"
}
variable "alarm_description" {
  description = "CW Alarms short description to be added"
}
variable "alert_sns_topic_arn" {
  description = "SNS topic for alert notification"
}
variable "alert_ok_sns_topic_arn" {
  description = "SNS topic for ok condition in CW"
}

variable "log_group_name" {
  description = "CW log group name"
}
variable "metric_name" {
  description = "CW metric name"
}
variable "namespace" {
  description = "short name for env in which alerts need to defined"
}
variable "filter_pattern" {
  description = "CW filter pattern"
}
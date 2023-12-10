module "cw_alarm_429_error_request_count" {
  source                 = "../modules/cw_alarms"
  alarm_description      = "429 Error Request count"
  alarm_threshold        = 200
  alert_ok_sns_topic_arn = "alert sns topic arn" ##sns topic arn need to pass here
  alert_sns_topic_arn    = "alert ok sns topic arn"
  filter_pattern         = "{$.status = \"429\"}" ##Alert on too many request on API gateway
  log_group_name         = "/aws/apigw/test-api-gateway"
  metric_name            = "429_error_request_count"
  namespace              = "prod"
}
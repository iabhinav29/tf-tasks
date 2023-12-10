resource "aws_cloudwatch_log_metric_filter" "metric_filter" {
  log_group_name = var.log_group_name
  name           = "${var.namespace}_${var.metric_name}_metric_filter"
  pattern        = var.filter_pattern
  metric_transformation {
    dimensions = {}
    name       = "${var.metric_name}_metric"
    namespace  = var.namespace
    unit       = "Count"
    value      = "1"
  }
}



resource "aws_cloudwatch_metric_alarm" "metric_alarm" {
  alarm_name          = "${var.namespace}_${var.metric_name}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "${var.metric_name}_metric"
  namespace           = var.namespace
  period              = "60"
  statistic           = "SampleCount"
  threshold           = var.alarm_threshold
  alarm_description   = var.alarm_description
  alarm_actions       = [var.alert_sns_topic_arn]
  ok_actions          = [var.alert_ok_sns_topic_arn]
  treat_missing_data  = "notBreaching"
}
provider "aws" {
  region = var.region
}

resource "aws_budgets_budget" "budget_alarm" {
  name              = "budget_manual"
  budget_type       = "COST"
  limit_amount      = "25"  # Límite de 25 USD
  limit_unit        = "USD"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator = "GREATER_THAN"
    notification_type   = "ACTUAL"
    threshold           = 80  # 80% del presupuesto
    threshold_type      = "PERCENTAGE"
    subscriber_email_addresses = [var.alert_email]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    notification_type   = "ACTUAL"
    threshold           = 100  # 100% del presupuesto
    threshold_type      = "PERCENTAGE"
    subscriber_email_addresses = [var.alert_email]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    notification_type   = "FORECASTED"
    threshold           = 80  # Pronóstico del 80%
    threshold_type      = "PERCENTAGE"
    subscriber_email_addresses = [var.alert_email]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    notification_type   = "FORECASTED"
    threshold           = 100  # Pronóstico del 100%
    threshold_type      = "PERCENTAGE"
    subscriber_email_addresses = [var.alert_email]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    notification_type   = "ACTUAL"
    threshold           = 110  # 110% del presupuesto
    threshold_type      = "PERCENTAGE"
    subscriber_email_addresses = [var.alert_email]
  }
}

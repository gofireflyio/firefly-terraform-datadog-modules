resource "datadog_monitor" "this" {
    name               = var.name
    type               = var.type
    query              = var.query
    message            = var.message
    escalation_message       = var.escalation_message
    require_full_window      = var.require_full_window
    notify_no_data           = var.notify_no_data
    new_group_delay          = var.new_group_delay
    evaluation_delay         = var.evaluation_delay
    no_data_timeframe        = var.no_data_timeframe
    renotify_interval        = var.renotify_interval
    notify_audit             = var.notify_audit
    timeout_h                = var.timeout_h
    include_tags             = var.include_tags
    enable_logs_sample       = var.enable_logs_sample
    force_delete             = var.force_delete
    tags                     = var.tags
    priority                 = var.priority
    renotify_statuses        = var.renotify_statuses

    dynamic "monitor_thresholds" {
        for_each = length(var.monitoring_threshold) > 0 ? [var.monitoring_thresholds] : []
        content {
            warning = try(monitoring_thresholds.value.warning, null)
            warning_recovery = try(monitoring_threshold.value.warning_recovery, null)
            critical = try(monitoring_threshold.value.critical, null)
            critical_recovery = try(monitoring_threshold.value.critical_recovery, null)
            ok = try(monitoring_threshold.value.ok, null)
        }
    }

    dynamic "monitor_threshold_windows" {
        for_each = length(var.monitoring_threshold_windows) > 0 ? [var.monitoring_threshold_windows] : []
        content {
            recovery_window = try(monitoring_threshold_windows.value.recovery_window, null)
            trigger_window  = try(monitoring_threshold_windows.value.trigger_window, null)
        }
    }

    # monitor_thresholds = var.monitor_thresholds

    # monitor_threshold_windows = var.monitor_threshold_windows

    restricted_roles = var.restricted_roles
    validate = true
  }
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

    monitor_thresholds {
        warning = var.warning_threshold
        warning_recovery = var.warning_recovery_threshold
        critical = var.critical_threshold
        critical_recovery = var.critical_recovery_threshold
        ok = var.ok_threshold
        unknown = var.unknown_threshold
    }

    monitor_threshold_windows {
    recovery_window = var.recovery_window_threshold
    trigger_window  = var.trigger_window_threshold
    }

    restricted_roles = try(var.restricted_roles_map[each.key], null)

    validate = true
  }
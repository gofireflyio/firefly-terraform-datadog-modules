variable "name" {
  type = string
  description = "Name of the monitor"
}

variable "type" {
  type = string
  description = "Type of the monitor"
  validation {
    condition = contains(
        ["composite", 
        "event alert", 
        "log alert", 
        "metric alert", 
        "process alert", 
        "query alert", 
        "rum alert", 
        "service check", 
        "synthetics alert", 
        "trace-analytics alert", 
        "slo alert", 
        "event-v2 alert", 
        "audit alert", 
        "ci-pipelines alert", 
        "error-tracking alert"
        ], var.type)
    error_message = "Invalid monitor type, see https://docs.datadoghq.com/api/latest/monitors/#monitor-types for valid types"
  }

}

variable "query" {
    type = string
    description = "Monitor query to notify on, see API reference https://docs.datadoghq.com/api/latest/monitors/#query-types for more information"
}

variable "message" {
    type = string
    description = "Message to include with notifications"
}

variable "escalation_message" {
    type = string
    description = "Message to include with escalation notifications"
    default = ""
}

variable "monitor_thresholds" {
    type = any
    description = "Thresholds for the monitor"
    default = {}
}

variable "monitoring_threshold_windows" {
    type = any
    description = "Threshold Windows for the monitor"
    default = {}
}


variable "warning_threshold" {
    type = string
    description = "Warning threshold for the monitor"
    default = null
}

variable "waring_recovery_threshold" {
    type = string
    description = "Warning recovery threshold for the monitor"
    default = null
}

variable "critical_threshold" {
    type = string
    description = "Critical threshold for the monitor"
    default = null
}

variable "critical_recovery_threshold" {
    type = string
    description = "Critical recovery threshold for the monitor"
    default = null
}

variable "ok_threshold" {
    type = string
    description = "OK threshold for the monitor"
    default = null
}

variable "unknown_threshold" {
    type = string
    description = "Unknown threshold for the monitor"
    default = null
}

variable "recovery_window_threshold" {
    type = string
    description = "Describes how long an anomalous metric must be normal before the alert recovers."
    default = null
}

variable "trigger_window_threshold" {
    type = string
    description = "Describes how long a metric must be anomalous before an alert triggers"
    default = null
}

variable "escalation_message" {
    type = string
    description = "Message to include with escalation notifications"
    default = null
}

variable "require_full_window" {
    type = bool
    description = "Require full window for monitor"
    default = false
}

variable "notify_no_data" {
    type = bool
    description = "Notify on no data"
    default = false
}

variable "new_group_delay" {
  type = number
  description = "Delay in seconds before a new group of alerts is sent"
  default = null
}

variable "evaluation_delay" {
    type = number
    description = "Delay in seconds before evaluation"
    default = null
}

variable "no_data_timeframe" {
    type = number
    description = "The number of minutes before a monitor will notify when data stops reporting"
    default = 10
}

variable "renotify_interval" {
    type = number
    description = "The number of minutes after the last notification before a monitor will re-notify on the current status"
    default = null
}

variable "renotify_statuses" {
    type = set(string)
    description = "The statuses to re-notify on"
    default = []
    validation {
        condition = can(regex("^(warn|no data|alert)$", each))
        error_message = "Invalid renotify status, must be one of ok, warn, no data, alert"
    }
}

variable "notify_audit" {
    type = bool
    description = "Indicates whether tagged users will be notified on changes to this monitor"
    default = false
}

variable "timeout_h" {
    type = number
    description = "The number of hours of query evaluation before a monitor will automatically resolve from a triggered state"
    default = null
}

variable "include_tags" {
    type = bool
    description = "Indicates whether notifications from this monitor automatically include its triggering tags"
    default = false
}

variable "enable_logs_sample" {
    type = bool
    description = "Indicates whether the monitor will be included in logs sample"
    default = false
}

variable "force_delete" {
    type = bool
    description = "Indicates whether the monitor will be deleted even if it's still referenced by other resources"
    default = false
}

variable "tags" {
    type = list(string)
    description = "A map of tags to apply to the monitor"
    default = []
}

variable "priority" {
    type = number
    description = "Integer from 1 (high) to 5 (low) indicating alert severity"
    default = 0
}

variable "restricted_roles" {
    type = list(string)
    description = "A list of roles that are allowed to edit this monitor"
    default = []
}
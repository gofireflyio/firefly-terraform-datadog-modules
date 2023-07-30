output "datadog_monitor_id" {
    value = datadog_monitor.this.id
    description = "ID of the crearted monitor"
}

output "datadog_monitor_name" {
    value = datadog_monitor.this.name
    description = "Name of the created monitor"
}
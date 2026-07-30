
abstract type AbstractApplication end

application_name(app::AbstractApplication) = error("application_name not implemented for $(typeof(app))")
application_type(app::AbstractApplication) = error("application_type not implemented for $(typeof(app))")

initialize_application!(app::AbstractApplication; kwargs...) = error("initialize_application! not implemented for $(typeof(app))")
shutdown_application!(app::AbstractApplication) = error("shutdown_application! not implemented for $(typeof(app))")

# Routing: returns AbstractExecutionContext for this connection/request
get_execution_context(app::AbstractApplication, connection_id) = error("get_execution_context not implemented for $(typeof(app))")

# Command handling
handle_application_command(app::AbstractApplication, ctx::AbstractExecutionContext, command, payload) = 
    error("handle_application_command not implemented for $(typeof(app))")

# Event streaming - app decides how to send events to frontend
emit_event(app::AbstractApplication, ctx::AbstractExecutionContext, event) = 
    error("emit_event not implemented for $(typeof(app))")

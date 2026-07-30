abstract type AbstractCore end
abstract type AbstractFrontend end
abstract type AbstractCoreManager end

@enum CoreStatus CORE_IDLE CORE_RUNNING CORE_STOPPING CORE_STOPPED CORE_ERROR
@enum FrontendStatus FRONTEND_CONNECTING FRONTEND_CONNECTED FRONTEND_DISCONNECTING FRONTEND_DISCONNECTED FRONTEND_ERROR

core_id(core::AbstractCore) = error("core_id not implemented for $(typeof(core))")
core_name(core::AbstractCore) = error("core_name not implemented for $(typeof(core))")
core_status(core::AbstractCore) = error("core_status not implemented for $(typeof(core))")
core_session_manager(core::AbstractCore) = error("core_session_manager not implemented for $(typeof(core))")
core_port(core::AbstractCore) = error("core_port not implemented for $(typeof(core))")

start_core!(core::AbstractCore; kwargs...) = error("start_core! not implemented for $(typeof(core))")
stop_core!(core::AbstractCore; graceful=true) = error("stop_core! not implemented for $(typeof(core))")
run_loop(core::AbstractCore) = error("run_loop not implemented for $(typeof(core))")

core_handle_command(core::AbstractCore, frontend_id::Base.UUID, command::AbstractString, payload::Dict) = 
    error("core_handle_command not implemented for $(typeof(core))")

core_get_execution_context(core::AbstractCore, frontend_id::Base.UUID) = 
    error("core_get_execution_context not implemented for $(typeof(core))")

core_emit_event(core::AbstractCore, frontend_id::Base.UUID, event) = 
    error("core_emit_event not implemented for $(typeof(core))")

frontend_connected!(core::AbstractCore, frontend::AbstractFrontend) = 
    error("frontend_connected! not implemented for $(typeof(core))")

frontend_disconnected!(core::AbstractCore, frontend_id::Base.UUID) = 
    error("frontend_disconnected! not implemented for $(typeof(core))")

list_frontends(core::AbstractCore) = error("list_frontends not implemented for $(typeof(core))")

frontend_id(frontend::AbstractFrontend) = error("frontend_id not implemented for $(typeof(frontend))")
frontend_type(frontend::AbstractFrontend) = error("frontend_type not implemented for $(typeof(frontend))")
frontend_core_id(frontend::AbstractFrontend) = error("frontend_core_id not implemented for $(typeof(frontend))")
frontend_status(frontend::AbstractFrontend) = error("frontend_status not implemented for $(typeof(frontend))")

frontend_connect!(frontend::AbstractFrontend, core::AbstractCore; kwargs...) = 
    error("frontend_connect! not implemented for $(typeof(frontend))")

frontend_disconnect!(frontend::AbstractFrontend) = error("frontend_disconnect! not implemented for $(typeof(frontend))")

frontend_send(frontend::AbstractFrontend, message) = error("frontend_send not implemented for $(typeof(frontend))")
frontend_receive(frontend::AbstractFrontend) = error("frontend_receive not implemented for $(typeof(frontend))")

frontend_handle_message(frontend::AbstractFrontend, message) = 
    error("frontend_handle_message not implemented for $(typeof(frontend))")

manager_start_core!(manager::AbstractCoreManager, core::AbstractCore; kwargs...) = 
    error("manager_start_core! not implemented for $(typeof(manager))")

manager_stop_core!(manager::AbstractCoreManager, core_id::Base.UUID; graceful=true) = 
    error("manager_stop_core! not implemented for $(typeof(manager))")

manager_get_core(manager::AbstractCoreManager, core_id::Base.UUID) = 
    error("manager_get_core not implemented for $(typeof(manager))")

manager_list_cores(manager::AbstractCoreManager) = error("manager_list_cores not implemented for $(typeof(manager))")

manager_running_cores(manager::AbstractCoreManager) = error("manager_running_cores not implemented for $(typeof(manager))")

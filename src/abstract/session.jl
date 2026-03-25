abstract type AbstractSession <: AbstractPersistable end

session_id(session::AbstractSession) = error("session_id not implemented for $(typeof(session))")
session_name(session::AbstractSession) = error("session_name not implemented for $(typeof(session))")
session_status(session::AbstractSession) = error("session_status not implemented for $(typeof(session))")
session_agents(session::AbstractSession) = error("session_agents not implemented for $(typeof(session))")
session_workspace(session::AbstractSession) = error("session_workspace not implemented for $(typeof(session))")
session_context(session::AbstractSession) = error("session_context not implemented for $(typeof(session))")
session_created_at(session::AbstractSession) = error("session_created_at not implemented for $(typeof(session))")
session_updated_at(session::AbstractSession) = error("session_updated_at not implemented for $(typeof(session))")
session_tools(session::AbstractSession) = error("session_tools not implemented for $(typeof(session))")

function list_default_tools()
    throw(MethodError(list_default_tools, ()))
end

function list_default_tools(session::Union{AbstractSession,Nothing})
    throw(MethodError(list_default_tools, (session,)))
end

@enum SessionStatus SESSION_ACTIVE SESSION_PAUSED SESSION_CLOSED

create_session(name; kwargs...) = error("create_session not implemented")

pause_session(session::AbstractSession) = error("pause_session not implemented for $(typeof(session))")
resume_session(session::AbstractSession) = error("resume_session not implemented for $(typeof(session))")
close_session(session::AbstractSession) = error("close_session not implemented for $(typeof(session))")

add_agent_to_session!(session::AbstractSession, agent::AbstractAgent) = error("add_agent_to_session! not implemented for $(typeof(session))")
remove_agent_from_session!(session::AbstractSession, agent_id::Base.UUID) = error("remove_agent_from_session! not implemented for $(typeof(session))")
get_agent_from_session(session::AbstractSession, agent_id::Base.UUID) = error("get_agent_from_session not implemented for $(typeof(session))")

create_subagent_in_session!(session::AbstractSession, parent::AbstractAgent, name::String; kwargs...) = error("create_subagent_in_session! not implemented for $(typeof(session))")

abstract type AbstractSessionManager end

create_session!(manager::AbstractSessionManager, name::String; kwargs...) = error("create_session! not implemented for $(typeof(manager))")
get_session(manager::AbstractSessionManager, session_id) = error("get_session not implemented for $(typeof(manager))")
get_active_session(manager::AbstractSessionManager) = error("get_active_session not implemented for $(typeof(manager))")
set_active_session!(manager::AbstractSessionManager, session_id) = error("set_active_session! not implemented for $(typeof(manager))")
list_sessions(manager::AbstractSessionManager) = error("list_sessions not implemented for $(typeof(manager))")
close_session!(manager::AbstractSessionManager, session_id) = error("close_session! not implemented for $(typeof(manager))")
close_all_sessions!(manager::AbstractSessionManager) = error("close_all_sessions! not implemented for $(typeof(manager))")

abstract type AbstractWorkflow end

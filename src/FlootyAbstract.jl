module FlootyAbstract

include("abstract.jl")

export AbstractLLMProvider, AbstractProviderObject, AbstractMessage
export AbstractEmbedder, AbstractContextStore
export AbstractTool, AbstractToolCall
export AbstractAgent, role, provider, context, tools, chat
export ToolResult
export AbstractFlootyError, ToolError, error_message
export role, content, tool_calls, tool_call_id, tool_name
export call_id, call_name, call_arguments
export tool_description, tool_parameters, tool_signature
export execute_tool, register_tool_handler!, get_tool_handler
export create_message, create_provider_instance, create_embedder
export create_stream
export add_message!, clear_history!
export AbstractSession, SessionStatus, SESSION_ACTIVE, SESSION_PAUSED, SESSION_CLOSED
export session_id, session_name, session_status, session_agents, session_workspace, session_context
export session_created_at, session_updated_at
export create_session, pause_session, resume_session, close_session
export add_agent_to_session!, remove_agent_from_session!, get_agent_from_session
export create_subagent_in_session!

end # module FlootyAbstract

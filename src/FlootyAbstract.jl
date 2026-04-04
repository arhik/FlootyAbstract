module FlootyAbstract

include("abstract.jl")

export AbstractLLMProvider, AbstractProviderObject, AbstractAttachment, AbstractMessage
export AbstractEmbedder, AbstractContextStore
export AbstractTool, AbstractToolCall
export AbstractModel, model_name, model_provider
export list_provider_models
export OpenAICompatibleProvider, AnthropicCompatibleProvider
export AbstractAgent, role, provider, context, tools, chat, create_agent, list_default_tools, get_messages
export ToolResult
export AbstractFlootyError, ToolError, error_message
export role, content, tool_calls, tool_call_id, tool_name, images, attachment_path, attachment_type, attachment_mime
export call_id, call_name, call_arguments
export tool_description, tool_parameters, tool_signature
export execute_tool, register_tool_handler!, get_tool_handler
export create_message, create_provider_instance, create_embedder, create_image_data, create_attachments, chat, chat_stream
export create_stream
export add_message!, clear_history!
export AbstractSession, AbstractSessionManager, SessionStatus, SESSION_ACTIVE, SESSION_PAUSED, SESSION_CLOSED
export session_id, session_name, session_status, session_agents, session_workspace, session_context
export session_created_at, session_updated_at, session_tools
export create_session, create_session!, pause_session, resume_session, close_session, close_session!
export add_agent_to_session!, remove_agent_from_session!, get_agent_from_session
export create_subagent_in_session!
export get_session, get_active_session, set_active_session!, list_sessions, close_all_sessions!
export AbstractPersistenceBackend, AbstractPersistable, save!, load, delete!, list, persistable_id

end # module FlootyAbstract

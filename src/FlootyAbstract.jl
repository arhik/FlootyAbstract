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

end # module FlootyAbstract

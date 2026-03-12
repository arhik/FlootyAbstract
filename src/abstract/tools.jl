
# abstract type AbstractRole <: AbstractProviderObject end
# Base.string(role::AbstractRole) = error("string not implemented for $(typeof(role))")

abstract type AbstractToolCall <: AbstractProviderObject end
call_id(call::AbstractToolCall) = error("call_id not implemented for $(typeof(call))")
call_name(call::AbstractToolCall) = error("call_name not implemented for $(typeof(call))")
call_arguments(call::AbstractToolCall) = error("call_arguments not implemented for $(typeof(call))")

abstract type AbstractTool end
tool_name(tool::AbstractTool) = error("tool_name not implemented for $(typeof(tool))")
tool_description(tool::AbstractTool) = error("tool_description not implemented for $(typeof(tool))")
tool_parameters(tool::AbstractTool) = error("tool_parameters not implemented for $(typeof(tool))")
tool_signature(tool::AbstractTool) = error("tool_parameters not implemented for $(typeof(tool))")

function convert_tool(tool, provider::AbstractLLMProvider)
    throw(MethodError(convert_tool, (tool, provider)))
end

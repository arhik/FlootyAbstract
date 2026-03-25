
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

# Build provider-specific tool from provider-agnostic tool definition
# Implementations in provider packages (e.g., FlootyStreams for OllamaProvider)
function build_tool(tool::AbstractTool, provider::AbstractLLMProvider)
    throw(MethodError(build_tool, (tool, provider)))
end

struct ToolResult
    success::Bool
    data::String
    error::Union{String,Nothing}
end

ToolResult(data::String) = ToolResult(true, data, nothing)

const TOOL_HANDLERS = Dict{String, Function}()

function register_tool_handler!(name::String, handler::Function)
    TOOL_HANDLERS[name] = handler
end

function get_tool_handler(name::String)
    get(TOOL_HANDLERS, name, nothing)
end

function execute_tool(tool_name::String, arguments::Dict{String,Any}; context=nothing)
    handler = get_tool_handler(tool_name)
    if handler === nothing
        return ToolResult(false, "", "Tool '$tool_name' not found")
    end
    try
        result = handler(arguments; context=context)
        if result isa ToolResult
            return result
        else
            return ToolResult(string(result))
        end
    catch e
        return ToolResult(false, "", "Execution failed: $e")
    end
end

abstract type AbstractFlootyError <: Exception end

error_message(e::AbstractFlootyError) = e.message

struct ToolError <: AbstractFlootyError
    message::String
    tool_name::String
end

# Not sure if we should allow this TODO
ToolError(msg::String) = ToolError(msg, "")

Base.showerror(io::IO, e::ToolError) = print(io, "ToolError (", e.tool_name, "): ", e.message)

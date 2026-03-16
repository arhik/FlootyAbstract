abstract type AbstractAgent end

role(agent::AbstractAgent) = error("role not implemented for $(typeof(agent))")
provider(agent::AbstractAgent) = error("provider not implemented for $(typeof(agent))")
context(agent::AbstractAgent) = error("context not implemented for $(typeof(agent))")
tools(agent::AbstractAgent) = error("tools not implemented for $(typeof(agent))")
chat(agent::AbstractAgent, message::String; stream::Bool=false) = throw(MethodError(chat, (agent, message)))

# Chat with attachments - agent implementations handle this
function chat(agent::AbstractAgent, message::String, attachments::Vector{<:AbstractAttachment};
              stream::Bool=false, auto_tools::Bool=true)
    throw(MethodError(chat, (agent, message, attachments)))
end

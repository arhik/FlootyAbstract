abstract type AbstractLLMProvider end
abstract type AbstractProviderObject end
abstract type AbstractMessage <: AbstractProviderObject end

# Interface functions with default implementations
role(msg::AbstractMessage) = error("role not implemented for $(typeof(msg))")
content(msg::AbstractMessage) = error("content not implemented for $(typeof(msg))")
tool_calls(msg::AbstractMessage) = nothing
tool_call_id(msg::AbstractMessage) = nothing
tool_name(msg::AbstractMessage) = nothing

function create_message(provider::AbstractLLMProvider, role::String, content::String; kwargs...)
    throw(MethodError(create_message, (provider, role, content)))
end

function create_provider_instance(::Val{provider_symbol}; config::Dict{Symbol,Any} = Dict{Symbol, Any}()) where {provider_symbol}
    throw(MethodError(create_provider_instance, (Val(provider_symbol), config)))
end

function chat_stream(provider::AbstractLLMProvider, model::String, messages::Vector{<:AbstractMessage}; kwargs...)
    throw(MethodError(chat_stream, (provider, model, messages)))
end

abstract type AbstractModel end
model_name(model::AbstractModel) = error("model_name not implemented for $(typeof(model))")
model_provider(model::AbstractModel) = error("model_provider not implemented for $(typeof(model))")

function list_provider_models(provider_id::Symbol, config::Dict{Symbol,Any})
    list_provider_models(Val(provider_id), config)
end

function list_provider_models(::Val{provider_symbol}, config::Dict{Symbol,Any}) where {provider_symbol}
    throw(MethodError(list_provider_models, (Val(provider_symbol), config)))
end

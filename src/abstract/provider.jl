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

function create_provider_instance(provider_id::Symbol; config::Dict{Symbol,Any} = Dict{Symbol, Any}())
    create_provider_instance(Val(provider_id); config=config)
end

function chat_stream(provider::AbstractLLMProvider, model::String, messages::Vector{<:AbstractMessage}; kwargs...)
    throw(MethodError(chat_stream, (provider, model, messages)))
end

function create_stream(provider::AbstractLLMProvider, model::String, messages::Vector{<:AbstractMessage},
                       stream::Bool=false, format=nothing, options=nothing, tools=nothing)
    throw(MethodError(create_stream, (provider, model, messages)))
end

abstract type AbstractModel end
model_name(model::AbstractModel) = error("model_name not implemented for $(typeof(model))")
model_provider(model::AbstractModel) = error("model_provider not implemented for $(typeof(model))")

# AbstractEmbedder interface for context management
abstract type AbstractEmbedder end

function embed(embedder::AbstractEmbedder, text::String)
    throw(MethodError(embed, (embedder, text)))
end

function embed(embedder::AbstractEmbedder, texts::Vector{String})
    throw(MethodError(embed, (embedder, texts)))
end

function embedding_dimension(embedder::AbstractEmbedder)
    throw(MethodError(embedding_dimension, (embedder,)))
end

function create_embedder(provider::AbstractLLMProvider, model::String; kwargs...)
    throw(MethodError(create_embedder, (provider, model)))
end

# AbstractContextStore interface
abstract type AbstractContextStore end

function add_message!(store::AbstractContextStore, message::AbstractMessage; kwargs...)
    throw(MethodError(add_message!, (store, message)))
end

function clear_history!(store::AbstractContextStore)
    throw(MethodError(clear_history!, (store,)))
end

function list_provider_models(provider_id::Symbol, config::Dict{Symbol,Any})
    list_provider_models(Val(provider_id), config)
end

function list_provider_models(::Val{provider_symbol}, config::Dict{Symbol,Any}) where {provider_symbol}
    throw(MethodError(list_provider_models, (Val(provider_symbol), config)))
end

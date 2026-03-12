module FlootyAbstract

include("abstract.jl")

export AbstractLLMProvider, AbstractProviderObject, AbstractMessage
export AbstractEmbedder, AbstractContextStore
export role, content, tool_calls, tool_call_id, tool_name
export create_message, create_provider_instance, create_embedder
export add_message!, clear_history!

end # module FlootyAbstract

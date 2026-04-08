# ═══════════════════════════════════════════════════════════════════════
# Abstract Web Search Interface
# Common API for web search capabilities across all providers
# ═══════════════════════════════════════════════════════════════════════

abstract type AbstractSearchResult <: AbstractProviderObject end

result_title(result::AbstractSearchResult) = error("result_title not implemented for $(typeof(result))")
result_url(result::AbstractSearchResult) = error("result_url not implemented for $(typeof(result))")
result_content(result::AbstractSearchResult) = error("result_content not implemented for $(typeof(result))")

abstract type AbstractSearchResponse <: AbstractProviderObject end

search_results(response::AbstractSearchResponse) = error("search_results not implemented for $(typeof(response))")

abstract type AbstractFetchResponse <: AbstractProviderObject end

fetch_title(response::AbstractFetchResponse) = error("fetch_title not implemented for $(typeof(response))")
fetch_content(response::AbstractFetchResponse) = error("fetch_content not implemented for $(typeof(response))")
fetch_links(response::AbstractFetchResponse) = error("fetch_links not implemented for $(typeof(response))")

abstract type AbstractWebSearchProvider end

function web_search(provider::AbstractWebSearchProvider, query::String; max_results::Int=5)
    throw(MethodError(web_search, (provider, query)))
end

function web_fetch(provider::AbstractWebSearchProvider, url::String)
    throw(MethodError(web_fetch, (provider, url)))
end

function web_search_tool(provider::AbstractWebSearchProvider)
    throw(MethodError(web_search_tool, (provider,)))
end

function web_fetch_tool(provider::AbstractWebSearchProvider)
    throw(MethodError(web_fetch_tool, (provider,)))
end

# Function declaration - providers extend this
function default_web_search_provider end

# Dispatch through default provider
web_search(query::String; kw...) = web_search(default_web_search_provider(), query; kw...)
web_fetch(url::String; kw...) = web_fetch(default_web_search_provider(), url; kw...)

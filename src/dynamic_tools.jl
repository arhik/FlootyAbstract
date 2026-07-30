# ═══════════════════════════════════════════════════════════════════════════
# Dynamic Tool Provider Registry
#
# Allows any package to register tools that will be automatically included
# when FlootyCore creates sessions.
#
# Usage:
#   # In any package that adds tools:
#   using FlootyAbstract
#   
#   FlootyAbstract.register_tool_provider!() do
#       [Tool("my_tool", "Description", [...])]
#   end
#
#   FlootyAbstract.register_tool_provider!(my_tools_function)
#
# Then in FlootyCore:
#   all_tools = FlootyAbstract.get_all_tools()  # Built-in + registered extras
# ═══════════════════════════════════════════════════════════════════════════

using FlootyBase

# Registry of tool provider functions
# Each provider is a Function that returns Vector{Tool}
const TOOL_PROVIDERS = Vector{Function}()

"""
    register_tool_provider!(provider::Function)

Register a function that provides additional tools.

The provider function should return a Vector{Tool}.

# Example
```julia
# Register with anonymous function
FlootyAbstract.register_tool_provider!() do
    [Tool("custom_tool", "Does something", [...])]
end

# Register with named function
function my_dev_tools()
    [tool1, tool2, tool3]
end
FlootyAbstract.register_tool_provider!(my_dev_tools)
```
"""
function register_tool_provider!(provider::Function)
    push!(TOOL_PROVIDERS, provider)
    @debug "Registered tool provider" count=length(TOOL_PROVIDERS)
end

"""
    unregister_tool_provider!(provider::Function)

Remove a previously registered tool provider.
"""
function unregister_tool_provider!(provider::Function)
    filter!(p -> p !== provider, TOOL_PROVIDERS)
end

"""
    get_all_tools() -> Vector{Tool}

Get all tools including default tools and all registered provider tools.

This is what FlootyCore should use instead of list_default_tools().
"""
function get_all_tools()::Vector{Tool}
    # Start with default tools from FlootyBase
    tools = Tool[list_default_tools()...]
    
    # Add tools from all registered providers
    for provider in TOOL_PROVIDERS
        try
            provider_tools = provider()
            if provider_tools isa Vector && eltype(provider_tools) <: Tool
                append!(tools, provider_tools)
            end
        catch e
            @warn "Tool provider failed" exception=e
        end
    end
    
    return tools
end

"""
    clear_tool_providers!()

Clear all registered tool providers. Useful for testing.
"""
function clear_tool_providers!()
    empty!(TOOL_PROVIDERS)
end

# Export the new functions
export register_tool_provider!, unregister_tool_provider!, 
       get_all_tools, clear_tool_providers!

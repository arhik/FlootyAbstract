abstract type AbstractChatOptions end
abstract type AbstractStreamChunk end

chunk_content(chunk::AbstractStreamChunk) = error("chunk_content not implemented for $(typeof(chunk))")
chunk_content(provider, chunk::AbstractStreamChunk) = chunk_content(chunk)  # Two-arg version

chunk_thinking(chunk::AbstractStreamChunk) = ""  # Default: no thinking content
chunk_thinking(provider, chunk::AbstractStreamChunk) = chunk_thinking(chunk)  # Two-arg version

chunk_done(chunk::AbstractStreamChunk) = error("chunk_done not implemented for $(typeof(chunk))")
chunk_done(provider, chunk::AbstractStreamChunk) = chunk_done(chunk)  # Default: delegate to single-arg

chunk_has_tool_calls(chunk::AbstractStreamChunk) = error("chunk_has_tool_calls not implemented for $(typeof(chunk))")
chunk_has_tool_calls(provider, chunk::AbstractStreamChunk) = chunk_has_tool_calls(chunk)  # Two-arg version

chunk_tool_calls(chunk::AbstractStreamChunk) = error("chunk_tool_calls not implemented for $(typeof(chunk))")
chunk_tool_calls(provider, chunk::AbstractStreamChunk) = chunk_tool_calls(chunk)  # Two-arg version

chunk_is_error(chunk::AbstractStreamChunk) = error("chunk_is_error not implemented for $(typeof(chunk))")
chunk_is_error(provider, chunk::AbstractStreamChunk) = chunk_is_error(chunk)  # Two-arg version

chunk_error_message(chunk::AbstractStreamChunk) = nothing  # Default: no error
chunk_error_message(provider, chunk::AbstractStreamChunk) = chunk_error_message(chunk)  # Two-arg version

# Alias for compatibility
const chunk_error = chunk_error_message


abstract type AbstractResponse end
response_content(resp::AbstractResponse) = error("response_content not implemented for $(typeof(resp))")
response_done(resp::AbstractResponse) = error("response_done not implemented for $(typeof(resp))")

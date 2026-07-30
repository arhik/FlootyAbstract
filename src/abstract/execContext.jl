
abstract type AbstractExecutionContext end

context_session(ctx::AbstractExecutionContext) = error("context_session not implemented for $(typeof(ctx))")
context_workspace(ctx::AbstractExecutionContext) = error("context_workspace not implemented for $(typeof(ctx))")
context_tools(ctx::AbstractExecutionContext) = error("context_tools not implemented for $(typeof(ctx))")
context_permissions(ctx::AbstractExecutionContext) = error("context_permissions not implemented for $(typeof(ctx))")

validate_context(ctx::AbstractExecutionContext) = error("validate_context not implemented for $(typeof(ctx))")


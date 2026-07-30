abstract type AbstractPermission end

permission_resource(perm::AbstractPermission) = error("permission_resource not implemented for $(typeof(perm))")
permission_actions(perm::AbstractPermission) = error("permission_actions not implemented for $(typeof(perm))")
check_permission(perm::AbstractPermission, action::Symbol) = error("check_permission not implemented for $(typeof(perm))")

abstract type AbstractResource end

resource_type(::AbstractResource) = error("resource_type not implemented")

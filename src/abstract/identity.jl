abstract type AbstractIdentity end

identity_id(::AbstractIdentity) = error("identity_id not implemented")
identity_type(::AbstractIdentity) = error("identity_type not implemented")
identity_name(::AbstractIdentity) = error("identity_name not implemented")

abstract type AbstractNamedPort end

namedport_name(np::AbstractNamedPort) = error("namedport_name not implemented for $(typeof(np))")
namedport_url(np::AbstractNamedPort) = error("namedport_url not implemented for $(typeof(np))")
namedport_port(np::AbstractNamedPort) = error("namedport_port not implemented for $(typeof(np))")
namedport_pid(np::AbstractNamedPort) = error("namedport_pid not implemented for $(typeof(np))")
namedport_active(np::AbstractNamedPort) = error("namedport_active not implemented for $(typeof(np))")

abstract type AbstractNamedPortManager end

portmanager_register!(manager::AbstractNamedPortManager, name::AbstractString, port::Integer; kwargs...) = error("portmanager_register! not implemented for $(typeof(manager))")
portmanager_unregister!(manager::AbstractNamedPortManager, name::AbstractString) = error("portmanager_unregister! not implemented for $(typeof(manager))")
portmanager_get(manager::AbstractNamedPortManager, name::AbstractString) = error("portmanager_get not implemented for $(typeof(manager))")
portmanager_list(manager::AbstractNamedPortManager) = error("portmanager_list not implemented for $(typeof(manager))")
portmanager_resolve(manager::AbstractNamedPortManager, name::AbstractString) = error("portmanager_resolve not implemented for $(typeof(manager))")

abstract type AbstractTransport end
abstract type AbstractConnection end

# Lifecycle
start_listening(transport::AbstractTransport, handler::Function; host::AbstractString="0.0.0.0", port::Integer=8080) = 
    error("start_listening not implemented for $(typeof(transport))")

stop_transport(transport::AbstractTransport) = 
    error("stop_transport not implemented for $(typeof(transport))")

# Connection operations
transport_send(transport::AbstractTransport, conn::AbstractConnection, data) = 
    error("transport_send not implemented for $(typeof(transport))")

transport_broadcast(transport::AbstractTransport, data) = 
    error("transport_broadcast not implemented for $(typeof(transport))")

transport_connections(transport::AbstractTransport) = 
    error("transport_connections not implemented for $(typeof(transport))")

# Connection info
connection_id(conn::AbstractConnection) = string(rand(UInt128))
connection_is_connected(conn::AbstractConnection) = true
connection_remote_addr(conn::AbstractConnection) = nothing

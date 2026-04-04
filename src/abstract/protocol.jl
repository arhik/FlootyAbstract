using StructTypes

abstract type AbstractProtocol end

abstract type AbstractProtocolMessage end

StructTypes.StructType(::Type{AbstractProtocolMessage}) = StructTypes.AbstractType()
StructTypes.subtypekey(::Type{AbstractProtocolMessage}) = :type

abstract type AbstractClientRequest <: AbstractProtocolMessage end

abstract type AbstractServerMessage <: AbstractProtocolMessage end

message_type(msg::AbstractProtocolMessage) = error("not implemented")

abstract type AbstractProtocolSerializer end

serialize(serializer::AbstractProtocolSerializer, msg::AbstractProtocolMessage) = error("not implemented")

deserialize(serializer::AbstractProtocolSerializer, data::String) = error("not implemented")

abstract type AbstractProtocolHandler end

abstract type AbstractClientProtocol <: AbstractProtocolHandler end

abstract type AbstractServerProtocol <: AbstractProtocolHandler end

handle_client_request(handler::AbstractServerProtocol, msg::AbstractClientRequest) = error("not implemented")

handle_server_message(handler::AbstractClientProtocol, msg::AbstractServerMessage) = error("not implemented")

abstract type AbstractProtocolConnection end

connection_id(conn::AbstractProtocolConnection) = error("not implemented")

connection_is_open(conn::AbstractProtocolConnection) = error("not implemented")

send_message(conn::AbstractProtocolConnection, msg::AbstractProtocolMessage) = error("not implemented")

receive_message(conn::AbstractProtocolConnection) = error("not implemented")

abstract type AbstractMessageFactory end

create_message(factory::AbstractMessageFactory, type::Symbol, args...) = error("not implemented")

abstract type ProtocolTrait end

struct BinaryProtocol <: ProtocolTrait end

struct TextProtocol <: ProtocolTrait end

protocol_trait(::Type{<:AbstractProtocol}) = TextProtocol()

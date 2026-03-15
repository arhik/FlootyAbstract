# ═══════════════════════════════════════════════════════════════════════
# Persistence Abstractions
# ═══════════════════════════════════════════════════════════════════════

"Abstract base for persistence backends (JSON, Arrow, Database, etc.)"
abstract type AbstractPersistenceBackend end

"Marker for types that support persistence via StructTypes"
abstract type AbstractPersistable end

# Persistence interface functions
function save! end
function load end
function delete! end
function list end

"Get unique identifier for persistable object"
function persistable_id(x::AbstractPersistable)
    hasproperty(x, :id) ? x.id : error("Persistable must have id field")
end

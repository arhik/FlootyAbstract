
abstract type AbstractWorkspace end

workspace_id(workspace::AbstractWorkspace) = error("workspace_id not implemented for $(typeof(workspace))")
workspace_folders(workspace::AbstractWorkspace) = error("workspace_folders not implemented for $(typeof(workspace))")
workspace_permissions(workspace::AbstractWorkspace) = error("workspace_permissions not implemented for $(typeof(workspace))")

add_folder_to_workspace!(workspace::AbstractWorkspace, path::String; kwargs...) = error("add_folder_to_workspace! not implemented for $(typeof(workspace))")
remove_folder_from_workspace!(workspace::AbstractWorkspace, folder_id::Base.UUID) = error("remove_folder_from_workspace! not implemented for $(typeof(workspace))")
get_folder_from_workspace(workspace::AbstractWorkspace, folder_id::Base.UUID) = error("get_folder_from_workspace not implemented for $(typeof(workspace))")


# Simple logging decorator for protocol handlers
# Usage: logged_handle_request(handler, msg) do h, m
#     # your handler code here
# end

using Dates

function logged_handle_request(f::Function, handler, msg)
    start = now()
    msg_type = string(typeof(msg))
    
    @info "[→] $msg_type"
    
    result = try
        f(handler, msg)
    catch e
        @error "[✗] $msg_type failed" exception=e
        rethrow(e)
    end
    
    duration = Dates.value(now() - start)
    @info "[←] $(string(typeof(result))) ($(duration)ms)"
    
    result
end

export logged_handle_request

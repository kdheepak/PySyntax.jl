module Py

using PyCall

function traverse!{T}(arg::T)::T
    return arg
end

function traverse!(expr::Expr)

    if expr.head == :ref
        expr.head = :call
        unshift!(expr.args, :get)
    end

    for (i, arg) in enumerate(expr.args)
        traverse!(expr.args[i])
    end

    if expr.head == :.
        expr.head = :ref
    end

    return expr
end

macro Py(expr::Expr)

    traverse!(expr)

    return expr
end

end # module

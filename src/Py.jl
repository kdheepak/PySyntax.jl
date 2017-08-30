module Py

using PyCall

function traverse!{T}(arg::T)::T
    return arg
end

function traverse!(expr::Expr)

    # (x::String:y::String) => slice(x, y)
    if expr.head == :(:)
        expr.head = :(call)
        if length(expr.args) == 2
            push!(expr.args, :nothing)
        end
        unshift!(expr.args, :(pybuiltin("slice")))
    end

    # df["name"] => get(df, :name)
    if expr.head == :(ref)
        expr.head = :(call)
        unshift!(expr.args, :(get))
    end

    for (i, arg) in enumerate(expr.args)
        traverse!(expr.args[i])
    end

    # df.loc => df[:loc]
    if expr.head == :(.)
        expr.head = :(ref)
    end

    return expr
end

macro Py(expr::Expr)
    traverse!(expr)
    return esc(expr)
end

macro Py(expr::Symbol)
    return esc(expr)
end

end # module

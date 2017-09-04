using PySyntax
using Base.Test

# write your own tests here
@test @py(:(df)) == :(df)
@test @py(:(df.loc)) == :(df[:loc])
@test @py(:(df.loc[:])) == :(get(df[:loc], (pybuiltin("slice"))(nothing, nothing, nothing)))
@test @py(:(df.loc[0:5, "salary1":"salary2"].plot.bar(linestyle="--"))) == :((((get(df[:loc], (pybuiltin("slice"))(0, 5, nothing), (pybuiltin("slice"))("salary1", "salary2", nothing)))[:plot])[:bar])(linestyle="--"))

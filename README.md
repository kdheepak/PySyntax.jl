# Py

### Installation

Within Julia, just use the package manager to run `Pkg.clone("https://github.com/kdheepak/Py.jl")` to install the files.
Julia 0.5 or later is recommended.

### Usage

In a session, type the following to export the `@py` macro.

```julia
using Py
```

The `@py` macro allows Python-like syntax

```julia
@pyimport pandas as pd
df = pd.DataFrame(
    Dict(
        "name"=>["John", "Jane", "Zack", "Zoey"],
        "salary"=>[100000, 100000, 100000, 100000]
        )
)
@py df = df.set_index("name")
@py df["John":"Jane"]
```

Py.jl provides a light wrapper on PyCall.jl

Improvements, suggestions or contributions welcome!


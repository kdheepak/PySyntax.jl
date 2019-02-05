# PySyntax [![Travis-CI Build Status](https://travis-ci.org/kdheepak/PySyntax.jl.svg?branch=master)](https://travis-ci.org/kdheepak/PySyntax.jl) [![AppVeyor](https://img.shields.io/appveyor/ci/gruntjs/grunt.svg)](https://ci.appveyor.com/project/kdheepak/pysyntax-jl)

**This package is deprecated:**
- [JuliaLang/julia#1974](https://github.com/JuliaLang/julia/issues/1974) ("allow overloading of a.b field access syntax") has been fixed with the merging of [JuliaLang/julia#24960](https://github.com/JuliaLang/julia/pull/24960);
- The dot-overloading functionality it enabled has since been implemented in PyCall.jl, with the merge of [JuliaPy/PyCall.jl#517](https://github.com/JuliaPy/PyCall.jl/pull/517).

----

PySyntax.jl enables using Python-like syntax in [Julia](https://github.com/JuliaLang/julia).
It provides a light wrapper on top of [PyCall.jl](https://github.com/JuliaPy/PyCall.jl), in the form of a macro.

![](./img/screenshot.png)

### Installation

Within Julia, just use the package manager to run `Pkg.clone("https://github.com/kdheepak/PySyntax.jl")` to install the files.
Julia 0.5 or later is recommended.

### Usage

In a session, type the following to export the `@py` macro.

```julia
using PySyntax
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

See [notebooks](./notebooks/PySyntax.jl.ipynb) for examples. See [JuliaPy/PyCall.jl#86](https://github.com/JuliaPy/PyCall.jl/issues/86) for the discussion on this subject.

Improvements, suggestions or contributions welcome!


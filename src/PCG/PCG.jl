__precompile__(true)

module PCG

    # PCG
    export AbstractPCG, PCGStateMCG, PCGStateOneseq, PCGStateUnique, PCGStateSetseq

    # PCG Methods
    export PCG_XSH_RS, PCG_XSH_RR, PCG_RXS_M_XS, PCG_XSL_RR, PCG_XSL_RR_RR

    export PCGUInt, PCGMethod

    export bounded_rand, advance!

    const pcg_uints = (UInt8, UInt16, UInt32, UInt64, UInt128)
    typealias PCGUInt Union{pcg_uints...}

    for method in (:XSH_RS, :XSH_RR, :RXS_M_XS, :XSL_RR, :XSL_RR_RR)
        eval(parse("const PCG_$method = Val{:$method}"))
    end
    const pcg_methods = map(x -> Val{x}, (:XSH_RS, :XSH_RR, :RXS_M_XS, :XSL_RR, :XSL_RR_RR))
    typealias PCGMethod Union{pcg_methods...}

    include("bases.jl")

    include("main.jl")

end

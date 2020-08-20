# ============================================================
# Collision Term
# ============================================================

export ube_rhs, ube_rhs!


"""
Right-hand side of universal Boltzmann equation
`ube_dfdt(f, p, t)`

"""
function ube_dfdt(f, p, t)
    M = p[1]
    τ = p[2]
    ann = p[3:end]

    if ann isa FastChain
        df = (M - f) / τ + ann[1](M - f, ann[2])
    elseif ann isa Chain
        df = (M - f) / τ + ann[1](M - f)
    end

    return df
end


"""
Right-hand side of universal Boltzmann equation
`ube_dfdt!(df, f, p, t)`

"""
function ube_dfdt!(df, f, p, t)
    M = p[1]
    τ = p[2]
    ann = p[3:end]

    if ann isa FastChain
        df .= (M - f) / τ + ann[1](M - f, ann[2])
    elseif ann isa Chain
        df .= (M - f) / τ + ann[1](M - f)
    end
end



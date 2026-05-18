"""
A gene feature in the simulated genome.

Fields:
- `id`: gene identifier
- `chr`: chromosome/scaffold name
- `start`: genomic start coordinate
- `stop`: genomic end coordinate
- `category`: functional category
- `essentiality`: value from 0.0 to 1.0; higher means harder to lose
- `active`: whether the gene is still functional
"""
mutable struct Gene
    id::String
    chr::String
    start::Int
    stop::Int
    category::String
    essentiality::Float64
    active::Bool
end

"""
A simplified simulated genome.

This early version only stores genes and chromosome lengths.
Repeats, introns, HGT blocks, and deletions will be added later.
"""
mutable struct Genome
    genes::Vector{Gene}
    chromosome_lengths::Dict{String, Int}
    time_mya::Float64
end

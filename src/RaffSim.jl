module RaffSim

include("types.jl")
include("initialize.jl")
include("gene_loss.jl")
include("simulate.jl")
include("statistics.jl")

export Gene,
       Genome,
       create_toy_genome,
       apply_gene_loss!,
       simulate!,
       summarize_genome

end

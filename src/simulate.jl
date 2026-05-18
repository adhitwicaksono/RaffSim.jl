using Random

"""
Run a simple RaffSim simulation.

Current v0.1 behavior:
- repeatedly applies function-biased gene loss
- moves simulated time forward

Future versions will add:
- repeat bursts
- intron expansion
- HGT
- deletions
"""
function simulate!(
    genome::Genome;
    steps::Int = 10,
    base_loss_rate::Float64 = 0.10,
    time_step_mya::Float64 = 1.0,
    seed::Union{Nothing, Int} = nothing
)
    rng = seed === nothing ? Random.default_rng() : MersenneTwister(seed)

    for _ in 1:steps
        apply_gene_loss!(genome; base_loss_rate = base_loss_rate, rng = rng)
        genome.time_mya -= time_step_mya
    end

    return genome
end

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
    seed::Int = 1
)
    for step in 1:steps
        apply_gene_loss!(
            genome;
            base_loss_rate = base_loss_rate,
            seed = seed,
            step = step
        )

        genome.time_mya -= time_step_mya
    end

    return genome
end

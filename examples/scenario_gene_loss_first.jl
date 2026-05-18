using RaffSim

genome = create_toy_genome(n_genes = 100)

println("Before simulation:")
println(summarize_genome(genome))

simulate!(
    genome;
    steps = 20,
    base_loss_rate = 0.01,
    time_step_mya = 1.0,
    seed = 42
)

println()
println("After simulation:")
println(summarize_genome(genome))

using Test
using RaffSim

@testset "Toy genome initialization" begin
    genome = create_toy_genome(n_genes = 100)

    @test length(genome.genes) == 100
    @test genome.time_mya == 100.0
    @test haskey(genome.chromosome_lengths, "chr1")
end

@testset "Gene loss simulation" begin
    genome = create_toy_genome(n_genes = 100)

    before = summarize_genome(genome)

    simulate!(
        genome;
        steps = 10,
        base_loss_rate = 0.2,
        seed = 123
    )

    after = summarize_genome(genome)

    @test after.total_genes == before.total_genes
    @test after.active_genes <= before.active_genes
    @test after.lost_genes >= before.lost_genes
end

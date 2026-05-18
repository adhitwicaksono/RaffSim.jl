using Random

"""
Apply function-biased gene loss to a genome.

Genes with lower essentiality are more likely to be lost.
The `base_loss_rate` controls the overall probability of loss.
"""
function apply_gene_loss!(
    genome::Genome;
    base_loss_rate::Float64 = 0.10,
    rng::AbstractRNG = Random.default_rng()
)
    for gene in genome.genes
        if gene.active
            loss_probability = base_loss_rate * (1.0 - gene.essentiality)

            if rand(rng) < loss_probability
                gene.active = false
            end
        end
    end

    return genome
end

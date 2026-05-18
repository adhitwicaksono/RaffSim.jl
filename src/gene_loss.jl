using Random

"""
Apply function-biased gene loss to a genome.

Genes with lower essentiality are more likely to be lost.
The `base_loss_rate` controls the overall probability of loss.
"""
function _pseudo_random01(seed::Int, step::Int, index::Int)
    m = 2_147_483_647
    a = 48_271

    x = mod(seed + 1_000_003 * step + 9_176 * index, m)
    x = x == 0 ? 1 : x

    return mod(a * x, m) / m
end

function apply_gene_loss!(
    genome::Genome;
    base_loss_rate::Float64 = 0.10,
    seed::Int = 1,
    step::Int = 1
)
    for (i, gene) in enumerate(genome.genes)
        if gene.active
            loss_probability = base_loss_rate * (1.0 - gene.essentiality)
            r = _pseudo_random01(seed, step, i)

            if r < loss_probability
                gene.active = false
            end
        end
    end

    return genome
end

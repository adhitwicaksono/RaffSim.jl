"""
Summarize the current genome state.

Returns a named tuple with basic genome statistics.
"""
function summarize_genome(genome::Genome)
    total_genes = length(genome.genes)
    active_genes = count(gene -> gene.active, genome.genes)
    lost_genes = total_genes - active_genes

    active_by_category = Dict{String, Int}()
    lost_by_category = Dict{String, Int}()

    for gene in genome.genes
        if gene.active
            active_by_category[gene.category] = get(active_by_category, gene.category, 0) + 1
        else
            lost_by_category[gene.category] = get(lost_by_category, gene.category, 0) + 1
        end
    end

    return (
        time_mya = genome.time_mya,
        total_genes = total_genes,
        active_genes = active_genes,
        lost_genes = lost_genes,
        active_by_category = active_by_category,
        lost_by_category = lost_by_category
    )
end

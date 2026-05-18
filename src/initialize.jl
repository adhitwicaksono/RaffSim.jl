"""
Create a small toy ancestral genome for development and testing.

This is not a real Rafflesiaceae genome.
It is only a minimal simulated genome used to test the simulator logic.
"""
function create_toy_genome(; n_genes::Int = 100, chr_length::Int = 1_000_000)
    categories = [
        "photosynthesis",
        "plastid",
        "body_plan",
        "defense",
        "nutrient_transport",
        "floral",
        "housekeeping",
        "unknown"
    ]

    genes = Gene[]

    spacing = div(chr_length, n_genes + 1)

    for i in 1:n_genes
        category = categories[mod1(i, length(categories))]

        essentiality =
            category == "housekeeping" ? 0.95 :
            category == "floral" ? 0.75 :
            category == "photosynthesis" ? 0.20 :
            category == "plastid" ? 0.30 :
            category == "body_plan" ? 0.40 :
            category == "defense" ? 0.45 :
            category == "nutrient_transport" ? 0.60 :
            0.50

        start = i * spacing
        stop = start + 999

        push!(
            genes,
            Gene(
                "gene_$i",
                "chr1",
                start,
                stop,
                category,
                essentiality,
                true
            )
        )
    end

    chromosome_lengths = Dict("chr1" => chr_length)

    return Genome(genes, chromosome_lengths, 100.0)
end

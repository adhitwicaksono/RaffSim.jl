# RaffSim.jl

**RaffSim.jl** is an early-stage Julia-based simulation framework for exploring the evolution of extreme genome architecture in **Rafflesiaceae** and other endoparasitic plants.

The project aims to simulate plausible evolutionary scenarios that may produce genome features observed in parasitic plants, including gene loss, repeat expansion, giant introns, genome contraction, and host-derived horizontal gene transfer.

> **Important:** RaffSim.jl does not attempt to reconstruct the true historical genome of Rafflesiaceae.  
> Instead, it provides a scenario-based computational framework to test whether proposed evolutionary processes can reproduce observed genome-architecture patterns.

---

## Background

Rafflesiaceae are among the most unusual flowering plants on Earth. Members of this family are fully endoparasitic for most of their life cycle, lack typical vegetative structures, and produce some of the largest flowers known.

Genomic studies of Rafflesiaceae and related parasitic plants suggest several unusual features, including:

- extensive gene loss
- reduction or loss of photosynthesis-related functions
- unusual genome-size evolution
- repeat-rich genome architecture
- extreme intron-size variation
- possible host-to-parasite horizontal gene transfer
- difficult phylogenetic placement due to long-branch effects and ancient rapid radiation

These features raise a major evolutionary question:

> What combinations of evolutionary processes can generate Rafflesiaceae-like genome architecture?

RaffSim.jl is designed to explore this question computationally.

---

## Project Philosophy

RaffSim.jl is not a full nucleotide-level genome simulator in its first version.

Instead, the initial version uses an **interval-based genome architecture model**, where genomes are represented as structured genomic features:

- genes
- exons
- introns
- repeats
- intergenic regions
- horizontally transferred blocks
- deleted or pseudogenized regions

This makes the simulator lightweight, interpretable, and suitable for hypothesis testing before moving into more complex sequence-level simulation.

---

## Core Questions

RaffSim.jl is designed to explore questions such as:

1. Can gene loss alone produce a Rafflesiaceae-like genome?
2. Are transposable element bursts required to explain repeat-rich genome architecture?
3. Can giant introns emerge from repeat insertion into intronic regions?
4. Does selection against long introns in highly expressed genes create dual genome architecture?
5. Can host-derived horizontal gene transfer contribute substantially to parasite genome structure?
6. Which evolutionary scenarios best reproduce observed Sapria- or Rafflesia-like genome statistics?

---

## Conceptual Model

The general model is:

```text
ancestral free-living angiosperm-like genome
        ↓
transition to parasitism
        ↓
function-biased gene loss
        ↓
repeat expansion and decay
        ↓
intron expansion and contraction
        ↓
horizontal gene transfer from host
        ↓
modern Rafflesiaceae-like genome architecture
```

---

## Planned Evolutionary Modules

### 1. Gene Loss Module

Simulates function-biased gene loss or pseudogenization.

Possible gene categories:

- photosynthesis-related genes
- plastid-related genes
- root/shoot/body-plan genes
- defense-related genes
- nutrient transport genes
- floral development genes
- housekeeping genes
- unknown genes

Expected outputs:

- final gene count
- gene retention by category
- simulated BUSCO-like conserved gene retention
- functional loss profile

---

### 2. Repeat Burst Module

Simulates expansion of transposable elements and other repeats.

Possible parameters:

- repeat family
- insertion rate
- burst duration
- deletion rate
- repeat decay rate
- insertion bias

Possible insertion biases:

- random
- intergenic-biased
- intron-biased
- gene-proximal
- repeat-cluster-biased

Expected outputs:

- repeat fraction
- repeat family distribution
- repeat age distribution
- repeat density around genes
- repeat density inside introns

---

### 3. Intron Evolution Module

Simulates intron expansion and contraction.

Possible mechanisms:

- repeat insertion into introns
- small indel accumulation
- large intronic deletion
- selection against long introns in highly expressed genes
- relaxed constraint in low-expression genes

Expected outputs:

- median intron length
- maximum intron length
- number of giant introns
- repeat content inside introns
- intron size distribution by gene category

---

### 4. Horizontal Gene Transfer Module

Simulates host-to-parasite DNA transfer.

Possible parameters:

- HGT rate
- donor lineage
- transferred fragment size
- integration bias
- retention probability
- functionalization probability
- decay probability

Expected outputs:

- HGT block count
- HGT genome fraction
- HGT location distribution
- HGT overlap with genes or repeats
- host-derived region summary

---

### 5. Genome Deletion and Contraction Module

Simulates deletion processes that counterbalance genome expansion.

Possible mechanisms:

- small deletions
- large deletions
- repeat decay
- gene deletion
- intergenic contraction
- pseudogene removal

Expected outputs:

- final genome size
- gene density
- repeat density
- deletion profile
- genome expansion/contraction trajectory

---

## Scenario Testing

RaffSim.jl will support multiple evolutionary scenarios.

Example scenarios:

### Scenario A: Gene-Loss-First Model

```text
parasitism → gene loss → repeat accumulation → intron divergence
```

### Scenario B: TE-Burst-First Model

```text
repeat expansion → genome inflation → intron expansion → gradual gene loss
```

### Scenario C: HGT-Associated Model

```text
host contact → HGT accumulation → local repeat activity → genome restructuring
```

### Scenario D: Dual Genome Syndrome Model

```text
some genes become compact and streamlined
while others accumulate giant introns and repeats
```

---

## Planned Output Files

A typical RaffSim.jl run may produce:

```text
simulation_summary.tsv
final_genes.bed
final_repeats.bed
final_introns.bed
final_hgt_blocks.bed
intron_length_distribution.tsv
repeat_density_summary.tsv
scenario_score.tsv
figures/
logs/
```

---

## Example Future Usage

```bash
julia examples/scenario_te_burst_first.jl
```

Possible output:

```text
Simulation completed.

Final genome size: 1.84 Gb
Final gene count: 14,203
Repeat fraction: 61.4%
Median intron length: 1.8 kb
Maximum intron length: 93.2 kb
Giant introns >10 kb: 4,812
Estimated HGT fraction: 1.1%
Scenario score: 0.18
```

---

## Planned Repository Structure

```text
RaffSim.jl/
├── Project.toml
├── README.md
├── src/
│   ├── RaffSim.jl
│   ├── types.jl
│   ├── initialize.jl
│   ├── gene_loss.jl
│   ├── repeats.jl
│   ├── introns.jl
│   ├── hgt.jl
│   ├── deletion.jl
│   ├── simulate.jl
│   ├── statistics.jl
│   └── scoring.jl
├── data/
│   ├── observed_sapria_stats.json
│   └── example_params.toml
├── examples/
│   ├── scenario_gene_loss_first.jl
│   ├── scenario_te_burst_first.jl
│   └── scenario_dual_genome_syndrome.jl
├── test/
│   ├── runtests.jl
│   ├── test_gene_loss.jl
│   ├── test_repeats.jl
│   └── test_introns.jl
└── docs/
    ├── model_concept.md
    ├── parameters.md
    ├── observed_statistics.md
    └── limitations.md
```

---

## Minimum Viable Version

The first version, `v0.1`, will focus on three core modules:

1. gene loss
2. repeat burst
3. intron expansion

The first scientific question will be:

> Can function-biased gene loss, repeat bursts, and intron expansion generate Sapria-like genome architecture?

The first version will not yet simulate:

- real nucleotide sequences
- real chromosome evolution
- population genetics
- recombination
- selection at nucleotide resolution
- detailed host-parasite coevolution

These may be added in later versions.

---

## Relationship to Other Projects

RaffSim.jl is conceptually related to:

- **MANDRAGORA** — annotation diagnostics for repeat-rich and aberrant plant genomes
- **TRANSPECTOR** — transcriptome assembly inspection
- **Digital Polymerase / XNA World Project** — sequence and structure transformation tools
- future Rafflesiaceae comparative genomics projects

MANDRAGORA may eventually provide observed genome statistics that RaffSim.jl can use as target data.

---

## Scientific Limitations

RaffSim.jl should be interpreted carefully.

Major limitations include:

- limited availability of high-quality Rafflesiaceae genomes
- uncertainty in genome assembly quality
- uncertainty in repeat annotation
- uncertainty in gene annotation
- possible artifacts in giant intron detection
- difficulty distinguishing true gene loss from annotation failure
- uncertainty in HGT detection
- unstable deep phylogenetic placement of Rafflesiaceae
- simplified evolutionary assumptions in early versions

RaffSim.jl is therefore best used as a **hypothesis exploration tool**, not as a definitive evolutionary reconstruction engine.

---

## Long-Term Vision

The long-term goal is to develop RaffSim.jl into a scenario-testing framework for parasitic plant genome evolution.

Future versions may include:

- Approximate Bayesian Computation-style parameter inference
- comparison with observed Sapria and Rafflesia genome statistics
- integration with MANDRAGORA output
- visualization of simulated chromosomes
- host-derived genome block modeling
- repeat family-specific expansion models
- gene expression-informed intron constraint models
- sequence-level simulation
- interoperability with Python and R analysis workflows

---

## Example Research Applications

Potential use cases include:

- testing whether TE bursts are necessary to explain repeat-rich parasite genomes
- exploring how giant introns may evolve in endoparasitic plants
- comparing gene-loss-first versus repeat-expansion-first scenarios
- generating figures for Rafflesiaceae genome evolution hypotheses
- producing simulated genome architectures for benchmarking annotation tools
- supporting perspective papers on parasitic plant genome evolution

---

## Development Status

RaffSim.jl is currently in the conceptual and early development stage.

Current priority:

```text
v0.1:
- define genome feature types
- simulate gene loss
- simulate repeat bursts
- simulate intron expansion
- summarize genome architecture
```

---

## AI Usage Declaration

This project was developed with assistance from AI tools (ChatGPT 5.5, OpenAI) for conceptual design, documentation drafting, coding support, and simulation planning.

All scientific interpretations, code validation, biological assumptions, and final project decisions remain the responsibility of the human developer.

---

## Author

**Adhityo Wicaksono**  
Plant molecular biologist and bioinformatician  
Developer of early-stage computational biology tools for unusual plant genomes, parasitic plants, and synthetic biology applications.

---

## License

License to be decided.

Suggested options:

- MIT License for maximum openness
- Apache 2.0 License for more explicit patent protection
- GPLv3 if derivative works should remain open-source

---

## Citation

No formal citation is available yet.

If this project becomes useful, please cite the future release or associated publication.

---

## Working Motto

> Simulate the weirdness before claiming the history.

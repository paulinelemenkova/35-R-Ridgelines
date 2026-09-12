# R Ridgeline Plots — Density Distributions of Trench Geomorphology (ggridges)

R scripts that draw ridgeline plots (also called joyplots) with the ggridges
package. A ridgeline plot stacks partially overlapping kernel-density curves,
one per category, along a shared axis, giving a compact view of how a
distribution changes across groups. Here the technique is applied to the
geomorphology of a deep-sea trench: the density distribution of bathymetric
depths across survey profiles and of observation points across tectonic plates.

## Related publication

These R ridgeline scripts implement the ridgeline-plotting technique used in the
author's geospatial trench analysis:

Lemenkova, P. Geospatial Analysis by Python and R: Geomorphology of the
Philippine Trench, Pacific Ocean. Electronic Letters on Science and Engineering
2019, 15(3), 81-94.

- DOI (Zenodo): https://doi.org/10.5281/zenodo.3592687
- figshare:     https://doi.org/10.6084/m9.figshare.11449362
- HAL:          https://hal.science/hal-02425688
- SSRN:         https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3509412
- Journal:      https://dergipark.org.tr/tr/pub/else/issue/50887/604976 (ISSN 1305-8614)

The article applies a combined Python-and-R geospatial workflow to the Philippine
Trench; this repository holds the R ridgeline scripts. Note that the committed
example plots Mariana Trench data (Morphology.csv, Depths.csv) - both are Pacific
Ocean trenches analysed with the same ridgeline technique.

## Scripts

### ridgeline_ggridges_mariana_trench.R
- Reads a morphometric table (Morphology.csv) and a depth table (Depths.csv) and
  removes incomplete records (na.omit with a per-row missing-value check).
- Reshapes wide to long with data.table::melt (setDT): the four tectonic-plate
  columns (pattern "^plate") into a "tectonics" variable, and the profile
  columns (pattern "^profile") into a "depth" variable.
- Draws ridgeline density plots with ggridges::geom_density_ridges: a tectonics
  plot with jittered raw points (position_points_jitter, point_shape "|") and a
  bathymetry plot with a viridis fill gradient, both styled with theme_ridges.

### ridgeline_ggridges_faostat_prices.R
An independent example drawing ridgelines of an agricultural producer-price time
series with geom_density_ridges and geom_density_ridges_gradient (viridis fill by
value), read with the tidyverse.

### ridgeline_template.R
A minimal ridgeline-plot template.

## Methods and techniques

- Ridgeline / joyplot visualisation: stacked, overlapping kernel-density
  estimates per category (ggridges).
- Kernel density estimation as the basis of each ridge, with optional jittered
  raw-point overlays and gradient fills mapped to the x value.
- Wide-to-long reshaping with data.table::melt for grouped distribution plots.
- Missing-data handling by listwise deletion (na.omit).

## Data

- Depths.csv, Morphology.csv: bathymetric depths and morphometric factors along
  cross-profiles and tectonic plates of a Pacific Ocean trench (Mariana Trench).
- FAOSTAT_Prices.csv: agricultural producer prices by product and year.

## Requirements

- R (>= 3.5)
- Packages: ggridges, ggplot2, data.table, viridis, tidyverse

Install with:

    install.packages(c("ggridges", "ggplot2", "data.table", "viridis", "tidyverse"))

## Usage

Place the required CSV in the working directory and run, e.g.:

    Rscript ridgeline_ggridges_mariana_trench.R

## Author and citation

Polina Lemenkova
ORCID: https://orcid.org/0000-0002-5759-1089

If you use these scripts, please cite:

Lemenkova, P. Geospatial Analysis by Python and R: Geomorphology of the
Philippine Trench, Pacific Ocean. Electronic Letters on Science and Engineering
2019, 15(3), 81-94. https://doi.org/10.5281/zenodo.3592687

## License

See the LICENSE file in this repository.

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visualisation.R
\name{make_barplot}
\alias{make_barplot}
\title{Plot deconvolution results as a barplot}
\usage{
make_barplot(result_list, title = "", file_name = NULL)
}
\arguments{
\item{result_list}{A named list containing all deconvolution results}

\item{title}{(optional) title of the plot}

\item{file_name}{(optional) plot is saved in this file}
}
\value{
the ggplot object
}
\description{
Plot deconvolution results as a barplot
}
\examples{
data("single_cell_data_1")
data("cell_type_annotations_1")
data("batch_ids_1")
data("bulk")
data("RefData")

common_genes <- intersect(rownames(single_cell_data_1), rownames(bulk))[1:2000]

single_cell_data <- single_cell_data_1[common_genes, 1:500]
cell_type_annotations <- cell_type_annotations_1[1:500]
batch_ids <- batch_ids_1[1:500]
bulk <- bulk[common_genes, ]

deconvolution <- deconvolute(
  bulk, NULL, "bisque", single_cell_data,
  cell_type_annotations, batch_ids
)
deconvolution <- list(deconvolution)
names(deconvolution) <- "Bisque"
make_barplot(deconvolution)
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deconvolution_algorithms.R
\name{deconvolute}
\alias{deconvolute}
\title{Deconvolution}
\usage{
deconvolute(
  bulk_gene_expression,
  model = NULL,
  method = deconvolution_methods,
  single_cell_object = NULL,
  cell_type_annotations = NULL,
  batch_ids = NULL,
  cell_type_column_name = NULL,
  normalize_results = FALSE,
  verbose = FALSE,
  assay_name = NULL,
  ...
)
}
\arguments{
\item{bulk_gene_expression}{A matrix with the bulk data. Rows are genes, columns
are samples.}

\item{method}{A string specifying the method.}

\item{single_cell_object}{A matrix with the single-cell data. Rows are genes,
columns are samples. Row and column names need to be set. Alternatively a SingleCellExperiment
or an AnnData object can be provided. In that case, note that cell-type labels need to be
indicated either directly providing a vector (cell_type_annotations) or by indicating the
column name that indicates the cell-type labels (cell_type_column_name). (Anndata: obs object,
SingleCellExperiment: colData object).}

\item{cell_type_annotations}{A vector of the cell type annotations. Has to be in the same order
as the samples in single_cell_object.}

\item{batch_ids}{A vector of the ids of the samples or individuals.}

\item{cell_type_column_name}{Name of the column in (Anndata: obs, SingleCellExperiment: colData),
that contains the cell-type labels. Is only used if no cell_type_annotations vector
is provided.}

\item{normalize_results}{Whether the deconvolution results should be normalized.
Negative values will be put to 0, and the estimates will be normalized to sum to 1.
Defaults to NULL.}

\item{verbose}{Whether to produce an output on the console.}

\item{assay_name}{Name of the assay/layer of the single_cell_object that should be used to extract the data}

\item{...}{Additional parameters, passed to the algorithm used.}

\item{signature}{(Optional) The signature matrix. A signature can be provided for certain methods.
If NULL, the signature will be computed internally and will not be saved.
If you wish to save the model/signature, use the 'build_model' function instead.}
}
\value{
A matrix with the probabilities of each cell-type for each individual. Rows are
individuals, columns are cell types.
}
\description{
Deconvolution
}
\examples{
# More examples can be found in the unit tests at tests/testthat/test-c-deconvolute.R
data("single_cell_data_1")
data("cell_type_annotations_1")
data("batch_ids_1")
data("bulk")

single_cell_data <- single_cell_data_1[1:2000, 1:500]
cell_type_annotations <- cell_type_annotations_1[1:500]
batch_ids <- batch_ids_1[1:500]
bulk <- bulk[1:2000, ]


deconv_bisque <- deconvolute(
  bulk, NULL, "bisque", single_cell_data,
  cell_type_annotations, batch_ids
)
}

---
name: unsupervised-learning
description: "Use only when explicitly invoked to explore clustering methods, select a model via label-free criteria, and write a concise statistical report."
user-invocable: true
disable-model-invocation: true
---

# Unsupervised Learning

Use this workflow only when the user explicitly invokes this skill and supplies the dataset and predictors. If labels are available, they must not be used for fitting or model selection; labels may be used after selection to interpret clusters. Do not assume variable names, class count, coding, or results. Ask for missing inputs before analysis. Use only clustering methods.

## Analysis Procedure

1.  Identify the predictors and any required coding. Check for missing/non-numeric predictors. Determine if the data are suitable for an unsupervised learning analysis. Scale the predictors if necessary.
2.  Set and report a random seed. If necessary, use dimension reduction via PCA or UMAP and explain why. If using UMAP, treat it as an optional embedding, not a clustering method, and don't select a model from its plot alone.
3.  Select **at least three** **different clustering algorithms**, such as K-means, hierarchical clustering, and spectral clustering and explain why the algorithms were selected.
4.  Tune only the important settings for each clustering algorithm; for spectral clustering, compare the similarity-graph settings as well as the number of clusters.
5.  Compare candidates using a consistent label-free criterion, such as average silhouette, and check cluster sizes and stability.
6.  Select and justify one final model; do not use known class labels for tuning or selection.

## Report Requirements

Create the analysis report as a Quarto `.qmd` file, following the structure and conventions of the user's homework `.qmd` files. Configure it to render as `.html`, run the document, and verify that the rendered HTML is current and opens successfully.

Produce a clearly readable analysis report that fits on at most one printed page at 11-point font. Include:

- A brief background information about the data and why an unsupervised learning analysis is required;

- A compact table of candidate settings, criterion, and the selected model;

- A figure that justifies choosing the final model and a caption that explains what the figure is and why the final model is selected;

- A brief description of candidates and tuning procedure, the selection, main findings, and limitations;

- Interpretation of the fit and key numerical results;

- Prioritize evidence needed to justify the final model;

- **ONLY PRESENT CLUSTERING RESULTS FROM THE SELECTED MODEL.** Briefly mention the other methods considered to justify the selection.

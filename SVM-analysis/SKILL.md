---
name: SVM-analysis
description: "Use only when explicitly invoked to compare SVM classifiers, select a model with cross-validation, evaluate it once on a reserved test set, and write a concise statistical report."
user-invocable: true
disable-model-invocation: true
---

## SVM Analysis

Use this workflow only when the user explicitly invokes this skill and supplies the dataset, response, and predictors. Do not assume variable names, class count, coding, or results. Ask for missing inputs before analysis. Use only SVM or combinations of their predicted class probabilities as classifiers.

## Analysis Procedure

1.  Identify the response, predictors, class labels, and any required coding. Check for missing/non-numeric predictors and class counts. Determine if the data are suitable for an SVM analysis.
2.  Set and report a random seed. Choose which kernels to consider and explain why.
3.  Identify tuning parameters and use cross-validation to tune them.
4.  Choose an evaluation method that supports selecting a final model and explain why.

## Report Requirements

Create the analysis report as a Quarto `.qmd` file, following the structure and conventions of the user's homework `.qmd` files. Configure it to render as `.html`, run the document, and verify that the rendered HTML is current and opens successfully.

Produce a clearly readable analysis report that fits on at most one printed page at 11-point font. Include:

- A brief background information about the data and why an SVM analysis is required;

- A compact table of candidate settings, their average CV misclassification rates, and the selected model;

- A figure that justifies choosing the final model and a caption that explains what the figure is and why the final model is selected;

- A compact table showing True Negative (TN), False Positive (FP), False Negative (FN), and True Positive (TP);

- A brief description of candidates and CV procedure, the selection, main findings, and limitations;

- Interpretation of the fit and key numerical results;

- Prioritize evidence needed to justify the final model.
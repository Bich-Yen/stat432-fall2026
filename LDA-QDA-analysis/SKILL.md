---
name: lda-qda-analysis
description: "Use only when explicitly invoked to compare LDA/QDA classifiers, select a model with cross-validation, evaluate it once on a reserved test set, and write a concise statistical report."
user-invocable: true
disable-model-invocation: true
---

# LDA/QDA Analysis

Use this workflow only when the user explicitly invokes this skill and supplies the dataset, response, and predictors. Do not assume variable names, class count, coding, or results. Ask for missing inputs before analysis. Use only LDA, QDA, or combinations of their predicted class probabilities as classifiers.

## Analysis procedure

1.  Identify the response, predictors, class labels, and any required coding. Check for missing/non-numeric predictors, class counts, and whether each class has enough training observations to estimate full covariance matrices. State problems and limitations rather than silently changing the data.
2.  Set and report a random seed. Split off a test set before comparing or selecting models; stratify by class where practical. Do not inspect test labels or use test performance to select features, preprocessing, model settings, or the final model.
3.  Always include ordinary LDA and ordinary QDA as candidates. Additional candidates may use a lower-dimensional representation (such as PCA followed by LDA/QDA) or blend LDA/QDA class probabilities. Keep every classifier within those methods. State each candidate and its settings clearly.
4.  Compare candidates using the same cross-validation folds on the training split and misclassification rate as the selection metric. Choose folds and settings appropriate to the class counts. Fit all preprocessing, feature selection, and embeddings separately within each fold using only that fold's analysis portion; apply the fitted transformation to its validation portion. Do not let validation or test observations influence preprocessing estimates.
5.  Select the candidate with the lowest mean cross-validated misclassification rate. Report fold count, candidate CV errors, selection rule, and any ties or instability. Do not use the reserved test set to revise this choice.
6.  Refit the chosen model and all its preprocessing on the full training split. Evaluate it exactly once on the reserved test split. Report the test confusion matrix (observed rows, predicted columns) and test misclassification rate as the final estimated prediction error. Clearly distinguish CV selection results from this held-out estimate.
7.  Verify that labels, factor/class order, dimensions, confusion-matrix orientation, and error denominators are correct. Do not claim a method works solely because fitting completed or report invented results. If execution is unavailable, provide reproducible code and mark results as not computed.

## Report requirements

Create the analysis report as a Quarto `.qmd` file, following the structure and conventions of the user's homework `.qmd` files. Configure it to render as `.html`, run the document, and verify that the rendered HTML is current and opens successfully.

Produce a clearly readable analysis report that fits on at most one printed page. Include:

- a compact table of candidate methods, their CV misclassification rates, and the selected model;
- one clearly labelled figure comparing candidate CV errors (or another informative, training/CV-only comparison);
- numerical model-fitting results, including sample sizes, seed, selected settings, CV error, and the once-only test error;
- a brief description of candidates and CV procedure, the selection, main findings, and limitations.

Keep the report concise; place code, detailed diagnostics, and the complete skill text outside the one-page report. Do not leak test-set information into the figure or model-selection discussion. Use accessible labels and distinguishable plot series. State when estimates are uncertain, covariance estimation is unstable, or model assumptions may be unsuitable.

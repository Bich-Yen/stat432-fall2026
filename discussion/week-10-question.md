---
id: w10-bpham9-oob-tuning
title: "Can the Best OOB Error Be Trusted?"
author: "Bich-Yen Pham (bpham9)"
---

Suppose you compare many random-forest settings using out-of-bag (OOB) error and choose the setting with the lowest OOB error. Why might reporting that same minimum as an unbiased estimate of the forest's test error be misleading, even though each OOB prediction comes from trees that did not use that observation?

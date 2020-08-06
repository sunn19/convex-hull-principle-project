# Convex-hull-principle-of-molecular-biology-as-one-of-the-Fundamental-Laws-of-Biology-and-the-geometry-of-genome-space-of-viruses

## Materials and Methods

* We downloaded data, all.gbk.tar.gz, from NCBI in in March, 2020 (ftp://ftp.ncbi.nlm.nih.gov/genomes/Viruses/). We extracted the following information of each virus according to our lab database VirusDB: Number of segments, Accession, GI, GenPart1, GenPart2, Baltimore label, Shape, Order, Family, Subfamily, Subfamily, Genus, Virus, Length, 12-dimensional natural vector. The detailed information of VirusDB can be found in table S1. The original paper:
Dong, R., Zheng, H., Tian, K., &Yau, SST. (2017). Virus Database and Online Inquiry System Based on Natural Vectors. Evolutionary Bioinformatics.

* naturalvectordna.m: compute 12-dim Natural Vector.

* intersection.m: solve the LP problem, which is used to prove separation between two convex hulls.

* separating_hyperplane.m: calculate the separating hyperplane (w^T*x+b=0) for two point sets.

* LDA_test.m and Lda1.m should be added in the same path, which are used to project high dimensional vector to 2-dim vector.

# Convex-hull-principle-of-molecular-biology-as-one-of-the-Fundamental-Laws-of-Biology-and-the-geometry-of-genome-space-of-viruses

## Materials and Methods

* We downloaded data, all.gbk.tar.gz, from NCBI in in March, 2020 (ftp://ftp.ncbi.nlm.nih.gov/genomes/Viruses/). We extracted the following information of each virus according to our lab database VirusDB: Number of segments, Accession, GI, GenPart1, GenPart2, Baltimore label, Shape, Order, Family, Subfamily, Subfamily, Genus, Virus, Length, 12-dimensional natural vector. The detailed information of VirusDB can be found in table S1. The original paper:
Dong, R., Zheng, H., Tian, K., &Yau, SST. (2017). Virus Database and Online Inquiry System Based on Natural Vectors. Evolutionary Bioinformatics.

* naturalvectordna.m: compute 12-dim Natural Vector.
Let $S = s_1s_2s_3...s_n$ be a genomic sequence of length n, and $\mathscr{L} = \{A, C, G, T/U\}$. For $k \in \mathscr{L}$, we define the indicator functions \cite{12d_NV} $w_k(\cdot): \mathscr{L}\rightarrow \{0,1\}$, i.e.:
\[
w_k(s_i)=\left\{
\begin{array}{rl}
1, & if \quad s_i = k,\\
0, & otherwise. \\
\end{array} \right. 
\]

where $s_i \in \mathscr{L}, i = 1, 2, 3, ..., n.$

\begin{itemize}
\item Let $n_k = \sum_{i=1}^n w_k(s_i)$ denote the counts of nucleotide k in S.    
\item Let $\mu _k = \sum_{i=1}^n i\cdot \dfrac{w_k(s_i)}{n_k}$ specify the average location of letter k.
\item Let $D_j^k = \sum_{i=1}^n \dfrac{(i-\mu _k)^j w_k(s_i)}{n_k^{j-1} n^{j-1}}$ be the j-th central moment of positions of letter k.
\end{itemize}

Then we can get the (8+4n)-dimensional natural vector:\\
$$
(n_A,n_C,n_G,n_T,u_A,u_C,u_G,u_T,D_2^A,D_2^C,D_2^G,D_2^T, \cdots , D_{n+1}^A,D_{n+1}^C,D_{n+1}^G,D_{n+1}^T, \cdots )
$$

* intersection.m: solve the LP problem, which is used to prove separation between two convex hulls.

* separating_hyperplane.m: calculate the separating hyperplane (w^T*x+b=0) for two point sets.

* LDA_test.m and Lda1.m should be added in the same path, which are used to project high dimensional vector to 2-dim vector.

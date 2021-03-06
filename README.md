# Generalisation Power Analysis for finding a stable set of features using evolutionary feature selection algorithms

To run the algorithm 
1. Open main.m file and run.
2. If needed the parameters for GA algorithm can be tuned in GA_Wrapper.m file.
3. The algorithm by default is set to select features for the GLI_85 dataset. 
4. You can load another dataset following the format of the GLI_85 dataset.




# GeneralisationPowerAnalysis
Generalisation Power Analysis for finding a stable set of features using evolutionary feature selection algorithms


Bibtex reference<br />
<br />
@article{SalesiCosma2021,<br />
title = {Generalisation Power Analysis for finding a stable set of features using evolutionary feature selection algorithms},<br />
journal = {Knowledge-Based Systems},<br />
pages = {107450},<br />
year = {2021},<br />
issn = {0950-7051},<br />
doi = {https://doi.org/10.1016/j.knosys.2021.107450},<br />
url = {https://www.sciencedirect.com/science/article/pii/S0950705121007127},<br />
author = {Sadegh Salesi and Georgina Cosma},<br />
keywords = {Feature selection, Generalisation Power Analysis, Generalisation Power Index, Machine learning, Evolutionary computation, Feature selection stability},
abstract = {Evolutionary Computation (EC) algorithms are powerful techniques for feature selection tasks however, they reach different solutions in each run, and this is known as the stability issue. Existing solutions to finding a stable subset of features when using an EC algorithm include aggregation and frequency-based methods. These methods may return feature subsets that achieve weak or inconsistent classification performance when utilised to build classifiers, and this limitation is known as ‘lack of generalisation power’. To address this limitation, this paper proposes a novel algorithm called Generalisation Power Analysis (GPA) that measures the performance of feature subsets in terms of generalisation power and hence evaluates their ability to achieve optimal or near-optimal accuracy over multiple classifiers. GPA has been designed to work with the stochastic nature of EC algorithms. Experiments with eleven benchmark datasets revealed that the proposed GPA approach consistently outperformed alternative methods in finding subsets that achieved high generalisation power. Although GPA requires relatively higher computation time compared to alternative approaches as it embeds multiple classifiers, the advantages of using GPA during feature selection outweigh this limitation since the outcome will be a robust prediction model that has been developed using a subset of features that are not biased towards a specific classifier.}
}

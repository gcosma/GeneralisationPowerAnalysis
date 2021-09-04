To run the algorithm open main.m file and run.
The algorithm by default is set to select features for the GLI_85 dataset. 
You can load your dataset with the format mentioned in the code.
The parameters for GA algorithm can be tuned in GA_Wrapper.m file.

Files:

main.m  the main file to run the algorithm
GA_Wrapper the GA wrapper algorithm used for the paper to select the elit pool of subsets
fitness.m fitness function for the GA algorithm
mutation.m mutation algorithm for the GA
crossover.m crossover algorithm used in GA
GLI_85.mat the sample dataset
GPI.m generalisation power index algorithm
svm.m SVM classifier
lda.m LDA classifier
nb.m Naive Bayes classifier
knn.m KNN classifier
fsFisher: Fisher's score algorithm

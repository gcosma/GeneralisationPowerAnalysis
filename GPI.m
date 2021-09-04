%----------------------------------------------------------------
% Generalisation Power Analysis for finding a stable set of features using evolutionary feature selection algorithms
% by Sadegh Salesi and Georgina Cosma %
% Programmed by Dr Sadegh Salesi%
% Last revised: August 2021     %
% Reference: Salesi and Cosma. Generalisation Power Analysis for finding a stable set of features 
% using evolutionary feature selection algorithms
% Knowledge-Based Systems,2021
% Copyright (c) 2021, Sadegh Salesi and Georgina Cosma . All rights reserved.
% -----------------------------------------------------------------


function selected= GPI(subsets,X,Y,cp)

% for each subset the accuracy for each classifier is calculated
for i=1:size(subsets,1)
    %Get each subset row by row in subsets matrix
    subset=subsets(i,:);
    % Convert subset from binary format to integer
    subset = find(subset==1);
    %Calculate accuracies for the subset and store it in a vector
    subset_svm_acc(i,1)=svm(subset,X,Y,cp);
    subset_lda_acc(i,1)=lda(subset,X,Y,cp);
    subset_nb_acc(i,1)=nb(subset,X,Y,cp);
    subset_knn_acc(i,1)=knn(subset,X,Y,cp);
 
end

%Find the optimal value for each classifier (please refer to the paper for
%more details)
opt_svm=max(subset_svm_acc);
opt_lda=max(subset_lda_acc);
opt_nb=max(subset_nb_acc);
opt_knn=max(subset_knn_acc);

%Store accuracies and optimal values in vectors to easily do calculations
opt=[opt_svm,opt_lda,opt_nb,opt_knn];
acc=[subset_svm_acc,subset_lda_acc,subset_nb_acc,subset_knn_acc];

%GPI Calculation

% Difference accuracy between optimal accuracy and subset accuracy (please
% refer to paper)
acc_diff=opt-acc;
%Calculate GPI value for subset
GPI_cal=sum(acc_diff,2)*100/(numel(opt));
%Sort subset based on their GPI value to find the best subset
[~,idx]=sort(GPI_cal);
selected=find(subsets(idx(1),:)==1);



    






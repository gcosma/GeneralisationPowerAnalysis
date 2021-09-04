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
clc,clear

%Loading the dataset (columns are the features and the rows are samples)
load('GLI_85.mat')

%Number of features to be filtered out by Fisher algorithm in the first
%reduction step
fisher_feat = 100;

% Apply fisher score algorithm to filter out the first n features and reduce the dataset (please
% refer to paper for this step)
rank=fsFisher(X,Y);
X=(X(:,rank(1:fisher_feat)));

%KFold partitioning for samle size.
cp=cvpartition(numel(Y),"KFold",10);

%Elite pool to collect elite subsets from GA
elite_pool = [];

%Number of runs we execute GA to find elite subsets
nrun = 20;

% the GA by default iterates 100 times, chanage the parameters in the file
% if required
for run = 1 : nrun
  disp([' Run Number = ' num2str(run)])
  subsets = GA_Wrapper(X,Y,cp); 
  elite_pool  = [elite_pool;subsets];
end

% Remove repetitative subsets if any
[~,idx]=unique( subsets, 'rows','stable');
subsets=subsets(idx,:);

%Calculate GPI value for the subsets and find the final subset (the final
%subset is provided in integr format)
final_subset=GPI(subsets,X,Y,cp);

%Reduce the dataset with the final subset
reduced_dataset=(X(:,final_subset));








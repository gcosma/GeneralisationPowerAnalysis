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

%X is feature matrix in N by M format where columns are features and rows
%are samples
%Y is single column matrix of target vector
%cp is the kfold partitioning
function subsets = GA_Wrapper(X,Y,cp)

%% parameters setting
%Dimension of the dataset
[~,nvar]=size(X);

%Pop size and number of iterations
popsize=50;
maxiter=100;

%Crossover rate
pc=0.7;
ncross=round(popsize*pc);

%Mutation rate
pm=0.01;
nmut=round(popsize*nvar*pm/2);

%% Initializing population


emp.var=[];
emp.fit=[];
emp.no=[];
emp.acc=[];

pop=repmat(emp,popsize,1);

for i=1:popsize
  
    pop(i).var=round(rand(1,nvar));
    pop(i).no=sum(pop(i).var);
    [pop(i).fit,pop(i).acc]=fitness(pop(i).var,cp,X,Y,nvar);
    
end

[~,index]=min([pop.fit]);
gpop=pop(index);

%% main loop algorithm

BEST=zeros(maxiter,1);

for iter=1:maxiter

% crossover
crosspop=repmat(emp,ncross,1);
crosspop=crossover(crosspop,pop,ncross,nvar,X,Y,cp);
[pop]=[pop;crosspop];
       
% mutation
mutpop=repmat(emp,nmut,1);   
mutpop=mutation(mutpop,pop,nmut,popsize,nvar,X,Y,cp);
   
[pop]=[pop;mutpop];
[~,index]=sort([pop.fit]); 
pop=pop(index);
gpop=pop(1);
pop=pop(1:popsize); 
    
BEST(iter)=gpop.fit;
end

%Find the index of subsets in the population which have the best fitness
indx=[pop.acc]==gpop.acc;
%Re-index the population
pop=pop(indx);
%Reshape the population to only contain the solutions with the best fitness
reshaped_pop=reshape([pop.var],[nvar,numel(pop)])';
%Find th index of unique subsets (we might find the same solutions in
%different runs)
[~,idx]=unique(reshaped_pop, 'rows','stable');
%Re-index the population
pop=pop(idx);
%Reshape the population to only contain the unique solutions
pop=reshape([pop.var],[nvar,numel(pop)])';
%The subsets which have achived highest accuracy in this run
subsets=pop;
end

























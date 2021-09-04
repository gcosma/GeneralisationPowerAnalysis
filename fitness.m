function [f,acc] = fitness(sub,cp,X,Y,nvar)
FeatIndex = find(sub==1);
trainset = X(:,[FeatIndex]);
trainlabel=Y;

Model=fitcknn(trainset,trainlabel,'NumNeighbors',2,'CVPartition',cp);
loss=kfoldLoss(Model);

acc=-(1-loss);
f=(0.0001*((sum(sub))/nvar))-0.9999*acc;
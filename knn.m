function acc=knn(s,X,Y,cp)
FeatIndex = s;
trainset = X(:,[FeatIndex]);
trainlabel=Y;
KNNModel=fitcknn(trainset,trainlabel,'NumNeighbors',5,'CVPartition',cp);
loss=kfoldLoss(KNNModel);
acc=1-loss;
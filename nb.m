function acc=nb(s,X,Y,cp)
warning('off','all')
FeatIndex = s;
trainset = X(:,[FeatIndex]);
trainlabel=Y;
NBModel=fitcnb(trainset,trainlabel,'Distribution','mvmn','CVPartition',cp);
loss=kfoldLoss(NBModel);
acc=1-loss;
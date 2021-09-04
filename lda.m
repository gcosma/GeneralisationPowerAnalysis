function acc=lda(s,X,Y,cp)
FeatIndex = s;
trainset = X(:,[FeatIndex]);
trainlabel=Y;
LDAModel=fitcdiscr(trainset,trainlabel,'DiscrimType','diagLinear','CVPartition',cp);
loss=kfoldLoss(LDAModel);
acc=1-loss;
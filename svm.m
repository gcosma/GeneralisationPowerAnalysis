function acc=svm(s,X,Y,cp)
FeatIndex = s;
trainset = X(:,[FeatIndex]);
trainlabel=Y;
if (numel(unique(Y))==2)
    SVMModel=fitcsvm(trainset,trainlabel,'KernelFunction','linear','KernelScale','auto','CVPartition',cp);
else
    SVMModel=fitcecoc(trainset,trainlabel,'Coding','allpairs','CVPartition',cp);
end

loss=kfoldLoss(SVMModel);
acc=1-loss;
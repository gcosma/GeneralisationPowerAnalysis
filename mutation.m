function  mutpop=mutation(mutpop,pop,nmut,popsize,nvar,X,Y,cp)

for n=1:nmut
    
i=randi([1 popsize]);  

p=pop(i).var;

j=randi([1 nvar],1,1);

p(j)=~p(j);

mutpop(n).var=p;
[mutpop(n).fit,mutpop(n).acc]=fitness(mutpop(n).var,cp,X,Y,nvar);
mutpop(n).no=sum(mutpop(n).var);

end

end
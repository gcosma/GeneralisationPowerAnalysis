function  crosspop=crossover(crosspop,pop,ncross,nvar,X,Y,cp)
f=[pop.fit];
f=max(f)-f+eps;
f=f./sum(f);
f=cumsum(f);

for n=1:2:ncross
i1=find(rand<=f,1,'first');
i2=find(rand<=f,1,'first');
p1=pop(i1).var;
p2=pop(i2).var;

j=randi([1 nvar-1]);

o1=[p1(1:j) p2(j+1:end)];
o2=[p2(1:j) p1(j+1:end)];

crosspop(n).var=o1;
[crosspop(n).fit,crosspop(n).acc]=fitness(crosspop(n).var,cp,X,Y,nvar);
crosspop(n).no=sum(crosspop(n).var);

crosspop(n+1).var=o2;
[crosspop(n+1).fit,crosspop(n+1).acc]=fitness(crosspop(n+1).var,cp,X,Y,nvar);
crosspop(n+1).no=sum(crosspop(n+1).var);
end
end





















function [offspring,count_cost,bestfit] = generateOffspring(Parentgene,init_num,train,count_cost)


%由亲代基因型生成后代基因型
%Parentgene,init_num，offspring分别是亲代基因型，亲代个数，后代基因型

%计算出亲代基因对应的适应度 fitnessOfParent（种群个体数*1）
fitnessOfParent=zeros(init_num,1);
for i=1:init_num
    %fitnessOfParent(i)=fitness(Parentgene(i,:),train);
    [fitnessOfParent(i),count_cost]=fitness(Parentgene(i,:),train,count_cost);
    
end

[mmmm,index]=max(fitnessOfParent);
%取出列向量fitnessOfParent中最大值所在行数index和最大值mmmm
bestfit=Parentgene(index,:);%取出种群中最大适应度的基因型

count_cost=1/max(fitnessOfParent)

%计算出亲代基因对应的赌盘概率 probability（种群个体数*1）
probability=fitnessOfParent/sum(fitnessOfParent);

%根据赌盘概率选出两个亲代的序号twoParent（2*1）
%两个亲代的基因型 twoParentGene
offspring=[];%子代基因矩阵



%把两个亲代的基因型交叉产生子代基因矩阵offspring（init_num,16）
if mod(init_num,2)==0
    for j=1:floor(init_num/2)
        twoParent=randsrc(2,1,[1:init_num;probability.']);
        twoParentGene=[Parentgene(twoParent(1),:);Parentgene(twoParent(2),:)];
        crossing=randsrc(1,1,[1:89]);%选出交叉点
        tmp1=twoParentGene(1,crossing+1:90);
        tmp2=twoParentGene(2,crossing+1:90);%保存两个交叉点后的基因片段
        son=[twoParentGene(1,1:crossing),tmp2];
        offspring=[offspring;son];%将第一个交换完片段的子基因添加进矩阵
        son=[twoParentGene(2,1:crossing),tmp1];
        offspring=[offspring;son];%将第二个交换完片段的子基因添加进offspring矩阵
        tmp1=[];
        tmp2=[];
    end
else
    for j=1:floor(init_num/2)
        twoParent=randsrc(2,1,[1:init_num;probability.']);
        twoParentGene=[Parentgene(twoParent(1),:);Parentgene(twoParent(2),:)];
        crossing=randsrc(1,1,[1:89]);%选出交叉点
        tmp1=twoParentGene(1,crossing+1:90);
        tmp2=twoParentGene(2,crossing+1:90);%保存两个交叉点后的基因片段
        son=[twoParentGene(1,1:crossing),tmp2];
        offspring=[offspring;son];%将第一个交换完片段的子基因添加进矩阵
        son=[twoParentGene(2,1:crossing),tmp1];
        offspring=[offspring;son];%将第二个交换完片段的子基因添加进offspring矩阵
        tmp1=[];
        tmp2=[];
    end
%         twoParent=randsrc(2,1,[1:init_num;probability.']);
%         twoParentGene=[Parentgene(twoParent(1),:);Parentgene(twoParent(2),:)];
%         crossing=randsrc(1,1,[1:89]);%选出交叉点
%         tmp1=twoParentGene(1,crossing+1:90);
%         tmp2=twoParentGene(2,crossing+1:90);%保存两个交叉点后的基因片段
%         son=[twoParentGene(1,1:crossing),tmp2];
        hanglie=size(Parentgene);
        
        offspring=[offspring;Parentgene(randsrc(1,1,1:hanglie(1)),:)];%将第一个交换完片段的子基因添加进矩阵
end
    


%变异函数
%不妨设变异概率为0.125
MutationRate=0.002;
maxxxxx=init_num*90;
for ii=1:maxxxxx
    if rand()<MutationRate
        offspring(ii)=1-offspring(ii);
    end
end
return;

end
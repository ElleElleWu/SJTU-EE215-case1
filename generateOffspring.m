
function [offspring,count_cost,bestfit] = generateOffspring(Parentgene,init_num,train,count_cost)


%���״����������ɺ��������
%Parentgene,init_num��offspring�ֱ����״������ͣ��״����������������

%������״������Ӧ����Ӧ�� fitnessOfParent����Ⱥ������*1��
fitnessOfParent=zeros(init_num,1);
for i=1:init_num
    %fitnessOfParent(i)=fitness(Parentgene(i,:),train);
    [fitnessOfParent(i),count_cost]=fitness(Parentgene(i,:),train,count_cost);
    
end

[mmmm,index]=max(fitnessOfParent);
%ȡ��������fitnessOfParent�����ֵ��������index�����ֵmmmm
bestfit=Parentgene(index,:);%ȡ����Ⱥ�������Ӧ�ȵĻ�����

count_cost=1/max(fitnessOfParent)

%������״������Ӧ�Ķ��̸��� probability����Ⱥ������*1��
probability=fitnessOfParent/sum(fitnessOfParent);

%���ݶ��̸���ѡ�������״������twoParent��2*1��
%�����״��Ļ����� twoParentGene
offspring=[];%�Ӵ��������



%�������״��Ļ����ͽ�������Ӵ��������offspring��init_num,16��
if mod(init_num,2)==0
    for j=1:floor(init_num/2)
        twoParent=randsrc(2,1,[1:init_num;probability.']);
        twoParentGene=[Parentgene(twoParent(1),:);Parentgene(twoParent(2),:)];
        crossing=randsrc(1,1,[1:89]);%ѡ�������
        tmp1=twoParentGene(1,crossing+1:90);
        tmp2=twoParentGene(2,crossing+1:90);%��������������Ļ���Ƭ��
        son=[twoParentGene(1,1:crossing),tmp2];
        offspring=[offspring;son];%����һ��������Ƭ�ε��ӻ�����ӽ�����
        son=[twoParentGene(2,1:crossing),tmp1];
        offspring=[offspring;son];%���ڶ���������Ƭ�ε��ӻ�����ӽ�offspring����
        tmp1=[];
        tmp2=[];
    end
else
    for j=1:floor(init_num/2)
        twoParent=randsrc(2,1,[1:init_num;probability.']);
        twoParentGene=[Parentgene(twoParent(1),:);Parentgene(twoParent(2),:)];
        crossing=randsrc(1,1,[1:89]);%ѡ�������
        tmp1=twoParentGene(1,crossing+1:90);
        tmp2=twoParentGene(2,crossing+1:90);%��������������Ļ���Ƭ��
        son=[twoParentGene(1,1:crossing),tmp2];
        offspring=[offspring;son];%����һ��������Ƭ�ε��ӻ�����ӽ�����
        son=[twoParentGene(2,1:crossing),tmp1];
        offspring=[offspring;son];%���ڶ���������Ƭ�ε��ӻ�����ӽ�offspring����
        tmp1=[];
        tmp2=[];
    end
%         twoParent=randsrc(2,1,[1:init_num;probability.']);
%         twoParentGene=[Parentgene(twoParent(1),:);Parentgene(twoParent(2),:)];
%         crossing=randsrc(1,1,[1:89]);%ѡ�������
%         tmp1=twoParentGene(1,crossing+1:90);
%         tmp2=twoParentGene(2,crossing+1:90);%��������������Ļ���Ƭ��
%         son=[twoParentGene(1,1:crossing),tmp2];
        hanglie=size(Parentgene);
        
        offspring=[offspring;Parentgene(randsrc(1,1,1:hanglie(1)),:)];%����һ��������Ƭ�ε��ӻ�����ӽ�����
end
    


%���캯��
%������������Ϊ0.125
MutationRate=0.002;
maxxxxx=init_num*90;
for ii=1:maxxxxx
    if rand()<MutationRate
        offspring(ii)=1-offspring(ii);
    end
end
return;

end
close all
clear;
clc;
tic;

%������Լ�
train=csvread('dataform_train-0229.csv');
init_num=100;%���ó�ʼҪ���ɵ���Ⱥ������
iterator=100;%���õ�������
disp("��Ⱥ����Ϊ��")
disp(init_num);
disp("��Ⱥ��������Ϊ��")
disp(iterator);



%��ʼ�������״����� Parentgene����(��Ⱥ������*90)
%ÿ�д���һ����������
Parentgene=zeros(init_num,90);
Parentgene=generateGene(init_num);

mm=1;
% while true
%     disp("����������"+mm)
%     Parentgene=generateOffspring(Parentgene,init_num,train);
%     if if_end(Parentgene,train)==1
%        break;
%     end
%     mm=mm+1;
%     %Parentgene=generateOffspring(Parentgene,init_num,train);
%     
% end
plot_cost=[];
gene=[];
count_cost=[];
for ttttttttt=1:iterator
 disp("����������"+mm)
     [Parentgene,count_cost,bestfit]=generateOffspring(Parentgene,init_num,train,count_cost);
     %bestfitΪ��tttttt�ε����������Ӧ�ȵĻ����ͣ�����������count_costΪ����ѡ����Ӧ�ĳɱ�
     mm=mm+1;
     plot_cost=[plot_cost,count_cost];%�ɱ���������1*tttttttttt����ÿ��Ԫ�ش���һ��ѭ����͵ĳɱ�
     gene=[gene;bestfit];%ÿ����ÿ�����ŵĻ�����
end
plot(1:size(plot_cost.'),plot_cost,'r-o');
[useless,index_max]=min(plot_cost);

tmptt=-20:69;
adder=22;
output=gene(index_max,:).*(tmptt+adder);
output(output==0)=[];
output=output-adder
disp("����������ֵ����")

disp("��С�ɱ�Ϊ��"+min(plot_cost))
xlabel("��������")
ylabel("�ɱ�")
title("����������ֵ���ɱ�-������������")
toc
return

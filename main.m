close all
clear;
clc;
tic;

%读入测试集
train=csvread('dataform_train-0229.csv');
init_num=100;%设置初始要生成的种群个体数
iterator=100;%设置迭代次数
disp("种群个数为：")
disp(init_num);
disp("种群迭代次数为：")
disp(iterator);



%初始化产生亲代基因 Parentgene矩阵(种群个体数*90)
%每行代表一个基因序列
Parentgene=zeros(init_num,90);
Parentgene=generateGene(init_num);

mm=1;
% while true
%     disp("迭代次数："+mm)
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
 disp("迭代次数："+mm)
     [Parentgene,count_cost,bestfit]=generateOffspring(Parentgene,init_num,train,count_cost);
     %bestfit为第tttttt次迭代后最佳适应度的基因型（行向量），count_cost为这种选法对应的成本
     mm=mm+1;
     plot_cost=[plot_cost,count_cost];%成本行向量（1*tttttttttt），每个元素代表一次循环最低的成本
     gene=[gene;bestfit];%每行是每次最优的基因型
end
plot(1:size(plot_cost.'),plot_cost,'r-o');
[useless,index_max]=min(plot_cost);

tmptt=-20:69;
adder=22;
output=gene(index_max,:).*(tmptt+adder);
output(output==0)=[];
output=output-adder
disp("三次样条插值法：")

disp("最小成本为："+min(plot_cost))
xlabel("迭代次数")
ylabel("成本")
title("三次样条插值法成本-迭代次数曲线")
toc
return

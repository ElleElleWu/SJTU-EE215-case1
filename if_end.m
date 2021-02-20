function [output] = if_end(generation,train)
%END 判断这一带子代是否满足终止条件,返回值output==0，则不满足，output==1则满足
row=size(generation,1);    %size(generation,1)返回generation矩阵的行数

fit=[];
%fit数组存储这代子代的适应度
%初始化fit数组为空（最终fit为种群个体数*1）

for i=1:row
    fit=[fit;fitness(generation(i,:),train)];
end

output=0;

y=std(fit);%y是均方差，当整个收敛的时候输出结果
disp(y)
[maxValue,index]=max(fit);
 %maxValue是子代中最大的适应度，index是最大元素的行坐标（序号）
 disp("最大适应度："+maxValue)

     M=generation(index,:);%取出最大适应度的基因型1*90
    disp("the temperature that we choose are")
    tttt=-20:69;
    tttt=tttt+21;%防止温度里面本身为0的部分被去掉
    output_t=M.*tttt;
    output_t(output_t==0)=[];
    output_t=output_t-21;
    disp(output_t);
    disp(1/fitness(generation(index,:),train));%第一项为基因型,函数返回值是成本的倒数

%     flag=M(21);
%     if flag==1
%        for tmp=1:90 
%            if output_t(tmp)==0&&tmp~=21
%                output_t(tmp)=NaN;
%            end
%        end
%        output_t(isnan(output_t))=[];
%     else
%             output_t(output_t==0)=[];
%     end

 
if y<2
    disp("Success!!!!")
%     M=generation(index,:);%取出最大适应度的基因型1*90
%     disp("the temperature that we choose are")
%     tttt=-20:69;
%     output_t=M.*tttt;
%     flag=M(21);
%     if flag==1
%        for tmp=1:90 
%            if output_t(tmp)==0&&tmp~=21
%                output_t(tmp)=NaN;
%            end
%        end
%        output_t(isnan(output_t))=[];
%     else
%             output_t(output_t==0)=[];
%     end
%     disp(output_t);
    
    
    
%     disp("the total value is")
%     disp(maxValue)
    %输出包括选择的温度
    %输出一下成本！
    
    output=1;

end

    
end

function [output] = if_end(generation,train)
%END �ж���һ���Ӵ��Ƿ�������ֹ����,����ֵoutput==0�������㣬output==1������
row=size(generation,1);    %size(generation,1)����generation���������

fit=[];
%fit����洢����Ӵ�����Ӧ��
%��ʼ��fit����Ϊ�գ�����fitΪ��Ⱥ������*1��

for i=1:row
    fit=[fit;fitness(generation(i,:),train)];
end

output=0;

y=std(fit);%y�Ǿ����������������ʱ��������
disp(y)
[maxValue,index]=max(fit);
 %maxValue���Ӵ���������Ӧ�ȣ�index�����Ԫ�ص������꣨��ţ�
 disp("�����Ӧ�ȣ�"+maxValue)

     M=generation(index,:);%ȡ�������Ӧ�ȵĻ�����1*90
    disp("the temperature that we choose are")
    tttt=-20:69;
    tttt=tttt+21;%��ֹ�¶����汾��Ϊ0�Ĳ��ֱ�ȥ��
    output_t=M.*tttt;
    output_t(output_t==0)=[];
    output_t=output_t-21;
    disp(output_t);
    disp(1/fitness(generation(index,:),train));%��һ��Ϊ������,��������ֵ�ǳɱ��ĵ���

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
%     M=generation(index,:);%ȡ�������Ӧ�ȵĻ�����1*90
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
    %�������ѡ����¶�
    %���һ�³ɱ���
    
    output=1;

end

    
end

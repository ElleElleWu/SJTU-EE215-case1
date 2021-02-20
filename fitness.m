function [cost,count_cost] = fitness(geneticType,train,count_cost)
%FITNESS �������������͵���Ӧ����ֵ
%geneticType��һ������90��Ԫ�ص���������Train��ʵ��ĵ�ѹ�¶�ֵ
%���������¶ȣ�ż�����ǵ�ѹ

tpoint=sum(geneticType);
%tpoint����������¶ȵ������

if tpoint<2
    cost=0;
    return;
end

    

sums=0;
T_xls=[];



for ii=1:500
    t=train(2*ii-1,:);
    %�¶ȵ�������
    v=train(2*ii,:);
    %��ѹ��������
    
    tmp_add=21;
    t=t+tmp_add;%!!!!!�¶���СΪ-17
    vx=v.*geneticType;
    vx(vx==0)=[];
    ty=t.*geneticType;
    ty(ty==0)=[];%!!!!!!
    ty=ty-tmp_add;%!!!!!!
    t=t-tmp_add;

    
 % disp("���ǵ�"+ii+"����¶���Ͻ��")
 
   t1=spline(vx,ty,v);%t1�൱��tñ�����¶���Ϻ��ֵ

   T_xls=[T_xls;t1];
   
   vx=[];
   ty=[];
    diff_t=abs(t-t1);
    s=zeros(1,90);
    for jj=1:90
        if diff_t(jj)<=0.5
            s(jj)=0;
        else
            if diff_t(jj)<=1
                s(jj)=1;
            else
                if diff_t(jj)<=1.5
                    s(jj)=5;
                else
                    if diff_t(jj)<=2
                        s(jj)=10;
                    else
                        s(jj)=10000;
                    end
                end
            end
        end
    end
    sums=sums+sum(s);%Si
end

%xlswrite('examine.xlsx',T_xls,'A1:CL500');
costreal=sums/500+50*tpoint; %ʵ�ʳɱ�
count_cost=[count_cost,costreal];
%disp("�ɱ�Ϊ��"+costreal)
cost=1/(costreal);%�ɱ��ĵ���



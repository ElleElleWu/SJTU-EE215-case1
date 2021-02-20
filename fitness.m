function [cost,count_cost] = fitness(geneticType,train,count_cost)
%FITNESS 计算出输入基因型的适应函数值
%geneticType是一个含有90个元素的行向量，Train是实测的电压温度值
%奇数行是温度，偶数行是电压

tpoint=sum(geneticType);
%tpoint代表测量的温度点的数量

if tpoint<2
    cost=0;
    return;
end

    

sums=0;
T_xls=[];



for ii=1:500
    t=train(2*ii-1,:);
    %温度的行向量
    v=train(2*ii,:);
    %电压的行向量
    
    tmp_add=21;
    t=t+tmp_add;%!!!!!温度最小为-17
    vx=v.*geneticType;
    vx(vx==0)=[];
    ty=t.*geneticType;
    ty(ty==0)=[];%!!!!!!
    ty=ty-tmp_add;%!!!!!!
    t=t-tmp_add;

    
 % disp("这是第"+ii+"组的温度拟合结果")
 
   t1=spline(vx,ty,v);%t1相当于t帽，是温度拟合后的值

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
costreal=sums/500+50*tpoint; %实际成本
count_cost=[count_cost,costreal];
%disp("成本为："+costreal)
cost=1/(costreal);%成本的倒数



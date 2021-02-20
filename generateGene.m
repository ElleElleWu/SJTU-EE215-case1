function geneMatrix = generateGene(n)
%生成亲代基因型（n*90的矩阵）
% n是要生成的种群数量
% geneMatrix是生成的n*90的矩阵，每行代表一个亲代的基因型

geneMatrix=randsrc(n,90,[0,1;0.94,0.06]);
%0概率为0.94，1概率为0.06，生成一个只包含0和1的n*90矩阵

end
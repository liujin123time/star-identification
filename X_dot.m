function Q2 = X_dot(W)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
Q2 = zeros(size(W,1),size(W,1));
for i = 1 : size(W,1)
   for j = 2: size(W,1)
    Q2(i,j) = dot(W(i,:),W(j,:));
   end
end
%����������Ԫ��
for i = 1 : size(Q2,1)
    for j = 1 : i
        Q2(i,j) = 1e10;
    end
end
end


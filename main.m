clc;clear;
close all

%%%% ��ͼʶ�����
%%% �������
f = 107.46496182529; % ���� mm
dx = 5.5*1e-3; % ��Ԫ mm
dy = 5.5*1e-3; % ��Ԫ mm
x0 = 2048/2*dx;
y0 = 2048/2*dy;

%% �������� 
% �ǿ��ļ���sinf ; �����������㣺crdinf
sinf = load('sinf.txt');  %% �ྭ����γ���ȣ�
crdinf = load('60.txt');  %% X�����أ� Y�����أ�

%%% ������������ϵ�µ�λ��ʸ��
R = computeR(sinf);
W = computeW(crdinf,x0,y0,f,dx,dy);

%% ��ͼʶ��
%%% �����ǶԽǾ�
Q1 = dot_product(R);
Q2 = X_dot(W);

%%%% ���
%%% �̶� A ��
    for i = 2 : size(Q2,1)
        A = Q2(1,i)*ones(size(Q1,1),size(Q1,1));
        B = abs(A - Q1);
        [r1(i-1),c1(i-1)] = find(abs(A - Q1) == min(min(abs(A - Q1))));
        flag1 = [r1;c1];
    end  
if max(r1) - min(r1) == 0
    disp(['A�ǵĶ�Ӧ����sinf�е�',num2str(r1(1)), '����']);
else
      disp('����');
end
    
%%% �̶� B ��
for i = 3 : size(Q2,1)
     A = Q2(2,i)*ones(size(Q1,1),size(Q1,1));
     B = abs(A - Q1);
     [r2(i-2),c2(i-2)] = find(abs(A - Q1) == min(min(abs(A - Q1))));
     flag2 = [r2;c2];
end 
if max(r2) - min(r2) == 0
    disp(['B�ǵĶ�Ӧ����sinf�е�',num2str(r2(1)), '����']);
else
      disp('����');
end

%%% �̶� C ��
for i = 4 : size(Q2,1)
     A = Q2(3,i)*ones(size(Q1,1),size(Q1,1));
     B = abs(A - Q1);
     [r3(i-3),c3(i-3)] = find(abs(A - Q1) == min(min(abs(A - Q1))));
     flag3 = [r3;c3];
end 
if max(r3) - min(r3) == 0
    disp(['C�ǵĶ�Ӧ����sinf�е�',num2str(r3(1)), '����']);
else
      disp('����');
end

%%% �̶� D �ǣ��ж� D E�� ��Ӧ��
for i = 5 : size(Q2,1)
     A = Q2(4,i)*ones(size(Q1,1),size(Q1,1));
     B = abs(A - Q1);
     [r4(i-4),c4(i-4)] = find(abs(A - Q1) == min(min(abs(A - Q1))));
     flag4 = [r4;c4];
end 
if r4 - flag1(2,3) == 0  &&  r4 - flag2(2,2) == 0 && r4 - flag3(2,1) ==0
    disp(['D�ǵĶ�Ӧ����sinf�е�',num2str(r4), '����']);
else
      disp('����');
end

if c4 - flag1(2,4) == 0  &&  c4 - flag2(2,3) == 0 && c4 - flag3(2,2) ==0
    disp(['E�ǵĶ�Ӧ����sinf�е�',num2str(c4), '����']);
else
      disp('����');
end

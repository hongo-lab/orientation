clear;
filename = input('input filename eg. ''data.dat'':');
n = input('input number of guassian:');

%infor = load('data.dat');
infor = load(filename);
x = infor(:,1);
y = infor(:,2);

g1 = 'gauss1';
g2 = 'gauss2';
g3 = 'gauss3';
g4 = 'gauss4';
g5 = 'gauss5';
g6 = 'gauss6';
g7 = 'gauss7';
g8 = 'gauss8';
guassian_num = {g1,g2,g3,g4,g5,g6,g7,g8};

%op1 =fitoptions('Method', 'LinearLeastSquares');
%op2 =fitoptions('Method', 'NonlinearLeastSquares');

figure(1);clf;
[f v]= fit(x, y,guassian_num{n})
plot(f,x,y)

% fprintf '#######################\n\n'
% figure(2);clf;
% cl = 'rgmkcyrk'
% plot(x,y, '.b')
% hold on
% for j=1:8
%     [f v] = fit(x, y, guassian_num{j})
%     plot(f,cl(j))
%     hold on
%     fprintf '#######################\n\n'
% end
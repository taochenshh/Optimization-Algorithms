clear all;clc;close all;
f1=@(x)x(1)^4+x(2)^4+2*x(1)^2*x(2)^2+6*x(1)*x(2)-4*x(1)-4*x(2)+1;
f2=@(x)x(1)^6+x(2)^6+3*x(1)^2*x(2)^2-x(1)^2-x(2)^2-2*x(1)*x(2);
f1dot=@(x)[4*x(1)^3+4*x(1)*x(2)^2+6*x(2)-4;4*x(2)^3+4*x(2)*x(1)^2+6*x(1)-4];
f2dot=@(x)[6*x(1)^5+6*x(1)*x(2)^2-2*x(1)-2*x(2);6*x(2)^5+6*x(2)*x(1)^2-2*x(2)-2*x(1)];
Hmat1=@(x)[12*x(1)^2+4*x(2)^2 8*x(1)*x(2)+6;12*x(2)^2+4*x(1)^2 8*x(1)*x(2)+6];
Hmat2=@(x)[30*x(1)^4+6*x(2)^2-2 12*x(1)*x(2)-2;30*x(2)^4+6*x(1)^2-2 12*x(1)*x(2)-2];

x0=[0;1];
epsilon=5e-7;
n=100;
[x_mina1,f_mina1] =SteepestDescent(f1,f1dot,x0,epsilon,n);
[x_minb1,f_minb1] =SteepestDescent(f2,f2dot,x0,epsilon,n);
[X1,FVAL1,EXITFLAG1] = fminunc(f1,x0);
[X2,FVAL2,EXITFLAG2] = fminunc(f2,x0);
x0=[-0.5;1.1];
[xa1,fa1]=NewtonUncOptimization(f1,f1dot,Hmat1,x0,epsilon,n);
x0=[0.7;0.6];
[xb1,fb1]=NewtonUncOptimization(f2,f2dot,Hmat2,x0,epsilon,n);
x0=[0;-1];
[x_mina2,f_mina2] =SteepestDescent(f1,f1dot,x0,epsilon,n);
[x_minb2,f_minb2] =SteepestDescent(f2,f2dot,x0,epsilon,n);
[X3,FVAL3,EXITFLAG3] = fminunc(f1,x0);
[X4,FVAL4,EXITFLAG4] = fminunc(f2,x0);
x0=[1.1;-0.4];
[xa2,fa2]=NewtonUncOptimization(f1,f1dot,Hmat1,x0,epsilon,n);
x0=[-0.7;-0.6];
[xb2,fb2]=NewtonUncOptimization(f2,f2dot,Hmat2,x0,epsilon,n);
disp('==================================');
disp('For exercise (a):');
fprintf('The solutions found by using steepest descent method are:\n');
fprintf('(1) x=%10.9d ,y=%10.9d ,f=%5.4d; (2) x=%10.9d ,y=%10.9d ,f=%5.4d \n',x_mina1(1),x_mina1(2),f_mina1,x_mina2(1),x_mina2(2),f_mina2);
fprintf('The solutions found by using fminunc are:\n');
fprintf('(1) x=%10.9d ,y=%10.9d ,f=%5.4d; (2) x=%10.9d ,y=%10.9d ,f=%5.4d \n',X1(1),X1(2),FVAL1,X3(1),X3(2),FVAL3);
disp(['The exit flag for the first solution is ' num2str(EXITFLAG1)]);
disp(['The exit flag for the second solution is ' num2str(EXITFLAG3)]);
fprintf('The solutions found by using Newton''s Method are:\n');
fprintf('(1) x=%10.9d ,y=%10.9d ,f=%5.4d; (2) x=%10.9d ,y=%10.9d ,f=%5.4d \n',xa1(1),xa1(2),fa1,xa2(1),xa2(2),fa2);
disp('==================================');
disp('For exercise (b):');
fprintf('The solutions found by using steepest descent method are:\n');
fprintf('(1) x=%10.9d ,y=%10.9d ,f=%5.4d; (2) x=%10.9d ,y=%10.9d ,f=%5.4d \n',x_minb1(1),x_minb1(2),f_minb1,x_minb2(1),x_minb2(2),f_minb2);
fprintf('The solutions found by using fminunc are:\n');
fprintf('(1) x=%10.9d ,y=%10.9d ,f=%5.4d; (2) x=%10.9d ,y=%10.9d ,f=%5.4d \n',X2(1),X2(2),FVAL2,X4(1),X4(2),FVAL4);
disp(['The exit flag for the first solution is ' num2str(EXITFLAG2)]);
disp(['The exit flag for the second solution is ' num2str(EXITFLAG4)]);
fprintf('The solutions found by using Newton''s Method are:\n');
fprintf('(1) x=%10.9d ,y=%10.9d ,f=%5.4d; (2) x=%10.9d ,y=%10.9d ,f=%5.4d \n',xb1(1),xb1(2),fb1,xb2(1),xb2(2),fb2);
clear; clc;

A = [0 1 0;
    0 0 1;
    0 0 0];
B = [0; 0; 1];

D = 1.5;  
n = size(A,1);              
P = sdpvar(n,n,'symmetric'); 
Y = sdpvar(1,n,'full');     

% ==========================================
% Parámetros de diseño
% ==========================================
alpha   = 10;
epsilon = 0.000001;
delta   = 0.095;

% ==========================================
% LMI 
% ==========================================

s11 = A*P + P*A' + B*Y + Y'*B' + alpha*P + epsilon*eye(n);
s12 = delta*P;
s22 = -epsilon*eye(n);

LMI = [s11, s12; 
    s12', s22];

% ==========================================
% Restricciones y resolución
% ==========================================
cons = [LMI <= 0, P >= 0];

sol = optimize(cons); %[output:71d4aaf4]

% ==========================================
% Recuperar ganancias 
% ==========================================
    P_val = double(P);
    Y_val = double(Y);

    K_val = Y_val * inv(P_val);

    disp('=========================================='); %[output:81d74a50]
    disp('Ganancias calculadas (K):'); %[output:54c83fa0]
    disp(K_val); %[output:4b4330dd]

    k= [K_val(1);K_val(2);K_val(3)];


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":36.6}
%---
%[output:71d4aaf4]
%   data: {"dataType":"text","outputData":{"text":"SeDuMi 1.3.7 by AdvOL, 2005-2008 and Jos F. Sturm, 1998-2003.\nAlg = 2: xz-corrector, theta = 0.250, beta = 0.500\neqs m = 9, order n = 10, dim = 46, blocks = 3\nnnz(A) = 30 + 0, nnz(ADA) = 81, nnz(L) = 45\n it :     b*y       gap    delta  rate   t\/tP*  t\/tD*   feas cg cg  prec\n  0 :            4.41E+01 0.000\n  1 :   0.00E+00 3.68E+00 0.000 0.0835 0.9900 0.9900   1.00  1  1  1.7E+00\n  2 :   0.00E+00 3.43E-01 0.000 0.0931 0.9900 0.9900   1.00  1  1  1.6E-01\n  3 :   0.00E+00 1.23E-01 0.000 0.3595 0.9000 0.9000   1.00  1  1  5.9E-02\n  4 :   0.00E+00 4.30E-02 0.000 0.3494 0.9000 0.9000   1.00  1  1  2.3E-02\n  5 :   0.00E+00 9.29E-03 0.000 0.2158 0.9000 0.9000   1.01  1  1  8.5E-03\n  6 :   0.00E+00 2.64E-03 0.000 0.2841 0.9000 0.9000   1.04  1  1  5.1E-03\n  7 :   0.00E+00 6.01E-04 0.000 0.2278 0.9000 0.9000   1.16  1  1  3.5E-03\n  8 :   0.00E+00 2.10E-04 0.000 0.3494 0.9000 0.9000   1.89  1  1  1.0E-03\n  9 :   0.00E+00 5.85E-05 0.000 0.2784 0.9000 0.9000   3.71  1  1  2.0E-05\n 10 :   0.00E+00 1.59E-05 0.000 0.2718 0.9000 0.9000   0.98  1  1  4.3E-06\n 11 :   0.00E+00 3.25E-06 0.000 0.2045 0.9000 0.9000   0.78  1  1  3.5E-07\n 12 :   0.00E+00 1.05E-06 0.000 0.3226 0.9000 0.9000   0.50  1  1  1.5E-07\n 13 :   0.00E+00 3.23E-07 0.000 0.3076 0.9000 0.9000   0.48  1  1  6.1E-08\n 14 :   0.00E+00 6.64E-08 0.000 0.2058 0.9000 0.9000   0.81  1  1  7.8E-08\n 15 :   0.00E+00 1.27E-08 0.000 0.1921 0.9000 0.9000   1.15  1  1  1.9E-08\n 16 :   0.00E+00 1.26E-09 0.000 0.0988 0.9900 0.9900   1.04  1  1  1.8E-09\n 17 :   0.00E+00 1.20E-10 0.000 0.0951 0.9900 0.9900   1.00  1  1  1.8E-10\n\niter seconds digits       c*x               b*y\n 17      0.0   3.5  3.8866669066e-13  0.0000000000e+00\n|Ax-b| =   1.7e-11, [Ay-c]_+ =   0.0E+00, |x|=  1.1e-03, |y|=  1.6e+00\n\nDetailed timing (sec)\n   Pre          IPM          Post\n2.800E-02    1.610E-01    3.993E-03    \nMax-norms: ||b||=0, ||c|| = 1.000000e-06,\nCholesky |add|=0, |skip| = 0, ||L.L|| = 1.\n","truncated":false}}
%---
%[output:81d74a50]
%   data: {"dataType":"text","outputData":{"text":"==========================================\n","truncated":false}}
%---
%[output:54c83fa0]
%   data: {"dataType":"text","outputData":{"text":"Ganancias calculadas (K):\n","truncated":false}}
%---
%[output:4b4330dd]
%   data: {"dataType":"text","outputData":{"text":"   1.0e+06 *\n\n   -3.8187   -0.4020   -0.0024\n\n","truncated":false}}
%---

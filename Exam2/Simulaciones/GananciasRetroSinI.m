clear; clc;

A = [0 1 0;
    0 0 1;
    0 0 0];
B = [0; 0; 1];


D_mat = eye(3);      
Qx = zeros(3,3);      
Qf = eye(3);           
f0 = 2.25;             % f0 = D^2 = 2.25


P = sdpvar(3,3,'symmetric');
Y = sdpvar(1,3,'full'); 
tau2 = sdpvar(1,1);
alpha = 9;

s11 = A*P + B*Y + P*A' + Y'*B' + alpha*P + tau2*Qx;
s12 = D_mat;
s22 = -tau2*Qf;
LMI = [s11, s12; s12', s22];

cons = [LMI <= 0, P >= 0, tau2 >= 0, alpha >= f0*tau2];

sol = optimize(cons); %[output:71d4aaf4]

    P_val = double(P);
    Y_val = double(Y);
    tau2_val = double(tau2);
    alpha_val = double(alpha);
    K_val = Y_val * inv(P_val);

    disp('Ganancias (K):'); %[output:81d74a50]
    disp(K_val); %[output:54c83fa0]

    lambda_min = min(eig(P_val));
    cota = sqrt(f0 / (tau2_val * alpha_val * lambda_min));
    fprintf('Cota del error: %.4f\n', cota); %[output:4b4330dd] %[output:51490b02]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:71d4aaf4]
%   data: {"dataType":"text","outputData":{"text":"SeDuMi 1.3.7 by AdvOL, 2005-2008 and Jos F. Sturm, 1998-2003.\nAlg = 2: xz-corrector, theta = 0.250, beta = 0.500\neqs m = 10, order n = 11, dim = 47, blocks = 3\nnnz(A) = 25 + 0, nnz(ADA) = 100, nnz(L) = 55\n it :     b*y       gap    delta  rate   t\/tP*  t\/tD*   feas cg cg  prec\n  0 :            1.24E+01 0.000\n  1 :   0.00E+00 2.85E+00 0.000 0.2287 0.9000 0.9000   2.07  1  1  2.9E+00\n  2 :   0.00E+00 5.95E-01 0.000 0.2091 0.9000 0.9000   1.44  1  1  9.0E-01\n  3 :   0.00E+00 1.80E-01 0.000 0.3017 0.9000 0.9000   0.87  1  1  6.8E-01\n  4 :   0.00E+00 5.33E-02 0.000 0.2966 0.9000 0.9000   0.51  1  1  9.1E-01\n  5 :   0.00E+00 1.57E-02 0.000 0.2952 0.9000 0.9000  -0.50  1  1  6.0E-02\n  6 :   0.00E+00 6.20E-03 0.000 0.3942 0.9000 0.9000  -0.19  1  1  3.1E-02\n  7 :   0.00E+00 2.94E-04 0.000 0.0475 0.9900 0.9900   0.69  1  1  3.1E+00\n  8 :   0.00E+00 5.57E-05 0.000 0.1893 0.9000 0.9000   0.97  1  1  5.9E-01\n  9 :   0.00E+00 1.05E-05 0.000 0.1887 0.9000 0.9000   0.99  1  1  1.1E-01\n 10 :   0.00E+00 1.97E-06 0.000 0.1872 0.9000 0.9000   1.00  1  1  2.1E-02\n 11 :   0.00E+00 3.66E-07 0.000 0.1856 0.9000 0.9000   1.00  1  1  3.8E-03\n 12 :   0.00E+00 6.73E-08 0.000 0.1841 0.9000 0.9000   1.00  1  1  6.8E-04\n 13 :   0.00E+00 1.23E-08 0.000 0.1827 0.9000 0.9000   1.00  1  1  1.2E-04\n 14 :   0.00E+00 1.22E-09 0.000 0.0995 0.9900 0.9900   1.00  1  1  1.2E-05\n 15 :   0.00E+00 1.19E-10 0.000 0.0969 0.9900 0.9900   1.00  1  1  1.1E-06\n 16 :   0.00E+00 1.12E-11 0.000 0.0945 0.9900 0.9900   1.00  1  1  1.1E-07\n 17 :   0.00E+00 1.04E-12 0.000 0.0925 0.9900 0.9900   1.00  1  1  9.5E-09\n 18 :   0.00E+00 9.59E-14 0.000 0.0925 0.9900 0.9900   1.00  1  1  8.4E-10\n\niter seconds digits       c*x               b*y\n 18      0.1   3.0  3.2266389543e-13  0.0000000000e+00\n|Ax-b| =   4.3e-13, [Ay-c]_+ =   0.0E+00, |x|=  3.6e-11, |y|=  1.6e+03\n\nDetailed timing (sec)\n   Pre          IPM          Post\n7.600E-02    3.550E-01    1.399E-02    \nMax-norms: ||b||=0, ||c|| = 9,\nCholesky |add|=0, |skip| = 0, ||L.L|| = 125.747.\n","truncated":false}}
%---
%[output:81d74a50]
%   data: {"dataType":"text","outputData":{"text":"Ganancias (K):\n","truncated":false}}
%---
%[output:54c83fa0]
%   data: {"dataType":"text","outputData":{"text":"   1.0e+03 *\n\n   -2.8024   -0.6686   -0.0441\n\n","truncated":false}}
%---
%[output:4b4330dd]
%   data: {"dataType":"text","outputData":{"text":"Cota del error: 3.2160\n","truncated":false}}
%---
%[output:51490b02]
%   data: {"dataType":"textualVariable","outputData":{"name":"Vmax","value":"0.0716"}}
%---

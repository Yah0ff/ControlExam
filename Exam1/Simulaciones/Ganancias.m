clear; clc;
%[text] ## Sistema de actitud 
A0 = [0 1; 0 0];
B0 = [0; 1];
C0 = [1 0];       
n = size(A0,1);
%[text] Sistema aumentado  
A_aug = [A0, zeros(n,1);
         C0, 0];       
B_aug = [B0; 0];
T = size(A_aug,1);
%[text] Tasa de convergencia
a = 50; 

G = sdpvar(T,T);
F = sdpvar(1,T);

LMI1 = A_aug*G + G*A_aug' - (B_aug*F + F'*B_aug') + a*G;
LMI2 = G;

cons = [LMI1 <= 0, LMI2 >= 0];

solvesdp(cons); %[output:2c7a4292]

g = double(G);
f = double(F);
P = inv(g);
K_int = f * P;

fprintf('K_int = [%.4f  %.4f  %.4f]\n', K_int(1), K_int(2), K_int(3)); %[output:6ea74769]
fprintf('Eig(A_aug - B_aug*K_int):\n'); %[output:8567b0f8]
disp(eig(A_aug - B_aug*K_int)); %[output:3abc37ce]
%[text] ## Sistema de externo
a = 2; 

G = sdpvar(T,T);
F = sdpvar(1,T);

LMI1 = A_aug*G + G*A_aug' - (B_aug*F + F'*B_aug') + a*G;
LMI2 = G;

cons = [LMI1 <= 0, LMI2 >= 0];

solvesdp(cons); %[output:36ec52b7]

g = double(G);
f = double(F);
P = inv(g);
K_ext = f * P;

fprintf('K_int = [%.4f  %.4f  %.4f]\n', K_ext(1), K_ext(2), K_ext(3)); %[output:64dce7e3]
fprintf('Eig(A_aug - B_aug*K_int):\n'); %[output:48b60b9e]
disp(eig(A_aug - B_aug*K_ext)); %[output:77889abe]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:2c7a4292]
%   data: {"dataType":"text","outputData":{"text":"SeDuMi 1.3.7 by AdvOL, 2005-2008 and Jos F. Sturm, 1998-2003.\nAlg = 2: xz-corrector, theta = 0.250, beta = 0.500\neqs m = 9, order n = 7, dim = 19, blocks = 3\nnnz(A) = 21 + 0, nnz(ADA) = 81, nnz(L) = 45\n it :     b*y       gap    delta  rate   t\/tP*  t\/tD*   feas cg cg  prec\n  0 :            1.46E+03 0.000\n  1 :   0.00E+00 4.20E+01 0.000 0.0288 0.9900 0.9900   1.00  1  0  2.9E+00\n  2 :   0.00E+00 2.87E+00 0.000 0.0684 0.9900 0.9900   1.00  1  1  2.0E-01\n  3 :   0.00E+00 8.65E-01 0.000 0.3012 0.9000 0.9000   1.00  1  1  5.9E-02\n  4 :   0.00E+00 6.35E-02 0.000 0.0733 0.9900 0.9900   1.00  1  1  4.4E-03\n  5 :   0.00E+00 2.75E-03 0.000 0.0434 0.9900 0.9900   1.00  1  1  1.9E-04\n  6 :   0.00E+00 7.57E-04 0.000 0.2750 0.9000 0.9000   1.00  1  1  5.2E-05\n  7 :   0.00E+00 5.66E-05 0.000 0.0748 0.9900 0.9900   1.00  2  2  3.9E-06\n  8 :   0.00E+00 3.59E-06 0.000 0.0635 0.9900 0.9900   1.00  2  2  2.5E-07\n  9 :   0.00E+00 2.25E-07 0.000 0.0627 0.9900 0.9900   1.00  2  2  1.5E-08\n 10 :   0.00E+00 1.41E-08 0.000 0.0626 0.9900 0.9900   1.00  2  2  9.7E-10\n\niter seconds digits       c*x               b*y\n 10      0.0   Inf  0.0000000000e+00  0.0000000000e+00\n|Ax-b| =   8.2e-10, [Ay-c]_+ =   0.0E+00, |x|=  4.6e-05, |y|=  1.3e+02\n\nDetailed timing (sec)\n   Pre          IPM          Post\n7.000E-02    1.640E-01    1.501E-02    \nMax-norms: ||b||=0, ||c|| = 0,\nCholesky |add|=1, |skip| = 0, ||L.L|| = 363.803.\n","truncated":false}}
%---
%[output:6ea74769]
%   data: {"dataType":"text","outputData":{"text":"K_int = [6893.9522  104.9815  138098.9649]\n","truncated":false}}
%---
%[output:8567b0f8]
%   data: {"dataType":"text","outputData":{"text":"Eig(A_aug - B_aug*K_int):\n","truncated":false}}
%---
%[output:3abc37ce]
%   data: {"dataType":"text","outputData":{"text":" -37.6780 +56.9373i\n -37.6780 -56.9373i\n -29.6255 + 0.0000i\n\n","truncated":false}}
%---
%[output:36ec52b7]
%   data: {"dataType":"text","outputData":{"text":"SeDuMi 1.3.7 by AdvOL, 2005-2008 and Jos F. Sturm, 1998-2003.\nAlg = 2: xz-corrector, theta = 0.250, beta = 0.500\neqs m = 9, order n = 7, dim = 19, blocks = 3\nnnz(A) = 21 + 0, nnz(ADA) = 81, nnz(L) = 45\n it :     b*y       gap    delta  rate   t\/tP*  t\/tD*   feas cg cg  prec\n  0 :            7.00E+00 0.000\n  1 :   0.00E+00 1.80E+00 0.000 0.2578 0.9000 0.9000   1.00  1  0  1.5E+00\n  2 :   0.00E+00 4.28E-01 0.000 0.2372 0.9000 0.9000   1.00  1  1  3.7E-01\n  3 :   0.00E+00 8.83E-02 0.000 0.2063 0.9000 0.9000   1.00  1  1  7.6E-02\n  4 :   0.00E+00 4.44E-03 0.000 0.0503 0.9900 0.9900   1.00  1  1  3.8E-03\n  5 :   0.00E+00 1.51E-04 0.000 0.0341 0.9900 0.9900   1.00  1  1  1.3E-04\n  6 :   0.00E+00 5.13E-06 0.000 0.0338 0.9900 0.9900   1.00  1  1  4.4E-06\n  7 :   0.00E+00 1.73E-07 0.000 0.0338 0.9900 0.9900   1.00  1  1  1.5E-07\n  8 :   0.00E+00 5.86E-09 0.000 0.0338 0.9900 0.9900   1.00  1  1  5.0E-09\n  9 :   0.00E+00 1.98E-10 0.000 0.0338 0.9900 0.9900   1.00  1  1  1.7E-10\n\niter seconds digits       c*x               b*y\n  9      0.0   Inf  0.0000000000e+00  0.0000000000e+00\n|Ax-b| =   1.1e-10, [Ay-c]_+ =   0.0E+00, |x|=  8.4e-10, |y|=  5.2e+00\n\nDetailed timing (sec)\n   Pre          IPM          Post\n2.499E-02    5.300E-02    4.999E-03    \nMax-norms: ||b||=0, ||c|| = 0,\nCholesky |add|=0, |skip| = 0, ||L.L|| = 1.81859.\n","truncated":false}}
%---
%[output:64dce7e3]
%   data: {"dataType":"text","outputData":{"text":"K_int = [17.1816  5.3696  15.6623]\n","truncated":false}}
%---
%[output:48b60b9e]
%   data: {"dataType":"text","outputData":{"text":"Eig(A_aug - B_aug*K_int):\n","truncated":false}}
%---
%[output:77889abe]
%   data: {"dataType":"text","outputData":{"text":"  -2.0225 + 2.7808i\n  -2.0225 - 2.7808i\n  -1.3247 + 0.0000i\n\n","truncated":false}}
%---

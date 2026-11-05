clear; clc;

% ==========================================
% 1. Matrices aumentadas 
% ==========================================
A = [0 1 0 0;
    0 0 1 0;
    0 0 0 0;
    1 0 0 0];
B = [0; 0; 1; 0];

% ==========================================
% 2. Variables de la LMI
% ==========================================

Q = sdpvar(4,4,'symmetric');
F = sdpvar(1,4,'full'); 

% ==========================================
% 3. Parámetros de diseño
% ==========================================

alpha = 0.1;    % Tasa de decaimiento 
epsilon = 1;  % Parámetro de la LMI

% ==========================================
% 4. Construcción de la LMI
% ==========================================

s11 = A*Q + Q*A' - F'*B' - B*F + epsilon*eye(4) + alpha*Q;
s12 = eye(4);
s22 = -(1/epsilon)*eye(4);

LMI = [s11, s12; 
    s12', s22];

% ==========================================
% 5. Restricciones
% ==========================================
cons = [LMI <= 0, Q >= 0];

% ==========================================
% 6. Resolver
% ==========================================
ops = sdpsettings('solver','sedumi','verbose',1);
sol = optimize(cons, [], ops); %[output:35d52370]

% ==========================================
% 7. Recuperar las ganancias
% ==========================================

    Q_val = double(Q);
    F_val = double(F);

    P_val = inv(Q_val);
    K_val = F_val * Q_val; 

    disp('=========================================='); %[output:004619ec]
    disp('   RESULTADOS'); %[output:7868ff9e]
    disp('=========================================='); %[output:4c938d08]
    disp('Ganancias calculadas (k1, k2, k3, ki):'); %[output:578a7a70]
    disp(K_val); %[output:6cc7bf77]

    

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:35d52370]
%   data: {"dataType":"text","outputData":{"text":"SeDuMi 1.3.7 by AdvOL, 2005-2008 and Jos F. Sturm, 1998-2003.\nAlg = 2: xz-corrector, theta = 0.250, beta = 0.500\neqs m = 14, order n = 13, dim = 81, blocks = 3\nnnz(A) = 36 + 0, nnz(ADA) = 196, nnz(L) = 105\n it :     b*y       gap    delta  rate   t\/tP*  t\/tD*   feas cg cg  prec\n  0 :            2.40E+00 0.000\n  1 :   0.00E+00 5.73E-01 0.000 0.2391 0.9000 0.9000   0.59  1  1  2.1E+00\n  2 :   0.00E+00 2.06E-01 0.000 0.3593 0.9000 0.9000   0.42  1  1  9.9E-01\n  3 :   0.00E+00 4.52E-02 0.000 0.2196 0.9000 0.9000   0.93  1  1  2.1E-01\n  4 :   0.00E+00 1.69E-03 0.000 0.0375 0.9900 0.9900   1.03  1  1  7.7E-03\n  5 :   0.00E+00 7.72E-05 0.000 0.0456 0.9900 0.9900   1.00  1  1  3.5E-04\n  6 :   0.00E+00 3.49E-06 0.000 0.0452 0.9900 0.9900   1.00  1  1  1.6E-05\n  7 :   0.00E+00 1.57E-07 0.000 0.0451 0.9900 0.9900   1.00  1  1  7.2E-07\n  8 :   0.00E+00 7.07E-09 0.000 0.0450 0.9900 0.9900   1.00  1  1  3.2E-08\n  9 :   0.00E+00 3.18E-10 0.000 0.0449 0.9900 0.9900   1.00  1  1  1.5E-09\n 10 :   0.00E+00 1.42E-11 0.000 0.0448 0.9900 0.9900   1.00  1  1  6.5E-11\n\niter seconds digits       c*x               b*y\n 10      0.0   Inf -5.6938556807e-12  0.0000000000e+00\n|Ax-b| =   4.3e-11, [Ay-c]_+ =   0.0E+00, |x|=  2.5e-10, |y|=  2.9e+01\n\nDetailed timing (sec)\n   Pre          IPM          Post\n4.700E-02    1.580E-01    9.998E-03    \nMax-norms: ||b||=0, ||c|| = 2,\nCholesky |add|=0, |skip| = 0, ||L.L|| = 1.56229.\n","truncated":false}}
%---
%[output:004619ec]
%   data: {"dataType":"text","outputData":{"text":"==========================================\n","truncated":false}}
%---
%[output:7868ff9e]
%   data: {"dataType":"text","outputData":{"text":"   RESULTADOS\n","truncated":false}}
%---
%[output:4c938d08]
%   data: {"dataType":"text","outputData":{"text":"==========================================\n","truncated":false}}
%---
%[output:578a7a70]
%   data: {"dataType":"text","outputData":{"text":"Ganancias calculadas (k1, k2, k3, ki):\n","truncated":false}}
%---
%[output:6cc7bf77]
%   data: {"dataType":"text","outputData":{"text":"  -56.8272   97.1220   27.8327  -99.4097\n\n","truncated":false}}
%---

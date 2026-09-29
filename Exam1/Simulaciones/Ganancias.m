%[text]{"align":"center"} # Control con acción integral
%[text] Sistema original
A = [0 1; %[output:group:5647f970] %[output:2b68b769]
    0 0] %[output:group:5647f970] %[output:2b68b769]

B = [0 ; 1] %[output:080c3aad]

C = [1 0] %[output:65490545]

[T,t] = size(A) %[output:9d4ba03e] %[output:93d77440]
%[text] Expansión para acción integral
A = [A,   zeros(T,1); %[output:group:1695cb90] %[output:4eb649a3]
    -C,  0] %[output:group:1695cb90] %[output:4eb649a3]

B = [B ; 0] %[output:9995b09d]

C = [C 0] %[output:0116ea5e]

[T,t] = size(A) %[output:50b892c6] %[output:76bc30fd]
%[text] Variables de Yalmip
G = sdpvar(T,T);
P = sdpvar(T,T);
F = sdpvar(1,T);
Z = zeros(T,1) %[output:37f1387a]
I = 1 %[output:7a1d665c]
%[text] ## Ganancias para vx y vz
%[text] Convergencia exponencial
a=3;
%[text] Desarrollo de condiciones y solución
LMI1 = [A*G + G*A' - (B*F + F'*B') + 2*a*G      Z; %[output:group:6e34088d] %[output:9c22dd3b]
    Z'                       I] %[output:group:6e34088d] %[output:9c22dd3b]
LMI2 = G %[output:78fee7e6]

cons=[LMI1<=0,LMI2>=0] %[output:61ec93e6]
solvesdp(cons) %[output:52068798] %[output:2ae1313b]
%[text] Calculo de las gananancias
g = double(G) %[output:7e443fc8]
f = double(F) %[output:58b5db4f]

eig(g) %[output:1d71551a]

p = inv(g) %[output:4e8deb65]
eig(p) %[output:66f11c0e]

K = f*p %[output:8622af7a]
%[text] ## Ganancias para tau
a=3;

A = [0 1; %[output:group:1febb37e] %[output:70b38aa6]
    0 0] %[output:group:1febb37e] %[output:70b38aa6]

B = [0 ; 1] %[output:9044895d]

C = [1 0] %[output:62b1580b]

[T,t] = size(A) %[output:54b5cf54] %[output:9aa949d5]

G = sdpvar(T,T);
P = sdpvar(T,T);
F = sdpvar(1,T);
Z = zeros(T,1) %[output:997b6188]
I = 1 %[output:7f538ec7]
%[text] Desarrollo de condiciones y solución
LMI1 = [A*G + G*A' - (B*F + F'*B') + 2*a*G      Z; %[output:group:82611c93] %[output:27d23e7d]
    Z'                       I] %[output:group:82611c93] %[output:27d23e7d]
LMI2 = G %[output:1939180d]

cons=[LMI1<=0,LMI2>=0] %[output:063bf3e9]
solvesdp(cons) %[output:5258cdb8] %[output:7b27d462]
%[text] Calculo de las gananancias
g = double(G) %[output:72e7c3c4]
f = double(F) %[output:042e61f4]

eig(g) %[output:9bd2d3c1]

p = inv(g) %[output:75de6abc]
eig(p) %[output:7190030c]

K2 = f*p %[output:1e32de03]


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:2b68b769]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"A","rows":2,"type":"double","value":[["0","1"],["0","0"]]}}
%---
%[output:080c3aad]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"B","rows":2,"type":"double","value":[["0"],["1"]]}}
%---
%[output:65490545]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"C","rows":1,"type":"double","value":[["1","0"]]}}
%---
%[output:9d4ba03e]
%   data: {"dataType":"textualVariable","outputData":{"name":"T","value":"2"}}
%---
%[output:93d77440]
%   data: {"dataType":"textualVariable","outputData":{"name":"t","value":"2"}}
%---
%[output:4eb649a3]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"A","rows":3,"type":"double","value":[["0","1","0"],["0","0","0"],["-1","0","0"]]}}
%---
%[output:9995b09d]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"B","rows":3,"type":"double","value":[["0"],["1"],["0"]]}}
%---
%[output:0116ea5e]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"C","rows":1,"type":"double","value":[["1","0","0"]]}}
%---
%[output:50b892c6]
%   data: {"dataType":"textualVariable","outputData":{"name":"T","value":"3"}}
%---
%[output:76bc30fd]
%   data: {"dataType":"textualVariable","outputData":{"name":"t","value":"3"}}
%---
%[output:37f1387a]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"Z","rows":3,"type":"double","value":[["0"],["0"],["0"]]}}
%---
%[output:7a1d665c]
%   data: {"dataType":"textualVariable","outputData":{"name":"I","value":"1"}}
%---
%[output:9c22dd3b]
%   data: {"dataType":"text","outputData":{"text":"Linear matrix variable 4x4 (symmetric, real, 9 variables)\nCoefficient range: 1 to 6\n","truncated":false}}
%---
%[output:78fee7e6]
%   data: {"dataType":"text","outputData":{"text":"Linear matrix variable 3x3 (symmetric, real, 6 variables)\nCoefficient range: 1 to 1\n","truncated":false}}
%---
%[output:61ec93e6]
%   data: {"dataType":"text","outputData":{"text":"+++++++++++++++++++++++++++++++++++++++++++++++++++++\n|   ID|              Constraint|   Coefficient range|\n+++++++++++++++++++++++++++++++++++++++++++++++++++++\n|   #1|   Matrix inequality 4x4|              1 to 6|\n|   #2|   Matrix inequality 3x3|              1 to 1|\n+++++++++++++++++++++++++++++++++++++++++++++++++++++\n","truncated":false}}
%---
%[output:52068798]
%   data: {"dataType":"text","outputData":{"text":"SeDuMi 1.3.7 by AdvOL, 2005-2008 and Jos F. Sturm, 1998-2003.\nAlg = 2: xz-corrector, theta = 0.250, beta = 0.500\neqs m = 9, order n = 8, dim = 26, blocks = 3\nnnz(A) = 21 + 0, nnz(ADA) = 81, nnz(L) = 45\n it :     b*y       gap    delta  rate   t\/tP*  t\/tD*   feas cg cg  prec\n  0 :            1.23E+01 0.000\n  1 :   0.00E+00 2.27E+00 0.000 0.1854 0.9000 0.9000  -0.20  1  1  8.7E+00\n  2 :   0.00E+00 5.77E-01 0.000 0.2539 0.9000 0.9000  -0.86  1  1  8.7E+00\n  3 :   0.00E+00 1.10E-01 0.000 0.1905 0.9000 0.9000  -0.96  1  1  8.7E+00\n  4 :   0.00E+00 2.65E-02 0.000 0.2411 0.9000 0.9000  -0.99  1  1  8.7E+00\n  5 :   0.00E+00 5.50E-03 0.000 0.2078 0.9000 0.9000  -1.00  1  1  8.7E+00\n  6 :   0.00E+00 2.32E-05 0.000 0.0042 0.9990 0.9990  -1.00  1  1  8.7E+00\n  7 :   0.00E+00 1.49E-06 0.000 0.0641 0.9900 0.9900  -1.00  1  1  8.7E+00\n  8 :   0.00E+00 9.45E-08 0.000 0.0636 0.9900 0.9900  -1.00  1  1  8.7E+00\n  9 :   0.00E+00 5.96E-09 0.000 0.0631 0.9900 0.9900  -1.00  1  1  8.7E+00\n 10 :   0.00E+00 3.73E-10 0.000 0.0626 0.9900 0.9900  -1.00  1  1  8.7E+00\n\nDual infeasible, primal improving direction found.\niter seconds  |Ax|    [Ay]_+     |x|       |y|\n 10      0.0   2.1e-10   0.0e+00   1.0e+00   3.0e+01\n\nDetailed timing (sec)\n   Pre          IPM          Post\n1.170E-01    1.130E-01    1.800E-02    \nMax-norms: ||b||=0, ||c|| = 1,\nCholesky |add|=0, |skip| = 0, ||L.L|| = 3.94981.\n","truncated":false}}
%---
%[output:2ae1313b]
%   data: {"dataType":"textualVariable","outputData":{"header":"struct with fields:","name":"ans","value":"    yalmipversion: '20230622'\n    matlabversion: '26.2.0.3386108 (R2026b)'\n       yalmiptime: 0.5148\n       solvertime: 0.2582\n             info: 'Infeasible problem (<a href=\"yalmip.github.io\/debugginginfeasible\">learn to debug<\/a>) (SeDuMi)'\n          problem: 1\n"}}
%---
%[output:7e443fc8]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"g","rows":3,"type":"double","value":[["0.4285","-1.4628","0.1007"],["-1.4628","9.1615","-0.2332"],["0.1007","-0.2332","0.0291"]]}}
%---
%[output:58b5db4f]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"f","rows":1,"type":"double","value":[["0.3849","28.4844","0.0637"]]}}
%---
%[output:1d71551a]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"ans","rows":3,"type":"double","value":[["0.0023"],["0.2104"],["9.4064"]]}}
%---
%[output:4e8deb65]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"p","rows":3,"type":"double","value":[["46.5056","4.1889","-127.1567"],["4.1889","0.5144","-10.3565"],["-127.1567","-10.3565","390.7707"]]}}
%---
%[output:66f11c0e]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"ans","rows":3,"type":"double","value":[["0.1063"],["4.7532"],["432.9312"]]}}
%---
%[output:8622af7a]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"K","rows":1,"type":"double","value":[["129.1178","15.6043","-319.0478"]]}}
%---
%[output:70b38aa6]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"A","rows":2,"type":"double","value":[["0","1"],["0","0"]]}}
%---
%[output:9044895d]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"B","rows":2,"type":"double","value":[["0"],["1"]]}}
%---
%[output:62b1580b]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"C","rows":1,"type":"double","value":[["1","0"]]}}
%---
%[output:54b5cf54]
%   data: {"dataType":"textualVariable","outputData":{"name":"T","value":"2"}}
%---
%[output:9aa949d5]
%   data: {"dataType":"textualVariable","outputData":{"name":"t","value":"2"}}
%---
%[output:997b6188]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"Z","rows":2,"type":"double","value":[["0"],["0"]]}}
%---
%[output:7f538ec7]
%   data: {"dataType":"textualVariable","outputData":{"name":"I","value":"1"}}
%---
%[output:27d23e7d]
%   data: {"dataType":"text","outputData":{"text":"Linear matrix variable 3x3 (symmetric, real, 5 variables)\nCoefficient range: 1 to 6\n","truncated":false}}
%---
%[output:1939180d]
%   data: {"dataType":"text","outputData":{"text":"Linear matrix variable 2x2 (symmetric, real, 3 variables)\nCoefficient range: 1 to 1\n","truncated":false}}
%---
%[output:063bf3e9]
%   data: {"dataType":"text","outputData":{"text":"+++++++++++++++++++++++++++++++++++++++++++++++++++++\n|   ID|              Constraint|   Coefficient range|\n+++++++++++++++++++++++++++++++++++++++++++++++++++++\n|   #1|   Matrix inequality 3x3|              1 to 6|\n|   #2|   Matrix inequality 2x2|              1 to 1|\n+++++++++++++++++++++++++++++++++++++++++++++++++++++\n","truncated":false}}
%---
%[output:5258cdb8]
%   data: {"dataType":"text","outputData":{"text":"SeDuMi 1.3.7 by AdvOL, 2005-2008 and Jos F. Sturm, 1998-2003.\nAlg = 2: xz-corrector, theta = 0.250, beta = 0.500\neqs m = 5, order n = 6, dim = 14, blocks = 3\nnnz(A) = 10 + 0, nnz(ADA) = 25, nnz(L) = 15\n it :     b*y       gap    delta  rate   t\/tP*  t\/tD*   feas cg cg  prec\n  0 :            1.63E+01 0.000\n  1 :   0.00E+00 1.35E+00 0.000 0.0824 0.9900 0.9900  -0.20  1  1  5.8E+00\n  2 :   0.00E+00 3.72E-01 0.000 0.2762 0.9000 0.9000  -0.97  1  1  6.0E+00\n  3 :   0.00E+00 1.62E-02 0.074 0.0436 0.9900 0.9900  -0.99  1  1  7.0E+00\n  4 :   0.00E+00 1.19E-03 0.000 0.0736 0.9900 0.9900  -1.00  1  1  7.0E+00\n  5 :   0.00E+00 8.03E-05 0.000 0.0672 0.9900 0.9900  -1.00  1  1  7.0E+00\n  6 :   0.00E+00 5.36E-06 0.000 0.0667 0.9900 0.9900  -1.00  1  1  7.1E+00\n  7 :   0.00E+00 3.54E-07 0.000 0.0662 0.9900 0.9900  -1.00  1  1  7.1E+00\n  8 :   0.00E+00 2.33E-08 0.000 0.0656 0.9900 0.9900  -1.00  1  1  7.1E+00\n  9 :   0.00E+00 1.52E-09 0.000 0.0651 0.9900 0.9900  -1.00  1  1  7.1E+00\n 10 :   0.00E+00 9.80E-11 0.000 0.0646 0.9900 0.9900  -1.00  1  1  7.1E+00\n\nDual infeasible, primal improving direction found.\niter seconds  |Ax|    [Ay]_+     |x|       |y|\n 10      0.0   3.4e-11   0.0e+00   1.0e+00   1.7e+01\n\nDetailed timing (sec)\n   Pre          IPM          Post\n2.700E-02    8.100E-02    4.999E-03    \nMax-norms: ||b||=0, ||c|| = 1,\nCholesky |add|=0, |skip| = 0, ||L.L|| = 1.\n","truncated":false}}
%---
%[output:7b27d462]
%   data: {"dataType":"textualVariable","outputData":{"header":"struct with fields:","name":"ans","value":"    yalmipversion: '20230622'\n    matlabversion: '26.2.0.3386108 (R2026b)'\n       yalmiptime: 0.2208\n       solvertime: 0.1172\n             info: 'Infeasible problem (<a href=\"yalmip.github.io\/debugginginfeasible\">learn to debug<\/a>) (SeDuMi)'\n          problem: 1\n"}}
%---
%[output:72e7c3c4]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"g","rows":2,"type":"double","value":[["0.1496","-0.8249"],["-0.8249","5.0992"]]}}
%---
%[output:042e61f4]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"f","rows":1,"type":"double","value":[["0.1496","16.2974"]]}}
%---
%[output:9bd2d3c1]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"ans","rows":2,"type":"double","value":[["0.0158"],["5.2330"]]}}
%---
%[output:75de6abc]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"p","rows":2,"type":"double","value":[["61.8657","10.0084"],["10.0084","1.8152"]]}}
%---
%[output:7190030c]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"ans","rows":2,"type":"double","value":[["0.1911"],["63.4899"]]}}
%---
%[output:1e32de03]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"K2","rows":1,"type":"double","value":[["172.3671","31.0810"]]}}
%---

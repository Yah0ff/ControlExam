clear; clc;

m1_nom = 5;
m2_nom = 6;
Am = [0 1; -m2_nom -m1_nom];
Bm = [0; 1]; 

Q = sdpvar(2,2,'symmetric');
G = sdpvar(1,2,'full');  

gam = 20;   
alf = 2;     

H = Am*Q - Bm*G;
-
I_2 = eye(2);
s11 = H + H' + 2*alf*Q;
s12 = I_2;
s22 = -gam*I_2;
LMI1 = [s11, s12; s12', s22];
LMI2 = Q;

cons = [LMI1 <= 0, LMI2 >= 0, trace(Q) <= 10];

ops = sdpsettings('solver','sedumi','verbose',0);
sol = optimize(cons, [], ops);

Q_val = double(Q);
G_val = double(G);

if sol.problem == 0 && ~isempty(Q_val) %[output:group:739761b2]
    P = inv(Q_val);
    disp('Matriz P (2x2):'); %[output:7bdf52fa]
    disp(P); %[output:1d05a74e]
    disp('Valores propios de P:'); %[output:41b32929]
    disp(eig(P)); %[output:7bae7bf8]

    mt = G_val * P;
    disp('Ganancias calculadas mt (m1, m2):'); %[output:09368c1e]
    disp(mt); %[output:1007476e]

    if mt(1) > 0 && mt(2) > 0
        disp('¡Ganancias válidas (positivas)!'); %[output:3ae4d996]
        fprintf('m1 = %.4f, m2 = %.4f\n', mt(1), mt(2)); %[output:98b81a98]
    else
        disp('Ganancias no válidas, usar valores manuales (m1=5, m2=6).');
    end
else
    disp('LMI no factible. Usa m1=5, m2=6 directamente.');
end %[output:group:739761b2]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:7bdf52fa]
%   data: {"dataType":"text","outputData":{"text":"Matriz P (2x2):\n","truncated":false}}
%---
%[output:1d05a74e]
%   data: {"dataType":"text","outputData":{"text":"    5.4327    1.2466\n    1.2466    0.4454\n\n","truncated":false}}
%---
%[output:41b32929]
%   data: {"dataType":"text","outputData":{"text":"Valores propios de P:\n","truncated":false}}
%---
%[output:7bae7bf8]
%   data: {"dataType":"text","outputData":{"text":"    0.1512\n    5.7269\n\n","truncated":false}}
%---
%[output:09368c1e]
%   data: {"dataType":"text","outputData":{"text":"Ganancias calculadas mt (m1, m2):\n","truncated":false}}
%---
%[output:1007476e]
%   data: {"dataType":"text","outputData":{"text":"   18.8680    3.5272\n\n","truncated":false}}
%---
%[output:3ae4d996]
%   data: {"dataType":"text","outputData":{"text":"¡Ganancias válidas (positivas)!\n","truncated":false}}
%---
%[output:98b81a98]
%   data: {"dataType":"text","outputData":{"text":"m1 = 18.8680, m2 = 3.5272\n","truncated":false}}
%---

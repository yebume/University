function [e,w,yk] = myXLMS(M, mu, A2_k, s, d, start)
%OUTPUT: [e,w]
%M                  % szűrő együtthatók száma
%mu                 % bátorsági tényező ~(1/M)
%s                  % reprezentálni kívánt rendszer bemenete
%d                  % reprezentálni kívánt rendszer kimenete


L = length(s);      % gerj hossza
w = zeros(M, 1);    % szűrő együtthatók
x = zeros(M,1);     % forgó vektor, késleltetők értékét tartalmazza
e = zeros(L,1);     % hiba vektor
% y                 % szűrő által becsült kimenet
yk = zeros(L,1);

state_y = 0;
memory_y = 0;
z = zeros(M,1);
state_z = 0;
memory_z = 0;

e_z = zeros(L,1);
state_e = 0;
memory_e = 0;

    for k = 1:L     % k: futó IDŐváltózó
        x(1)   = s(k);                  % FIR tartalmazza
        [z(1), state_z, memory_z] = myIIR4one(A2_k, 1, state_z, memory_z, s(k));
        y      = w' * x;                % FIR tartalmazza
        [y, state_y, memory_y] = myIIR4one(A2_k, 1, state_y, memory_y, y);
        e(k)   = d(k)  - y;
        [e_z(k), state_e, memory_e] = myIIR4one(1, 1, state_e, memory_e, e(k));
        if start<=k
            w      = w  + mu*e_z(k)*z;        % módosított coef
        end                               % csak a tömb elemek kell majd
                                        % átírni, mert az fordítási időben
                                        % már kész lesz
        x(2:M) = x(1:(M-1));            % FIR tartalmazza
        z(2:M) = z(1:(M-1));
        yk(k)  = y;
    end
end


%%1. adapt szűrő outű
%%A2 kalap
%% hiba jelet megszűrt
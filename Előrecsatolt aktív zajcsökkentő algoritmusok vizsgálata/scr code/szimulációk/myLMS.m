function [e,w,yk] = myLMS(M, mu, s, d)
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

    for k = 1:L     % k: futó IDŐváltózó
        x(1)   = s(k);                  % FIR tartalmazza
        y      = w' * x;                % FIR tartalmazza
        e(k)   = d(k)  - y;
        w      = w  + mu*e(k)*x;        % módosított coef
                                        % csak a tömb elemek kell majd
                                        % átírni, mert az fordítási időben
                                        % már kész lesz
        x(2:M) = x(1:(M-1));            % FIR tartalmazza
        yk(k)  = y;
    end
end

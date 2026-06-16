%% demo6 : A [Personlized Lyapunov Fractal] demo from MvLevi : https://www.mathworks.com/matlabcentral/communitycontests/contests/5/entries/10775

C = -9:9e-3:9; 
D = -9:9e-3:9;
L = zeros(2001);
for q = 1:2001
    for j = 1:2001
        X = .5.*ones(1, 5 + 1);
        for i = 1:5
            if mod(i, 2) == 0
                X(i + 1) = X(i) - C(q)*(.5 + .3*cos(X(i)))^-1;
            else
                X(i + 1) = X(i) - D(j)*(.5 + .3*cos(X(i)))^-1;
            end
        end
        P = diff(X);
        L(q, j) = mean(log(abs(P)));
    end
end
pcolor(C, D, - L)
shading flat
axis off
clim([-3.5, 3.5])

colormap(slanCM('twilight'))
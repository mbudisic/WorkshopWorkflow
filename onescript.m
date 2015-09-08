% Example of the prototyped run.

ic = [0 1; -1 -1; -.5, .5];
A = [0,1; -5,-2];
f = @(t,x)A*x;
T = [0,5];

for k = 1:size(ic,1)

    [t,x] = ode45(f, T, ic(k,:) );
    
    plot( t, x(:,2), '-o');
    hold all;    
    
end

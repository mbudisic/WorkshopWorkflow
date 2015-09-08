function data = generate(N)
%%GENERATE  Generate data for Software Workshop.
%
% generate(N) generate N trajectories of a linear ODE.
%

%%
% Check that inputs are valid.
validateattributes(N, {'numeric'},{'integer','positive','finite'});

%%
% Specify the ODE.
SystemMatrix = [0,1; -5,-2];
VectorField = @(t,x)SystemMatrix*x;

%%
% Specify N random initial conditions
InitialConditions = rand( N, 2 ) - 0.5;

%%
% Specify time span
Timespan = [0,5];

%%
% Run the ODE N times
Trajectories = cell(1,N);
for k = 1:N
    Trajectories{k} = ode45(VectorField,Timespan, InitialConditions(k,:));
end

%%
% Store everything into the output.
data.Trajectories = Trajectories;
data.Timespan = Timespan;
data.InitialConditions = InitialConditions;
data.N = N;


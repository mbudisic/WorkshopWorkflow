function run(name)
%RUN Visualize a data run.
%
% RUN(name) If name.mat exists, load the data and visualize them.
% Otherwise, generate a data set, store it as name.mat and visualize it.
%
% See also: generate, plotall, onescript
%

% Test that the input is a nonempty string.
if nargin < 1
    error('You have to provide a name for the test run')
end
validateattributes(name,{'char'},{'vector','nonempty'});

% Form the appropriate extension.
matfile = [name '.mat'];

if ~exist(matfile, 'file')
    data = generate(5); % Generate 5 trajectories
    data.README = ['This is the dataset for an ODE run named ' name];
    save(matfile,'-struct','data') % Save data from this run.
    disp(['Saved: ' data.README]);
else
    data = load(matfile); % Load data from this run.
    disp(['Loaded: ' data.README]);
end

% Visualize data.
plotall(data);

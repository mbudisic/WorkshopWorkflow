function plotall( data )
%PLOTALL Plot all trajectories.
%
% PLOTALL(data) plot x-coordinate from the cell-array data.Trajectories
%
% See also generate, run

assert( all( isfield( data, {'Trajectories'} ) ), 'Not a valid input' );

for k = 1:data.N
    
    % Select the desired trajectory.
    Trajectory = data.Trajectories{k};
    
    % Plot the trace of the trajectory.
    plot( Trajectory.x, Trajectory.y(1,:), '-o');
    
    % Suspend overwriting of the graph
    hold all;
end

% Resume overwriting of the graph.
hold off;

% Labels
xlabel('Time');
ylabel('X-coordinate');

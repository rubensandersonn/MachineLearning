function plotDecisionBoundary2(theta, X, y, titulo)
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   a either 
%   1) Mx3 matrix, where the first column is an all-ones column for the 
%      intercept.
%   2) MxN, N>3 matrix, where the first column is all-ones

    % Plot Data
    figure;
    tmp1 = find(y==1);
    tmp0 = find(y==0);
    plot(X(tmp1,2),X(tmp1,3), '+');
    hold on
    plot(X(tmp0,2),X(tmp0,3), 'rx');
   
    % Here is the grid range
    u = linspace(-2, 1.5, 50);
    v = linspace(-2, 1.5, 50);

    z = zeros(length(u), length(v));
    % Evaluate z = theta*x over the grid
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i), v(j))*theta;
        end
    end
    z = z'; % important to transpose z before calling contour

    % Plot z = 0
    % Notice you need to specify the range [0, 0]
    contour(u, v, z, [0, 0], 'LineWidth', 2)
    title(titulo);
  hold off

end

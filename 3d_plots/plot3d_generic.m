function [z, x, y] = plot3d_generic(f, x_range, y_range)
% plot 3d functions z = f(x, y)
% Usage. e.g. plot z = x*y
% 1. define zFunction
% function [z] = zFunction(x, y)
% z = x * y;
% 2. plot it
% zf = @(x, y) zFunction(x, y);
% plot3d_generic(zf, [-10 10], [-10 10])

x_vals = linspace(x_range(1), x_range(2), 100);
y_vals = linspace(y_range(1), y_range(2), 100);

z_vals = zeros(length(y_vals), length(x_vals));

z_min = 10000000000000;
z_max = -10000000000000;
for i = 1:length(y_vals)
    for j = 1:length(x_vals)
	  z_vals(i,j) = f(x_vals(j), y_vals(i));
    if (z_vals(i,j) > z_max)
        z_max = z_vals(i,j);
    end
    if (z_vals(i,j) < z_min)
        z_min = z_vals(i,j);
    end
    end
end

% Surface plot
figure;
surf(x_vals, y_vals, z_vals)
xlabel('x'); ylabel('y');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(x_vals, y_vals, z_vals, linspace(z_min, z_max, 20), 'LineWidth', 2)
xlabel('x'); ylabel('y');
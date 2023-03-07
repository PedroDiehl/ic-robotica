% Define the magnitude and angle of the first vector
mag1 = 2;
angle_deg1 = 30;

% Define the magnitude and angle of the second vector
mag2 = 1;
angle_deg2 = 120;

% Convert the angles to radians
angle_rad1 = angle_deg1 * pi/180;
angle_rad2 = angle_deg2 * pi/180;

% Convert the vectors to rectangular coordinates
x1 = mag1 * cos(angle_rad1);
y1 = mag1 * sin(angle_rad1);
x2 = mag2 * cos(angle_rad2);
y2 = mag2 * sin(angle_rad2);

% Plot the first vector using the quiver function
quiver(0, 0, x1, y1, 'r', 'LineWidth', 2);

% Append the second vector to the first one using the hold on and quiver functions
hold on;
quiver(x1, y1, x2, y2, 'b', 'LineWidth', 2);

% Customize the plot
axis([-3 3 -3 3]); % set axis limits
grid on; % show grid lines
title(['Two Vectors with Magnitudes ', num2str(mag1), ' and ', num2str(mag2), ' and Angles ', num2str(angle_deg1), '\circ and ', num2str(angle_deg2), '\circ']);
xlabel('x');
ylabel('y');
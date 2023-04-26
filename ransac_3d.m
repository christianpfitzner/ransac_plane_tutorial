% ransac 3d plane

close all; 
clear all; 
pkg load statistics



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate noisy data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P = generate_noisy_plane(100,10); 


num = length(P(1,:)); 





best_consens_size     = 0;
best_plane_parameters = ones(4,0);
for trial=1:20

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE
    % Impement RANSAC here for the plane model
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % select 3 random points
    rnd_a = randi(num);  
    rnd_b = randi(num);
    rnd_c = randi(num);






    
    % check how many points belong to the consensus set
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    % in case the a better solution is found, save the best plane parameters
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE
% Impement Least Square
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE (Optinally)
% Impement PCA for Inliers here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot the result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1); 
scatter3(P(1,:), P(2,:), P(3,:));
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');
##xlim([-0.2; 1.2]);
##ylim([-0.2; 1.2]);
##zlim([-0.2; 3]);
axis equal; 
% hold on; 
% tx = linspace (0, 1, 10);
% ty = linspace (0, 1, 10)';

% a = best_plane_parameters(1); 
% b = best_plane_parameters(2); 
% c = best_plane_parameters(3); 
% d = best_plane_parameters(4); 

% tz = -(a.*tx + b.*ty - d) ./ c; % + 0.1;
% mesh(tx, ty, tz);




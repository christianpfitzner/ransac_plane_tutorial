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
best_plane_parameters = zeros(4,0);
for trial=1:20

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE
    % Impement RANSAC here for the plane model
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % select 3 random points
    rnd_a = randi(num);  
    rnd_b = randi(num);
    rnd_c = randi(num);

    A = P(:, rnd_a);
    C = P(:, rnd_c);
    B = P(:, rnd_b);
        
    n = cross((B - A),(C - A));
    n = n/norm(n);
    d = n(1)*A(1) + n(2)*A(2) + n(3)*A(3);

    
    % check how many points belong to the consensus set
    consensus_size = 0; 
    for i=1:num
        R    = P(:, i);
        dist = n(1)*R(1) + n(2)*R(2) + n(3)*R(3) - d;
        
        if(abs(dist) < 0.2)
        consensus_size = consensus_size + 1;
        end
        
    end
    
    % in case the a better solution is found
    if(consensus_size > best_consens_size)
        best_consens_size     = consensus_size 
        best_plane_parameters = [n; d]; 
        trial
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE
% Impement Least Square
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_11 = sum(P(1,:).^2);
a_12 = sum(P(1,:).*P(2,:));
a_13 = sum(P(1,:));

a_21 = a_12; 
a_22 = sum(P(2,:).^2);
a_23 = sum(P(2,:));

a_31 = a_13; 
a_32 = a_23; 
a_33 = length(P(1,:));

b_1 = sum(P(1,:).*P(3,:));
b_2 = sum(P(2,:).*P(3,:));
b_3 = sum(P(3,:));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE (Optinally)
% Impement PCA for Inliers here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


##mat_A = [a_11, a_12, a_13; 
##     a_21, a_22, a_23; 
##     a_31, a_32, a_33]
##     
##     
##B = [b_1; b_2; b_3]
##
##
##X = inv(A)*B
##
##
##
##
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot the result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1); 
scatter3(P(1,:), P(2,:), P(3,:));
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');
xlim([-0.2; 1.2]);
ylim([-0.2; 1.2]);
zlim([-0.2; 3]);
axis equal; 
hold on; 
tx = linspace (0, 1, 10);
ty = linspace (0, 1, 10)';

a = best_plane_parameters(1); 
b = best_plane_parameters(2); 
c = best_plane_parameters(3); 
d = best_plane_parameters(4); 

tz = -(a.*tx + b.*ty - d) ./ c; % + 0.1;
mesh(tx, ty, tz);




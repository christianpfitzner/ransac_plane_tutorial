% generate noisy plane data

function P = generate_noisy_plane(nr_plane_point, nr_noise)
  n     = [1.0; 0.0; 1.0]
  n     = n/norm(n);
  d     =  1.0;
  noise = 0.1; 
  % generate random cartesian points
  P = zeros (3, 0); 
  for i=1:nr_plane_point
    x = rand(1);
    y = rand(1);

    z = (n(1)*x + n(2)*y - d) / n(3) + noise*unifrnd(-1, 1); 
    p = [x; y; z];
    P = [P, p]; 
  end


  % add random noise
  for i=1:nr_noise
    x = rand(1);
    y = rand(1);
    z = rand(1) - d +  noise*unifrnd(-1, 1);
   
    p = [x; y; z]; 
    P = [P, p]; 
  end 

end
##### Homework 1 #####
##### Carlos Gonzalez & Aldair Desiderio #####


##### Excercise 4 #####

rvec = 1:0.01:4;  # Vector with r values

num_iterations = 500; #Can safely adjust

xmat = zeros(num_iterations, length(rvec)); # matrix that will contain x_n itr.

for i = 1:length(rvec) #iterating through the rvec using (i)
    r = rvec(i);
    x = rand(1); # Choose a random x_0 between 0 and 1

    for j = 1:num_iterations # iterating thru the rows of xmat using (j)
        x = r * cos(x);
        xmat(j, i) = x;  # Store each iteration in a separate column
    end
end

xmat = xmat(101:end, :); # Delete first 100 rows of xmat

# Plotting: for a given x value, plot all 400 iterates of x_n on top of each other

#figure;
#hold on;
#for t = 1:length(rvec)
    #plot(rvec(t) * ones((num_iterations-100), 1), xmat(:, t),
    #'.', 'MarkerSize', 2);
    # You need this multiplication to create a column (num_iterations-100) tall
    # filled with rvec(t), so that you can stack xmat(:, t)
#end
#hold off;

#xlabel('r');
#ylabel('x');

###############################################################################

##### Excercise 6 #####


f = @(r, x) r * sin(pi*x);
fprime = @(x, r) pi*r*cos(pi*x);
iterations = 1000;
rvec = 0:0.001:1;

lyapunov_exp = zeros(size(rvec));

for i = 1:length(rvec)
    r = rvec(i);
    x = rand(1);
    l_sum = 0;

    for j = 1:iterations
        x = f(r, x);
        l_sum = l_sum + log(abs(fprime(x,r)));
    end
    lyapunov_exp(i) = l_sum / iterations;
end

figure;
plot(rvec, lyapunov_exp);
xlabel('r');
ylabel('Lyapunov Exponent');



##### Homework 1 #####
##### Carlos Gonzalez & Aldair Desiderio #####

###############################################################################

#### Excercise 1-B####
xs = linspace((-pi/4), (pi/4),1000);
tang =  abs(tan(xs));

plot(abs(xs),tang-0, 'DisplayName', '|tanx-0|');
hold on
plot(abs(xs),abs(xs)-0, 'DisplayName', '|x-0|');

hold off;
legend('show');


##### Excercise 1-C ####
x = 0.9; # initial condition
iterations = 10000;
x_values = zeros(1, iterations);

# iterating thru sinx
for i = 1:iterations
    x = sin(x);
    x_values(i) = x;
end

% Plot the iterates FOR POSITIVE xs
plot(1:iterations, x_values, '.');
hold on


x = -0.9; # initial condition
x_values2 = zeros(1, iterations);

# iterating thru sinx
for i = 1:iterations
    x = sin(x);
    x_values2(i) = x;
end

% Plot the iterates FOR NEGATIVE xs
plot(1:iterations, x_values2, '.');
xlabel('Iteration');
ylabel('sin(x)');
title('Iterates of sin(x) around -1<x<1');

hold off


##### Excercise 1-D ####
x = 0.1; # initial condition
iterations = 2506;
x_values = zeros(1, iterations);

# iterating thru x^5+x
for i = 1:iterations
    x = (x^5)+x;
    x_values(i) = x;
end

% Plot the iterates FOR POSITIVE xs
plot(1:iterations, x_values, '.','DisplayName', 'X_0=0.1');
hold on

iterations = 2506;
x = -0.1; # initial condition
x_values2 = zeros(1, iterations);

# iterating thru x^5+x
for i = 1:iterations
    x =  (x^5)+x;
    x_values2(i) = x;
end

% Plot the iterates FOR NEGATIVE xs
plot(1:iterations, x_values2, '.','DisplayName', 'X_0=-0.1');
xlabel('Iteration');
ylabel('x^5+x');
title('2506 iterates of x^5+x with x_0=0.1,-0.1');

legend('show');
hold off



##########################################################################

##### Excercise 2 ####
x = 0.01; # initial condition
iterations = 5003;
x_values = zeros(1, iterations);

# iterating thru x^5+x
for i = 1:iterations
    x = (x^3)+x;
    x_values(i) = x;
end

% Plot the iterates FOR POSITIVE xs
plot(1:iterations, x_values, '.','DisplayName', 'X_0=0.1');
hold on

iterations = 5003;
x = -0.01; # initial condition
x_values2 = zeros(1, iterations);

# iterating thru x^5+x
for i = 1:iterations
    x =  (x^3)+x;
    x_values2(i) = x;
end

% Plot the iterates FOR NEGATIVE xs
plot(1:iterations, x_values2, '.','DisplayName', 'X_0=-0.1');
xlabel('Iteration');
ylabel('x^3+x');
title('5003 iterates of x^3+x with x_0=0.01,-0.01');

legend('show');
hold off


###############################################################################


##### Excercise 4 #####

# Bifurcation diagram map x_n+1=r(cos*x_n)

rvec = 1:0.01:5;  # Vector with r values

num_iterations = 1000; #Can safely adjust

xmat = zeros(num_iterations, length(rvec)); # matrix that will contain x_n itr.

for i = 1:length(rvec) #iterating through the rvec using (i)
    r = rvec(i);
    x = 0.9; # Choose a random x_0 between 0 and 1

    for j = 1:num_iterations # iterating thru the rows of xmat using (j)
        x = r * cos(x);
        xmat(j, i) = x;  # Store each iteration in a separate column
    end
end

xmat = xmat(101:end, :); # Delete first 100 rows of xmat

 #Plotting: for a given x value, plot all 400 iterates of x_n on top of each other

figure;
hold on;
for t = 1:length(rvec)
    plot(rvec(t) * ones((num_iterations-100), 1), xmat(:, t),
    '.', 'MarkerSize', 2);
     #You need this multiplication to create a column (num_iterations-100) tall
    # filled with rvec(t), so that you can stack xmat(:, t)
end
hold off;

xlabel('r');
ylabel('x');
title('Bifurcation Diagram: x_{n+1}=r(cos(x_n)), x_0=0.9');


###############################################################################

##### Excercise 6 #####

# Compute Lyapunov Exponent as a function of r for the sine map x_n+1=r(sinpix)
# for 0<x_n<1 and o<r<1

f = @(r, x) r * sin(pi*x);
fprime = @(x, r) pi*r*cos(pi*x);


iterations = 1000; # 1000 safe level, can adjust
rvec = 0:0.001:1; #r vector

lyapunov_exp = zeros(size(rvec)); # Creating empty vector for lyap_exp for
                                  # Corresponding r value

for i = 1:length(rvec) # Fist Forloop - Iterates thru rvec
    r = rvec(i);
    x = rand(1);
    l_sum = 0; # sum in lypunov exponent formula

    for j = 1:iterations
        x = f(r, x);
        l_sum = l_sum + log(abs(fprime(x,r))); # summation process
    end
    lyapunov_exp(i) = l_sum / iterations; # 1/n term in formula
end

figure;
plot(rvec, lyapunov_exp);
xlabel('r');
ylabel('Lyapunov Exponent');
title('x_{n+1}=rsin(pi*x_n)');

#############################################################################

######### Excercise 7 ########

f = @(x) mod(2*x, 1);
iterations = 50;

xvec = 0:0.5:iterations;
ini1 = zeros(1, length(xvec));
ini2 = zeros(1, length(xvec));
d = zeros(1, length(xvec));

ini1(1) = 0.1;
ini2(1) = 0.1001;

for i = 1:length(xvec)-1
    ini1(i+1) = f(ini1(i));
    ini2(i+1) = f(ini2(i));
    d(i) = abs(ini1(i) - ini2(i));
end

figure;
plot(xvec, ini1, '-', 'DisplayName', 'initial cond 1');
hold on;
plot(xvec, ini2, '-', 'DisplayName', 'initial cond 2');
plot(xvec, d, '--', 'DisplayName', 'difference');
legend('show');











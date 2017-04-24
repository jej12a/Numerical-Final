%%Final Project
%Caleb Hicks and James Johnstone
%13 May 2017

clear all; close all; clc;

%Set initial variables
dt = 1; %time step
T = 10; %duration of simulation
N = 1000; %number of initial particles
pd = makedist('Normal');    %gaussian distribution for use in particle assignment
scale1 = 1; %scaling factor for position terms
scale2 = 0.1;   %scaling factor for velocity terms (smaller to not have huge positions changes)

%Setup grid
x = 5;
y = 5;
z = 5;
grid = zeros(x,y,z);

%Particle Setup
for i = 1:N;
    p(i,1) = 1;  %mass of particle i
    p(i,2) = scale1*random(pd); %x-position
    p(i,3) = scale1*random(pd); %y-position
    p(i,4) = scale1*random(pd); %z-position
    p(i,5) = scale2*random(pd); %x-velocity
    p(i,6) = scale2*random(pd); %y-velocity
    p(i,7) = scale2*random(pd); %z-velocity
    p(i,8) = 0;  %collided?
end

%Initial Plot
figure()
scatter3(p(:,2),p(:,3),p(:,4),'k','.');
F(1) = getframe;

%Particle motion (only velocity)
for t = 1:T
    for i = 1:N
        p(i,2) = p(i,2) + p(i,5);
        p(i,3) = p(i,3) + p(i,6);
        p(i,4) = p(i,4) + p(i,7);
    end
    figure();
    scatter3(p(:,2),p(:,3),p(:,4),'k','.');
    F(t+1) = getframe;
end

%play movie
movie(F,10)
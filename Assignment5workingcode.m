%This is a matlab script to complete assignment 5. Once we have written the
%necessary code, we can figure out how to organize it so it will compile in
%Doxygen


%% Main section of the code
%after importing the data to matlab, we want to rename it 'A' so it is easy
%for the team to use

A=csvread('Assignment5Data.txt');

%%
%Part 3 written by Chloe Melnick. This is used to plot the trajectories of
%the data. The function is contained in plottraj.m and has the full code
%used to create the graphs
 
plottraj(A);

%% 
%Part 4 Written by Soumyabrata 
data_processing(A);


%% Part 5 written by Linying GAO

parameterfit(A);
[vx,vy,vz,g]=parameterfit(A);

fprintf(strcat('X component of velocity = ',num2str(vx),'\n\n'))
fprintf(strcat('Y component of velocity = ',num2str(vy),'\n\n'))
fprintf(strcat('Z component of velocity = ',num2str(vz),'\n\n'))
fprintf(strcat('Gravitational acceleration = ',num2str(g),'\n\n'))
%% Part 6
%Written by Fredrico
speed(A)

function [t, xmean, xstd] = data_processing(A,flag)
% This function calculates mean and standard deviation of a time series of
% the 3D position of a particle.
% The first input here is A which includes time and location in the following
% format: A=[t X1 Y1 Z1 X2 Y2 Z2 ... Xn Yn Zn]
% The second input 'flag' here is optional. If flag is 0, the program does 
% not plot the mean and standard deviation.
% The outputs are the separated time vector (t), mean X, Y, and Z time series (xmean)

t=A(:,1);           % Extract time vector
sizeA=size(A);      % Find the size of input matrix
N=(sizeA(2)-1)/3;   % Find the numbvber of intances the code needs to run to separate X YZ location
X=[];Y=[];Z=[];     % Assign name to the vectors

%% Seperate X Y Z time series
for ii=1:N
    X=[X A(:,3*ii-1)];
    Y=[Y A(:,3*ii)];
    Z=[Z A(:,3*ii+1)];
 
end
 %% Find mean
Xmean=mean(X,2);
Ymean=mean(Y,2);
Zmean=mean(Z,2);

%% Find standard deviation
Xstd=std(X')';
Ystd=std(Y')';
Zstd=std(Z')';

%% Put all data together
xmean=[Xmean Ymean Zmean];
xstd=[Xstd Ystd Zstd];

%% Plot the time series
if nargin==1 || flag~=0
    fig1=figure(5);plot(t,[Xmean Ymean Zmean]);xlabel('Time');ylabel('Location');legend('X','Y','Z')
    saveas(fig1,'location.bmp');
    fig2=figure(6);plot(t,[Xstd Ystd Zstd]);xlabel('Time');ylabel('Standard deviation');legend({'X','Y','Z'},'Location','southeast')
    saveas(fig2,'standard_deviation.bmp');
end




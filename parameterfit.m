function [vx,vy,vz,g]=parameterfit(A)

% This function returns initial velocity components and gravity value from the averaged position values


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

%% Fit X,Y,Z
xfit=polyfit(t,Xmean,1);    %y=kx, first value = k, second value= error
yfit=polyfit(t,Ymean,1);
zfit=polyfit(t,Zmean,2);    %y=ax^2+bx+c, 

%% Calculate desired parameter values
vx=xfit(1);
vy=yfit(1);
vz=zfit(2);     %z=vz*t-0.5*g*t^2
g=abs(zfit(1)*2);    %note that zfit(3)<>0, z components are not zero at t=0;

end



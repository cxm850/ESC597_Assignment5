function [ti,xpos,ypos] = speed(A)
ti=A(:,1);
n=length(A(:,1));
xpos=zeros(n,10);
ypos=zeros(n,10);
zpos=zeros(n,10);
for i=1:10
    xpos(:,i)=A(:,3*i-1);
    ypos(:,i)=A(:,3*i);
    zpos(:,i)=A(:,3*i+1);
end
xdisp=zeros(n-1,10);
ydisp=zeros(n-1,10);
zdisp=zeros(n-1,10);
for i=2:n
    xdisp(i-1,:)=xpos(i,:)-xpos(i-1,:);
    ydisp(i-1,:)=ypos(i,:)-ypos(i-1,:);
    zdisp(i-1,:)=zpos(i,:)-zpos(i-1,:);
end
totdisp=zeros(size(xdisp));
for i=1:n-1
    for j=1:10
        totdisp(i,j)=sqrt(xdisp(i,j)^2+ydisp(i,j)^2+zdisp(i,j)^2);
    end
end
tijmp=zeros(n-1,1);
for i=1:n-1
    tijmp(i)=ti(i+1)-ti(i);
end
spd=zeros(size(totdisp));
for i=1:n-1
    spd(i,:)=totdisp(i,:)/tijmp(i);
end
pltti=ti(2:141);
for i=1:10
    figure(7);
    hold on
    yaxis=spd(:,i);
    xaxis=pltti;
    plot(xaxis,yaxis)
end
end
%ESC597 Assignment 5 Part 3 function

function plottraj(A)
    figure(1);
hold on 
for i = 2:31
    plot(A(:,1),A(:,i))
end
xlabel('Time (sec)')
ylabel('Position')
title('Trajectories for the 10 Marbles')

figure(2);
hold on 
for i = [2,5,8,11,14,17,20,23,26,29]
    plot(A(:,1),A(:,i))
end
xlabel('Time (sec)')
ylabel('Position')
title('Trajectories for the 10 Marbles in the X-Direction')

figure(3);
hold on 
for i = [3,6,9,12,15,18,21,24,27,30]
    plot(A(:,1),A(:,i))
end
xlabel('Time (sec)')
ylabel('Position')
title('Trajectories for the 10 Marbles in the Y-Direction')

figure(4);
hold on 
for i = [4,7,10,13,16,19,22,25,28,31]
    plot(A(:,1),A(:,i))
end
xlabel('Time (sec)')
ylabel('Position')
title('Trajectories for the 10 Marbles in the Z-Direction')
hold off
end

    
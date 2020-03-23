%loads file and puts data in vectors
load length_vs_strength.mat -ascii
mat = length_vs_strength;
%Displays the mean bucking load and standard deviation for each of the
%straw lengths in our group
%puts data into vectors for simplicity
len = mat(1,:);
mean_force = (.312 + mat(2,:) * 1.62  / 9.8) / .198;
std_dev = (.312 + mat(3,:) * 1.62 /9.8) / .198;
clearvars mat;
%Puts data for our group into vectors 
len1 = len(1:3);
load1 = mean_force(1:3);
std_dev1 = std_dev(1:3);
figure(1)
errorbar(len1,load1,std_dev1,'ro')
%Gets best linear line
coeff = polyfit(len1,load1,1);
best_fit_line = coeff(1) * len1 + coeff(2);
hold on
%Plots best fit linear line
plot(len1,best_fit_line,'b')
title('Straw length vs Force of Straws')
xlabel('Straw length (cm)')
ylabel('Force of straws (N)')
xmin = min(len1) - .5; xmax = max(len1) + .5; 
ymin = 4; ymax = 15;
axis([xmin, xmax, ymin, ymax])
grid on
%Gets error and prints
len2 = len(4:6);
load2 = mean_force(4:6);
std_dev2 = std_dev(4:6);

plot(len2,load2,'k*')
legend('Raw data','Best fit line','Other group data')
%Calculates error
err = sum(abs(best_fit_line - load1)) / length(best_fit_line);
%Prints slope,intercept and error
fprintf('THE BEST FIT LINE:\nSlope: %.3f\n',coeff(1))
fprintf('Intercept: %.3f\n',coeff(2))
fprintf('Average error between best fit line and our data is: %.3f\n',err)
clearvars len1 load1 std_dev1
%New best line with our groups data:
figure(2)
%Combines data with second group
total_len = len(1:6);
total_load = mean_force(1:6);
total_std_dev = std_dev(1:6);
%Graphs points w/ vertical error bars
errorbar(total_len, total_load, total_std_dev,'go')
%Gets coefficients of new best fit line, calculates new best fit line
coeff_2 = polyfit(total_len,total_load,1);
best_fit_line = coeff_2(1) * total_len + coeff_2(2);

%Calculates average error with new best fit line
err = sum(abs(best_fit_line - total_load)) / 6;
%plots best fit line and adds label,title, and legend
hold on
plot(total_len,best_fit_line,'k')
xlabel('Straw length (cm)')
ylabel('Force of straws (N)')
title('Straw length vs Force of straws w/ other group')
legend('Combined data','New best fit line')
xmin = min(total_len) - .5; xmax = max(total_len) + .5; 
ymin = 5; ymax = 16;
axis([xmin, xmax, ymin, ymax])
%Prints new slope,intercept and average error
disp('NEW BEST FIT LINE: ')
fprintf('Slope: %.3f\n',coeff_2(1))
fprintf('Intercept: %.3f\n',coeff_2(2))
fprintf('Average error is %.3f\n',err)





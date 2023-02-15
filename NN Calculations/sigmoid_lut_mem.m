%% Generate cubic look-up table
clear; clc; close all

precision = 16;
one = 2^precision;
resolution = 1/2; % should be 1 over a power of 2
step = one * resolution;
high = ceil(one * log(2*one - 1));

% table values
xt = (0:step:high+step);
yt = round((sigmoid(xt/one) - 1/2) * one); % subtract 1/2 to make it symmetric about 0
ydt = round(exp(-xt/one)./((1 + exp(-xt/one)).^2) * one * resolution); % scale the derivative to match the x spacing

% continuous calculated values
x = 0:high+step;
y = round(sigmoid(x/one) * one);

% interpolation argument
t = mod(x,step) / resolution; % take low bits
t2 = round(t.*t / one); % t^2
t3 = round(t2.*t / one); % t^3

% LUT index
x1 = floor(x/step)+1; % take high bits
x2 = x1+1;
x2(x2>length(xt)) = length(xt); % cap max value to 1

a =  2*yt(x1) - 2*yt(x2) +   ydt(x1) + ydt(x2);
b = -3*yt(x1) + 3*yt(x2) - 2*ydt(x1) - ydt(x2);
c =                          ydt(x1);
d =    yt(x1);

calcy = round((a.*t3 + b.*t2 + c.*t) / one) + d + one/2; % add 1/2 to correct offset
error = abs(calcy - y);

figure(1)
plot(x,y, x,calcy)

figure(2)
plot(x,error)


%% calculate full range of inputs
xout = -(high+1):(high+1);

xsgn = sign(xout);
xabs = abs(xout);

% interpolation argument
t = mod(xabs,step) / resolution; % take low bits
t2 = round(t.*t / one); % t^2
t3 = round(t2.*t / one); % t^3

% LUT index
x1 = floor(xabs/step)+1; % take high bits
x2 = x1+1;
x2(x2>length(xt)) = length(xt); % cap max value to 1

a =  2*yt(x1) - 2*yt(x2) +   ydt(x1) + ydt(x2);
b = -3*yt(x1) + 3*yt(x2) - 2*ydt(x1) - ydt(x2);
c =                          ydt(x1);
d =    yt(x1);

yout = (round((a.*t3 + b.*t2 + c.*t) / one) + d) .* xsgn + one/2;

figure(3)
plot(xout,yout);

% error over the full range
y = round(sigmoid(xout/one) * one);
error = abs(yout - y);
figure(4)
plot(xout,error)


%% save mem files for LUT and testbench
hexout = dec2hex(yt, 8);
fileID = fopen('sigmoid_lut.mem','w');
fprintf(fileID, "%c%c%c%c%c%c%c%c\n", hexout');
fclose(fileID);

hexout = dec2hex(ydt, 8);
fileID = fopen('sigmoid_slope_lut.mem','w');
fprintf(fileID, "%c%c%c%c%c%c%c%c\n", hexout');
fclose(fileID);

hexout = dec2hex(xout, 8);
fileID = fopen('sigmoid_x.mem','w');
fprintf(fileID, "%c%c%c%c%c%c%c%c\n", hexout');
fclose(fileID);

hexout = dec2hex(yout, 8);
fileID = fopen('sigmoid_y_expect.mem','w');
fprintf(fileID, "%c%c%c%c%c%c%c%c\n", hexout');
fclose(fileID);
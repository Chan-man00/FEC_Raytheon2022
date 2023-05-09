%% compare linear and cubic interpolations
clear; clc; close all

x = linspace(0, 6, 1000);
y = tanh(x);

resolution = 1/8;

% sample points (look-up table)
xt = 0:resolution:(6+resolution);
yt = tanh(xt);
ydt = sech(xt).^2 * resolution;

% linear interpolation
x1 = floor(x/resolution)+1;
x2 = x1 + 1;
t = (x - xt(x1))/resolution;

liny = (1-t).*yt(x1) + t.*yt(x2);
linerr = abs(liny - y);

fprintf("linear max error: %g\n", max(linerr));

% cubic polynomial
a =  2*yt(x1) - 2*yt(x2) +   ydt(x1) + ydt(x2);
b = -3*yt(x1) + 3*yt(x2) - 2*ydt(x1) - ydt(x2);
c =                          ydt(x1);
d =    yt(x1);
poly = a.*t.^3 + b.*t.^2 + c.*t + d;
polerr = abs(poly - y);

fprintf("cubic max error: %g\n", max(polerr));

figure(1);
plot(x,y, x,liny, x,poly)

figure(2);
plot(x,polerr, x,linerr)


%% Generate cubic look-up table
clear; clc; close all

precision = 16;
one = 2^precision;
resolution = 1/4; % should be 1 over a power of 2
step = one * resolution;
high = ceil(one * atanh(1 - 0.5/one));

% table values
xt = (0:step:high+step);
yt = round(tanh(xt/one) * one);
ydt = round(sech(xt/one).^2 * one * resolution); % scale the derivative to match the x spacing

% continuous calculated values
x = 0:high+step;
y = round(tanh(x/one) * one);

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

calcy = round((a.*t3 + b.*t2 + c.*t) / one) + d;
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

yout = (round((a.*t3 + b.*t2 + c.*t) / one) + d) .* xsgn;

figure(3)
plot(xout,yout);

% error over the full range
y = round(tanh(xout/one) * one);
error = abs(yout - y);
figure(4)
plot(xout,error)

%% save mem files for LUT and testbench
hexout = dec2hex(yt, 8);
fileID = fopen('tanh_lut.mem','w');
fprintf(fileID, "%c%c%c%c%c%c%c%c\n", hexout');
fclose(fileID);

hexout = dec2hex(ydt, 8);
fileID = fopen('tanh_slope_lut.mem','w');
fprintf(fileID, "%c%c%c%c%c%c%c%c\n", hexout');
fclose(fileID);

hexout = dec2hex(xout, 8);
fileID = fopen('tanh_x.mem','w');
fprintf(fileID, "%c%c%c%c%c%c%c%c\n", hexout');
fclose(fileID);

hexout = dec2hex(yout, 8);
fileID = fopen('tanh_y_expect.mem','w');
fprintf(fileID, "%c%c%c%c%c%c%c%c\n", hexout');
fclose(fileID);
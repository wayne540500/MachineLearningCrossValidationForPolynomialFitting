% loading dataset
clc;
clear;
load problem1.mat;

% split data into -> training set and testing set
% Define the split ratio (e.g., 50% training, 50% test)
splitRatio = 0.5;  % Equal split, you can adjust as needed

% Determine the split point
splitPointX = round(splitRatio * length(x));
splitPointY = round(splitRatio * length(y));
% Split the dataset into training and test sets

% xt = vector of input scalars for training
xt = x(1:splitPointX);
% yt = vector of output scalars for training
yt = y(1:splitPointY);


% xT = vector of input scalars for testing
xT = x(splitPointX+1:end);
% yT = vector of output scalars for testing
yT = y(splitPointY+1:end);

% D = the order plus one of the polynomial being fit
errt = [];
errTT = [];

for D = 1:100
    figure(1);
    [err,model,errT] = polyregg(xt,yt,D,xT,yT);
    errt = [errt,err];
    errTT = [errTT,errT];
end
hold on

figure(2);

plot(errTT,'g');
hold on
plot(errt,'r');
xlabel('D');
ylabel('Error');



function [err,model,errT] = polyregg(x,y,D,xT,yT)

xx = zeros(length(x),D);
for i=1:D
  xx(:,i) = x.^(D-i);
end
model = pinv(xx)*y;
err   = (1/(2*length(x)))*sum((y-xx*model).^2);

if (nargin==5)
  xxT = zeros(length(xT),D);
  for i=1:D
    xxT(:,i) = xT.^(D-i);
  end
  errT  = (1/(2*length(xT)))*sum((yT-xxT*model).^2);
end

q  = (min(x):(max(x)/300):max(x))';
qq = zeros(length(q),D);
for i=1:D
  qq(:,i) = q.^(D-i);
end

clf
plot(x,y,'X');
hold on
if (nargin==5)
    plot(xT,yT,'cO');
end
plot(q,qq*model,'r')
end

trainX=double(trainX')/255;
trainY=double(trainY);
testX=double(testX')/255;
testY=double(testY);
net=fitnet(5);
x=trainX;
t=trainY;
net = train(net,x,t);
y=net(testX);
z=round(y);
counter=0;
for i=1:10000
    if z(1,i)==testY(1,i)
        counter=counter+1;
    end
end

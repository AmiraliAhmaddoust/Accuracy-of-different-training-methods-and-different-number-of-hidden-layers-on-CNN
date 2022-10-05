trainX=double(trainX')/255;
trainY=double(trainY);
testX=double(testX')/255;
testY=double(testY);
net = patternnet(3);
t=trainY+1;
t=full(ind2vec(t));
x=trainX;
net = train(net,x,t);
y=net(testX);
[a,b]=max(y);
b=b-1;
counter=0;
for i=1:10000
    if b(1,i)==testY(1,i)
        counter=counter+1;
    end
end

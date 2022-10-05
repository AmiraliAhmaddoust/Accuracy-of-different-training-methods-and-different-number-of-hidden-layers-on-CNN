trainX=double(trainX')/255;
trainY=double(trainY);
testX=double(testX')/255;
testY=double(testY);
a=round(trainX);
for i=1:60000
counter_loop=1;
for j=1:28:784
 counter_answer=0;
k=j;
for z=k:1:k+28
   
    if a(z,i)==1
 counter_answer= counter_answer+1;
    end
if z==784
    break;
end

end
array(counter_loop,i)= counter_answer;
counter_loop=counter_loop+1;
end
end
for i=1:60000
counter_loop=29 
for j=1:28
  counter_answer=0;
   for z=j:28:784
      if a(z,i)==1 
       counter_answer= counter_answer+1;
      end
     end 
    array(counter_loop,i)= counter_answer;
    counter_loop=counter_loop+1;
  end
end
net = patternnet(4);
x=array;
t=trainY+1;
t=full(ind2vec(t));
net = train(net,x,t);
a=round(testX);


for i=1:10000
counter_loop=1;
for j=1:28:784
 counter_answer=0;
k=j;
for z=k:1:k+28
   
    if a(z,i)==1
 counter_answer= counter_answer+1;
    end
if z==784
    break;
end

end
array(counter_loop,i)= counter_answer;
counter_loop=counter_loop+1;
end
end
for i=1:10000
counter_loop=29 
for j=1:28
  counter_answer=0;
   for z=j:28:784
      if a(z,i)==1 
       counter_answer= counter_answer+1;
      end
     end 
    array(counter_loop,i)= counter_answer;
    counter_loop=counter_loop+1;
  end
end
y=net(array);
[a,b]=max(y);
b=b-1;
counter=0;
for i=1:10000
    if b(1,i)==testY(1,i)
        counter=counter+1;
    end
end


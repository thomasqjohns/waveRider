%% data input- this recieves the inout from the data source. IN this case we will be using historical data from a csv. 
% i will write the code to use both csvread and xlsreae and then test which
% one is faster.

time=xlsread('Data.csv','B2:B2001');
open=xlsread('Data.csv','D2:D2001');
close=xlsread('Data.csv','F2:F2001');

closingsize=size(close,1);

%% Plot original data 

plot(time,close);


%% Do reversal amount
reversal= input('reversal amount')



%%%% This file is to plot the support and resistances in the data and then
%%%% predict the future trend based on elliot wave theory. The current
%%%% value is checked against the last support or resistance to see if it
%%%% has broken resistnace or fallen from support.






%% defining resistance --possible resitance will be held in a circular
%%buffer of previous inputs


n=3;
pivot=zeros([closingsize 1]);
x=zeros(20,1); %circular buffer
support=zeros([closingsize 1]);
resistance=zeros([closingsize 1]);

while  n <= (size(close,1)-2) 
    
if close(n) < close(n-1) && close(n)< close(n+1)
     pivot(n) = close(n);
end



    if pivot(n) > (support(n+1) + reversal) && pivot(n) > (close(n) + reversal)
        resistance(n) = pivot(n);
    end
    
    
%% Defining support 

 
    if pivot(n) < (resistance(n-1) + reversal) && pivot(n) < (close(n) + reversal)
        
        support(n) = pivot(n);
      
   
    end
    
   
    
    n = n+1;
    
    
 
end


support 
resistance


m=[closingsize 1]
subplot(1,1,1),plot(pivot);
title('pivot')
subplot(1,2,1),plot(close);
title('close')
axis auto


 


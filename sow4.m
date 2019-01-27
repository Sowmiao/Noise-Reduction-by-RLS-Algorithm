recod11=audiorecorder;
disp('Start Speaking...');
recordblocking(recod11,5);%Recording of the speech is implemented in this snippet of code
signal=getaudiodata(recod11);
recod11=audiorecorder;
figure;subplot(3,1,1);plot(signal);
sound(signal);
pause(5);
xlabel('Time');
ylabel('Signal Amplitude');
title('Pure Speech Signal');
[a,b]=size(signal);
v=rand(a,b);%Considering a uniformly distributed noise
inp=v+signal;%Input fed along with noise
subplot(3,1,2);plot(inp);
xlabel('Time');
ylabel('Signal Amplitude');
title('Speech Corrupted by noise');
sound(inp);
[c,d]=size(signal);
rh=rand(c,d);
lambda=0.98;
M=4;            %FIR Filter design
H = zeros( 1,2* M );
H = H';
ident_mat = eye( 2* M ); 
Rn = ident_mat ./ 0.01;
for z = 1 : length( rh )
r_v( 1 : z ) = flipud( v( 1 : z ) ); 
r_h( 1 : z ) = flipud( rh( 1 : z ) );     
if length( r_v ) < M 
r_v( z + 1 : M, 1 ) = 0;
r_h( z + 1 : M, 1 ) = 0;   
elseif length( r_v ) > M            %Implementation of the rls Algorithm
r_v = r_v( 1 : M );
r_h = r_h( 1 : M );
end 
r_n    = [ r_v; r_h ];
K      = ( Rn * r_n ) ./ ( lambda + (r_n' * Rn * r_n ));
e( z ) = inp( z ) - (r_n' * H);
H= H + (K * e( z ));
Rn     = ( lambda^-1 * Rn ) - ( lambda^-1 * K * r_n' * Rn );
error(z)=(e(z)-inp(z)).^2;
end
t=1:length(inp);

xlabel('Number of iterations');
ylabel('Squared Error');
title('Learning Curve');
disp(error(z));
subplot(3,1,3);plot(t,e');
xlabel('Time');
ylabel('Signal Amplitude');
title('Filtered Speech');
sound(e');

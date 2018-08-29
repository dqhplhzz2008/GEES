%OS：Windows 10 x64%
%Designed By Yushuai Zhang @ SDUST 2015/12/29-2016/1/8%
% <http://www.yushuai.me 小奥の专属领地>%
%此程序包含以下功能：1.原声音信号的代入和时域频域图像。2.加入回声信号之后的时域频域图像。%
%y为原始音频信号，z为加入回声之后的音频信号%
[y,Fs]=wavread('2015122722340821'); %读出信号，采样率和采样位数。
figure(1);%图1
sigLength=length(y);
t=(0:length(y)-1)/Fs; %计算时间轴
subplot(3,1,1);plot(t,y),xlabel('Time(s)'),ylabel('Amplitude'),title('时域关系图');%在第一个窗口画波形
grid on;
n=0:sigLength-1;
Y= fft(y,length(y)); %在sigLength这个有限区间内做快速傅立叶变换
mag=abs(Y);
f=Fs*n/sigLength;
subplot(3,1,2);plot(f,abs(Y));xlabel('Frequency(Hz)'),title('经过快速傅里叶变换之后的幅频特性');
grid on;
subplot(3,1,3);
plot(f,angle(Y)); grid on;
xlabel('频率'); ylabel('相位') ;title('相频特性');
%以下是画出三维图像，展示时域和频域的关系%
figure(2)
Nw=20; %窗函数长 window length
L=Nw/2; %窗函数每次移动的样点数
Ts=round((sigLength-Nw)/L)+1; %计算把数据y共分成多少段
nfft=512; % FFT的长度
TF=zeros(Ts,nfft); %将存放三维图谱，先清零
for i=1:Ts
    xw=y((i-1)*L+1:i*L+L); %取一段数据
    temp=fft(xw,nfft); % FFT变换
    %temp=fftshift(temp); %频谱以0频为中心
    TF(i,:)=temp; %把谱图存放在TF中 代表TF矩阵中的第i行
end
fn=(1:nfft)*Fs/nfft;
tn=(1:Ts)*Nw/2/Fs;
[T,F]=meshgrid(tn,fn);
mesh(F,T,abs(TF.')); %三维绘图
axis tight;
title('原始信号三维时频图');
ylabel('Time(s)');
xlabel('Frequency(Hz)');
grid on;
%以上是未加回声处理的信号%
%以下进行加回声处理%
% 延迟0.31秒
N=2500;%a为反射系数；N为延迟时间。
a=0.5
z=[y;zeros(N,1)]+a*[zeros(N,1);y];
audiowrite('huisheng.wav',z,Fs);%我们将回声信号保存为huisheng.wav
%回声信号图像%
figure(3);
xsigLength=length(z);
tx=(0:length(z)-1)/Fs; %计算时间轴
subplot(3,1,1);plot(tx,z),xlabel('Time(s)'),ylabel('Amplitude'),title('时域关系图');%在第一个窗口画波形
grid on;
n=0:xsigLength-1;
Z= fft(z,length(z)); %在sigLength这个有限区间内做快速傅立叶变换
mag=abs(Z);
fx=Fs*n/xsigLength;
subplot(3,1,2);plot(fx,abs(Z));xlabel('Frequency(Hz)'),title('经过快速傅里叶变换之后的幅频特性');
grid on;
subplot(3,1,3);
plot(fx,angle(Z)); grid on;
xlabel('频率'); ylabel('相位') ;title('相频特性');
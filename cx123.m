%OS：Windows 10 x64%
%Designed By Yushuai Zhang @ SDUST 2015/12/29-2016/1/8%
% <http://www.yushuai.me 小奥の专属领地>%
%此程序包含以下功能：1.画出时域频域图像%
[y Fs]=wavread('huifuxinhao');
%接下来画时域图像
sigLength=length(y);
t=(0:length(y)-1)/Fs; %计算时间轴
subplot(3,1,1);plot(t,y);xlabel('Time(s)'),ylabel('Amplitude'),title('时域图像');%在第一个窗口画波形
grid on;
n=0:sigLength-1;
Y= fft(y,length(y)); %在sigLength这个有限区间内做快速傅立叶变换
f=Fs*n/sigLength;
subplot(3,1,2);plot(f,abs(Y));
xlabel('Frequency(Hz)'),title('幅频特性');
grid on;
subplot(3,1,3);
plot(f,angle(Y)); grid on;
xlabel('Frequency(Hz)'); ylabel('相位') ;title('相频特性');

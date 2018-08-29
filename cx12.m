%OS��Windows 10 x64%
%Designed By Yushuai Zhang @ SDUST 2015/12/29-2016/1/8%
% <http://www.yushuai.me С�¤�ר�����>%
%�˳���������¹��ܣ�1.ԭ�����źŵĴ����ʱ��Ƶ��ͼ��2.��������ź�֮���ʱ��Ƶ��ͼ��%
%yΪԭʼ��Ƶ�źţ�zΪ�������֮�����Ƶ�ź�%
[y,Fs]=wavread('2015122722340821'); %�����źţ������ʺͲ���λ����
figure(1);%ͼ1
sigLength=length(y);
t=(0:length(y)-1)/Fs; %����ʱ����
subplot(3,1,1);plot(t,y),xlabel('Time(s)'),ylabel('Amplitude'),title('ʱ���ϵͼ');%�ڵ�һ�����ڻ�����
grid on;
n=0:sigLength-1;
Y= fft(y,length(y)); %��sigLength������������������ٸ���Ҷ�任
mag=abs(Y);
f=Fs*n/sigLength;
subplot(3,1,2);plot(f,abs(Y));xlabel('Frequency(Hz)'),title('�������ٸ���Ҷ�任֮��ķ�Ƶ����');
grid on;
subplot(3,1,3);
plot(f,angle(Y)); grid on;
xlabel('Ƶ��'); ylabel('��λ') ;title('��Ƶ����');
%�����ǻ�����άͼ��չʾʱ���Ƶ��Ĺ�ϵ%
figure(2)
Nw=20; %�������� window length
L=Nw/2; %������ÿ���ƶ���������
Ts=round((sigLength-Nw)/L)+1; %���������y���ֳɶ��ٶ�
nfft=512; % FFT�ĳ���
TF=zeros(Ts,nfft); %�������άͼ�ף�������
for i=1:Ts
    xw=y((i-1)*L+1:i*L+L); %ȡһ������
    temp=fft(xw,nfft); % FFT�任
    %temp=fftshift(temp); %Ƶ����0ƵΪ����
    TF(i,:)=temp; %����ͼ�����TF�� ����TF�����еĵ�i��
end
fn=(1:nfft)*Fs/nfft;
tn=(1:Ts)*Nw/2/Fs;
[T,F]=meshgrid(tn,fn);
mesh(F,T,abs(TF.')); %��ά��ͼ
axis tight;
title('ԭʼ�ź���άʱƵͼ');
ylabel('Time(s)');
xlabel('Frequency(Hz)');
grid on;
%������δ�ӻ���������ź�%
%���½��мӻ�������%
% �ӳ�0.31��
N=2500;%aΪ����ϵ����NΪ�ӳ�ʱ�䡣
a=0.5
z=[y;zeros(N,1)]+a*[zeros(N,1);y];
audiowrite('huisheng.wav',z,Fs);%���ǽ������źű���Ϊhuisheng.wav
%�����ź�ͼ��%
figure(3);
xsigLength=length(z);
tx=(0:length(z)-1)/Fs; %����ʱ����
subplot(3,1,1);plot(tx,z),xlabel('Time(s)'),ylabel('Amplitude'),title('ʱ���ϵͼ');%�ڵ�һ�����ڻ�����
grid on;
n=0:xsigLength-1;
Z= fft(z,length(z)); %��sigLength������������������ٸ���Ҷ�任
mag=abs(Z);
fx=Fs*n/xsigLength;
subplot(3,1,2);plot(fx,abs(Z));xlabel('Frequency(Hz)'),title('�������ٸ���Ҷ�任֮��ķ�Ƶ����');
grid on;
subplot(3,1,3);
plot(fx,angle(Z)); grid on;
xlabel('Ƶ��'); ylabel('��λ') ;title('��Ƶ����');
%OS��Windows 10 x64%
%Designed By Yushuai Zhang @ SDUST 2015/12/29-2016/1/8%
% <http://www.yushuai.me С�¤�ר�����>%
%�˳���������¹��ܣ�1.����ʱ��Ƶ��ͼ��%
[y Fs]=wavread('huifuxinhao');
%��������ʱ��ͼ��
sigLength=length(y);
t=(0:length(y)-1)/Fs; %����ʱ����
subplot(3,1,1);plot(t,y);xlabel('Time(s)'),ylabel('Amplitude'),title('ʱ��ͼ��');%�ڵ�һ�����ڻ�����
grid on;
n=0:sigLength-1;
Y= fft(y,length(y)); %��sigLength������������������ٸ���Ҷ�任
f=Fs*n/sigLength;
subplot(3,1,2);plot(f,abs(Y));
xlabel('Frequency(Hz)'),title('��Ƶ����');
grid on;
subplot(3,1,3);
plot(f,angle(Y)); grid on;
xlabel('Frequency(Hz)'); ylabel('��λ') ;title('��Ƶ����');

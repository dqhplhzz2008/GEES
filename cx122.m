%OS��Windows 10 x64%
%Designed By Yushuai Zhang @ SDUST 2015/12/29-2016/1/8%
% <http://www.yushuai.me С�¤�ר�����>%
%�˳���������¹��ܣ�1.�������⡣2.��a��3.��ԭ�ź�%
%yΪԭʼ��Ƶ�źţ�zΪ�������֮�����Ƶ�ź�%
%���ڻ����Ѿ������ϣ���ʼ��ⷴ����ľ���%
[z Fs]=wavread('huisheng.wav')
r=xcorr(z);
figure(1);
plot(r);grid on;title('z������غ���');
[u,v]=max(r);
r1=r;
r1(v-100:v+100,1)=0;
[u1,v1]=max(r1);
N1=v-v1;%�˴���N1��Ϊ��֮ǰ���õĵ�N
%��������ʼ������
yt=N1/Fs;%�����ʱ
sv=340;
juli=sv*yt/2;
for k=1:11
    t(k)=(-1)^k*z(2500*(k-1)+1,1);
end
a1=roots(t);
for k=1:11
    t(k)=(-1)^k*z(2500*(k-1)+2,1);
end
a2=roots(t);
%��������ʼ��ԭ�����ź�%
a=[1,zeros(1,2499),0.5];
b=[1];
xhf=filter(b,a,z);
wavwrite(xhf,'huifuxinhao')


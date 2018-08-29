%OS：Windows 10 x64%
%Designed By Yushuai Zhang @ SDUST 2015/12/29-2016/1/8%
% <http://www.yushuai.me 小奥の专属领地>%
%此程序包含以下功能：1.距离的求解。2.求a。3.还原信号%
%y为原始音频信号，z为加入回声之后的音频信号%
%现在回声已经添加完毕，开始求解反射物的距离%
[z Fs]=wavread('huisheng.wav')
r=xcorr(z);
figure(1);
plot(r);grid on;title('z的自相关函数');
[u,v]=max(r);
r1=r;
r1(v-100:v+100,1)=0;
[u1,v1]=max(r1);
N1=v-v1;%此处的N1即为所之前设置的的N
%接下来开始求解距离
yt=N1/Fs;%求出延时
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
%接下来开始还原声音信号%
a=[1,zeros(1,2499),0.5];
b=[1];
xhf=filter(b,a,z);
wavwrite(xhf,'huifuxinhao')


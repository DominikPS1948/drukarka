
if ~exist('s1')
s1=serial('COM4');
fopen(s1);
end

t=0;
x1=0;
y1=0;
z1=0;
r=21.5;
x2=0;
y2=16.5;
z2=0;

x3=10;
y3=8;
z3=0;


xc=5;
 yc=15;
 zc=15;
 
 z1=zc+sqrt(r^2-(x1-xc)^2-(y1-yc)^2);
z2=zc+sqrt(r^2-(x2-xc)^2-(y2-yc)^2);
z3=zc+sqrt(r^2-(x3-xc)^2-(y3-yc)^2);

 %kolumny
col1=line([x1 x1], [y1 y1], [0 60]);
col2=line([x2 x2], [y2 y2], [0 60]);
col3=line([x3 x3], [y3 y3], [0 60]);
%ramiona
arm1=line([x1 xc], [y1 yc], [z1 zc]);
arm2=line([x2 xc], [y2 yc], [z2 zc]);
arm3=line([x3 xc], [y3 yc], [z3 zc]);
% z01=0;
 
clear z01 z02 z03;
view(-67,6)
krok=1;
for t=0:0.1:20
  xc = 5+sin(t);
    yc = 8+cos(t);
 zc=15;
  z1=zc+sqrt(r^2-(x1-xc)^2-(y1-yc)^2);
z2=zc+sqrt(r^2-(x2-xc)^2-(y2-yc)^2);
z3=zc+sqrt(r^2-(x3-xc)^2-(y3-yc)^2);

if exist('z01')
krok1=z1-z01;
krok2=z2-z02;
krok3=z3-z03;
end

    set(arm1,'XData',[x1 xc],'YData',[y1 yc],'ZData',[z1 zc]);
    set(arm2,'XData',[x2 xc],'YData',[y2 yc],'ZData',[z2 zc]);
    set(arm3,'XData',[x3 xc],'YData',[y3 yc],'ZData',[z3 zc]);
         
   
  
   try 
    krok1=z01-z1;
    krok2=z02-z2;
    krok3=z03-z3;
    tekst=['x ' num2str(round(krok1*2600)) ' y ' num2str(round(krok2*2600)) ' z ' num2str(round(krok3*2600))]
    fprintf(s1, tekst);
    
    while (s1.BytesAvailable==0)
    end
    while (s1.BytesAvailable>0)
        fscanf(s1);
    end
    
   catch err
        
   end
 z01=z1;
   z02=z2;
   z03=z3;
end



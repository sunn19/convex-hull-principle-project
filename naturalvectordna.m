function [result]=naturalvectordna(sequence)
 for k = 1: length(sequence)
        if strcmp(sequence(k),'A')||strcmp(sequence(k),'a');       
            vector(k)=1;
            k=k+1;
        elseif strcmp(sequence(k),'C')||strcmp(sequence(k),'c');
            vector(k)=2;
            k=k+1;
        elseif strcmp(sequence(k),'G')||strcmp(sequence(k),'g');
            vector(k)=3;
            k=k+1;
        elseif strcmp(sequence(k),'U'||strcmp(sequence(k),'u'));
            vector(k)=4;
            k=k+1;
        elseif strcmp(sequence(k),'T')||strcmp(sequence(k),'t');
            vector(k)=4;
            k=k+1;
        elseif strcmp(sequence(k),'N')||strcmp(sequence(k),'n');
            vector(k)=5;
            k=k+1;
        end
 end
    
    nA=0;TA=0;nC=0;TC=0;nG=0;TG=0;nT=0;TT=0;
    tA=[];tC=[];tG=[];tT=[];
    a=1;c=1;g=1;u=1;
    nn=0;DA=0;DC=0;DG=0;DT=0;
 
    for x=1:length(vector) 
       if vector(x)==1;%A
        nA=nA+1;
        TA=TA+(x);
        tA(a)=x; 
        a=a+1;
       elseif vector(x)==2;%C
        nC=nC+1;
         TC=TC+(x);
        tC(c)=x;
        c=c+1; 
       elseif vector(x)==3;%G
        nG=nG+1;
        TG=TG+(x);
        tG(g)=x; % tg%
        g=g+1;
       elseif vector(x)==4;%U or T
        nT=nT+1;
        TT=TT+(x);
        tT(u)=x; % tg%
        u=u+1;
        elseif vector(x)==5;%N
        nA=nA+0.25;
        nC=nC+0.25;
        nG=nG+0.25;
        nT=nT+0.25;
        TA=TA+0.25*x;
        TC=TC+0.25*x;
        TG=TG+0.25*x;
        TT=TT+0.25*x;
        tA(a)=0.25*x;
        tC(c)=0.25*x;
        tG(g)=0.25*x;
        tT(u)=0.25*x;
        a=a+1;
        c=c+1;
        g=g+1;u=u+1;
       end
    end
    
    uA=TA/nA;
    uC=TC/nC;
    uG=TG/nG;
    uT=TT/nT;
    
    
    nn=length(vector);
    DA=sum((tA-uA).^2)/(nA*nn);
    DC=sum((tC-uC).^2)/(nC*nn);
    DG=sum((tG-uG).^2)/(nG*nn);
    DT=sum((tT-uT).^2)/(nT*nn);
   
    
      
   result=[nA,nC,nG,nT,uA,uC,uG,uT, DA,DC,DG,DT];
  
  
  
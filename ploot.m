function ploot(t,s,P,a)
global Xmin Xmax Ymin Ymax
global Smin Smax I P0 K

Pex=P0(s);

figure(1);
clf;
axis =[Xmin,Xmax,Ymin,Ymax];

h=(Smax-Smin)/(I+1);
s1=Smin+(1:I)'*h;

sgraph  =[Smin;s1;Smax];
Pgraph  =[P0(t);P;  0];
Pexgraph=[P0(t);Pex;0];

if (t>5)
    if (t<K)
        t=t/2+K;
    else
        t=K-t/2;
    end
end

if (Pgraph~=Pexgraph)
    line1=plot(sgraph,Pexgraph,'blue.-','Linewidth',2);
else
    if (a==1)
        line1=plot(sgraph,Pexgraph,'blue.-','Linewidth',2); % Payoff function
        hold on;
        line2=plot(sgraph,Pgraph,'black.-','Linewidth',2); 
        legend([line2],'Black-Scholes','Scheme');
        titre=strcat('Numerical solution for g-hat. t=',num2str(t)); title(titre);
        legend(line2,{'$\hat{g}$'},'Interpreter','latex');
    elseif (a==2)
        line1=plot(sgraph,Pexgraph,'blue.-','Linewidth',2); % Payoff function
        hold on;
        line2=plot(sgraph,Pgraph,'black.-','Linewidth',2); 
        legend([line2,line1],'Black-Scholes','Scheme');
    elseif (a==3)
        line1=plot(sgraph,Pexgraph,'blue.-','Linewidth',2); % Payoff function
        hold on;
        line2=plot(sgraph,Pgraph,'black.-','Linewidth',2); 
        legend([line1,line2],'Black-Scholes','Scheme');
    end
end



xlabel('s');
ylabel('price');
grid;
end


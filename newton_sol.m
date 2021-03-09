function [x,k,err]=newton(B,b,Bh,bh,x0,eps,kmax)
%- Methode de Newton pour resoudre min(Bx-b,Bhx-bh)=0;

k=0;
x=x0;
err=eps+1;
while( k<kmax & err>eps )
    
    k=k+1;
    
    xold=x;
    
    %- Definition de F(x) et de F'(x):
    F=min(B*x-b,Bh*x-bh);
    Fp=Bh;
    i=find(B*x-b<=Bh*x-bh); Fp(i,:)=B(i,:);

    %- Definition nouvel x
    x=x-inv(Fp)*F;
    
    %- Estimateur pour convergence
    err=norm(x-xold,'inf');
end
end


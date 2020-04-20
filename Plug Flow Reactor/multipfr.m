function dx = multipfr(t,x)
global n nc nr u mu  p delx

dx = zeros(n*nc,1);
R  = zeros(nc,n);

C=reshape(x, n, nc)';

%---------------
r = zeros(nr,n);

r(1,:)= p(1)*C(1,:).*C(2,:).^2;
r(2,:)= p(2)*C(1,:).*C(4,:);
r(3,:)= p(3)*C(2,:).*C(3,:).^2;
%--------------------------------------

R = mu*r; %R_ji

% dx(1:n:nc*n)    = -p(5)*(C(1:nc,1)-u(1))/delx+R(1:nc,1);
% dx(1:n:nc*n)    = -p(5)*(C(1:nc,1)-u(1))/delx+R(1:nc,1);

for i =1:n
    for j =1:nc
        if i==1
            dx(i+n*(j-1))= -p(4)*(C(j,i)-u(j))/delx+R(j,i);
        else
            dx(i+n*(j-1))= -p(4)*(C(j,i)-C(j,i-1))/delx+R(j,i);
        end 
    end
end

% for i =1:n
%     for j=1:nc
%         if i == 1
%             dx(j+nc*(i-1))=-p(5)*(C(j,i)-u(j))/delx; %+R(j,i);
% %             dx(i+nc*(j-1))=-p(5)*(C(j,i)-u(j))/delx; %+R(j,i);
% 
%             if j==2
%                 a=u(j)
%                 b=i+nc*(j-1)
%             end
%         else
%             dx(i+nc*(j-1))=-p(5)*(C(j,i)-C(j,i-1))/delx;%+R(j,i);
%              if j==2
%                 a=u(j)
%                 i+nc*(j-1)
%             end
%         end
%     end
% end


% for i =1:n
%     if i == 1
%         dx(1)    = -p(5)*(C(1,i)-u(1))/delx+R(1,i);
%         dx(n+1)  = -p(5)*(C(2,i)-u(2))/delx+R(2,i);
%         dx(2*n+1)= -p(5)*(C(3,i)-u(3))/delx+R(3,i);
%         dx(3*n+1)= -p(5)*(C(4,i)-u(4))/delx+R(4,i);
%         dx(4*n+1)= -p(5)*(C(5,i)-u(5))/delx+R(5,i);
%         dx(5*n+1)= -p(5)*(C(6,i)-u(6))/delx+R(6,i);
%     else
%         dx(i)    = -p(5)*(C(1,i)-C(1,i-1))/delx+R(1,i);
%         dx(n+i)  = -p(5)*(C(2,i)-C(2,i-1))/delx+R(2,i);
%         dx(2*n+i)= -p(5)*(C(3,i)-C(3,i-1))/delx+R(3,i);
%         dx(3*n+i)= -p(5)*(C(4,i)-C(4,i-1))/delx+R(4,i);
%         dx(4*n+i)= -p(5)*(C(5,i)-C(5,i-1))/delx+R(5,i);
%         dx(5*n+i)= -p(5)*(C(6,i)-C(6,i-1))/delx+R(6,i);
%     end
% end
% 
% 




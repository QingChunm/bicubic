function A=sw(w1,a)
% a 越大，曲线越陡，
w=abs(w1);
if w<1&&w>=0
  A=(a*3)*w.^3-(a*5)*w.^2+1;
else if w>=1&&w<2
  A=-a*w.^3+5*a*w.^2-(8*a).*w+4*a;
else
  A=0;
    end
end
end
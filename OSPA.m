function OSPA(p,t,s,m,X,Y)
X
Y
t.target_no.truth
for i=1:1:t.target_no(1).leg(1).duration
 
        
       OsA(i) =  sqrt( (t.target_no.truth(i,2)-X(i))^2 + (t.target_no.truth(i,4)-Y(i))^2)/m;
        
  
end

savefile = 'ospa.mat';
save(savefile, 'OsA');

size(OsA)
disp('OSPA')
sum(OsA)

t_d = 1:1:1600;

size(t_d)

figure(7)
plot(t_d,OsA,'--r','LineWidth',1,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'MarkerSize',1)
xlabel('Time (sec)');
ylabel('OSPA (m)');

end


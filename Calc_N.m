%compute the squared unsaturated and saturated buoyancy frequencies

function [Nu,Ns] = Calc_N(basic_theta_e,basic_qt,qvs_p,m,g,th00,Rvd,Lv,cp,dz)

Nu=zeros(1,m);
Ns=zeros(1,m);

for i=1:m
    if(i==1)
        dtheta_e=basic_theta_e(i+1)-basic_theta_e(i);
        dqt=basic_qt(i+1)-basic_qt(i);
        dqvs_p=qvs_p(i+1)-qvs_p(i);
        Nu(i)=(g/dz)*((dtheta_e/th00)+(Rvd-(Lv/(cp*th00)))*dqt);
        Ns(i)=(g/dz)*((dtheta_e/th00)-(Rvd-(Lv/(cp*th00))+1)*dqvs_p-dqt);
    elseif(i==m)
        dtheta_e=basic_theta_e(i)-basic_theta_e(i-1);
        dqt=basic_qt(i)-basic_qt(i-1);
        dqvs_p=qvs_p(i)-qvs_p(i-1);
        Nu(i)=(g/dz)*((dtheta_e/th00)+(Rvd-(Lv/(cp*th00)))*dqt);
        Ns(i)=(g/dz)*((dtheta_e/th00)-(Rvd-(Lv/(cp*th00))+1)*dqvs_p-dqt);
    else
        dtheta_e=basic_theta_e(i+1)-basic_theta_e(i-1);
        dqt=basic_qt(i+1)-basic_qt(i-1);
        dqvs_p=qvs_p(i+1)-qvs_p(i-1);
        Nu(i)=(g/(2*dz))*((dtheta_e/th00)+(Rvd-(Lv/(cp*th00)))*dqt);
        Ns(i)=(g/(2*dz))*((dtheta_e/th00)-(Rvd-(Lv/(cp*th00))+1)*dqvs_p-dqt);
    end

end

if(Nu(1)==0)
    Nu(1)=Nu(2);
end

end
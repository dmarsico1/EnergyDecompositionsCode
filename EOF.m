clear
clf
cla

vec_of_times=zeros(1,20);
%loop through and get times 
for r=1:20
    filename=strcat(pwd,'/rico',num2str(r),'.nc');
    ncid=netcdf.open(filename,'nc_nowrite');
    vec_of_times(r)=length(netcdf.getVar(ncid,netcdf.inqVarID(ncid,'time')));
end
NT=min(vec_of_times);

for r=1:20
filename=strcat(pwd,'/rico',num2str(r),'.nc');
ncid=netcdf.open(filename,'nc_nowrite');

time=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'time'));
xt=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'xt'));
xm=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'xm'));
zt=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'zt'));
zm=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'zm'));

u=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'u'),'double');
w=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'w'),'double');
tl=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'t'),'double'); %remember that tl is actually potential temperature
p=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'p'),'double');
qt=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'q'),'double');
ql=netcdf.getVar(ncid,netcdf.inqVarID(ncid,'l'),'double');
qv=qt-ql;


th00=299.8; %this is th00 in grid.f90, or else it is specified in the NAMELIST.
p00=1e5; %this is p00 in defs.f90
Lv=2.5e6; %this is alvl in defs.f90
Rd=287.04; %this is Rm in defs.f90
Rv=461.5; %this is R in defs.f90
cp=1005; %this is cp in defs.f90
g=9.8;
Rvd=(Rv/Rd)-1;
Nz=length(zt);
[d1,d2,d3,d4]=size(qt);

    if(r==1)
        X1=zeros(d1*d2,NT);
        X2=zeros(d1*d2,NT);
        X3=zeros(d1*d2,NT);
        X1_C=zeros(d1*d2,d1*d2);
        X2_C=zeros(d1*d2,d1*d2);
        X3_C=zeros(d1*d2,d1*d2);
    end

%Compute tilde variables
p_tilde=xt_average(p,d1,d2,d4,2);
theta_tilde=xt_average(tl,d1,d2,d4,2);
qt_tilde=xt_average(qt,d1,d2,d4,2);

%calculate T_tilde
T_tilde=(theta_tilde).*((p_tilde/p00).^(Rd/cp));

%calculate qvs
qvs=zeros(Nz,1);

    for i=1:Nz
        qvs(i)=calc_qvs(T_tilde(i),p_tilde(i));
    end

basic_qvs=xt_average(qt,d1,d2,d4,2);

theta_e_tilde=theta_tilde+(Lv/cp)*qt_tilde;

qt_p=squeeze(qt-xt_average(qt,d1,d2,d4,1));

qvs_p=qvs-basic_qvs;

theta_p=squeeze(tl-xt_average(tl,d1,d2,d4,1));

[Nu,Ns]=Calc_N(theta_e_tilde,qt_tilde,qvs_p,Nz,g,th00,Rvd,Lv,cp,zt(2)-zt(1));

%subtract off the background u
u=u-xt_average(u,d1,d2,d4,1);

%Interpolate to get cell centered velocities
u=squeeze(UInt(u,d1,d2,d3,d4));
w=squeeze(WInt(w,d1,d2,d3,d4));


thetae_p=zeros(d1,d2,d4);

    for i=1:d4
        for j=1:d1
            for k=1:d2
                if(qt_p(j,k,i)<qvs_p(j))
                    thetae_p(j,k,i)=theta_p(j,k,i)+(Lv/cp)*qt_p(j,k,i);
                else
                    thetae_p(j,k,i)=theta_p(j,k,i)+(Lv/cp)*qvs_p(j);
                end
            end
        end
    end
    thetae_p=theta_p+(Lv/cp)*(qv_p);
    

bu=zeros(d1,d2,d4);
bs=zeros(d1,d2,d4);
M=zeros(d1,d2,d4);

B=zeros(d1,d2,d4);
M_hu=zeros(d1,d2,d4);

Nu_before=Nu;
Ns_before=Ns;
z=find(Nu>10^-4,1);
Nu(1:z-1)=Nu(z);
Ns=(1/10)*Nu;


for i=1:d4
    for j=1:d1
        for k=1:d2
            bu(j,k,i)=g*((1/th00)*(thetae_p(j,k,i)+(Rvd-(Lv/(cp*th00)))*qt_p(j,k,i)));
            bs(j,k,i)=g*((1/th00)*(thetae_p(j,k,i)+(Rvd-(Lv/(cp*th00))+1)*qvs_p(j)-qt_p(j,k,i)));
         end
    end
end
 
bu_p=(bu-repmat((1/d2)*sum(bu,2),1,d2,1));
bs_p=(bs-repmat((1/d2)*sum(bs,2),1,d2,1));

for i=1:d4
    for j=1:d1
        for k=1:d2
            M(j,k,i)=(bu(j,k,i)/Nu(j))-(bs(j,k,i)/Ns(j));
            if(ql(j,k,1,i)>0)
                B(j,k,i)=(1/(sqrt(Ns(j))))*bs(j,k,i);
            else
                B(j,k,i)=(1/(sqrt(Nu(j))))*bu(j,k,i);
                M_hu(j,k,i)=sqrt(Nu(j)*Ns(j)/(Nu(j)-Ns(j)))*M(j,k,i);
            end
        end
    end
end

B=(B-repmat((1/d2)*sum(B,2),1,d2,1));

%calculate covariance matrices

for i=1:NT
    X1(:,i)=reshape(B(:,:,i)',[d1*d2,1]);
end
X1_C=X1_C+X1*X1';

for i=1:NT
       X2(:,i)=reshape(bu_p(:,:,i)',[d1*d2,1]);
end
X2_C=X2_C+X2*X2';

for i=1:NT
    X3(:,i)=reshape(bs_p(:,:,i)',[d1*d2,1]);
end
X3_C=X3_C+X3*X3';


end

%compute eigenvalues and eigenvectors of covariance matrices

[V1,D1]=eigs((1/NT)*X1_C,NT);
[V2,D2]=eigs((1/NT)*X2_C,NT);
[V3,D3]=eigs((1/NT)*X3_C,NT);



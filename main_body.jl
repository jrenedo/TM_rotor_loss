
# Define geometry:

mu_0=4*pi*10.0^-7; # [m kg s^-2 A^-2]
p=2; # number of pole pairs

B_r_ext=2.553*10.0^-3; # external field [T]
space_order=9; # space order of the harmonic
q=p*space_order; # harmonic order



n_mech=65000; # mechanical speed [rpm]
k_time=1*6; # time order
f_1=n_mech/60*p; # [Hz]


N_div=1000.0; # number of divisions simplified method


mu_r=1.07;

# Conductivity:
sigma_1=6.7*10.0^6; # [S/m] 
sigma_2=0.77*10.0^6; # [S/m]
sigma_3=2.2*10.0^4; # [S/m] 
sigma_4=3*10.0^-15; # [S/m] 
sigma_5=3*10.0^-15; # [S/m] 


# test:
#sigma_3=3*10.0^-15; # [S/m]
sigma_3=8*10^5
#sigma_sleeve=3*10.0^-15; # [S/m] 

# Permeability:
mu_1=750*mu_0; # [m kg s^-2 A^-2]
mu_2=mu_r*mu_0; # [m kg s^-2 A^-2]
mu_3=1*mu_0; # [m kg s^-2 A^-2]
mu_4=1*mu_0; # [m kg s^-2 A^-2]
mu_5=5000*mu_0; # [m kg s^-2 A^-2]



# Geometry:
t_sl=2.95*10.0^-3; # [m] sleeve thickness

R_1=20*10.0^-3; # [m] rotor radius
R_2=27.4*10.0^-3; # [m] PM radius
R_3=R_2+t_sl; # [m] sleeve outer radius
R_4=31.15*10.0^-3; # [m] current sheet radius
R_5=50*10.0^-3; # [m] end domain radius

r_wave=R_2+0.25*10.0^-3; # where you measured the harmonics

#B_r_ext=B_r_ext*(R_3/(R_2+0.5*10.0^-3))^(q-1);


L=109*10.0^-3; # [m] axial length


println("R_1 = $R_1")
println("R_2 = $R_2")
println("R_3 = $R_3")
println("R_4 = $R_4")
println("R_5 = $R_5")
println("r_wave = $r_wave")

println("B_r_ext = $(B_r_ext*1000)")

using SpecialFunctions

P_3=Calc_rotor_loss( n_mech, space_order, p, k_time, B_r_ext,L,R_1,R_2,R_3,R_4,R_5,sigma_1,sigma_2,sigma_3,sigma_4,sigma_5,mu_r,r_wave)



# no load losses

using SpecialFunctions

vec_Br=[6.073 9.436 2.553 1.42 2.744 4.267 1.155]*10.0^-3;
vec_so=[5 7 9 11 11 13 15];
vec_time=[1 1 1 1 2 2 2];

vec_loss=zeros(1,length(vec_Br));

for count=1:length(vec_Br)
    space_order=vec_so[count]
    B_r_ext=vec_Br[count]
    k_time=vec_time[count]
    
    vec_loss[count]=Calc_rotor_loss( n_mech, space_order, p, k_time, B_r_ext,L,R_1,R_2,R_3,R_4,R_5,sigma_1,sigma_2,sigma_3,sigma_4,sigma_5,mu_r,r_wave);

    
end

count=1;

#P_3=Calc_rotor_loss( n_mech, space_order, p, k_time, B_r_ext,L,R_1,R_2,R_3,R_4,R_5,sigma_1,sigma_2,sigma_3,sigma_4,sigma_5,mu_r,r_wave)


println("$vec_loss")

# no load losses

using SpecialFunctions

vec_Br=[7.84 4.8598 1.8727 1.1626]*10.0^-3;
vec_so=[5 7 11 13];
vec_time=[1 1 1 1 2 2 2];

vec_loss=zeros(1,length(vec_Br));

for count=1:length(vec_Br)
    space_order=vec_so[count]
    B_r_ext=vec_Br[count]
    k_time=vec_time[count]
    
    vec_loss[count]=Calc_rotor_loss( n_mech, space_order, p, k_time, B_r_ext,L,R_1,R_2,R_3,R_4,R_5,sigma_1,sigma_2,sigma_3,sigma_4,sigma_5,mu_r,r_wave);

    
end

count=1;

#P_3=Calc_rotor_loss( n_mech, space_order, p, k_time, B_r_ext,L,R_1,R_2,R_3,R_4,R_5,sigma_1,sigma_2,sigma_3,sigma_4,sigma_5,mu_r,r_wave)


println("$vec_loss")

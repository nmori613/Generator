%%%%%%%%%%%%%% Values for TI and AD regulators components %%%%%%%%%%%%%
Freq_TI = 400000;
Freq_AD = 400000;
Vout=9;
Vin= 24;
Ipeak_AD=0.1;
Ior_TI= 0.03;
R1_TI=10000;
R2_AD=10000;

L_AD= (Vout/(Freq_AD*Ipeak_AD))*(1-(Vout/Vin));
L_TI= (Vout*(Vin-Vout))/(Ior_TI*Freq_TI*Vin);

Cout_AD= 50*L_AD*(Ipeak_AD/Vout)^2;

R3_TI=0.025/Ior_TI;
Cout_TI= 20;

R2_TI= (9*R1_TI)/2.5 - R1_TI;
R1_AD= ((9/0.8) -1)*R2_AD;


%%%%%%%%%%%%% Current sense amplifier circuit component values %%%%%%%%%
Imin=0.05; %Minimumal current through battery triggers charging disable, 50mA
Voutput=10;
Vref=0;
Rsense=1;
V1_minus_V2=Imin*Rsense;
R2_R1=100;
R2_R1_ratio=(Voutput-Vref)/V1_minus_V2;
Voutput=((V1_minus_V2)*R2_R1)+Vref




% Maximum power pointing tracking data for primary and secondary windings
% Uses a series resistor at the output stage of the full wave rectifier


%Primary winding max voltage and current vs series resistance
R = [1.5 4.7 10 47 67 100 220 330 470];
Vmax = [2.4 2.6 2.8 4.2 4.8 5.7 7.9 11.1 12.9];
Amax = [49 57 59 43 39 36 27 25 19];
Pmax = Vmax.*Amax;

%Primary and Secondary winding max voltage and current vs series resistance             
Vmax_TwoPhase= [4.5 4.8 5.35 7.5 8.1 8.58 12.4 13.9 14.4];
Amax_TwoPhase = [85 77 72 62 55 45 39 30 26];
Pmax_TwoPhase = Vmax_TwoPhase.*Amax_TwoPhase;

% Perform polynomial regression to fit a parabolic curve for Pmax
degree = 3;
coefficients = polyfit(R, Pmax, degree);
parabolic_curve = polyval(coefficients, R);

figure(1);
yyaxis left;
plot(R,Vmax, 'DisplayName', 'Vmax');
xlabel('Resistance (Ohm)');
ylabel('Voltage (V) and Current (mA)');
hold on;
plot(R,Amax, 'DisplayName', 'Amax');
yyaxis right;
hold on;
plot(R, parabolic_curve, 'DisplayName', 'Pmax');
ylabel('Maximum Power (mW)');

title('Vmax, Amax, and Pmax vs. Series Resistance');
legend('Location', 'best');

figure(2);
coefficients_TwoPhase = polyfit(R, Pmax_TwoPhase, degree);
parabolic_curve_TwoPhase = polyval(coefficients_TwoPhase, R);

plot(R,Vmax_TwoPhase, 'DisplayName', 'Vmax_TwoPhase');
xlabel('Resistance (Ohm)');
ylabel('Voltage (V) and Current (mA)');
hold on;
plot(R,Amax_TwoPhase, 'DisplayName', 'Amax_TwoPhase');
yyaxis right;
hold on;
plot(R, parabolic_curve_TwoPhase, 'DisplayName', 'Pmax_TwoPhase');
ylabel('Maximum Power (mW)');

title('Two-Phase Vmax, Amax, and Pmax vs. Series Resistance');
legend('Location', 'best');
hold off;



%%regulator voltages
%9V battery Current mapping (battery actual voltage is 8.02V)
figure(3);
R_9V = [36 47 100 147 220 320];
%%Vmax = [2.4 2.6 2.8 4.2 4.8 5.7 7.9 11.1 12.9];
Amax_9V = [170 140 73.5 51.4 36.6 24.7];
Amax_9V_expected = (1000*8.01)./R_9V;
plot(R_9V,Amax_9V, 'DisplayName', 'Amax 9V Measured');
hold on;
plot(R_9V, Amax_9V_expected, 'DisplayName', 'Amax Expected');
xlabel('Resistance (Ohm)');
ylabel('Measured Current (maA')
legend('Location', 'best');

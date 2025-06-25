% Symulacja biosensora QCM: efekt masy, temperatury i kinetyki
clear; clc;

% Parametry fizyczne
f0 = 10e6;           % [Hz] częstotliwość bazowa
A = 0.2;             % [cm^2] powierzchnia elektrody
rho_q = 2.648;       % [g/cm^3] gęstość kwarcu
mu_q = 2.947e11;     % [g·cm⁻¹·s⁻²] moduł ścinania kwarcu
eta_l = 0.001;       % [Pa·s] lepkość wody
rho_l = 1000;        % [kg/m^3] gęstość wody
K = 1e6;             % Stała równowagi Langmuira
C_vals = logspace(1,6,100); % Zakres CFU/ml

% Masa bakterii: zakładamy 1 CFU ≈ 1 pg = 1e-12 g
mass_per_CFU = 1e-12;
delta_m = C_vals * mass_per_CFU; % masa przy danym stężeniu

% Obliczenia
delta_f_sauerbrey = arrayfun(@(m) sauerbrey(f0, m, A, rho_q, mu_q), delta_m);
theta_vals = arrayfun(@(C) langmuir(C, K), C_vals);
delta_f_kanazawa = arrayfun(@(m) kanazawa(f0, eta_l, rho_l, rho_q, mu_q, 1), delta_m);

% Suma Δf
delta_f_total = delta_f_sauerbrey + delta_f_kanazawa;

% Wykres
figure;
semilogx(C_vals, delta_f_total, 'b', 'LineWidth', 2); hold on;
xlabel('Stężenie bakterii [CFU/ml]');
ylabel('Zmiana częstotliwości [Hz]');
title('Odpowiedź biosensora QCM – Równanie Sauerbreya + Kanazawa');
grid on;

% Langmuir overlay
yyaxis right;
plot(C_vals, theta_vals, 'r--', 'LineWidth', 2);
ylabel('Pokrycie powierzchni 	heta');
legend('Δf (Sauerbrey + Kanazawa)', '	heta (Langmuir)');

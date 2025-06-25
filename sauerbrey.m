function delta_f = sauerbrey(f0, delta_m, A, rho_q, mu_q)
% Równanie Sauerbreya – zmiana częstotliwości w funkcji przyrostu masy
    delta_f = -2 * f0^2 * delta_m / (A * sqrt(rho_q * mu_q));
end

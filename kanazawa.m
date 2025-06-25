function delta_f = kanazawa(f0, eta_l, rho_l, rho_q, mu_q, n)
% Równanie Kanazawy-Gordona – zmiana częstotliwości w cieczy
    delta_f = -sqrt(n) * f0^(3/2) * sqrt(eta_l * rho_l) / sqrt(pi * rho_q * mu_q);
end

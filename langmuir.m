function theta = langmuir(C, K)
% Model Langmuira – pokrycie powierzchni przez bakterie
    theta = (K * C) / (1 + K * C);
end

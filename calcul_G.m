function G = calcul_G(H)
    [n, m] = size(H);

    % Vérifiez que H est de taille (n-k) x n (pour un code (n, k))
    if n > m
        error('La matrice H n''est pas compatible avec un code (n, k).');
    end

    % Créez une matrice identité I de taille (n-k) x (n-k)
    I = eye(n - n);

    % Formez une matrice [I | H] en concaténant I à gauche de H
    IH = [I, H];

    % Utilisez l'élimination de Gauss pour réduire [I | H] à la forme échelonnée réduite [G | I]
    [R, pivots] = rref(IH);

    % La matrice génératrice G est extraite de la partie gauche de [G | I]
    G = R(:, 1:n - n);

    % Assurez-vous que tous les pivots sont sur la diagonale
    if ~isequal(pivots, 1:n - n)
        error('La matrice H n''est pas compatible avec un code (n, k).');
    end
end
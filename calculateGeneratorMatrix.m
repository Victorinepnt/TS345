function G = calculateGeneratorMatrix(H)
    [m, n] = size(H);

    % Vérifiez que H est de taille (n-k) x n (pour un code (n, k))
    if m > n
        error('La matrice H n''est pas compatible avec un code (n, k).');
    end

    % Créez une matrice identité I de taille (n-k) x (n-n)
    I = eye(m);

    % Formez une matrice [I | H] en concaténant I à gauche de H
    HI = [H, I];

    % Utilisez l'élimination de Gauss pour réduire [I | H] à la forme échelonnée réduite [G | I]
    [T, pivots] = rref(HI);

    % Après avoir calculé les pivots et la matrice échelonnée réduite HI
    % Assurez-vous d'avoir correctement calculé les pivots
    
    % Indice des colonnes de la matrice échelonnée réduite HI qui sont associées à la matrice génératrice G
    col_indices = pivots(pivots <= n - m);
    
    % Extraitz la matrice génératrice G à partir de la matrice échelonnée réduite HI
    G = HI(:, col_indices);


    % Assurez-vous que tous les pivots sont sur la diagonale
    if ~isequal(pivots(pivots <= n - m), 1:n - m)
        error('La matrice H n''est pas compatible avec un code (n, k).');
    end
end

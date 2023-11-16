function G = get_generator_matrix_from_parity_matrix(H)
    [n, m] = size(H);
    k = n - m; % Le nombre de bits d'information
    H = [eye(n) H];
    % Vérifie si H est sous forme de matrice systématique
    if ~isequal(H(:, 1:k), eye(k))
        disp('La matrice de parité n''est pas sous forme systématique.');
        G = [];
        return;
    end

    % Crée une matrice identité de taille (k, k)
    I = eye(k);

    % Extrait la sous-matrice de H correspondant aux bits de parité
    P = H(:, k+1:end);

    % Utilise l'élimination de Gauss-Jordan pour obtenir la matrice génératrice G
    G_parity_transpose = inv(P);
    G_parity = G_parity_transpose';

    % Construit la matrice génératrice G
    G = [I, -G_parity];

end



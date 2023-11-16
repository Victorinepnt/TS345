% Importez H et G depuis le fichier DEBUG_6_3.alist
% Spécifiez le chemin complet vers le fichier
file_path = 'D:\T3\TS345\TS345\alist\DEBUG_6_3.alist';

% Ouvrez le fichier en mode lecture
fileID = fopen(file_path, 'r');

% Assurez-vous que le fichier a été ouvert avec succès
if fileID == -1
    error('Impossible d''ouvrir le fichier.');
end

% Lisez les données du fichier (vous devrez adapter cela en fonction du format du fichier)
% Par exemple, si le fichier est au format texte avec deux colonnes de données :
data = fscanf(fileID, '%f %f', [2, Inf]);

% Fermez le fichier
fclose(fileID);
H = data.H;
G = data.G;

% Définissez la fonction BEC

% Initialisation des paramètres
p_values = 0.1:0.05:1;
Nit_values = 1:5;
effacement_rates = zeros(length(Nit_values), length(p_values));

% Boucle sur les probabilités d'effacement
for p_idx = 1:length(p_values)
    p = p_values(p_idx);
    
    % Boucle sur le nombre d'itérations
    for Nit_idx = 1:length(Nit_values)
        Nit = Nit_values(Nit_idx);
        
        effacement_count = 0;
        
        % Répétez l'expérience un certain nombre de fois
        num_experiments = 1000; % Vous pouvez ajuster ce nombre
        for experiment = 1:num_experiments
            % Générez mot_code, appliquez BEC
            % Appelez la fonction BP et comptez les zéros
            % Accumulez effacement_count
        end
        
        % Calculez le taux d'effacement binaire moyen
        effacement_rates(Nit_idx, p_idx) = effacement_count / num_experiments;
    end
end

% Tracez les courbes
plot(p_values, effacement_rates(1, :), '-o', 'DisplayName', '1 itération');
hold on;
plot(p_values, effacement_rates(2, :), '-o', 'DisplayName', '2 itérations');
% Continuez pour les autres valeurs de Nit
xlabel('Probabilité d''effacement (p)');
ylabel('Taux d''effacement binaire');
title('Taux d''effacement binaire pour différentes itérations');
legend;
grid on;

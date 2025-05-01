//Números de aluno em consideração: 8240231 e 8240266

// Alínea A
clc; //Limpa o ecrã
clear; //Limpa as variáveis
n_points = 20;
max_value = 27; //Valor máximo para as coordenadas
points = [];

while size(points,1) < n_points
    x = rand() * 54 - 27; //intervalo [-27, 27]
    y = rand() * 54 - 27;
    z = rand() * 54 - 27;
    if sqrt(x^2 + y^2 + z^2) <= max_value then
        points = [points; x, y, z];
    end
end

disp("Alínea A");
disp(points);

//Alínea B
n = size(points, 1);
adj = zeros(n, n); //Matriz de adjacência inicializada com zeros
edge_count = 0;
max_edges = 100;
edge_limit = 5; //Distância máxima entre dois pontos que estão ligados

for i = 1:n-1
    for j = i+1:n
        d = norm(points(i,:) - points(j,:));
        if d <= edge_limit & edge_count < max_edges then
            adj(i,j) = d;
            adj(j,i) = d;
            edge_count = edge_count + 1;
        end
    end
end

disp("Alínea B");
disp(adj);

//Alínea C
//Regras para ajustar β e σ
beta = 1;
sigma = 66;
if beta == 0 then beta = 7; end
if sigma == 0 then sigma = 2; end
if sigma > 20 then sigma = 10; end

start_node = beta;
end_node = sigma;

//Função Dijkstra
function [dist, prev] = dijkstra(adj, start)
    n = size(adj,1);
    dist = ones(1,n) * %inf;
    prev = zeros(1,n);
    visited = zeros(1,n);
    dist(start) = 0;

    for i = 1:n
        [min_dist, u] = min(dist + visited * %inf);
        visited(u) = 1;
        for v = 1:n
            if adj(u,v) > 0 & visited(v)==0 then
                alt = dist(u) + adj(u,v);
                if alt < dist(v) then
                    dist(v) = alt;
                    prev(v) = u;
                end
            end
        end
    end
endfunction

[distances, prev] = dijkstra(adj, start_node);

//Reconstruir caminho
path = [];
u = end_node;
while u <> 0
    path = [u path];
    u = prev(u);
end

disp("Alínea C");

if distances(end_node) == %inf then
    disp("Não existe caminho entre os pontos selecionados.");
else
    disp("Caminho mais curto (lista de pontos):");
    disp(path);
    disp("Distância total do caminho (em cm):");
    disp(distances(end_node));
    if distances(end_node) < 50 then
        disp("O caminho é inferior a 50 cm!");
    else
        disp("O caminho cumpre o requisito mínimo de 50 cm.");
    end
end

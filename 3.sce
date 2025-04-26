//Exercício 3

//Constantes

beta = 1;
sigma = 10;
num_pontos = 20;
limite_dist = 27;   // cm
max_arestas = 100;
limite_conexao = 5; // cm

//Alínea A
pontos = grand(num_pontos, 3, 'unf', 0, limite_dist);

//Alínea B
distancias = zeros(num_pontos, num_pontos);
for i = 1:num_pontos
    for j = i+1:num_pontos
        d = norm(pontos(i,:) - pontos(j,:));
        distancias(i,j) = d;
        distancias(j,i) = d;
    end
end

//Construção da matriz de adjacência
adj = zeros(num_pontos, num_pontos);
contador_arestas = 0;
for i = 1:num_pontos
    for j = i+1:num_pontos
        if distancias(i,j) <= limite_conexao & contador_arestas < max_arestas then
            adj(i,j) = distancias(i,j);
            adj(j,i) = distancias(i,j);
            contador_arestas = contador_arestas + 1;
        end
    end
end

//Selecionar nós inicial e final conforme beta e sigma
no_inicial = beta;
no_final = sigma;

disp("Nó inicial:");
disp(no_inicial);
disp("Nó final:");
disp(no_final);

// Algoritmo de Dijkstra
function [dist, path] = dijkstra(graph, start_node)
    n = size(graph, 1);
    dist = ones(n, 1) * %inf;
    visited = zeros(n, 1);
    path = ones(n, 1) * -1;
    
    dist(start_node) = 0;
    
    for i = 1:n
        [minval, u] = min(dist + visited * %inf);
        visited(u) = 1;
        
        for v = 1:n
            if graph(u,v) > 0 & ~visited(v) then
                if dist(u) + graph(u,v) < dist(v) then
                    dist(v) = dist(u) + graph(u,v);
                    path(v) = u;
                end
            end
        end
    end
endfunction

[distancias_final, caminhos] = dijkstra(adj, no_inicial);

//Reconstrução do caminho
caminho_final = [];
atual = no_final;
while atual <> -1
    caminho_final = [atual; caminho_final];
    atual = caminhos(atual);
end

disp("Caminho mínimo encontrado:");
disp(caminho_final);
disp("Distância total:");
disp(distancias_final(no_final));

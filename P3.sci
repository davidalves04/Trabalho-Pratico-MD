beta = 6;
sigma = 16;
num_pontos = 20;
limite_dist = 27;     // cm
max_arestas = 100;
limite_conexao = 5;   // cm
arestas = 0;



// Gerar coordenadas aleatórias dos pontos (x, y, z)
X = grand(1, num_pontos, "unf", 0, limite_dist);
Y = grand(1, num_pontos, "unf", 0, limite_dist);
Z = grand(1, num_pontos, "unf", 0, limite_dist);


//Pontos Gerados
disp(pontos)

// --- Calcular matriz de distâncias euclidianas ---
adj = zeros(num_pontos, num_pontos);
for i = 1:num_pontos
    for j = 1:num_pontos
        if i <> j then
            adj(i,j) = sqrt((X(i)-X(j))^2 + (Y(i)-Y(j))^2 + (Z(i)-Z(j))^2);
            adj(j, i) = adj(i, j); // Garantir simetria na matriz de distâncias
            
            arestas = arestas + 1;
            
         if adj(i, j) < 5 then
            adj(i, j) = 0;
            adj(j,i) = adj(i,j);
           
        end
        
        if arestas == 100 then
            disp("A Matriz tem mais de 100 arestas");
        end
        
        
        
        else
            adj(i,j) = 0;
        end
    end
end


//Matriz adjacente
disp(adj)

//Garantir os requisitos de sigma e verificar distancia
if sigma == 0 then
    sigma = 2;
elseif sigma > 20 then
    sigma = 10;
end

if (beta - sigma) > 50 || (beta - sigma) < -50 then

    disp("A diferença entre o ponto inicial e final é maior que 50 ou menor que -50");
end



// --- Algoritmo de Dijkstra ---
function [dist, path] = dijkstra(G, start_node, end_node)
    n = size(G, 1);
    visited = zeros(1, n);
    dist = ones(1, n) * %inf;
    prev = zeros(1, n);
    dist(start_node) = 0;

    for i = 1:n
        min_dist = %inf;
        u = -1;
        for j = 1:n
            if ~visited(j) & dist(j) < min_dist then
                min_dist = dist(j);
                u = j;
            end
        end

        if u == -1 then
            break;
        end

        visited(u) = 1;

        for v = 1:n
            if G(u,v) > 0 & ~visited(v) then
                alt = dist(u) + G(u,v);
                if alt < dist(v) then
                    dist(v) = alt;
                    prev(v) = u;
                end
            end
        end
    end

    path = [];
    u = end_node;
    while u <> 0
        path = [u, path];
        u = prev(u);
    end
endfunction

// --- Executar o algoritmo ---


[distancias, caminho] = dijkstra(adj, beta, sigma);
disp("Caminho: " + string(caminho));
disp("Distância total: " + string(distancias(sigma)));

// Definição dos parâmetros
beta = 6;
n = 30;

// Calcula constante floor(6!/7)
constante = floor(factorial(beta) / (beta + 1));

// Inicializa produto
produto = 1;

// Loop para k de 1 até (n-15)
for k = 1:(n-15)
    soma = 0;
    // Loop para j de (n-5) até n
    for j = (n-5):n
        termo = floor(1 + (j + k)/200);
        soma = soma + termo;
    end
    termo_final = 3 * soma - constante;
    produto = produto * termo_final;
end

// Exibe o resultado
disp(produto);

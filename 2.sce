//Número de aluno em consideração: 8240266

beta = 6;

//Escolha de n tal que 50 + beta < 2n < 100 - beta
n = 30;

//Alínea A
a = 0;
for j = beta + 2 : n
    a = a + ((-2*beta - 1)/5)^j;
end
disp("Resultado da alínea A:", a);

// Alínea B
M = min(5 + beta, floor(100 / (beta + 1)));
b = 1;  //começa em 1 porque é produto, não soma
for m = 1:M
    i = 5 * m; //i = 5, 10, 15, ..., 5*M
    b = b * (((beta + 1)/i) - 1)^4;
end
disp("Resultado da alínea B:", b);

// Alínea C
c = 1;
const = ceil(factorial(6)/(beta + 1));  //valor constante

for k = 1:(n - 15)
    soma = 0;
    for j = (n - 5):n
        termo = floor(1 + ((j + k)/200)) - const;
        soma = soma + termo;
    end
    c = c * (3 * soma);
end

disp("Resultado da alínea C:", c);

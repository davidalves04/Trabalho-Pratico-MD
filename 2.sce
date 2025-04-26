
// Exercício Resolvido - Matemática Discreta
// Aluno: Nome Fictício - Número: 12345

// Definir beta (último algarismo do número de estudante)
beta = 7;

// Escolher n tal que 50 + beta < 2n < 100 - beta
n = 30;

// ------------------------
// Alínea (a)
// ------------------------
a = 0;
for j = beta + 2 : n
    a = a + ((-2*beta - 1)/5)^j;
end
disp("Resultado da alínea (a):", a);

// ------------------------
// Alínea (b)
// ------------------------
M = min(5 + beta, floor(100 / (beta + 1)));
b = 0;
for i = 1:M
    b = b + ((beta + 1)/i - 1)^4;
end
disp("Resultado da alínea (b):", b);

// ------------------------
// Alínea (c)
// ------------------------
c = 1;
const = floor(factorial(6)/(beta + 1));  // valor constante
for k = 1:(n - 15)
    soma = 0;
    for j = n - 5 : n
        soma = soma + (1 + ((j + k)/200)*const);
    end
    c = c * (3 * soma);
end
disp("Resultado da alínea (c):", c);

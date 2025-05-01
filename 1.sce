U = 1:20; //Universo de elementos de 1 a 20

//Subconjuntos A e B
A = [3, 5, 9, 11, 13, 17, 19];  // 7 elementos
B = [2:18]; // 17 elementos

//a)- Cardinalidade
disp("a)");
disp("Cardinalidade de A: " + string(length(A)));
disp("Cardinalidade de B: " + string(length(B)));

//b)- Complemento de A
disp("b)");
Ac = setdiff(U, A);
disp("Complemento de A:");
disp(Ac);

//c)- União de A e B
disp("c)");
unionAB = union(A, B);
disp("A ∪ B:");
disp(unionAB);

//d)- Interseção de A e B
disp("d)");
interAB = intersect(A, B);
disp("A ∩ B:");
disp(interAB);

//e)- Diferença de B - A
disp("e)");
diffBA = setdiff(B, A);
disp("B - A:");
disp(diffBA);

//f) Diferença simétrica A ⊕ B
disp("f)");
diffAB = setdiff(A, B);
diffBA = setdiff(B, A);
symDiff = union(diffAB, diffBA);
disp("A ⊕ B:");
disp(symDiff);

//g)- A ⊕ B̅ ∪ (A - B)
disp("g)");
Bc = setdiff(U, B);
symDiff2 = union(setdiff(A, Bc), setdiff(Bc, A));  // A ⊕ B̅
resG = union(symDiff2, diffAB);
disp("A ⊕ B̅ ∪ (A - B):");
disp(resG);

//h)- Produto cartesiano de B × A
disp("h)");
cartProd = [];
for i = 1:length(B)
    for j = 1:length(A)
        cartProd($+1,:) = [B(i), A(j)];
    end
end
disp("B × A:");
disp(cartProd(1:10,:)); //Mostra apenas os 10 primeiros pares

//i)- Produto cartesiano de A × A × A
disp("i)");
A3 = [];
for i = 1:length(A)
    for j = 1:length(A)
        for k = 1:length(A)
            A3($+1,:) = [A(i), A(j), A(k)];
        end
    end
end
disp("A³:");
disp(A3(1:10,:));   //Mostra apenas os 10 primeiros trios

% Predicado principal para resolver las Torres de Hanoi
hanoi(N) :-
    mover(N, izquierda, centro, derecha).

% Regla para mover discos
mover(0, _, _, _) :- !.
mover(N, Origen, Auxiliar, Destino) :-
    N1 is N - 1,
    mover(N1, Origen, Destino, Auxiliar),
    informar(Origen, Destino),
    mover(N1, Auxiliar, Origen, Destino).

% Regla para informar el movimiento
informar(Origen, Destino) :-
    write('Mover disco de '), write(Origen), write(' a '), write(Destino), nl.

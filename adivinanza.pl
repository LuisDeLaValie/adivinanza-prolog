% Lista de adivinanzas y sus respuestas
% el echo adivinanza consite en la adivinaza y su respeusta
% `adivinanza(adivianza, respuesta)`
adivinanza("Blanco por dentro, verde por fuera. Si quieres que te lo diga, espera.", sandia).
adivinanza("De muchos colores me veras, por el campo voy y no ando jamas.", arcoiris).
adivinanza("Con cincuenta ojos y una lengua, siempre esta cerca de una fragua.", abanico).
adivinanza("Tengo agujas pero no se coser. Tengo numeros pero no se leer.", reloj).
adivinanza("Con cien patas y no puede andar, con mil ojos y no puede mirar.", abanico).
adivinanza("Vuelo sin alas, canto sin voz, tengo un nido pero no soy un pajaro.", nube).
adivinanza("Luzco siempre en compañía, en el cielo o en el mar, me puedes ver brillar, pero no me puedes tocar.", estrella).
adivinanza("No es cama ni es leon y desaparece en cualquier rincon.", camaleon).
adivinanza("Vuelo de noche, duermo en el dia y nunca veras plumas en ala mia.", murcielago).
adivinanza("Pequeña como una pera, pero alumbra toda la casa entera.", bombilla).



% Predicado para seleccionar una adivinanza aleatoria
% creamos una regla que buscara los echos `adivinanza`  y selecciona una de forma aleatorio
% esta es devuenta en la variables `Adivinanza` y `Respuesta`
seleccionar_adivinanza(Adivinanza, Respuesta) :-
    findall((Adiv, Resp), adivinanza(Adiv, Resp), Adivinanzas),
    length(Adivinanzas, Length),
    random(0, Length, Index),
    nth0(Index, Adivinanzas, (Adivinanza, Respuesta)).




% Predicado para jugar
% En esta regla iniciamos el jeugo, usamos el comando `writeln` para poder escribir en pantalla y
% el comando `read` para poder leer una respuesta del usuario
% y mandamos la respota coreecta y la respusta del uasrio a la regla `validar_respuesta` para validar la respuesta
jugar_adivinanza :-
    writeln("¡Bienvenido al juego de adivinanzas!"),
    seleccionar_adivinanza(Adivinanza, Respuesta),
    writeln(Adivinanza),
    writeln("¿Cual es tu respuesta?"),
    read(RespuestaUsuario),
    validar_respuesta(RespuestaUsuario, Respuesta).



% Predicado para validar la respuesta del usuario
% comprobamos si la respuesta correcta y la respuesta del usuario son identicas,
% si lo son entonces escribira que as adivida correcta amente
validar_respuesta(RespuestaUsuario, RespuestaCorrecta) :-
    RespuestaUsuario = RespuestaCorrecta,
    writeln("¡Correcto! ¡Has adivinado la respuesta!"),
    writeln("¡Felicidades!"),
    !.

% Al validar la regla que las respeustas no son correctas en este caso se le indicara al ususuario
% que su respuesta fue incorrecta y se le ortoga una pista
validar_respuesta(_, RespuestaCorrecta) :-
    writeln("¡Incorrecto! ¡Inténtalo de nuevo!"),
    writeln("Aqui tienes una pista: la respuesta tiene "),
    atom_length(RespuestaCorrecta, Length),
    write(Length),
    writeln(" letras"),
    writeln("¿Cuál es tu respuesta?"),
    read(RespuestaUsuario),
    validar_respuesta(RespuestaUsuario, RespuestaCorrecta).

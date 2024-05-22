% Lista de adivinanzas y sus respuestas
adivinanza("Blanco por dentro, verde por fuera. Si quieres que te lo diga, espera.", sandia).
adivinanza("De muchos colores me verás, por el campo voy y no ando jamás.", arcoiris).
adivinanza("Con cincuenta ojos y una lengua, siempre está cerca de una fragua.", abanico).
adivinanza("Tengo agujas pero no sé coser. Tengo números pero no sé leer.", reloj).
adivinanza("Con cien patas y no puede andar, con mil ojos y no puede mirar.", abanico).
adivinanza("Vuelo sin alas, canto sin voz, tengo un nido pero no soy un pájaro.", nube).
adivinanza("Luzco siempre en compañía, en el cielo o en el mar, me puedes ver brillar, pero no me puedes tocar.", estrella).
adivinanza("No es cama ni es león y desaparece en cualquier rincón.", camaleon).
adivinanza("Vuelo de noche, duermo en el día y nunca verás plumas en ala mía.", murcielago).
adivinanza("Pequeña como una pera, pero alumbra toda la casa entera.", bombilla).



% Predicado para seleccionar una adivinanza aleatoria
seleccionar_adivinanza(Adivinanza, Respuesta) :-
    findall((Adiv, Resp), adivinanza(Adiv, Resp), Adivinanzas),
    length(Adivinanzas, Length),
    random(0, Length, Index),
    nth0(Index, Adivinanzas, (Adivinanza, Respuesta)).




% Predicado para jugar
jugar_adivinanza :-
    writeln("¡Bienvenido al juego de adivinanzas!"),
    seleccionar_adivinanza(Adivinanza, Respuesta),
    writeln(Adivinanza),
    writeln("¿Cuál es tu respuesta?"),
    read(RespuestaUsuario),
    validar_respuesta(RespuestaUsuario, Respuesta).



% Predicado para validar la respuesta del usuario
validar_respuesta(RespuestaUsuario, RespuestaCorrecta) :-
    RespuestaUsuario = RespuestaCorrecta,
    writeln("¡Correcto! ¡Has adivinado la respuesta!"),
    writeln("¡Felicidades!"),
    !.
validar_respuesta(_, RespuestaCorrecta) :-
    writeln("¡Incorrecto! ¡Inténtalo de nuevo!"),
    writeln("Aquí tienes una pista: la respuesta tiene "),
    atom_length(RespuestaCorrecta, Length),
    write(Length),
    writeln(" letras"),
    writeln("¿Cuál es tu respuesta?"),
    read(RespuestaUsuario),
    validar_respuesta(RespuestaUsuario, RespuestaCorrecta).

% Lista de adivinanzas y sus respuestas
% el hecho adivinanza consite en la adivinaza y su respeusta

% `adivinanza(adivianza, respuesta)`
adivinanza("Blanco por dentro, verde por fuera. Si quieres que te lo diga, espera.", sandia).
adivinanza("De muchos colores me veras, por el campo voy y no ando jamas.", arcoiris).
adivinanza("Con cincuenta ojos y una lengua, siempre esta cerca de una fragua.", abanico).
adivinanza("Tengo agujas pero no se coser. Tengo numeros pero no se leer.", reloj).
adivinanza("Con cien patas y no puede andar, con mil ojos y no puede mirar.", abanico).
adivinanza("Vuelo sin alas, canto sin voz, tengo un nido pero no soy un pajaro.", nube).
adivinanza("Luzco siempre en compania, en el cielo o en el mar, me puedes ver brillar, pero no me puedes tocar.", estrella).
adivinanza("No es cama ni es leon y desaparece en cualquier rincon.", camaleon).
adivinanza("Vuelo de noche, duermo en el dia y nunca veras plumas en ala mia.", murcielago).
adivinanza("Pequeña como una pera, pero alumbra toda la casa entera.", bombilla).
adivinanza("Me pisan al caminar, me destrozan al jugar, no me puedo quejar.", sombra).
adivinanza("Blanca por dentro, verde por fuera. Si quieres que te lo diga, espera.", pera).
adivinanza("Cuantos mas le quito, mas grande se hace.", agujero).
adivinanza("Siempre quietas, siempre mudas, pero nunca en la vida desnudas.", estatuas).
adivinanza("En el mar no me mojo, en la cocina no me quemo y en la tierra me sostengo.", sal).
adivinanza("Tiene dientes y no come, tiene cabeza y no es hombre.", ajo).
adivinanza("Dos hermanas van al campo, y nunca se juntan.", piernas).
adivinanza("Tengo orejas y no oigo, tengo cola y no empujo, soy pequeno y me ves en el cuarto.", raton).
adivinanza("Tengo ciudades, pero no casas. Tengo montanas, pero no arboles. Tengo agua, pero no peces.", mapa).
adivinanza("Va y viene, y no se mueve, ni uno ni dos, sino tres golpes da y se queda en su lugar.", puerta).
adivinanza("Vuelo dia y noche, pero no soy pajaro ni avion.", tiempo).
adivinanza("Sin ser rica, te doy mucho dinero. Sin ser tienda, tengo trapos y joyas.", cartera).
adivinanza("Va subiendo, va bajando, y el sitio no va dejando.", escalera).
adivinanza("Tiene ojos y no ve, tiene agua y no la bebe.", aguja).
adivinanza("Soy madre y doy de mamar, pero a mi casa no puedo entrar.", vaca).
adivinanza("Te lo digo y te lo repito, pero no me entiendes ni un poquito.", eco).
adivinanza("Cien companeras en fila, todas de la mano, y al que a todas obedece, no se escapa ni un grano.", peine).
adivinanza("Vuelo sin alas y llevo un traje, soy tan ligero que al cielo subo y soy un mensaje.", carta).
adivinanza("Soy larga y soy lista, de noche doy vueltas y de dia me acuesto con la vista.", cuerda).
adivinanza("En la ciudad es facil de encontrar, por la noche tiene luz, de dia la apagan ya.", farola).



% Predicado para seleccionar una adivinanza aleatoria

% creamos una regla que buscara los hechos `adivinanza`  y selecciona una de forma aleatorio
% esta es devuenla en la variables `Adivinanza` y `Respuesta`

seleccionar_adivinanza(Adivinanza, Respuesta) :-
    findall((Adiv, Resp), adivinanza(Adiv, Resp), Adivinanzas),         % encuentra todas las adivinanzas y sus respuestas y las coloca en la lista Adivinanzas.
    length(Adivinanzas, Length),                                        % obtiene la longitud de la lista de adivinanzas.
    random(0, Length, Index),                                           % genera un índice aleatorio entre 0 y Length - 1.
    nth0(Index, Adivinanzas, (Adivinanza, Respuesta)).                  % selecciona la adivinanza y la respuesta correspondientes al índice aleatorio generado.




% Predicado para jugar

% En esta regla iniciamos el jeugo, usamos el comando `writeln` para poder escribir en pantalla y
% el comando `read` para poder leer una respuesta del usuario
% y mandamos la respota coreecta y la respusta del uasrio a la regla `validar_respuesta` para validar la respuesta

jugar_adivinanza :-
    writeln("¡Bienvenido al juego de adivinanzas!"),                % imprime un mensaje de bienvenida.
    seleccionar_adivinanza(Adivinanza, Respuesta),                  % selecciona una adivinanza aleatoria y su respuesta.
    writeln(Adivinanza),                                            % imprime la adivinanza.
    writeln("¿Cual es tu respuesta?"),                              % solicita la respuesta del usuario.
    read(RespuestaUsuario),                                         % lee la respuesta del usuario.
    validar_respuesta(RespuestaUsuario, Respuesta).                 % llama al predicado para validar la respuesta.



% Predicado para validar la respuesta del usuario

% comprobamos si la respuesta correcta y la respuesta del usuario son identicas,
% si lo son entonces escribira que as adivida correcta amente

validar_respuesta(RespuestaUsuario, RespuestaCorrecta) :-           % verifica si la respuesta del usuario es correcta.
    RespuestaUsuario = RespuestaCorrecta,                           % Si es correcta, imprime mensajes de felicitación y utiliza ! (corte) para evitar cualquier otra regla.
    writeln("¡Correcto! ¡Has adivinado la respuesta!"),
    writeln("¡Felicidades!"),
    !.

% Al validar la regla que las respeustas no son correctas en este caso se le indicara al ususuario
% que su respuesta fue incorrecta y se le ortoga una pista

validar_respuesta(_, RespuestaCorrecta) :-
    writeln("¡Incorrecto! ¡Inténtalo de nuevo!"),
    writeln("Aqui tienes una pista: la respuesta tiene "),          % Si es incorrecta, imprime un mensaje de error y proporciona una pista sobre la longitud de la respuesta correcta.
    atom_length(RespuestaCorrecta, Length),
    write(Length),
    writeln(" letras"),
    writeln("¿Cuál es tu respuesta?"),                              % Luego, solicita nuevamente la respuesta del usuario y vuelve a validar.
    read(RespuestaUsuario),
    validar_respuesta(RespuestaUsuario, RespuestaCorrecta).

﻿Sapi := ComObjCreate("SAPI.SpVoice")
Sapi.Rate := 4
Sapi.Volume :=85
soundBeep, 440, 250
sleep, 100
Sapi.Speak("Bienvenido al buscador automatizado. Pulsa control + shift + q para cerrar el programa, o control + shift  + h para leer la ayuda del mismo. ¡Qué lo disfrutes!")
^f2::
sleep, 5000
return
^+h::
run readme.txt
return
^+q::
Sapi.Speak("Hasta luego!")
sleep, 50
SoundBeep, 1000, 200
exitapp

sleep, 3000
return
f4::
InputBox, texto, Texto de búsqueda, Ingrese el texto de búsqueda en google
Run https://www.google.com/search?q=%texto%

Return
f3::
InputBox, texto2, Texto de búsqueda, Ingrese el texto para buscar en youtube.
run https://www.youtube.com/results?search_query=%texto2%

return
f2::
InputBox, texto2, Texto de búsqueda, Ingrese la búsqueda de pornhub.
run https://www.google.com
sleep, 3000
ClipPut(https://es.pornhub.com/video/search?search=%texto2%)
send, ^+n
send, 500
send, !d
sleep, 400
send, ^v
sleep, 50
send, enter
return
f1::
InputBox, texto3, Texto de búsqueda, Ingresa el término a buscar en xnxx.com
run https://www.xnxx.com/search/%texto3%

return
f5::
InputBox, texto4, Texto de búsqueda, Ingresa la búsqueda para mercado libre México.
run https://listado.mercadolibre.com.mx/%TEXTO4%#D[A:%texto%]
return
f6::
InputBox, texto5, Texto de búsqueda, Ingrese el término de búsqueda para amazon México.
run https://www.amazon.com.mx/s?k=%texto5%&__mk_es_MX=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2
return
f7::
InputBox, texto6, Texto de búsqueda, Ingrese el texto de búsqueda para amazon España.
run https://www.amazon.es/s?k=%texto6%&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2
return
f8::
InputBox, texto7, Texto de búsqueda, Ingresa la búsqueda para amazon.com
run https://www.amazon.com/s?k=%texto7%&ref=nb_sb_noss_2
return
f9::
InputBox, texto8, Ingresar búsqueda, ingresar la búsqueda de mercado libre argentina.
run https://listado.mercadolibre.com.ar/%texto8%#D[A:%texto8%]
return

f10::
InputBox, texto9, Ingresar búsqueda, Ingresar la búsqueda de facebook.
run https://www.facebook.com/search/top?q=%C3%%texto9%
return
f11::
InputBox, texto10, Ingresar búsqueda, Ingresa la búsqueda para twitter.
run https://twitter.com/search?q=%texto10%&src=typed_query
return
#^f1::
InputBox, texto11, Ingresar búsqueda, Ingresa la búsqueda para bing.
run https://www.bing.com/search?q=%texto11%&form=QBLH&sp=-1&pq=ho&sc=9-2&qs=n&sk=&cvid=9F7BDB2914EA4C7988124D49233601D0
return
^#s::
InputBox texto12, Ingresa búsqueda, Ingresa búsqueda para spotify
run https://open.spotify.com/search/%texto12%
return
#n::
InputBox, texto13, Ingresar búsqueda, Ingresar búsqueda para netflix.
run https://www.netflix.com/search?q=%texto13%
return
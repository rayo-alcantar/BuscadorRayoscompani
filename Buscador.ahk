Sapi := ComObjCreate("SAPI.SpVoice")
Sapi.Rate := 4
Sapi.Volume :=85
soundBeep, 440, 250
sleep, 100
Sapi.Speak("Bienvenido al buscador automatizado. Pulsa control + alt + m para abrir el menú, control + shift + q para cerrar el programa, o control + shift  + h para leer la ayuda del mismo. ¡Qué lo disfrutes!")


Menu, MenuName, add, xnxx.com, xnxx
Menu, MenuName, Add, pornhub.com, pornhub
Menu, MenuName, Add, youtube.com, youtube
Menu, MenuName, Add, google.com, google
Menu, MenuName, Add, mercado libre méxico, mlmx
Menu, MenuName, Add, Amazon méxico, amazonmx
Menu, MenuName, Add, Amazon España, amazones
Menu, Menuname, add, amazon.com, amazoncom
Menu, menuname, Add, Mercado Libre Argentina, mlarg
Menu, menuname, add, Facebook, facebook
menu, menuname, add, twitter, twitter
menu, menuname, add, Bing, bing
menu, menuname, add, Spotify, spotify
menu, menuname, add, Netflix, netflix
menu, menuname, add, NVDA En español, nvda
menu, menuname, add, Cerrar, cerrar

^!m::
Menu, MenuName, Show
return

xnxx()
{
InputBox, texto3, Texto de búsqueda, Ingresa el término a buscar en xnxx.com
run https://www.google.com
sleep, 3000
Clipboard := "https://www.xnxx.com/search/"
send, ^+n
sleep, 500
send, !d
sleep, 400
send, ^v
Clipboard := texto3
sleep, 400
send, ^v
sleep, 300
send, {enter}
return
}
pornhub()
{
InputBox, texto2, Texto de búsqueda, Ingrese la búsqueda de pornhub.
run https://www.google.com
sleep, 3000
Clipboard := "https://es.pornhub.com/video/search?search="
send, ^+n
sleep, 500
send, !d
sleep, 400
send, ^v
Clipboard := texto2
sleep, 400
send, ^v
sleep, 300
send, {enter}
return
}
youtube()
{
InputBox, texto2, Texto de búsqueda, Ingrese el texto para buscar en youtube.
run https://www.youtube.com/results?search_query=%texto2%
return
}
google()
{
InputBox, texto, Texto de búsqueda, Ingrese el texto de búsqueda en google
Run https://www.google.com/search?q=%texto%
Return
}
mlmx()
{
InputBox, texto4, Texto de búsqueda, Ingresa la búsqueda para mercado libre México.
run https://listado.mercadolibre.com.mx/%TEXTO4%#D[A:%texto%]
return
}
amazonmx()
{
InputBox, texto5, Texto de búsqueda, Ingrese el término de búsqueda para amazon México.
run https://www.amazon.com.mx/s?k=%texto5%&__mk_es_MX=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2
return
}
amazones()
{
InputBox, texto6, Texto de búsqueda, Ingrese el texto de búsqueda para amazon España.
run https://www.amazon.es/s?k=%texto6%&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2
return
}
amazoncom()
{
InputBox, texto7, Texto de búsqueda, Ingresa la búsqueda para amazon.com
run https://www.amazon.com/s?k=%texto7%&ref=nb_sb_noss_2
return
}
mlarg()
{
InputBox, texto8, Ingresar búsqueda, ingresar la búsqueda de mercado libre argentina.
run https://listado.mercadolibre.com.ar/%texto8%#D[A:%texto8%]
return
}
facebook()
{
InputBox, texto9, Ingresar búsqueda, Ingresar la búsqueda de facebook.
run https://www.facebook.com/search/top?q=%C3%%texto9%
return
}
twitter()
{
InputBox, texto10, Ingresar búsqueda, Ingresa la búsqueda para twitter.
run https://twitter.com/search?q=%texto10%&src=typed_query
return
}
bing()
{
InputBox, texto11, Ingresar búsqueda, Ingresa la búsqueda para bing.
run https://www.bing.com/search?q=%texto11%&form=QBLH&sp=-1&pq=ho&sc=9-2&qs=n&sk=&cvid=9F7BDB2914EA4C7988124D49233601D0
return
}
spotify()
{
InputBox texto12, Ingresa búsqueda, Ingresa búsqueda para spotify
run https://open.spotify.com/search/%texto12%
return
}
netflix()
{
InputBox, texto13, Ingresar búsqueda, Ingresar búsqueda para netflix.
run https://www.netflix.com/search?q=%texto13%
return
}
nvda()
{
InputBox, texto14, Ingresar búsqueda, Ingresa la búsqueda para NVDA.es.
run https://nvda.es/?s=%texto14%
return
}
cerrar()
{
Sapi.Speak("Hasta luego!")
sleep, 50
SoundBeep, 1000, 200
exitApp
return
}
sleep, 5000

^+h::
run readme.txt
return

^+q::
cerrar()
Return
f4::
google()
Return

f3::
youtube()
return

F2::
pornhub()
return

f1::
xnxx()
return

f5::
mlmx()
return

f6::
amazonmx()
return

f7::
amazones()
return

f8::
amazoncom()
return

f9::
mlarg()
return

f10::
facebook()
return

f11::
twitter()
return

#^f1::
bing()
return

^#s::
spotify()
return

#n::
netflix()
return

^f3::
nvda()
return

Sapi := ComObjCreate("SAPI.SpVoice")
Sapi := ComObjCreate("SAPI.SpVoice")
Sapi.Rate := 4
Sapi.Volume :=85
soundBeep, 440, 250
sleep, 100
Sapi.Speak("Bienvenido al buscador automatizado. Pulsa control + alt + m para abrir el menú, control + shift + q para cerrar el programa, o control + shift  + h para leer la ayuda del mismo. ¡Qué lo disfrutes!", 1)

Menu, MenuName, add, xnxx.com, buscar
Menu, MenuName, Add, Pornhub.com, buscar
Menu, MenuName, Add, Youtube.com, buscar
Menu, MenuName, Add, Google.com, buscar
Menu, MenuName, Add, Mercado libre méxico, buscar
Menu, MenuName, Add, Amazon méxico, buscar
Menu, MenuName, Add, Amazon España, buscar
Menu, Menuname, add, Amazon.com, buscar
Menu, menuname, Add, Mercado Libre Argentina, buscar
Menu, menuname, add, Facebook, buscar
menu, menuname, add, Twitter, buscar
menu, menuname, add, Bing, buscar
menu, menuname, add, Spotify, buscar
menu, menuname, add, Netflix, buscar
menu, menuname, add, NVDA En español, buscar
menu, menuname, add, Cerrar, cerrar

^!m::Menu, MenuName, Show
f1::actualizador("2.2")

buscar(ItemName, ItemPos, MenuName) {
InputBox, cadena, Texto de búsqueda, Ingresa el término a buscar en %ItemName%
sitios := ["https://www.xnxx.com/search/" cadena " -incognito -inprivate", "https://es.pornhub.com/video/search?search=" cadena " -incognito -inprivate", "https://www.youtube.com/results?search_query=" cadena, "https://www.google.com/search?q=" cadena, "https://listado.mercadolibre.com.mx/" cadena "#D[A:%texto%]", "https://www.amazon.com.mx/s?k=" cadena "&__mk_es_MX=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2", "https://www.amazon.es/s?k=" cadena "%&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2", "https://www.amazon.com/s?k=" cadena "&ref=nb_sb_noss_2", "https://listado.mercadolibre.com.ar/" cadena "#D[A:%texto8%]", "https://www.facebook.com/search/top?q=%C3%" cadena, "https://twitter.com/search?q=" cadena "&src=typed_query", "https://www.bing.com/search?q=" cadena "%&form=QBLH&sp=-1&pq=ho&sc=9-2&qs=n&sk=&cvid=9F7BDB2914EA4C7988124D49233601D0", "https://open.spotify.com/search/" cadena, "https://www.netflix.com/search?q=" cadena, "https://nvda.es/?s=" cadena]
run, % sitios[ItemPos]
}

cerrar:
Sapi.Speak("Hasta luego!", 1)
sleep, 50
SoundBeep, 1000, 200
exitapp
return

sleep, 5000

^+h::
run readme.txt
return

^+q::
Sapi.Speak("Hasta luego!")
sleep, 50
SoundBeep, 1000, 200
exitapp
return

actualizador(versionActual) {
Web := ComObjCreate("WinHttp.WinHttpRequest.5.1")
Web.Open("GET", "http://www.rayoscompani.260mb.net/cosos.html", true)
Web.Send()
Web.WaitForResponse()
Data := Web.ResponseText
RegExMatch(Data, "Buscador.{20,30}zip", link)
MsgBox, 0, Atención, La versión actual del script es; %link%
}

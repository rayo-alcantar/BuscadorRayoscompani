Sapi := ComObjCreate("SAPI.SpVoice")
Sapi := ComObjCreate("SAPI.SpVoice")
Sapi.Rate := 4
Sapi.Volume :=85
soundBeep, 440, 250
sleep, 100
Sapi.Speak("Bienvenido al buscador automatizado. Pulsa control + alt + m para abrir el menú, control + shift + q para cerrar el programa, o control + shift  + h para leer la ayuda del mismo. ¡Qué lo disfrutes!", 1)

version = V1.4
SetTimer, actualizar, 10800000

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

sleep 9000
gosub actualizar

^!m::Menu, MenuName, Show

buscar(ItemName, ItemPos, MenuName) {
sleep 150
InputBox, cadena, Texto de búsqueda, Ingresa el término a buscar en %ItemName%
if (cadena = "")
return
sitios := ["https://www.xnxx.com/search/" cadena " -incognito -inprivate", "https://es.pornhub.com/video/search?search=" cadena " -incognito -inprivate", "https://www.youtube.com/results?search_query=" cadena, "https://www.google.com/search?q=" cadena, "https://listado.mercadolibre.com.mx/" cadena "#D[A:%texto%]", "https://www.amazon.com.mx/s?k=" cadena "&__mk_es_MX=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2", "https://www.amazon.es/s?k=" cadena "%&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2", "https://www.amazon.com/s?k=" cadena "&ref=nb_sb_noss_2", "https://listado.mercadolibre.com.ar/" cadena "#D[A:%texto8%]", "https://www.facebook.com/search/top?q=%C3%" cadena, "https://twitter.com/search?q=" cadena "&src=typed_query", "https://www.bing.com/search?q=" cadena "%&form=QBLH&sp=-1&pq=ho&sc=9-2&qs=n&sk=&cvid=9F7BDB2914EA4C7988124D49233601D0", "https://open.spotify.com/search/" cadena, "https://www.netflix.com/search?q=" cadena, "https://nvda.es/?s=" cadena]
run, % sitios[ItemPos]
}

^+h::
run readme.txt
return

^+q::
cerrar:
Sapi.Speak("Hasta luego!")
sleep, 50
SoundBeep, 1000, 200
ExitApp

actualizar:
actualizador(version)
return

actualizador(versionActual) {
Web := ComObjCreate("WinHttp.WinHttpRequest.5.1")
Web.Open("GET", "https://api.github.com/repos/rayo-alcantar/BuscadorRayoscompani/releases", true)
Web.Send()
Web.WaitForResponse()
Data := Web.ResponseText
RegExMatch(Data, "V\d\.\d", version)
if (versionActual != version)
MsgBox, 4, ¡Atención!,
(
¡Hay una nueva versión del script!; %version%.
 ¿Quieres descargarla ahora?
	)
	IfMsgBox yes
	RegExMatch(Data, "https...github.com.rayo.alcantar.BuscadorRayoscompani.releases.download.version.tag.Buscador.automatizado.by.rayoscompaniV\d\.\d.zip", link)
run %link%
}

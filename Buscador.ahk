#include include\sapi.ahk
sprate("4")
spvolume("85")
soundBeep, 440, 250
sleep, 100
speak("Bienvenido al buscador automatizado. Pulsa control + alt + m para abrir el menú, control + shift + q para cerrar el programa, o control + shift  + h para leer la ayuda del mismo. ¡Que lo disfrutes!", 1)

version = V1.5
SetTimer, actualizar, 10800000
;organización de páginas por categoría.
Menu, cat1, Add, Pornhub.com, buscar
Menu, Cat1, add, xnxx.com, buscar
Menu, Cat1, add, Xvideos.com, buscar
Menu,Cat1, add, morritastube.xxx, buscar
menu, cat2, add, Netflix, buscar
menu, cat2, add, SoundCloud, buscar
menu, cat2, add, Spotify, buscar
Menu, cat2, Add, Youtube.com, buscar
menu, cat3, add, Bing, buscar
Menu, cat3, Add, Google.com, buscar
Menu, cat4, add, Amazon.com, buscar
Menu, cat4, Add, Amazon España, buscar
Menu, cat4, Add, Amazon méxico, buscar
Menu, cat4, Add, Mercado Libre Argentina, buscar
Menu, cat4, Add, Mercado libre méxico, buscar
Menu, cat5, add, Facebook, buscar
menu, cat5, add, Twitter, buscar
menu, cat6, add, GitHub, buscar
menu, cat6, add, NVDA En español, buscar

;Creamos las categorías:
Menu, menuname, Add, Porno, :cat1
Menu, menuname, Add, Multimedia, :cat2
Menu, menuname, Add, Motores de búsqueda, :cat3
Menu, menuname, Add, Tienda, :cat4
Menu, menuname, Add, Redes sociales, :cat5
Menu, menuname, Add, Miscelánea, :cat6
menu, menuname, add, Cerrar, cerrar

sleep 9000
gosub actualizar

^!m::Menu, MenuName, Show

buscar(ItemName, ItemPos, MenuName) {
sleep 150
InputBox, cadena, Texto de búsqueda, Ingresa el término a buscar en %ItemName%
;Agrega mensaje de error en campo en blanco.
if (cadena) = ""
{
MsgBox, 16, Error, Por favor introduce un criterio de búsqueda.
return
}
;Porno.
sitios1 := ["https://es.pornhub.com/video/search?search=" cadena, "https://www.xnxx.com/search/" cadena, "https://www.xvideos.com/?k=" cadena, "https://www.morritastube.xxx/?s=", cadena]
;multimedia.
sitios2 := ["https://www.netflix.com/search?q=" cadena, "https://soundcloud.com/search?q=" cadena, "https://open.spotify.com/search/" cadena, "https://www.youtube.com/results?search_query=" cadena]
;Motores búsqueda
sitios3 := ["https://www.bing.com/search?q=" cadena "%&form=QBLH&sp=-1&pq=ho&sc=9-2&qs=n&sk=&cvid=9F7BDB2914EA4C7988124D49233601D0", "https://www.google.com/search?q=" cadena]
;Tiendas
sitios4 := ["https://www.amazon.com/s?k=" cadena "&ref=nb_sb_noss_2", "https://www.amazon.es/s?k=" cadena "%&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2", "https://www.amazon.com.mx/s?k=" cadena "&__mk_es_MX=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2", "https://listado.mercadolibre.com.ar/" cadena "#D[A:%texto8%]", "https://listado.mercadolibre.com.mx/" cadena "#D[A:%texto%]"]
;Redes
sitios5 := ["https://www.facebook.com/search/top?q=%C3%" cadena, "https://twitter.com/search?q=" cadena "&src=typed_query"]
;Misc
sitios6 := ["https://github.com/search?q=" cadena, "https://nvda.es/?s=" cadena]
;Lo siguiente es comprobar cada submenú para ir obteniendo la posición y selección correcta al momento de ejecutar la página.
if A_ThisMenu = cat1
{
run, % sitios1[ItemPos]
;Abrir ventana en incógnito.
Sleep 2000
send, ^+n
sleep 100
Send, % sitios1[ItemPos]
sleep 250
send {enter}
return
}
if A_ThisMenu = cat2
{
run, % sitios2[ItemPos]
}
if A_ThisMenu = cat3
{
run, % sitios3[ItemPos]
}
if A_ThisMenu = cat4
{
run, % sitios4[ItemPos]
}
if A_ThisMenu = cat5
{
run, % sitios5[ItemPos]
}
if A_ThisMenu = cat6
{
run, % sitios6[ItemPos]
}
}

^+h::
run readme.txt
return

^+q::
cerrar:
speak("Hasta luego!")
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

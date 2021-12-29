#include include\sapi.ahk
#include include\translator.au3.ahk
#include include\updater.ahk
#include include\zip.ahk
;notice: This program is written in Spanish, which means that the translatable messages and comments are in that language.
sprate("4")
spvolume("85")
soundBeep, 440, 250
;if (InStr(A_language,"0a") = "3")
;{
;global Idioma := "es"
;}
;else
;{
global idioma := "en"
;}
speak(translate(idioma, "Bienvenido al buscador automatizado. Pulsa control + alt + m para abrir el menú, control + shift + q para cerrar el programa, o control + shift  + h para leer la ayuda del mismo. ¡Que lo disfrutes!"), 1)
version = V1.7
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
Menu, cat4, Add, % translate(idioma, "Amazon España"), buscar
Menu, cat4, Add, % translate(idioma, "Amazon méxico"), buscar
Menu, cat4, Add, % translate(idioma, "Mercado Libre Argentina"), buscar
Menu, cat4, Add, % translate(idioma, "Mercado libre méxico"), buscar
Menu, cat5, add, Facebook, buscar
menu, cat5, add, Twitter, buscar
menu, cat6, add, GitHub, buscar
menu, cat6, add, % translate(idioma, "NVDA En español"), buscar

;Creamos las categorías:
Menu, menuname, Add, % translate(idioma, "Porno"), :cat1
Menu, menuname, Add, % translate(idioma, "Multimedia"), :cat2
Menu, menuname, Add, % translate(idioma, "Motores de búsqueda"), :cat3
Menu, menuname, Add, % translate(idioma, "Tienda"), :cat4
Menu, menuname, Add, % translate(idioma, "Redes sociales"), :cat5
Menu, menuname, Add, % translate(idioma, "Miscelánea"), :cat6
menu, menuname, add, % translate(idioma, "Cerrar"), cerrar

sleep 9000
gosub actualizar

^!m::Menu, MenuName, Show

buscar(ItemName, ItemPos, MenuName) {
sleep 100
textToTranslate :=translate(idioma, "Ingresa el término a buscar en")
InputBox, cadena, % translate(idioma, "Texto de búsqueda"), %textToTranslate% %ItemName%
;Agrega mensaje de error en campo en blanco.
if (cadena) = ""
{
MsgBox, 16, % translate(idioma, "Error"), % translate(idioma, "Por favor introduce un criterio de búsqueda.")
return
}
;Porno.
sitios1 := ["https://es.pornhub.com/video/search?search=" cadena, "https://www.xnxx.com/search/" cadena, "https://www.xvideos.com/?k=" cadena, "https://www.morritastube.xxx/?s=" cadena]
;multimedia.
sitios2 := ["https://www.netflix.com/search?q=" cadena, "https://soundcloud.com/search?q=" cadena, "https://open.spotify.com/search/" cadena, "https://www.youtube.com/results?search_query=" cadena]
;Motores búsqueda
sitios3 := ["https://www.bing.com/search?q=" cadena "%&form=QBLH&sp=-1&pq=ho&sc=9-2&qs=n&sk=&cvid=9F7BDB2914EA4C7988124D49233601D0", "https://www.google.com/search?q=" cadena]
;Tiendas
sitios4 := ["https://www.amazon.com/s?k=" cadena "&ref=nb_sb_noss_2", "https://www.amazon.es/s?k=" cadena "&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2", "https://www.amazon.com.mx/s?k=" cadena "&__mk_es_MX=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss_2", "https://listado.mercadolibre.com.ar/" cadena "#D[A:%texto8%]", "https://listado.mercadolibre.com.mx/" cadena "#D[A:%texto%]"]
;Redes
sitios5 := ["https://www.facebook.com/search/top?q=%C3%" cadena, "https://twitter.com/search?q=" cadena "&src=typed_query"]
;Misc
sitios6 := ["https://github.com/search?q=" cadena, "https://nvda.es/?s=" cadena]
;Lo siguiente es comprobar cada submenú para ir obteniendo la posición y selección correcta al momento de ejecutar la página.
if A_ThisMenu = cat1
{
;gui para el menú de las opciones del incógnito
Gui, Add, Text,, % translate(idioma, "Selecciona una de las opciones siguientes:")
gui, add, button, Gnormal, % translate(idioma, "abrir en ventana normal")
gui, add, button, Gprivate, % translate(idioma, "abrir en incógnito (edge y chrome)")
gui, add, button, Gfirefox, % translate(idioma, "abrir en incógnito (firefox)")
gui, show,, % translate(idioma, "¿Quiéres abrir en incógnito?")
;obtener el resultado final del sitio seleccionado y su búsqueda en una variable global ya que las siguientes funciones la van a requerir para funcionar y ejecutar corectamente la búsqueda deseada.
global SelectedSite := sitios1[ItemPos]
return

normal:
run, %SelectedSite%
return

private:
run, www.google.com
;Abrir ventana en incógnito.
Sleep 2000
send, ^+n
sleep 100
Send, %SelectedSite%
sleep 250
send {enter}
return

firefox:
run, www.google.com
;Abrir ventana en incógnito.
Sleep 2000
send, ^+p
sleep 100
Send, %SelectedSite%
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
run, doc\readme %idioma%.txt
return

^+q::
cerrar:
speak(translate(idioma, "Hasta luego!"))
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
text :=translate(idioma, "¡Hay una nueva versión del script!")
text2 :=translate(idioma, "¿Quieres descargarla ahora?")
MsgBox, 4, % translate(idioma, "¡Atención!"), %text% %version%. %text2%
IfMsgBox yes
{
RegExMatch(Data, "https...github.com.rayo.alcantar.BuscadorRayoscompani.releases.download.version.tag.Buscador.automatizado.by.rayoscompaniV\d\.\d.zip", link)
_Updater_Update(link, "Buscador.zip")
MsgBox, 4, % translate(idioma, "Actualización descargada"), % translate(idioma, "¿Te gustaría extraer los archivos?")
IfMsgBox yes
{
Unzip(A_ScriptDir "\Buscador.zip`n", A_ScriptDir)
MsgBox, 48, % translate(idioma, "Listo"), % translate(idioma, "la actualización se ha completado correctamente.")
}
else
{
MsgBox, 0, % translate(idioma, "Aviso"), % translate(idioma, "Deberás extraer los contenidos del archivo buscador.zip para completar la actualización. El programa se cerrará.")
}
exitapp
return
}
}
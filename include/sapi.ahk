;Sapi 5 library converted to AHK
;Author: Mateo Cedillo
global Sapi := ComObjCreate("SAPI.SpVoice")
if ErrorLevel
{
MsgBox, Error, Could not initialize sapi 5 object.
}
speak(text, Ivalue = 0)
{
Sapi.Speak(text, Ivalue)
}
SpRate(rate)
{
Sapi.Rate := rate
}
SPVolume(level)
{
Sapi.Volume :=level
}
;these are the values to use with the second speech parameter.

;Value

;Description

;0

;Default – Synchronous. Control waits until the speaking is done.

;1

;Asynchronous. Control returns immediately after the command has been accepted which may be BEFORE the text is actively spoken.

;2

;Purge Before Speak.

;All other text statements are purged before it speaks.

;4

;Is File Name.

;Instead of reading the text passed, opens the file and reads the file specified.

;8

;IsXML. You can send grammatical and pronunciation rules to the Speech engine (see below).

;16

;IsNotXML. By default, the variables are not read as XML.

;32

;PersistXML. Changes made in one speak command will persist to other calls to Speak.

;64

;SpeakPunctuation

;With this flag, punctuation is actually spoken so the "." becomes the word "period"

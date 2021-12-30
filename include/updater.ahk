_Updater_Update(S_URL, fileName, Overwrite := True, UseProgressBar := True) {
If (!Overwrite && FileExist(FileName))
Return
If (UseProgressBar) {
WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
if ErrorLevel
{
MsgBox, Error, Could not initialize WinHttpRequest object.
}
WebRequest.Open("HEAD", s_URL)
WebRequest.Send()
FinalSize := WebRequest.GetResponseHeader("Content-Length")
;#If FinalSize= ""
;MsgBox, 16, Error, Could not get the file sice.
Progress, H80, , Downloading update..., please wait
SetTimer, __UpdateProgressBar, 100
}
UrlDownloadToFile, %s_url%, %FileName%
If (UseProgressBar) {
sleep, 2000
Progress, Off
SetTimer, __UpdateProgressBar, Off
}
Return

__UpdateProgressBar:
CurrentSize := FileOpen(Filename, "r").Length
CurrentSizeTick := A_TickCount
Speed := Round((CurrentSize/1024-LastSize/1024)/((CurrentSizeTick-LastSizeTick)/1000)) . " Kb/s"
LastSizeTick := CurrentSizeTick
LastSize := FileOpen(filename, "r").Length
PercentDone := Round(CurrentSize/FinalSize*100)
Progress, %PercentDone%, %PercentDone%`% Done, Downloading...  (%Speed%), Downloading %SaveFileAs% (%PercentDone%`%)
Return
}
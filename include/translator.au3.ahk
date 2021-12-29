;UDF to translate your applications into different languages.
;This UDF was created by Mateo Cedillo
;#include-once
GetLanguageName(file)
{
IniRead, nlgname, "lng\" file ".lang", Language info, Name
}
GetLanguageCode($file)
{
return IniRead, nlgcode, "lng\" file ".lang", Language info, Code
}
GetLanguageAuthors($file)
{
return IniRead, nlgauthors, "lng\" file ".lang", Language info, Author
}
GetLanguageCopyright($file)
{
return IniRead, nlgcpr, "lng\" file ".lang", Language info, Copyright
}
GetLanguageVersion($file)
{
return IniRead, nlgversion, "lng\" file ".lang", Language info, Version
}

translate(LanguageName, string)
{
    global
    ;msgbox, 0, result, IniRead, strings, %a_scriptDir%\LNG\%languageName%.lang, strings, %string%
IniRead, strings, %a_scriptDir%\LNG\%languageName%.lang, strings, %string%
IfInString, strings, ERROR
{
return string
}
else
{
Return strings
}
}
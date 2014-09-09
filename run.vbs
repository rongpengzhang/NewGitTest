Dim WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
return = WshShell.Run("cmd /c rails s -p 4000 > output.txt",0,true)
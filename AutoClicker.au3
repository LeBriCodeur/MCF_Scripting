;~ Aroun Le BriCodeur
;~ MCF AutoClicker v 0.2
;~ pour AkaKwak
;~ Mise en ligne pour avoir une save et si besoin pour d'autre personnes
;~ Script devant être exécuté avec AutoIt
#include<IE.au3>
#include <Misc.au3>

HotKeySet("{ESC}" , "MCF_Close")
HotKeySet("{SPACE}" , "MCF_StartAndPause")

;~ Taille des marges
Const $marge_x = 60 ;~ marge de gauche
Const $marge_y = 60 ;~ marge du haut

;~ Delay en ms entre les clics
Const $Delay = 40

;~ Troll link
Const $myLink = "https://youtu.be/MYZ67-Sh7kM?t=23"

;~ Variables init
Dim $axe_X = MouseGetPos()[0]
Dim $axe_y = MouseGetPos()[1]
Dim $click = False
Dim $NoClick = False
Const $win_w = @DeskTopWidth
Const $win_H = @DeskTopHeight
$dll = DllOpen("user32.dll")

;~ Message au lancement du script
MsgBox(64 , "MCF - AutoClicker" , "Coucou toi !" & @CRLF & "La consigne est simple tu appuie sur la barre ESPACE pour lancer l'autoClicker ou le mettre en pause..." & @CRLF & "Pour le stopper tu appuie sur ECHAPPE :D" & @CRLF & "En mettant le curseur sur les bords de l'écran le script se mettra aussi en pause")

;~ Si tu appuie sur oui ça ouvre le lien indiqué | Non quittera quand même ... Roooohhh Le trolleur ... :D
Func MCF_Close()
    $confirm = MsgBox(4 , "MCF - AutoClicker" , "Salut sale cheater !" & @CRLF & "Non mais si faut le dire tu triche..." & @CRLF & "Hein ???..." & @CRLF & "Moi j'ai rien fais !!! " & @CRLF & " le script est fait pour installer plus vite c'est tout :D" & @CRLF & "Souhaites-tu quitter ?")
    IF $confirm = 6 Then
        $OpenLink = _IECreate()
        _IENavigate($OpenLink , $myLink)
    EndIf
    Exit
EndFunc


Func MCF_StartAndPause()
   If $click = False Then
        $click = True
        $NoClick = False
        ToolTip("MCF - AutoClicker :: Activé" , 0 , 0)
   Else
        $click = False
        $NoClick = True
        ToolTip("MCF - AutoClicker :: En pause" , 0 , 0)
   EndIf
EndFunc

Func MouseMoving()
    If $NoClick Then
        ToolTip("MCF - AutoClicker :: En pause" , 0 , 0)
        Sleep(1000)
        Return
    EndIf
        $axe_X = MouseGetPos()[0]
        $axe_y = MouseGetPos()[1]
        Sleep(50)
        If $axe_X <= $marge_x Or $axe_y <= $marge_y Or $axe_X > ($win_w - $marge_x) Or $axe_Y > ($win_h - $marge_Y) Then
            $click = False
            ToolTip("MCF - AutoClicker :: En pause" , 0 , 0)
        Else
            $click = True
            ToolTip("MCF - AutoClicker :: Activé" , 0 , 0)
        EndIf
EndFunc

While 1
    If _IsPressed ( "02" ) = 1 Then
        Sleep ( 1000 )
        $click = True
        $NoClick = False
    EndIf

    MouseMoving()
    If $click And Not $NoClick Then
        MouseClick("left")
        Sleep($Delay)
    EndIf
sleep(10)
WEnd
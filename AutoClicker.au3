;~ Aroun Le BriCodeur
;~ MCF AutoClicker v 0.3
;~ pour AkaKwak
;~ Edit 0.3 : Un nombre de clic est désormais configurable
;~ Script devant être exécuté avec AutoIt

#include<IE.au3>
#include <Misc.au3>

HotKeySet("{ESC}" , "MCF_Close")
HotKeySet("{SPACE}" , "activNewClik")

;~ Constantes init
Const $marge_x = 60 ;~ marge de gauche et droite
Const $marge_y = 60 ;~ marge du haut et bas
Const $clickParAction = 20 ;~ 20 clics par passage de la boucle
Const $Delay = 40 ;~ Delay en ms du temps de passage entre chaque boucle
Const $win_w = @DeskTopWidth ;~ Largeur de l'écran
Const $win_H = @DeskTopHeight ;~ Hauteur de l'écran
Const $myLink = "https://youtu.be/MYZ67-Sh7kM?t=23" ;~ Troll link

;~ Variables init
Dim $axe_X = MouseGetPos()[0] ;~ init vecteur X de la souris
Dim $axe_y = MouseGetPos()[1] ;~ init vecteur Y de la souris
Dim $click = False
Dim $disableClick = True
Dim $NoClick = False

$dll = DllOpen("user32.dll") ;~ Ouverture de la DLL permettant l'appel des commandes et fonctions 

;~ Message au lancement du script
MsgBox(64 , "MCF - AutoClicker" , "Coucou Mr Kwak !" & @CRLF & "La consigne est simple tu appuie sur la barre ESPACE pour lancer l'autoClicker ou le mettre en pause..." & @CRLF & "Pour le stopper tu appuie sur ECHAPPE :D" & @CRLF & "En mettant le curseur sur les bords de l'écran le script se mettra aussi en pause")

;~ Active désactive l'action d'auto clic
Func activNewClik()
    if $click Then
        $click = False
        $NoClick = True
        ShowInfo(False)
    Else
        $axe_X = MouseGetPos()[0]
        $axe_Y = MouseGetPos()[1]
        $click = True
        $disableClick = False
        $NoClick = False
        ShowInfo(True)
    EndIf
EndFunc

;~ Affichage en haut à gauche de l'écran de l'état du script
Func ShowInfo($p_bool)
    if $p_bool Then
        ToolTip("MCF - AutoClicker :: Activé" , 0 , 0)
    Else
        ToolTip("MCF - AutoClicker :: Désactivé" , 0 , 0)
    EndIf
    Sleep(1500)
EndFunc

;~ Si tu appuie sur oui ça ouvre le lien indiqué | Non quittera quand même ... Roooohhh Le trolleur ... :D
Func MCF_Close()
    $confirm = MsgBox(4 , "MCF - AutoClicker" , "Salut sale cheater !" & @CRLF & "Non mais si faut le dire tu triche..." & @CRLF & "Hein ???..." & @CRLF & "Moi j'ai rien fais !!! " & @CRLF & " le script est fait pour installer plus vite c'est tout :D" & @CRLF & "Souhaites-tu quitter ?")
    IF $confirm = 6 Then
        $OpenLink = _IECreate()
        _IENavigate($OpenLink , $myLink)
    EndIf
    Exit
EndFunc

;~ Calcule des marges, 
;~ permet de mettre le script en pause quand le curseur est dans les marges
Func MouseMoving()
    If $disableClick Then
        Sleep(1000)
        Return
    EndIf
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

;~ Boucle qui permet l'action d'auto clique
While 1
    If _IsPressed ( "02" ) = 1 Then
        Sleep ( 1000 )
        $click = True
        $NoClick = False
    EndIf
    MouseMoving()
    If $click And Not $NoClick Then
        MouseClick("left", $axe_X, $axe_Y, 20)
    EndIf
    Sleep ( $Delay )
WEnd
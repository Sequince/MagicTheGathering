;Jacob Thomas
;Magic The Gathering script, quality of life improvements, remember specific decks I enjoyed
;Created April 1st, 2022
;Current: 434


#IF WinActive("ahk_exe Magic.exe")
;Disables 'win' key in MTG
w::
msgbox, no
return


;Get the value of the file for MTG
F1::
myIniFile := A_ScriptDir . "\myIniFile.ini"
IniRead, var, % myIniFile, Deck, myPermanentVar

msgbox % var
return


j::
;Feldon's Cane - Shuffle deck card
;myPermanentVar=71 = Slivers
;Insane Artifact deck =107
;Fun pick 10/10 creature = 129
;Mega buffs, quick burst fun=174
;White/Blue tokens fun = 186
	;Wow!  Mega Creatures turn 2 forever.  Literally.  = 199
;Artifact tokens and quick drop huge creatures = 240
;Fun enchantment white / tokens = 262
;Turn one kill (literally) = 291
;Interesting 'pods' deck.  Upgrade units to next cast cost for 2 mana = 295
;296 'fun' small creatures with Exaulted = 296
;Long games, full control of everything.  Everything. = 310
;Powerful small green elves, heavy pump combos = 317
;Black Vice, cycle hands, quick death, good control = 324
;Black small creatures, really really fast. Solid win rate = 375
;"Life Gain Deck" =?  Fast white littles that build fast and lots of life gain
;Bouncing permanents and force discard = 438
;B/W Tokens, fun, decent deck = 466
;Control creatures, summon 4/4 life steal equip & copy artifact it, mega planes walker = 504
;Changeling Deck, all mons are same 'type' with special ability 'fun' = 513
;CraZy elf army for low cost = 526
;Really strong life gain = 527
;5 colour huge creatures, sometimes fun, 'coalition' win = 543
;red/black - forces enemy draw cards, deal dmg each card, powerful lots clicking = 554
;Control 5 colour, Shrines x5 and Planes Walkers, decent a bit slow = 575
myIniFile := A_ScriptDir . "\myIniFile.ini"

if not (FileExist(myIniFile)) { ; creates the ini file if it does not exist
FileAppend,
(
[Deck]
myPermanentVar=239
), % myIniFile, utf-16 ; save your ini file asUTF-16LE
}

IniRead, var, % myIniFile, Deck, myPermanentVar ; reads the value from the ini file specifying its section and the key

sleep 50
send a
sleep 50
send {up %var%}

MsgBox, 4, , Do you want to increase deck? (Press YES or NO)
IfMsgBox No
{
	send {down %var%}
    return
}

newValue := var + 1
IniWrite % newValue, % myIniFile, Deck, myPermanentVar ; writes the new value to the ini file

var := var + 1
sleep, 1000
;run % "notepad " . myIniFile ; opens notepad to see changes
;msgbox 
send {down %var%}
return
#IF

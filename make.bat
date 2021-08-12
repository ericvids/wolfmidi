@echo off
cls

rd /s /q WLF
rd /s /q MUSIC
rd /s /q MID
del getwlf.exe
del dro2midi.exe
if "%1"=="clean" goto clean

mkdir WLF
mkdir MUSIC
mkdir MID
ver >nul && rem This resets the errorlevel
g++ src\getwlf.cpp -o getwlf.exe
g++ src\dro2midi.cpp src\midiio.cpp -o dro2midi.exe
if errorlevel 1 goto nogcc
for /f %%f in ('dir /b AUDIOT.*') do getwlf %%f WLF
if not exist WLF\WONDERIN.WLF goto nowlf
dro2midi -k 49 -i WLF\COPYPRO.WLF MUSIC\COPYPRO
dro2midi -k 49 -i WLF\CORNER.WLF MUSIC\CORNER
dro2midi -k 49 -i WLF\DUNGEON.WLF MUSIC\DUNGEON
dro2midi -k 49 -i WLF\ENDLEVEL.WLF MUSIC\ENDLEVEL
dro2midi -k 49 -i WLF\FUNKYOU.WLF MUSIC\FUNKYOU
dro2midi -k 49 -i WLF\GETTHEM.WLF MUSIC\GETTHEM
dro2midi -k 49 -i WLF\GOINGAFT.WLF MUSIC\GOINGAFT
dro2midi -k 49 -i WLF\HEADACHE.WLF MUSIC\HEADACHE
dro2midi -k 49 -i WLF\HITLWLTZ.WLF MUSIC\HITLWLTZ
dro2midi -k 49 -i WLF\INTROCW3.WLF MUSIC\INTROCW3
dro2midi -k 49 -i WLF\NAZI_NOR.WLF MUSIC\NAZI_NOR
dro2midi -k 49 -i WLF\NAZI_OMI.WLF MUSIC\NAZI_OMI
dro2midi -k 49 -i WLF\NAZI_RAP.WLF MUSIC\NAZI_RAP
dro2midi -k 49 -i WLF\PACMAN.WLF MUSIC\PACMAN
dro2midi -k 49 -i WLF\POW.WLF MUSIC\POW
dro2midi -k 49 -i WLF\PREGNANT.WLF MUSIC\PREGNANT
dro2midi -k 49 -i WLF\ROSTER.WLF MUSIC\ROSTER
dro2midi -k 49 -i WLF\SALUTE.WLF MUSIC\SALUTE
dro2midi -k 49 -i WLF\SEARCHN.WLF MUSIC\SEARCHN
dro2midi -k 49 -i WLF\SUSPENSE.WLF MUSIC\SUSPENSE
dro2midi -k 49 -i WLF\TWELFTH.WLF MUSIC\TWELFTH
dro2midi -k 49 -i WLF\ULTIMATE.WLF MUSIC\ULTIMATE
dro2midi -k 49 -i WLF\URAHERO.WLF MUSIC\URAHERO
dro2midi -k 49 -i WLF\VICMARCH.WLF MUSIC\VICMARCH
dro2midi -k 49 -i WLF\VICTORS.WLF MUSIC\VICTORS
dro2midi -k 49 -i WLF\WARMARCH.WLF MUSIC\WARMARCH
dro2midi -k 49 -i WLF\WONDERIN.WLF MUSIC\WONDERIN
dro2midi -k 49 -i WLF\XAWARD.WLF MUSIC\XAWARD
dro2midi -k 49 -i WLF\XDEATH.WLF MUSIC\XDEATH
dro2midi -k 49 -i WLF\XEVIL.WLF MUSIC\XEVIL
dro2midi -k 49 -i WLF\XFUNKIE.WLF MUSIC\XFUNKIE
dro2midi -k 49 -i WLF\XGETYOU.WLF MUSIC\XGETYOU
dro2midi -k 49 -i WLF\XJAZNAZI.WLF MUSIC\XJAZNAZI
dro2midi -k 49 -i WLF\XPUTIT.WLF MUSIC\XPUTIT
dro2midi -k 49 -i WLF\XTHEEND.WLF MUSIC\XTHEEND
dro2midi -k 49 -i WLF\XTIPTOE.WLF MUSIC\XTIPTOE
dro2midi -k 49 -i WLF\XTOWER2.WLF MUSIC\XTOWER2
dro2midi -k 49 -i WLF\ZEROHOUR.WLF MUSIC\ZEROHOUR
copy MUSIC\CORNER   "MID\08 - Enemy Around the Corner.mid"
copy MUSIC\DUNGEON  "MID\13 - Into the Dungeons.mid"
copy MUSIC\ENDLEVEL "MID\21 - End of Level.mid"
copy MUSIC\FUNKYOU  "MID\20 - Funk You!.mid"
copy MUSIC\GETTHEM  "MID\03 - Get Them Before They Get You.mid"
copy MUSIC\GOINGAFT "MID\11 - Going After Hitler.mid"
copy MUSIC\HEADACHE "MID\12 - Pounding Headache.mid"
copy MUSIC\HITLWLTZ "MID\24 - Hitler Waltz.mid"
copy MUSIC\INTROCW3 "MID\14 - Kill the S.O.B..mid"
copy MUSIC\NAZI_NOR "MID\01 - Horst-Wessel-Lied.mid"
copy MUSIC\NAZI_OMI "MID\09 - Nazi Anthem.mid"
copy MUSIC\NAZI_RAP "MID\15 - The Nazi Rap.mid"
copy MUSIC\PACMAN   "MID\19 - Wolf Pac.mid"
copy MUSIC\POW      "MID\05 - P.O.W..mid"
copy MUSIC\PREGNANT "MID\10 - Lurking....mid"
copy MUSIC\ROSTER   "MID\23 - Roster.mid"
copy MUSIC\SALUTE   "MID\25 - Salute.mid"
copy MUSIC\SEARCHN  "MID\04 - Searching For the Enemy.mid"
copy MUSIC\SUSPENSE "MID\06 - Suspense.mid"
copy MUSIC\TWELFTH  "MID\16 - Twelfth Hour.mid"
copy MUSIC\ULTIMATE "MID\18 - The Ultimate Challenge.mid"
copy MUSIC\URAHERO  "MID\22 - U R A Hero.mid"
copy MUSIC\VICMARCH "MID\27 - Victory March.mid"
copy MUSIC\VICTORS  "MID\26 - Victors.mid"
copy MUSIC\WARMARCH "MID\07 - The March to War.mid"
copy MUSIC\WONDERIN "MID\02 - Wondering About My Loved Ones.mid"
copy MUSIC\XAWARD   "MID\37 - Award Ceremony.mid"
copy MUSIC\XDEATH   "MID\31 - Death to the Nazis.mid"
copy MUSIC\XEVIL    "MID\34 - Evil Incarnate.mid"
copy MUSIC\XFUNKIE  "MID\30 - Funkie Colonel Bill.mid"
copy MUSIC\XGETYOU  "MID\32 - The SS Gonna Get You.mid"
copy MUSIC\XJAZNAZI "MID\35 - Jazzin' Them Nazis.mid"
copy MUSIC\XPUTIT   "MID\33 - Puttin' It to the Enemy.mid"
copy MUSIC\XTHEEND  "MID\36 - Is This THE END.mid"
copy MUSIC\XTIPTOE  "MID\29 - Tiptoeing Around.mid"
copy MUSIC\XTOWER2  "MID\28 - The Tower.mid"
copy MUSIC\ZEROHOUR "MID\17 - Zero Hour.mid"
del wolfmidi.pk3
zip wolfmidi.pk3 MUSIC\*
ver >nul && rem This resets the errorlevel
if exist MUSIC\HITLWLTZ (
    if exist MUSIC\COPYPRO (
        fc /b MUSIC\HITLWLTZ MUSIC\COPYPRO
        if errorlevel 1 goto warn
    )
)
goto finish

:clean
echo ============
echo Build artifacts have been deleted.
goto done

:nogcc
echo ============
echo ERROR: mingw32 is not installed. Get it by doing this:
echo 1. Install chocolatey (https://chocolatey.org).
echo 2. Enter "choco install mingw zip" in an admin command prompt.
goto done

:nowlf
echo ============
echo ERROR: No WLF files extracted. Make sure you have placed all your AUDIOT.* files in the current directory.
goto done

:warn
echo ============
echo WARNING: HITLWLTZ should generate the exact same .mid file as COPYPRO -- something's wrong with your rip.

:finish
echo ============
echo If you have zip installed, you should now have a wolfmidi.pk3 that you can use in ECWolf.
echo Otherwise, you should have the MIDI files in mid\ and the wolfmidi.pk3 contents in MUSIC\

:done
pause

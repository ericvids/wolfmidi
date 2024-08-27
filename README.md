**wolfmidi**
============

Copyright © 2021-2024 by ericvids.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License v2 ONLY, as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License v2 along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


About
=====

**wolfmidi** is a music enhancement mod for Wolfenstein 3-D and Spear of Destiny by id Software. This mod replaces the AdLib/OPL2 soundtrack with a fully-instrumented General MIDI soundtrack, auto-generated from the games' own data. This *drastically* improves music quality.

Either [ECWolf](http://maniacsvault.net/ecwolf/) or [wolfdosmpu](https://github.com/ericvids/wolfdosmpu/) is required to use this mod. ECWolf is recommended on modern systems. For older systems (or if you prefer the original DOS version of Wolf3D over ECWolf), wolfdosmpu provides an alternative DOS executable to play MIDI through the traditional MPU-401 UART interface.

It is highly recommended to use this mod in conjunction with a MIDI hardware module such as Roland Sound Canvas, or at least through a software synthesizer such as [VirtualMIDISynth](https://coolsoft.altervista.org/en/virtualmidisynth). The Windows default synth is anyway a bit better than OPL2, but it seriously lacks reverb.

If that blurb is enough to make you drool for this mod, head down to [Usage](#usage).

If you're interested why I built this mod, or just want to kill some time, feel free to read on.

How is this different from other Wolf3D music mods?
===================================================

Unlike previous mods of the same nature, the MIDI files in this mod are **completely auto-generated** from the original IMF sound files contained within Wolf3D/Spear, without editing the MIDI files by hand. The conversion is handled by a heavily modified version of dro2midi (original version found at http://www.shikadi.net/utils/dro2midi) and a complete instrument-mapping definition file designed specifically for the Wolf3D/Spear games. The source code to this modified dro2midi and instrument mapping is included in this repository under the terms of the GPL (v2 only).

Previous attempts using older versions of dro2midi (or its predecessor imf2midi) resulted in incomplete instruments or buggy notes and/or playback, requiring editing of the MIDI files themselves to fix the issues (and leading some authors to introduce their own embellishments to the MIDI data, customizing the instrumentation per song and sometimes adding more notes). Because of this practice, the music quality tended to vary across songs. (Even id Software themselves succumbed to doing this with their now-defunct web browser port of Wolf3D, and even rendered the music in low-bitrate OGG to make things worse.) In fact, the inconsistent quality of these previous attempts is what inspired me to make this mod in the first place.

The instrument mapping used in this mod is heavily based off of "official" MIDI files that were once published by the game's original composer, Bobby Prince (which have unfortunately since been removed from his website). However, this mod does NOT include any of these MIDI files -- instead, the MIDI files are built from scratch using the IMF files in the game data. This results in music that is more faithful and consistent with what the game originally sounded like, except now you can choose a better MIDI synth than OPL2.

A note on Bobby Prince's official MIDI files
--------------------------------------------

Note that although Bobby Prince's released General MIDI files may be closer to his intended vision, these are NOT representative of the music that actually appeared in-game -- in fact, these files are _technically remakes_ of the originals, produced in 1993 according to the MIDI files' metadata (a year after Wolf3D's release)! Furthermore, _not all of the songs were remade_, and no complete official MIDI soundtrack exists anywhere.

The original music, while written for MIDI (via Voyetra Sequencer Plus Gold), was likely NOT produced with General MIDI in mind -- this is evidenced by the use of a custom FM "noise" instrument in a few songs, something which does not actually exist in base General MIDI.

Going back to the remakes, they were likely created because several Wolf3D levels were planned to be remade as secret levels in DOOM II, and the DOOM engine only supported General MIDI (it technically supported OPL2/3 only by converting the GM data through the DMX sound engine). In the end, only two of these remakes were actually used since only two secret levels were put in, but I guess Mr. Prince felt at the time that it was a waste not to release the rest of the songs that were remade.

This explains why there were some changes to the songs (the remade GETTHEM.MID in particular sounds vastly different from the original in-game version, with the addition of an Electric Piano bass line and a faster tempo). This also explains why simply using these remakes' instrument mappings for all songs _will_ result in conflicts. That is, the exact same OPL2 patch is reused across several tracks, but the remakes use completely different GM instruments for this same patch (unless you think Shakuhachi, New Age Pad and Muted Electric Guitar all sound the same to you); conversely, some of the original tracks use multiple different OPL2 patches that get mapped to the _same_ GM instrument in the remakes! This likely means that the GM mappings were manually created (or at least modified) after the songs' original OPL2 release.

This mod's philosophy is to map only one GM instrument per OPL2 patch for consistency reasons (with an option to switch to another instrument for a fixed note range, needed for a few special cases involving OPL2 notes that are both chromatic and percussive, e.g., melodic toms). This means that this mod does NOT allow changing to a particular GM instrument on a per-song basis like the official MIDI files did.

Okay, technically you can, but you will have to manage the conversion process per-file or edit the MIDI files directly. But then that goes against the point of this mod -- which is, to automatically generate General MIDI files from just the original game data. Those per-song instrument variations anyway _did_ sound the same in OPL2 since the game data itself did not say otherwise. Some might say that this is too much of a "nostalgia-purist" approach that ignores the intentions of the composer, but one can argue that you can go even more "purist" -- just don't use any music mods at all! -- and besides, this is the particular itch I wanted to scratch. I want to hear the game's music the way I remember it, only with higher quality drums and instruments than OPL2, and I want it to sound consistent across the entire game. If you feel the same, then this mod is for you. If not, there may be another existing music mod that works for you (or, you can modify _this_ mod to your liking; that's the beauty of open source).


Version History
===============

1.20.1 (2024-08-27)
-------------------

- Updated instructions for ECWolf version 1.4.1.  (No changes were made to the MIDI files.)

1.20 (2021-09-22)
-----------------

- Added DOS support via sister project [wolfdosmpu](https://github.com/ericvids/wolfdosmpu/).

1.14 (2021-08-17)
-----------------

- Replaced Blown Bottle with Piccolo to make it sound even mellower (it was
  too loud on non-SC-55 devices).

1.13 (2021-08-17)
-----------------

- Replaced Recorder sound with Blown Bottle, allowing the sound to be pitched as
  high as the original OPL2 patch without ear-piercing artifacts on GM.
- Replaced XPUTIT's bass line from SynthBrass 1 to Lead 8 to compensate for the
  higher pitch of the Blown Bottle while matching the sound to the OPL2 version.
  This has the side effect of making the bass line of SUSPENSE much louder, which
  might need getting used to.
- Pitched down a Tubular Bells patch to avoid getting cut off (out-of-range).

1.12 (2021-08-15)
-----------------

- Small change to minimum time (only affects GOINGAFT).

1.11 (2021-08-14)
-----------------

- Changed some high percussive-melodic notes to better match the OPL2 output.
- dro2midi changes:
  - Added loop length adjustment by specifying a channel to track, followed by
    the number of notes on this channel during the last measure (and, optionally,
    second-to-the-last). The end time of the song will be adjusted by lengthening
    the last measure to be as long as the second-to-the-last one, minus the time
    before the first note on the tracked channel. Now the title song and several
    other songs loop correctly!
  - Placed drumkit change at the start of the track instead of creating a new
    track, because ECWolf currently has a bug where MIDI time offsets are not
    synchronously processed across all tracks.

1.10 (2021-08-12)
-----------------

- Made extensive changes to inst.txt to use custom release time and GS drumkit
  support (details mentioned in dro2midi changes below), as well as to adjust
  balance and compatibility with other synthesizers (XG and MT-32).
- Many songs that previously used Tubular Bells now use a more faithful sound,
  e.g., NAZI_OMI now uses the Recorder patch. (The original WLF encoding used
  staccato notes with long release times, which, without compensation, were
  only previously playable in GM1 using the Tubular Bells patch.)
- Previously incomplete songs due to the use of OPL-specific noise effects,
  e.g., GOINGAFT and INTROCW3, should now sound more complete.
- dro2midi changes:
  - The Roland MT-32 using the MTGM.MID utility uses channels 0-7 and ignores
    channel 8. For compatibility, this version shifts the GM channels down one
    step. (1 maps to 0, 2 maps to 1, etc.) Wolf3d reserves channel 0 for sound
    effects so this should not be a problem.
  - Removed unnecessary reset messages at the start and end of the MIDI file in
    order to reduce latency when using serial-DIN MIDI.
  - Added per-patch customizable minimum time before note-off. Some Wolf3D songs
    trigger staccato notes that have long release times in their OPL instrument
    definition. Since standard GM does not allow specific release times (unlike
    in GS and GM2), the release time is instead simulated by delaying note-off
    events, which works for all GM devices.
  - Added GS drumkit support. While technically not supported by the GM standard,
    Roland GS devices support custom drumkits even when set to GM mode, and these
    kits are extensively used in games like Warcraft I/II (and are also used by
    Bobby Prince in his remade XFUNKIE.MID.) The orchestral drumkit effortlessly
    matches many (but not all) of Wolf3D's songs; for the exceptions, the drumkit
    is automatically selected depending on the other drum sounds used by the
    song. GM1-only devices will silently ignore GS drumkit program changes.

1.00 (2021-06-30)
-----------------

- Initial release.


Usage
=====

Can I play NOW, daddy?
----------------------

Download a pre-built wolfmidi.zip from the [Releases section](https://github.com/ericvids/wolfmidi/releases/).

If you use [ECWolf](http://maniacsvault.net/ecwolf/):
- Copy the .zip in your ECWolf folder.
- Modify your ECWolf startup shortcut to append the command-line parameters " --file wolfmidi.zip" (without the quotes) in the shortcut's Target field.
- Start ECWolf, then immediately go to "Options" -> "Sound Options", then change the "Music Device & Volume" setting from "AdLib/Sound Blaster" to "SDL_mixer MIDI Synth".

If you use [wolfdosmpu](https://github.com/ericvids/wolfdosmpu/), please refer to wolfdosmpu's README.md for full instructions.

Don't hurt MIDI.
----------------

ECWolf seems to use only the first (default) MIDI device reported in the system, which is usually the crappy Microsoft GS Wavetable Synth. You may need [MIDIMapper](https://coolsoft.altervista.org/en/midimapper) to set the Windows default MIDI device.

If you use wolfdosmpu inside DOSBox, select your MIDI device with the help of [this guide](https://www.dosbox.com/wiki/Configuration:MIDI).

Bring "M" on!
-------------

This mod has been tested with the following hardware and software synthesizers (ordered by personal preference):

- Roland SC-D70
  - Equivalent to Roland SC-8820.
- Roland CM-300
  - Equivalent to Roland SC-55.
- [Roland SC-VA VSTi](https://www.roland.com/us/products/rc_sound_canvas_va/)* (costs $69 on Roland Cloud) [(get trial here)](https://static.roland.com/assets/media/zip/scva_win_trial.zip)
  - Essentially an official Roland SC-8820 emulator.
  - See setup requirements below.
- [Coolsoft VirtualMIDISynth](https://coolsoft.altervista.org/en/virtualmidisynth) (free)
  - Soundfont-based software synth -- soundfonts are acquired separately.
  - Tested with [trevor0402's](https://github.com/trevor0402/SC55Soundfont/releases) and [Patch93's](https://musical-artifacts.com/artifacts/1228) SC-55 soundfonts.
- [Yamaha S-YXG50 VSTi](https://veg.by/en/projects/syxg50/)* (abandonware)
  - XG software synth popularized by the original PC versions of Final Fantasy VII/VIII.
  - Formally discontinued, but still available to download above.
  - See setup requirements below.
- [Munt VSTi](http://falcosoft.hu/softwares.html#munt_vsti)* (free)
  - Roland MT-32 emulator -- the VSTi version is easier to setup than regular Munt.
  - See setup requirements below.
- [Munt](https://sourceforge.net/projects/munt/)* (free)
  - Closer to the limitations of an actual MT-32.
  - Also harder to set up than the VSTi version -- like an actual MT-32, it does not support General MIDI until you program it using Roland's [MTGM.MID](https://www.roland.com/us/support/by_product/all/general_apps_tools/508451ba-ab7a-44bb-979c-a4097dfe1142/) utility.
  - See setup requirements below.
- Microsoft GS Wavetable Synth (meh)

A real MT-32 (or CM-32L/CM-64) should also work, by playing Roland's [MTGM.MID](https://www.roland.com/us/support/by_product/all/general_apps_tools/508451ba-ab7a-44bb-979c-a4097dfe1142/) utility on it before launching the game. (I don't have an MT-32, but other users say that Munt is very close.)

*_To use any VSTi for MIDI playback, you will need to do the following:_
  - Setup [loopMIDI](https://www.tobias-erichsen.de/software/loopmidi.html).
    - Make sure to launch loopMIDI after setup and create a loopMIDI Port.
  - Download [SAVIHost](https://www.hermannseib.com/english/savihost.htm).
    - For Roland SC-VA or Munt VSTi, download a _64-bit VST2_ (not VST3) version.
    - For Yamaha S-YXG50, download a _32-bit VST2_ (not VST3) version.
    - The "including keyboard" version is not needed.
  - Copy savihost.exe into the VSTi's installation folder (you may need admin privileges), then rename savihost.exe to use the same name as the main DLL file of the VSTi (e.g., "SOUND Canvas VA.exe", "syxg50.exe", or "MuntVsti.exe").
  - Create a shortcut to the .exe on your desktop (or other preferred location), then launch it.
  - On the SAVIHost window's menu bar, select Devices->MIDI and select the loopMIDI port in Input Port 1. (NOT in Output Port.)
    - Now SAVIHost will receive all messages from any application that outputs MIDI data to the loopMIDI OUT port.
  - For Roland SC-VA, you can enable classic SC-55 sounds:
    - Click the Option button on the VSTi itself.
    - Select SYSTEM from the menu.
    - Select SC-55 in the Map Mode drop-down list.
    - To make this the default, check File->Autosave Plugin Bank on the SAVIHost window.
  - For Munt VSTi, you will want to set GM mode:
    - In the Reset Mode box on the VSTi itself, change the selection from MT32 to GM.
      - Dual Synth is not needed by wolfmidi since it uses only the first 8 channels, but you may leave it on to use for other General MIDI apps.
    - Click the Reset Synths button.
    - To make this the default, check File->Autosave Plugin Bank on the SAVIHost window.
  - Before launching the game, always launch the SAVIHost shortcut on your desktop first; otherwise you will not get any music.
    - If ECWolf refuses to find the loopMIDI device by default, you will also need [MIDIMapper](https://coolsoft.altervista.org/en/midimapper) and set the default MIDI Out device as the loopMIDI port.

*_To use regular Munt (not the VSTi version) for MIDI playback, you will need to do the following:_
  - Setup [loopMIDI](https://www.tobias-erichsen.de/software/loopmidi.html).
    - Make sure to launch loopMIDI after setup and create a loopMIDI Port.
  - Before launching the game:
    - Run the Munt MT-32 shortcut on your Start Menu.
    - Click Tools->New MIDI Port and select the loopMIDI port.
    - Now Munt will receive all messages from any application that outputs MIDI data to the loopMIDI OUT port. More importantly, the virtual MT-32 device is not reinitialized for every app that uses it, potentially erasing the GM settings. (That's why you needed loopMIDI.)
    - Using a MIDI player, play Roland's [MTGM.MID](https://www.roland.com/us/support/by_product/all/general_apps_tools/508451ba-ab7a-44bb-979c-a4097dfe1142/) utility on the loopMIDI device.
    - Finally, launch the game itself.
      - You will need to do the same steps EVERY time, sadly. The VSTi version is highly recommended because GM mode is built into the VSTi.
      - If ECWolf refuses to find the loopMIDI device by default, you will also need [MIDIMapper](https://coolsoft.altervista.org/en/midimapper) and set the default MIDI Out device as the loopMIDI port.

I am H@xx0r Incarnate!
----------------------

If you want to build the mod from scratch, using your own copy of the game(s)' data:

1. Create an admin command prompt window (press WinKey+R, type "cmd" without quotes, and then press Ctrl+Shift+Enter).
2. Install chocolatey (https://docs.chocolatey.org/en-us/choco/setup). **Hint:** Simply copy the command indicated in the **Install with cmd.exe** section and paste it into the admin command prompt window.
3. Immediately afterwards, enter the following command in the same window:
```
choco install git mingw zip
```
4. Close the admin command prompt, create a normal-privilege command prompt (WinKey+R, type "cmd" and just press Enter), and create a clone of the wolfmidi repository by entering the following lines. This shall create a **wolfmidi** subfolder under your Desktop folder (change the target folder according to your preference).
```
cd /d C:\Users\{username-without-brackets}\Desktop
git clone https://github.com/ericvids/wolfmidi.git
```
5. Copy and paste all AUDIOT.* files from your installation of Wolf3D and Spear into the wolfmidi folder you just created. (These AUDIOT files should have the extensions .WL1/.SDM for shareware/demo versions, or .WL6/.SOD for registered/retail versions.)
6. Run the make.bat file.

make.bat does the following:

1. Build the tool executables (getwlf.exe and dro2midi.exe) using g++ (from chocolatey package "mingw", installed earlier)
2. Extract the .WLF files from the AUDIOT.* archives using getwlf.exe
3. Convert the .WLF files to .MID files using dro2midi.exe
4. Bundle the .MID files (without extension, as required by ECWolf) into the final .zip file using InfoZIP (from chocolatey package "zip", installed earlier)

Building from scratch will also allow you to adjust the instrument mapping to your own liking. See the inst.txt file for more details.

**wolfmidi** copyright © 2021 by ericvids.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License v2 ONLY, as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License v2 along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


About
=====

**wolfmidi** is a mod for ECWolf-based ports of Wolfenstein 3-D and Spear of Destiny by id Software to play a General MIDI soundtrack instead of an AdLib/OPL2 soundtrack. This *drastically* improves music quality.

It is highly recommended to use this mod in conjunction with a MIDI hardware module such as Roland Sound Canvas, or at least through a software synthesizer such as VirtualMIDISynth (https://coolsoft.altervista.org/en/virtualmidisynth). However, the Windows default synth is anyway a bit better than OPL2. ;)

If that blurb is enough to make you drool for this mod, head down to [Usage](#usage).

If you're interested why I built this mod, or just want to kill some time, feel free to read on.

How is this different from other Wolf3D music mods?
===================================================

Unlike previous mods of the same nature, the MIDI files in this mod are **completely auto-generated** from the original IMF sound files contained within Wolf3D/Spear, without editing the MIDI files by hand. The conversion is handled by a heavily modified version of dro2midi and a complete instrument-mapping definition file designed specifically for the Wolf3D/Spear games. The source code to this modified dro2midi and instrument mapping is included in this repository under the terms of GPL (v2 only).

Previous attempts using older versions of dro2midi (or its predecessor imf2midi) resulted in incomplete instruments or buggy notes and/or playback, requiring editing of the MIDI files themselves to fix the issues (and leading some authors to introduce their own embellishments to the MIDI data, customizing the instrumentation per song and sometimes adding more notes). Because of this practice, the music quality tended to vary across songs. (Even id Software themselves succumbed to doing this with their now-defunct web browser port of Wolf3D, and even rendered the music in low-bitrate OGG to make things worse.) In fact, the inconsistent quality of these previous attempts is what inspired me to make this mod in the first place.

The instrument mapping used in this mod is heavily based off of the MIDI files that were once published by the game's original composer, Bobby Prince (which have unfortunately since been removed from his website). However, this mod does NOT include any of these MIDI files -- instead, the MIDI files are built from scratch using the IMF files in the game data. This results in music that is more faithful and consistent with what the game originally sounded like, except now you can choose a better MIDI synth than OPL2.

A note on Bobby Prince's official MIDI files
--------------------------------------------

Note that although Bobby Prince's released General MIDI files may be closer to his intended vision, these are NOT representative of the music that actually appeared in-game -- in fact, these files are technically remakes as well, produced in 1993 according to the files' metadata (a year after Wolf3D's release)!

The original music, while written for MIDI (via Voyetra Sequencer Plus Gold), was likely NOT produced with General MIDI in mind -- this is evidenced by the use of a custom FM "noise" instrument in a few songs, something which does not actually exist in base General MIDI.

Going back to the general MIDI remakes, they were likely created because several Wolf3D levels were planned to be remade as secret levels in DOOM II, and the DOOM engine only supported General MIDI (it technically supported OPL2/3 only by converting the GM data through the DMX sound engine). In the end, only two of these remakes were actually used since only two secret levels were put in, but I guess Mr. Prince felt it was a waste not to release the rest of the songs that were remade.

This explains why there were some changes to the songs (the remade GETTHEM.MID in particular sounds vastly different from the original in-game version, with the addition of an Electric Piano bass line and a faster tempo). This also explains why using these official files' instrument mappings for all songs without careful consideration _will_ result in conflicts. That is, the exact same OPL2 patch is used in several tracks where the official General MIDI conversions use completely different instruments (unless you think Shakuhachi, New Age Pad and Muted Electric Guitar all sound the same to you); conversely, some original tracks use multiple different OPL2 patches that get mapped to the _same_ GM instrument in the remakes!

This mod's philosophy is to map only one GM instrument per OPL2 patch for consistency reasons (with an option to switch to another instrument for a fixed note range, needed for a few special cases involving percussion). This means that this mod does NOT allow changing to a particular GM instrument on a per-song basis like the official MIDI files did.

Okay, technically you can, but you will have to manage the conversion process per-file or edit the MIDI files directly. But then that goes against the point of this mod -- which is, to automatically generate General MIDI files from just the original game data. Those per-song instrument variations anyway _did_ sound the same in OPL2 since the game data itself did not say otherwise. Some might say that this is too much of a "nostalgia-purist" approach that ignores the intentions of the composer, but one can argue that you can go even more "purist" -- just don't use any music mods at all! -- and besides, this is the particular itch I wanted to scratch. I want my game music the way I remember it, only with higher quality drums and instruments than OPL2, and I want it to sound consistent across the entire game. If you feel the same, then this mod is for you. If not, there may be another existing music mod that works for you (or, you can modify _this_ mod to your liking; that's the beauty of open source).


Usage
=====

Can I play NOW, daddy?
----------------------

A pre-built wolfmidi.pk3 has been provided for your convenience. Simply [download](wolfmidi.pk3) the file, save it in your ECWolf directory, and modify your ECWolf startup shortcut to append the command-line parameters " --file wolfmidi.pk3" (without the quotes) in the shortcut's Target field.

I am H@xx0r Incarnate
---------------------

If you want to build the .pk3 or the MIDI files from scratch, using your own copy of the game(s)' data:

1. Clone this repository on your local machine.
2. Install chocolatey (https://chocolatey.org).
3. Enter "choco install mingw zip" in an admin command prompt. (You should already know how to do this if you installed chocolatey.)
4. Drop the AUDIOT.WL6 and AUDIOT.SOD files from your installation of Wolf3D/Spear into the same folder as your cloned repository.
5. Run the make.bat file.

make.bat does the following:

1. Build the executables (getwlf.exe and dro2midi.exe) using g++ (from chocolatey package "mingw", installed earlier)
2. Extract the .WLF files from the AUDIOT.* archives using getwlf.exe
3. Convert the .WLF files to .MID files using dro2midi.exe
4. Bundle the .MID files into the final .pk3 file using InfoZIP (from chocolatey package "zip", installed earlier)

Building from scratch will also allow you to adjust the instrument mapping to your own liking. See the inst.txt file for more details.

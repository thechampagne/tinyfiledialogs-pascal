(*
 * zlib License
 * 
 * (C) 2032 XXIV
 * 
 * This software is provided *as-is*, without any express or implied
 * warranty.  In no event will the authors be held liable for any damages
 * arising from the use of this software.
 * 
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 * 
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *)
unit tinyfiledialogs;

{$ifdef fpc}
{$packrecords c}
{$endif}

interface

uses
  ctypes;


type
   PLongint  = ^Longint;
   PSmallInt = ^SmallInt;
   PByte     = ^Byte;
   PWord     = ^Word;
   PDWord    = ^DWord;
   PDouble   = ^Double;
   Ppcchar   = ^pcchar;
   RGB_Array = array[0..2] of cuchar;


{$ifdef WIN32}

  type
     Pwchar_t  = ^wchar_t;

  var
     tinyfd_winUtf8 : cint;cvar;external;

  function tinyfd_utf8toMbcs(aUtf8string:pcchar):pcchar;cdecl;external;

  function tinyfd_utf16toMbcs(aUtf16string:Pwchar_t):pcchar;cdecl;external;

  function tinyfd_mbcsTo16(aMbcsString:pcchar):Pwchar_t;cdecl;external;

  function tinyfd_mbcsTo8(aMbcsString:pcchar):pcchar;cdecl;external;

  function tinyfd_utf8to16(aUtf8string:pcchar):Pwchar_t;cdecl;external;

  function tinyfd_utf16to8(aUtf16string:Pwchar_t):pcchar;cdecl;external;

  function tinyfd_notifyPopupW(aTitle:Pwchar_t; aMessage:Pwchar_t; aIconType:Pwchar_t):cint;cdecl;external;

  function tinyfd_messageBoxW(aTitle:Pwchar_t; aMessage:Pwchar_t; aDialogType:Pwchar_t; aIconType:Pwchar_t; aDefaultButton:cint):cint;cdecl;external;

  function tinyfd_inputBoxW(aTitle:Pwchar_t; aMessage:Pwchar_t; aDefaultInput:Pwchar_t):Pwchar_t;cdecl;external;

  function tinyfd_saveFileDialogW(aTitle:Pwchar_t; aDefaultPathAndFile:Pwchar_t; aNumOfFilterPatterns:cint; aFilterPatterns:PPwchar_t; aSingleFilterDescription:Pwchar_t):Pwchar_t;cdecl;external;

  function tinyfd_openFileDialogW(aTitle:Pwchar_t; aDefaultPathAndFile:Pwchar_t; aNumOfFilterPatterns:cint; aFilterPatterns:PPwchar_t; aSingleFilterDescription:Pwchar_t; 
             aAllowMultipleSelects:cint):Pwchar_t;cdecl;external;

  function tinyfd_selectFolderDialogW(aTitle:Pwchar_t; aDefaultPath:Pwchar_t):Pwchar_t;cdecl;external;

  function tinyfd_colorChooserW(aTitle:Pwchar_t; aDefaultHexRGB:Pwchar_t; aDefaultRGB:array[0..2] of cuchar; aoResultRGB:array[0..2] of cuchar):Pwchar_t;cdecl;external;

{$endif}

  var
     tinyfd_version : array[0..7] of cchar;cvar;external;
     tinyfd_needs : pcchar;cvar;external;
     tinyfd_verbose : cint;cvar;external;
     tinyfd_silent : cint;cvar;external;
     tinyfd_allowCursesDialogs : cint;cvar;external;
     tinyfd_forceConsole : cint;cvar;external;
     tinyfd_assumeGraphicDisplay : cint;cvar;external;
     tinyfd_response : array[0..1023] of cchar;cvar;external;


  function tinyfd_getGlobalChar(aCharVariableName:pcchar):pcchar;cdecl;external;

  function tinyfd_getGlobalInt(aIntVariableName:pcchar):cint;cdecl;external;

  function tinyfd_setGlobalInt(aIntVariableName:pcchar; aValue:cint):cint;cdecl;external;

  procedure tinyfd_beep;cdecl;external;

  function tinyfd_notifyPopup(aTitle:pcchar; aMessage:pcchar; aIconType:pcchar):cint;cdecl;external;

  function tinyfd_messageBox(aTitle:pcchar; aMessage:pcchar; aDialogType:pcchar; aIconType:pcchar; aDefaultButton:cint):cint;cdecl;external;

  function tinyfd_inputBox(aTitle:pcchar; aMessage:pcchar; aDefaultInput:pcchar):pcchar;cdecl;external;

  function tinyfd_saveFileDialog(aTitle:pcchar; aDefaultPathAndFile:pcchar; aNumOfFilterPatterns:cint; aFilterPatterns:Ppcchar; aSingleFilterDescription:pcchar):pcchar;cdecl;external;

  function tinyfd_openFileDialog(aTitle:pcchar; aDefaultPathAndFile:pcchar; aNumOfFilterPatterns:cint; aFilterPatterns:Ppcchar; aSingleFilterDescription:pcchar; 
             aAllowMultipleSelects:cint):pcchar;cdecl;external;

  function tinyfd_selectFolderDialog(aTitle:pcchar; aDefaultPath:pcchar):pcchar;cdecl;external;

  function tinyfd_colorChooser(aTitle:pcchar; aDefaultHexRGB:pcchar; aDefaultRGB:RGB_Array; aoResultRGB:RGB_Array):pcchar;cdecl;external;


{$ifndef WIN32}

  function tinyfd_arrayDialog(aTitle:pcchar; aNumOfColumns:cint; aColumns:Ppcchar; aNumOfRows:cint; aCells:Ppcchar):pcchar;cdecl;external;

  function tinyfd_checklistDialog(aTitle:pcchar; aNumOfOptions:cint; aOptions:Ppcchar):pcchar;cdecl;external;

{$endif}

implementation

end.

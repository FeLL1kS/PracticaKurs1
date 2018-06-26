unit story;

interface

uses types, System.Collections.Generic;

function getChapter(chapterId: integer): Chapter;
implementation

function getChapter(chapterId: integer): Chapter;
var
  chapt:Chapter;
  pictureId: integer;
  f: text;
begin
  assign(f, chapterId + '.txt');
  reset(f);
  
  while not eoln(f) do
  begin
    readln(f, chapt.title);
  end;
 
  
  getChapter:=chapt;
end;
end.


unit story;

interface

uses types, System.Collections.Generic;

function getChapter(chapterId: integer): Chapter;
implementation



function getChapter(chapterId: integer): Chapter;
var
  chapt: Chapter;
  pictureId: integer;
  f: text;
  txt: string;
  function readChapter(f: text): string;
  begin
    while not eof(f) do 
    begin
      setLength(chapt.slides, chapt.slides.Length + 1);
      readln(f, txt); end;
  end;

begin
  assign(f, chapterId + '.txt');
  readChapter(f);    
  reset(f); 
  readln(f, chapt.title);
  chapt.slides[imageId].picture := 'data/images'+imageId+'.jpg';
  
  getChapter := chapt;
end;
end.


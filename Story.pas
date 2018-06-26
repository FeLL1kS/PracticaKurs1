unit story;

interface

uses types, System.Collections.Generic;

function getChapter(chapterId: integer): Chapter;
implementation



function getChapter(chapterId: integer): Chapter;
var
  chapt: Chapter;
  f: text;
  txt, image, opt, kus: string;
  i: integer;
  a, b: array of string;
begin
  assign(f, chapterId + '.txt');
  reset(f); 
  readln(f, chapt.title);
  
  while not eof(f) do 
  begin
    setLength(chapt.slides, chapt.slides.Length + 1);
    readln(f, txt);
    readln(f, image);
    readln(f, opt);
  end;
  
  for i := 1 to length(chapt.slides) do
    chapt.slides[i].picture := 'data/images' + image + '.jpg';
  
  a := txt.Split(';');
  
  for i := 0 to 2 do 
  begin
    kus := a[i];
    foreach kus in a do
      b := kus.split('|'); end;
  
  getChapter := chapt;
end;
end.

unit story;

interface

uses types, System.Collections.Generic;

function getChapter(chapterId: integer): Chapter;
implementation



function getChapter(chapterId: integer): Chapter;
var
  chapt: Chapter;
  f: text;
  txt, image, opt: string;
  i: integer;
  a: array of string;
  b: array [0..2] of string;
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
  
  
  
  getChapter := chapt;
end;
end.

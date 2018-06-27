unit story;

interface
uses 

types, System.Collections.Generic;

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
  assign(f, 'data/story/' + chapterId + '.txt');
  reset(f); 
  readln(f, chapt.title);
  i := 0;
  while not eof(f) do begin
    setLength(chapt.slides, chapt.slides.Length + 1);
    readln(f, chapt.slides[i].text);
    readln(f, image);
    readln(f, opt);
    
    chapt.slides[i].picture := 'data/images/slides' + image + '.jpg';
    a := txt.Split(';');
    
    setLength(chapt.slides[i].options,a.Length);
    
    for var j := 0 to a.Length - 1 do begin
      b := kus.split('|');
      chapt.slides[i].options[j].text := b[0];
      chapt.slides[i].options[j].nextSlide := b[1].toInteger();
      chapt.slides[i].options[j].score := b[2].toInteger();
    end;
    
    i += 1;
  end;

  getChapter := chapt;
end;
end.

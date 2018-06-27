unit GameState;

interface

uses Types;

procedure loadChapter(Chapp: Chapter; sl, sc: integer);
function handleOption(buttonID: integer): Slide;
function getScore(): integer;

procedure setState(st: integer);
function getState(): integer;

implementation

var
  score, slideId, state: integer;
  Chap: Chapter;

///изменение состояния
procedure setState(st: integer);
begin
  state := st;
end;

///возврат состояния
function getState(): integer;
begin
  getState := state
end;

 ///инициализация     
procedure loadChapter(Chapp: Chapter; sl, sc: integer);
begin
  score := sc;
  slideId := sl;
  Chap := Chapp;
end;

 ///смена слайда и посчет очков
function handleOption(buttonID: integer): Slide;
begin
  if (buttonId > Chap.slides[slideId].options.length) then begin
    score += Chap.slides[slideId].options[buttonID].score;
    slideId := Chap.slides[slideId].options[buttonID].nextSlide;
    handleOption := Chap.slides[slideId];
  end;
end;

///возврат счета
function getScore(): integer;
begin
  getScore := score;
end;
end.
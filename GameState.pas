﻿unit GameState;

interface

uses Types;

procedure loadChapter(Chapp: Chapter; cp, sl, sc: integer);
function handleOption(buttonID: integer): Slide;
function getScore(): integer;

procedure setState(st: integer);
function getState(): integer;
function getFullState(): Save;

implementation

var
  score, slideId, chapterId, state: integer;
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

function getFullState(): Save;
var
  sv: Save;
begin
  sv.chapter := chapterId;
  sv.slide := slideId;
  sv.score := score;
  getFullState := sv;
end;

 ///инициализация     
procedure loadChapter(Chapp: Chapter; cp, sl, sc: integer);
begin
  score := sc;
  slideId := sl;
  chapterId := cp;
  Chap := Chapp;
end;

 ///смена слайда и посчет очков
function handleOption(buttonID: integer): Slide;
begin
  if ((Chap.slides[slideId].options.Length > 0) and (buttonId < Chap.slides[slideId].options.Length)) then begin
    score += Chap.slides[slideId].options[buttonID].score;
    slideId := Chap.slides[slideId].options[buttonID].nextSlide;
    if (slideId >= Chap.slides.Length) then begin
      var sl: Slide;
      handleOption := sl;
    end else handleOption := Chap.slides[slideId];
  end else handleOption := Chap.slides[slideId];
end;

///возврат счета
function getScore(): integer;
begin
  getScore := score;
end;
end.
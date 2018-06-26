unit GameState;

interface
uses Types;
procedure LoadChapter();
function handleOption(buttonID: integer): Slide;
function getScore(): integer;

implementation

var
  score, slideId, state: integer;
  Chap: Chapter;

///��������� ���������
procedure setState(st: integer);
begin
  state := st;
end;

///������� ���������
function getState(): integer;
begin
  getState := state
end;

 ///�������������     
procedure LoadChapter(Chapp: Chapter);
begin
  score := 0;
  slideId := 0;
  Chap := Chapp;
end;

 ///����� ������ � ������ �����
function handleOption(buttonID: integer): Slide;
begin
  if (buttonId > Chap.slides[slideId].options.length) then begin
    score := score + Chap.slides[slideId].options[buttonID];
    slideId := Chap.slides[slideId].options[buttonID].nextSlide;
    handleOption := Chap.slides[slideId];
  end;
end;

///������� �����
function getScore(): integer;
begin
  getScore := score;
end;

end.
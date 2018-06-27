unit Music;

interface
uses GraphABC; 
procedure musition;

implementation
///музыка
procedure musition;
begin
  var Player := new System.Media.soundPlayer('soundtrec.wav');
  Player.Play(); 
end;
end.
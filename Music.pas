unit Music;

interface
uses GraphABC, Types; 
var Player := new System.Media.soundPlayer('data/soundtrec.wav');
procedure play();
procedure stop();

implementation
///музыка
procedure play();
begin
  Player.PlayLooping()
end;

procedure stop();
begin
  Player.Stop();
end;
end.

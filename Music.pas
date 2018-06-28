unit Music;

interface
uses GraphABC; 
procedure play;

implementation
///музыка
procedure play;
begin
  var Player := new System.Media.soundPlayer('data/soundtrec.wav');
  Player.PlayLooping(); 
end;
end.
unit Music;

interface
uses GraphABC, Types; 
var Player := new System.Media.soundPlayer('data/soundtrec.wav');
procedure play();
procedure stop();
function enabled():boolean;

implementation
var isOn:boolean;
///музыка
procedure play();

begin
 isOn:=True;
 Player.PlayLooping()
end;

procedure stop();
begin
  isOn:=False;
  Player.Stop();
end;

function enabled():boolean;
begin
enabled:=isOn;
end;
end.

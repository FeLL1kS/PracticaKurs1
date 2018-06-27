unit Saver;

interface
uses Types;
procedure fsave(sv: Save);
function load():save;


implementation
///Зпись сохранения    
procedure fsave(sv: Save);
var
  f: text;
begin
  Assign(f, 'data/save.txt');
  rewrite(f);
  writeln(f, sv.chapter);
  writeln(f, sv.slide);
  writeln(f, sv.score);
  close(f);
end;
///открытие сохранения
function load():save;
var
  sv: Save;
  f: text;
begin
  try
    Assign(f, 'data/save.txt');
    reset(f);
    readln(f, sv.chapter);
    readln(f, sv.slide);
    readln(f, sv.score);
    close(f);
  except
    sv.chapter := 1;
    sv.slide := 0;
    sv.score := 0;
  end;
  load:=sv;
end;
end.
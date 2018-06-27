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
  write(f, sv.score,sv.chapter,sv.slide);
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
    read(f, sv.score,sv.chapter,sv.slide);
    close(f);
  except
    sv.score := 0;
    sv.chapter := 1;
    sv.slide := 0;
  end;
  load:=sv;
end;
end.
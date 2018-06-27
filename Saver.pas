unit save;

interface
uses Types;
procedure save(sv:save);
function load():save;


implementation
///Зпись сохранения    
procedure save(sv:save);
var
  f: text;
begin
  Assign(f, 'data/save.txt');
  rewrite(f);
  write(f, sv.score,sv.chapter,sv.clide);
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
    sv.chapter := 0;
    sv.slide := 0;
  end;
  load:=sv;
end;
end.
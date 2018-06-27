unit save;

interface
uses Types;
procedure save(sv:save);
function load():save;


implementation
///«пись сохранени€    
procedure save(sv:save);
var
  f: text;
begin
  Assign(f, 'data/save.txt');
  rewrite(f);
  write(f, sv.score,sv.chapter,sv.clide);
  close(f);
end;
///открытие сохранени€
function load():save;
var
  sv: Save;
  f: text;
begin
  Assign(f, 'data/save.txt');
  read(f, sv.score,sv.chapter,sv.clide);
  load:=sv;
end;
end.
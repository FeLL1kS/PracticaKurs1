unit Graph;

interface
  uses GraphABC;
  
  procedure createWindow(title: string);
  procedure quit();

implementation
  
  procedure createWindow(title: string);
  begin
    setwindowtitle(title);
    maximizewindow();
  end;
  
  procedure quit();
  begin
    closewindow();
  end;
end.

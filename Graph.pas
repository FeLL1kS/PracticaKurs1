unit Graph;

interface
  uses GraphABC, Types;
  
  procedure createWindow(title: string);
  procedure quit();

implementation
  
  procedure createWindow(title: string);
  begin
    setwindowtitle(title);
    maximizewindow();
  end;
  
  procedure drawSlide(sl: Slide);
  begin
    
  end;
  
  procedure quit();
  begin
    closewindow();
  end;
end.

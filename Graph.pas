unit Graph;

interface
  uses GraphABC, Types;
  
  procedure createWindow(title: string);
  procedure drawMenu();
  procedure drawSlide(sl: Slide);
  procedure closeWindow();

implementation
  type
    OptionButton = record
      x, y, id: integer;
    end;
  var window: GraphABCWindow;
  var buttons: array of OptionButton;


  function onClick();
  begin
  end;


  procedure createWindow(title: string);
  begin
    Window := GraphABC.Window();
    Window.Init(0,0,0,0,clBlack);
    Window.Title := title;
    Window.Maximize();
  end;
  
  procedure drawMenu();
  begin
    
  end;
  
  procedure drawSlide(sl: Slide);
  var
    slidePicture: Picture;
    width, y: integer;
    opt: Option;
  begin
    slidePicture := Picture.Create(sl.picture);
    slidePicture.Draw(0, 0, Window.Width, Window.Height);
    
    width := floor(Window.Width / 3);
    
    y := Window.Height - 50;
    drawTextCentered(width, y - 100, width * 2, y, sl.text);
    
    foreach opt in sl.options do begin
      setLength(buttons, buttons.Length + 1);
      
      y -= 150;
      drawTextCentered(width, y - 100, width * 2, y, op.text);
      
      with buttons[buttons.Length - 1] do begin
        y := y;
        id := buttons.Length - 1;
      end;
    end;
  end;
  
  procedure closeWindow();
  begin
    Window.Close();
  end;
end.

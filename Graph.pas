unit Graph;

interface
  uses GraphABC, Types;
  
  procedure setClickCallback(cb: Callback);
  procedure createWindow(title: string);
  procedure drawMenu();
  procedure drawSlide(sl: Slide);
  procedure closeWindow();

implementation
  type
    OptionButton = record
      x, y, id: integer;
    end;
  var
    Window: GraphABCWindow;
    buttons: array of OptionButton;
    clickCallback: Callback;

  procedure setClickCallback(cb: Callback);
  begin
    clickCallback := cb;
  end;

  procedure onClick(x,y,mb: integer);
  begin
    if (mb = 1) then begin
      foreach opt: OptionButton in buttons do begin
        if (
          (x >= opt.x) and (x <= opt.x + GRAPH_BUTTON_WIDTH) and
          (y >= opt.y) and (y <= opt.y + GRAPH_BUTTON_HEIGHT)
        ) then begin
          clickCallback(opt.id);
          break;
        end;
      end;
    end;
  end;


  procedure createWindow(title: string);
  begin
    Window := GraphABC.Window();
    OnMouseDown := onClick;
    Window.Init(0,0,0,0,GraphABC.clBlack);
    Window.Title := title;
    Window.Maximize();
  end;
  
  procedure drawMenu();
  var
    backgroundPicture: Picture;
    x, y: integer;
  begin
    try
      backgroundPicture := new Picture(GRAPH_MENU_BACKGROUND_IMAGE);
      backgroundPicture.Draw(0, 0, Window.Width, Window.Height);
    except
      setBrushColor(GRAPH_MENU_BACKGROUND_COLOR);
      fillRectangle(0, 0, Window.Width, Window.Height);
    end;
    
    setLength(buttons, 4);
    
  end;
  
  procedure drawSlide(sl: Slide);
  var
    slidePicture: Picture;
    x,y: integer;
  begin
    slidePicture := new Picture(sl.picture);
    slidePicture.Draw(0, 0, Window.Width, Window.Height);
    
    x := round(Window.Width / 2 - GRAPH_BUTTON_WIDTH / 2);
    y := Window.Height - GRAPH_BUTTON_SPACE;
    drawTextCentered(x, y, x + GRAPH_BUTTON_WIDTH, y + GRAPH_BUTTON_HEIGHT, sl.text);
    
    foreach opt: Option in sl.options do begin
      setLength(buttons, buttons.Length + 1);
      
      y -= GRAPH_BUTTON_HEIGHT + GRAPH_BUTTON_SPACE;
      drawTextCentered(x, y, x + GRAPH_BUTTON_WIDTH, y + GRAPH_BUTTON_HEIGHT, opt.text);
      
      with buttons[buttons.Length - 1] do begin
        x := x;
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

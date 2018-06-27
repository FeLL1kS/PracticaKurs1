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
      x, y, width, height, id: integer;
    end;
  var
    Window: GraphABCWindow;
    buttons: array of OptionButton;
    clickCallback: Callback;
    textBackground: Picture;

  procedure setClickCallback(cb: Callback);
  begin
    clickCallback := cb;
  end;

  procedure onClick(x,y,mb: integer);
  begin
    if (mb = 1) then begin
      foreach opt: OptionButton in buttons do begin
        if (
          (x >= opt.x) and (x <= opt.x + opt.width) and
          (y >= opt.y) and (y <= opt.y + opt.height)
        ) then begin
          clickCallback(opt.id);
          break;
        end;
      end;
    end;
  end;


  procedure createWindow(title: string);
  begin
    try
      textBackground := new Picture(GRAPH_TEXT_BACKGROUND_IMAGE);
    except
    end;
    Window := GraphABC.Window();
    OnMouseDown := onClick;
    setFontSize(16);
    setFontColor(clWhite);
    Window.Init(0, 0, 0, 0, GraphABC.clBlack);
    Window.Title := title;
    Window.Maximize();
  end;
   
  procedure drawMenu();
  var
    backgroundPicture, buttonImage: Picture;
    current_x, current_y, btn_width, btn_height, totalHeight: integer;
    text: array[0..3] of string := ('New game', 'Load', 'Settings', 'Exit');
  begin
    try
      backgroundPicture := new Picture(GRAPH_MENU_BACKGROUND_IMAGE);
      backgroundPicture.Draw(0, 0, Window.Width, Window.Height);
    except
      setBrushColor(GRAPH_MENU_BACKGROUND_COLOR);
      fillRectangle(0, 0, Window.Width, Window.Height);
    end;
    
    setLength(buttons, 4);
    
    btn_width := round(GRAPH_BUTTON_WIDTH * GRAPH_MENU_BUTTON_SCALE);
    btn_height := round(GRAPH_BUTTON_HEIGHT * GRAPH_MENU_BUTTON_SCALE);
    totalHeight := btn_height * 4 + GRAPH_BUTTON_SPACE * 3;
    
    current_x := round(Window.Width * GRAPH_MENU_POSITION_X - btn_width / 2);
    current_y := round(Window.Height * GRAPH_MENU_POSITION_Y - totalHeight / 2);
    drawRectangle(current_x - round(GRAPH_BUTTON_SPACE / 2), current_y - round(GRAPH_BUTTON_SPACE / 2), current_x + btn_width + GRAPH_BUTTON_SPACE, current_y + totalHeight + GRAPH_BUTTON_SPACE);
    for var i := 0 to 3 do begin
      with buttons[i] do begin
        x := current_x;
        y := current_y;
        width := btn_width;
        height := btn_height;
        id := i + 10;
      end;
      try
        buttonImage := new Picture(GRAPH_MENU_BUTTON_IMAGE_PATH + i.toString() + '.' + GRAPH_MENU_BUTTON_IMAGE_EXT);
        buttonImage.Draw(current_x, current_y, btn_width, btn_height);
      except
        drawRectangle(current_x, current_y, current_x + btn_width, current_y + btn_height);
        drawTextCentered(current_x, current_y, current_x + btn_width, current_y + btn_height, text[i]);
      end;
      current_y += btn_height + GRAPH_BUTTON_SPACE;
    end;
  end;
  
  procedure drawSlide(sl: Slide);
  var
    slidePicture: Picture;
    current_x,current_y: integer;
  begin
    try
      slidePicture := new Picture(sl.picture);
      slidePicture.Draw(0, 0, Window.Width, Window.Height);
    except
      setBrushColor(GRAPH_SLIDE_BACKGROUND_COLOR);
      fillRectangle(0, 0, Window.Width, Window.Height);
    end;
    
    current_x := round(Window.Width / 2 - GRAPH_BUTTON_WIDTH / 2);
    current_y := Window.Height - GRAPH_BUTTON_SPACE;
    
    setLength(buttons, 0);
    foreach opt: Option in sl.options do begin
      setLength(buttons, buttons.Length + 1);
      
      current_y -= GRAPH_BUTTON_HEIGHT + GRAPH_BUTTON_SPACE;
      textBackground.Draw(current_x, current_y, GRAPH_BUTTON_WIDTH, GRAPH_BUTTON_HEIGHT);
      drawTextCentered(current_x, current_y, current_x + GRAPH_BUTTON_WIDTH, current_y + GRAPH_BUTTON_HEIGHT, opt.text);
      
      with buttons[buttons.Length - 1] do begin
        x := current_x;
        y := current_y;
        width := GRAPH_BUTTON_WIDTH;
        height := GRAPH_BUTTON_HEIGHT;
        id := buttons.Length - 1;
      end;
    end;
    
    current_y -= GRAPH_BUTTON_HEIGHT * 2 + GRAPH_BUTTON_SPACE;
    textBackground.Draw(current_x - round(GRAPH_BUTTON_WIDTH / 2), current_y - round(GRAPH_BUTTON_HEIGHT / 2), GRAPH_BUTTON_WIDTH * 2, GRAPH_BUTTON_HEIGHT * 2);
    drawTextCentered(current_x - round(GRAPH_BUTTON_WIDTH / 2), current_y - round(GRAPH_BUTTON_HEIGHT / 2), current_x + GRAPH_BUTTON_WIDTH * 2 - round(GRAPH_BUTTON_WIDTH / 2), current_y + GRAPH_BUTTON_HEIGHT * 2 - round(GRAPH_BUTTON_HEIGHT / 2), sl.text);
 
    setLength(buttons, buttons.Length + 2);
    try
      var menuButtonImage := new Picture(GRAPH_SLIDE_BUTTON_MENU_IMAGE);
      menuButtonImage.Draw(50, 50, GRAPH_SLIDE_BUTTON_MENU_SIZE, GRAPH_SLIDE_BUTTON_MENU_SIZE);
    except
      drawRectangle(50, 50, 50 + GRAPH_SLIDE_BUTTON_MENU_SIZE, 50 + GRAPH_SLIDE_BUTTON_MENU_SIZE);
      drawTextCentered(50, 50, 50 + GRAPH_SLIDE_BUTTON_MENU_SIZE, 50 + GRAPH_SLIDE_BUTTON_MENU_SIZE, 'M');
    end;
    with buttons[buttons.Length - 2] do begin
      x := 50;
      y := 50;
      width := GRAPH_SLIDE_BUTTON_MENU_SIZE;
      height := GRAPH_SLIDE_BUTTON_MENU_SIZE;
      id := BUTTON_MENU;
    end;
    
    try
      var menuButtonImage := new Picture(GRAPH_SLIDE_BUTTON_SAVE_IMAGE);
      menuButtonImage.Draw(Window.Width - GRAPH_SLIDE_BUTTON_SAVE_SIZE - 50, 50, GRAPH_SLIDE_BUTTON_SAVE_SIZE, GRAPH_SLIDE_BUTTON_SAVE_SIZE);
    except
      drawRectangle(Window.Width - GRAPH_SLIDE_BUTTON_SAVE_SIZE - 50, 50, Window.Width - 50, 50 + GRAPH_SLIDE_BUTTON_SAVE_SIZE);
      drawTextCentered(Window.Width - GRAPH_SLIDE_BUTTON_SAVE_SIZE - 50, 50, Window.Width - 50, 50 + GRAPH_SLIDE_BUTTON_SAVE_SIZE, 'S');
    end;
    with buttons[buttons.Length - 1] do begin
      x := Window.Width - GRAPH_SLIDE_BUTTON_SAVE_SIZE - 50;
      y := 50;
      width := GRAPH_SLIDE_BUTTON_SAVE_SIZE;
      height := GRAPH_SLIDE_BUTTON_SAVE_SIZE;
      id := BUTTON_SAVE;
    end;
 end;
  
  procedure closeWindow();
  begin
    Window.Close();
  end;
end.

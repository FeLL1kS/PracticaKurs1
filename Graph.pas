﻿unit Graph;

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
    Window := GraphABC.Window();
    OnMouseDown := onClick;
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
    slidePicture := new Picture(sl.picture);
    slidePicture.Draw(0, 0, Window.Width, Window.Height);
    
    current_x := round(Window.Width / 2 - GRAPH_BUTTON_WIDTH / 2);
    current_y := Window.Height - GRAPH_BUTTON_SPACE;
    drawTextCentered(current_x, current_y, current_x + GRAPH_BUTTON_WIDTH, current_y + GRAPH_BUTTON_HEIGHT, sl.text);
    
    foreach opt: Option in sl.options do begin
      setLength(buttons, buttons.Length + 1);
      
      current_y -= GRAPH_BUTTON_HEIGHT + GRAPH_BUTTON_SPACE;
      drawTextCentered(current_x, current_y, current_x + GRAPH_BUTTON_WIDTH, current_y + GRAPH_BUTTON_HEIGHT, opt.text);
      
      with buttons[buttons.Length - 1] do begin
        x := current_x;
        y := current_y;
        width := GRAPH_BUTTON_WIDTH;
        height := GRAPH_BUTTON_HEIGHT;
        id := buttons.Length - 1;
      end;
    end;
  end;
  
  procedure closeWindow();
  begin
    Window.Close();
  end;
end.

unit Types;
interface
  uses GraphABC;
  const
    STATE_MENU = 0;
    STATE_GAME = 1;
    STATE_SETTINGS = 2;
  
    BUTTON_NEW_GAME = 10;
    BUTTON_LOAD = 11;
    BUTTON_SETTINGS = 12;
    BUTTON_MENU = 20;
    BUTTON_SAVE = 21;
    BUTTON_EXIT = 666;
  
    GRAPH_BUTTON_WIDTH = 300;
    GRAPH_BUTTON_HEIGHT = 100;
    GRAPH_BUTTON_SPACE = 50;
    
    GRAPH_MENU_BUTTON_SCALE = 1.5;
    GRAPH_MENU_BACKGROUND_IMAGE = 'data/images/menu_background.jpg';
    GRAPH_MENU_BACKGROUND_COLOR = GraphABC.clCyan;
  
  type
    Save = record
      slide: integer;
      chapter: integer;
      score: integer;
    end;
  
    Option = record
      text: string;
      nextSlide: integer;
      score: integer;
    end;
    Slide = record
      text: string;
      picture: string;
      options: array of Option;
    end;
    Chapter = record
      title: string;
      slides: array of Slide;
    end;
    
    Callback = procedure(i: integer);
implementation
end.
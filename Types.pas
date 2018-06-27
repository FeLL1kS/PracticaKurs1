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
    BUTTON_EXIT = 13;
    BUTTON_MENU = 20;
    BUTTON_SAVE = 21;
  
    GRAPH_BUTTON_WIDTH = 300;
    GRAPH_BUTTON_HEIGHT = 45;
    GRAPH_BUTTON_SPACE = 50;
    
    GRAPH_MENU_POSITION_X = 0.5;
    GRAPH_MENU_POSITION_Y = 0.5;
    GRAPH_MENU_BUTTON_SCALE = 1.2;
    GRAPH_MENU_BUTTON_IMAGE_PATH = 'data/images/buttons/menu_';
    GRAPH_MENU_BUTTON_IMAGE_EXT = 'png';
    GRAPH_MENU_BACKGROUND_IMAGE = 'data/images/menu_background.jpg';
    GRAPH_MENU_BACKGROUND_COLOR = GraphABC.clCyan;
    
    GRAPH_SLIDE_BUTTON_SAVE_IMAGE = 'data/images/buttons/save.png';
    GRAPH_SLIDE_BUTTON_SAVE_SIZE = 50;
    GRAPH_SLIDE_BUTTON_MENU_IMAGE = 'data/images/buttons/menu.png';
    GRAPH_SLIDE_BUTTON_MENU_SIZE = 50;
    GRAPH_SLIDE_BACKGROUND_COLOR = GraphABC.clRed;
    GRAPH_TEXT_BACKGROUND_IMAGE = 'data/images/text_background.png';
  
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
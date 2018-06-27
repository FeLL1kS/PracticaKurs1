unit Game;

interface
  uses Graph, Types, GameState, Story, Saver;
  procedure run;

implementation
  procedure onClick(buttonId: integer);
  begin
    case (GameState.getState()) of
      0: begin
        case (buttonId) of
          BUTTON_NEW_GAME: begin
            GameState.setState(STATE_GAME);
            var chp := Story.getChapter(1);
            GameState.loadChapter(chp,0,0,0);
            Graph.drawSlide(chp.slides[0]);
          end;
          BUTTON_LOAD: begin
            var sv := Saver.load();
            var chp := Story.getChapter(sv.chapter);
            GameState.loadChapter(chp, sv.chapter, sv.slide, sv.score);
            Graph.drawSlide(chp.slides[sv.slide]);
          end;
          BUTTON_SETTINGS: begin
          end;
          BUTTON_EXIT: begin
            Graph.closeWindow();
            exit();
          end;
        end;
      end;
      1: begin
        case (buttonId) of
          BUTTON_MENU: begin
            GameState.setState(STATE_MENU);
            Graph.drawMenu();
          end;
          BUTTON_SAVE: begin
            Saver.save(GameState.getFullState());
          end;
          else Graph.drawSlide(GameState.handleOption(buttonId));
        end;
      end;
    end;
  end;
  
  procedure run();
  var
    clickCallback: Callback;
  begin
    Graph.createWindow('Цвет настроения - радужный');
    GameState.setState(STATE_MENU);
    clickCallback := onClick;
    Graph.setClickCallback(clickCallback);
    Graph.drawMenu();
  end;
end.
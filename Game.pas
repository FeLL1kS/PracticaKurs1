unit Game;

interface
  uses Graph, Types, GameState, Story, Saver, Music;
  procedure run;

implementation
  procedure onClick(buttonId: integer);
  begin
    case (GameState.getState()) of
      0: begin
        case (buttonId) of
          BUTTON_NEW_GAME: begin
            var chp := Story.getChapter(1);
            GameState.loadChapter(chp,1,0,0);
            Graph.drawSlide(chp.slides[0]);
            GameState.setState(STATE_GAME);
          end;
          BUTTON_LOAD: begin
            var sv := Saver.load();
            var chp := Story.getChapter(sv.chapter);
            GameState.loadChapter(chp, sv.chapter, sv.slide, sv.score);
            Graph.drawSlide(chp.slides[sv.slide]);
            GameState.setState(STATE_GAME);
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
            Saver.fsave(GameState.getFullState());
          end;
          else begin
            var sl := GameState.handleOption(buttonId);
            if ((sl.text = '') and (sl.options = nil)) then begin
              GameState.setState(STATE_MENU);
              Graph.drawMenu();
            end else Graph.drawSlide(sl);
          end;
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
    Music.play();
    Graph.drawMenu();
  end;
end.
unit Game;

interface
  uses Graph, Types, GameState, Story;
  procedure run;

implementation
  const configFile = 'data/config.cfg';
  
  var config: Dictionary<string,integer> := new Dictionary<string,integer>;
  
  procedure init();
  begin
    Graph.createWindow('');
    GameState.setState(0);
  end;
  
  procedure mainLoop();
  begin
    while true do begin
      
    end;
  end;
  
  procedure run();
  begin
    init();
    
    mainLoop();
  end;
<<<<<<< HEAD:game.pas
end.
=======

//finalization
//  quit;

end.
>>>>>>> b022770f8fb78da1a81e26898890979846363df6:Game.pas

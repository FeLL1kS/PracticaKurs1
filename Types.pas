unit Types;
interface
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
implementation
end.
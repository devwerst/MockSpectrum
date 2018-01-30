unit GBConst;

interface
const
  GB_DP = 1;
  GB_FP = 2;
  GB_CS = 3;
  GB_HV = 4;
  GB_Max_Modules = 4;

  GB_Max_Proj = 11;

  //Module Messages
  GB_CREATE              = 1;  {Called once at beginning so module may Init}
  GB_DESTROY             = 2;  {Called once at end}
  GB_OPEN                = 3;  {Open file}
  GB_EDIT                = 4;  {Edit projection}
  GB_CALC                = 6;  {Not used at this time}
  GB_SAVE                = 7;  {Save file}
  GB_CLOSE               = 8;  {Close file}
  GB_NEW                 = 9;  {New projection}
  GB_FINALYEAR_CHANGE    = 10; {Final year change}
  GB_LANGUAGE_CHANGE     = 12; {Language has changed}
  GB_DATA_CHANGED        = 13; {Asking Module if their data has changed}
  GB_MODULE_DATA_CHANGED = 14; {Informs modules that another module's or Main shell data has changed}
  GB_REQUIRED_MODULES    = 15; {See if module requires any other module to be active}
  GB_EP_Refresh          = 16; {Reset country data}
  GB_COUNTRY_VALID       = 17; {check to see if slected country is valid for module}
  GB_MODS_LOADED_NEW     = 18; {All modules have been sent GB_NEW in LoadFiles}
  GB_MODS_LOADED_OPEN    = 19; {All modules have been sent GB_OPEN in LoadFiles}
  GB_FILENAME_CHANGE     = 20;

type
  GB_TByteSet = set of byte;

  TGBModMessage = record
    proj    : byte;
    msgID   : byte;
    session : TObject;
    data1,
    data2   : pointer;
  end;

  function modIDToStr(modID:byte):string;

implementation


function modIDToStr(modID:byte):string;
begin
  case modID of
    GB_DP : result := 'DP';
    GB_FP : result := 'FP';
    GB_CS : result := 'CS';
    GB_HV : result := 'HV';
    else
      result := 'XX';
  end;
end;

end.

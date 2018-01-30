unit GBUtil;

interface

procedure Log(const msg:string);

implementation

uses
  windows;
procedure Log(const msg:string);
begin
  outputDebugString(PWideChar(msg));
end;

end.

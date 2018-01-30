unit HVInterface;

interface

type
  IHV_DP_Inf = interface
    ['{DC97F413-2678-4317-876B-7F662A9CF052}']
    function GetPop(sex, t : byte):double;
  end;

implementation

end.

unit DPInterface;

interface

type
  IDP_HV_Inf = interface
    ['{CE72C108-4302-4D26-990B-4616E4A8FBB6}']
    function GetPrEP:double;
    function GetRisk:double;
  end;

  IDP_FP_Inf = interface
    ['{CE72C108-4302-4D26-990B-4616E4A8FBB6}']
    function GetTFR(t:byte):double;
  end;

implementation

end.

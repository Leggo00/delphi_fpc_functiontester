unit FormMasterMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, BaseGrid, AdvGrid, ExtCtrls;

type
  TFrmMasterMenu = class(TFrame)
    Panel1: TPanel;
    pnStatus: TPanel;
    pnBcd: TPanel;
    pnVariant: TPanel;
    pnType: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

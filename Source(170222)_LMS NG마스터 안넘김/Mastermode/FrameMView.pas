unit FrameMView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, BaseGrid, AdvGrid, ExtCtrls;

type
  TFrmMView = class(TFrame)
    Panel1: TPanel;
    pnStatus: TPanel;
    pnBcd: TPanel;
    pnVariant: TPanel;
    pnType: TPanel;
    Grid: TAdvStringGrid;
    procedure GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmMView.GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
    VAlign := vtaCenter;
end;

end.

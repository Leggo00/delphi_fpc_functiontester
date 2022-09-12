unit FormKeyTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid;

type
  TFrmKeyTable = class(TForm)
    Grid_KEY: TAdvStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmKeyTable: TFrmKeyTable;

implementation

{$R *.dfm}

end.

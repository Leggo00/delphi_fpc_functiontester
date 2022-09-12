unit FormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls;

type
  TFrame1 = class(TFrame)
    Panel1: TPanel;
    pnVariant: TPanel;
    pnSerialNo: TPanel;
    Panel5: TPanel;
    PageControl1: TPageControl;
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

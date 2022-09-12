unit FormStepToMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmStepToMemo = class(TForm)
    Memo: TMemo;
    Panel1: TPanel;
    BtnSave: TBitBtn;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStepToMemo: TFrmStepToMemo;

implementation

{$R *.dfm}

end.

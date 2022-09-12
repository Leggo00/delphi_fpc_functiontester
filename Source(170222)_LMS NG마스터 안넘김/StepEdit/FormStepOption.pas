unit FormStepOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmStepOption = class(TForm)
    BtnOk: TBitBtn;
    BtnClose: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit_TimeOut: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit_Sampling: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Combo_RunMode: TComboBox;
    Label6: TLabel;
    Edit_Retry: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit_Message: TEdit;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute(List : TStrings) : Boolean;
  end;

var
  FrmStepOption: TFrmStepOption;

implementation

uses GenUtils;

{$R *.dfm}

function TFrmStepOption.Execute(List : TStrings) : Boolean;
var i: Integer;
    fValue : Double;
    Str, RdStr, ItemStr, ParamStr : String;
begin
    Result := False;
    if List = nil then exit;

    for i :=0 to List.Count-1 do begin
        RdStr := List[i];

        ItemStr  := GetToken(RdStr, ';');
        ParamStr := GetToken(RdStr, ';');
        if (ItemStr = 'TIMEOUT') then begin
            fValue := StrToFloatDef(GetToken(ParamStr, ';'), 10);
            Edit_TimeOut.Text := FloatToStr(fValue);
        end
        else
        if (ItemStr = 'SAMPLING') then begin
            fValue := StrToFloatDef(GetToken(ParamStr, ';'), 0.01);
            Edit_Sampling.Text := FloatToStr(fValue);
        end
        else
        if (ItemStr = 'RETRY') then begin
            fValue := StrToFloatDef(GetToken(ParamStr, ';'), 0);
            Edit_Retry.Text := IntToStr(Round(fValue));
        end else
        if (ItemStr = 'RUNMODE') then begin
            Combo_RunMode.Text := ParamStr;
        end else
        if (ItemStr = 'MESSAGE') then begin
            Edit_Message.Text := ParamStr;
        end;
    end;

    try
        List.Clear;
        if (ShowModal() = mrOk) then begin
            if Edit_TimeOut.Text <> ''  then List.Add('TIMEOUT;' + Edit_TimeOut.Text );
            if Edit_Sampling.Text <> '' then List.Add('SAMPLING;'+ Edit_Sampling.Text );
            if Edit_Retry.Text <> ''    then List.Add('RETRY;'   + Edit_Retry.Text );
            if Combo_RunMode.Text <> '' then List.Add('RUNMODE;' + Combo_RunMode.Text );
            if Edit_Message.Text <> ''  then List.Add('MESSAGE;' + Edit_Message.Text );
            Result := True;
        end;
    except
    end;
end;

procedure TFrmStepOption.BtnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFrmStepOption.BtnCloseClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.

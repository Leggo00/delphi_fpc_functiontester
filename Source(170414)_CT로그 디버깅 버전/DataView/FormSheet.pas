unit FormSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, AxCtrls, OleCtrls, VCF1, ComCtrls, ExtCtrls;

type
  TFrmSheet = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Sheet: TF1Book;
    BtnSave: TSpeedButton;
    BtnPrint: TSpeedButton;
    BtnClose: TSpeedButton;
    PrintDialog: TPrintDialog;
    SaveDialog: TSaveDialog;
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function LoadFromFile(FileName : String) : Boolean;
  end;

var
  FrmSheet: TFrmSheet;

implementation

uses GenUtils;

{$R *.dfm}


function TFrmSheet.LoadFromFile(FileName : String) : Boolean;
var i, nStepIdx : Integer;
    nRow, nCol, nReadMode : Integer;
    text: TextFile;
    Str, RdStr : String;
    clFont : TColor;
begin
    EXIT;

    Result := False;
    
    if not FileExists(FileName) then exit;
    with Sheet do
        ClearRange (5, -1, MaxRow, -1, F1ClearValues);
{
[INFO]
MODEL=TEST-TG BCM
DATE=04-07-12 ¿ÀÈÄ 8:55:41
[DATA]
Defroster On/Off;DEF_ON_LEVEL_(V);0~10;0.01;OK;
;DEF_OFF_LEVEL_(V);10~10;0.00;NG;

}

    nReadMode := 0;
    nStepIdx  := 1;
  	AssignFile (text, FileName);
    try
   	    reset (text);
        while not EOF (text) do begin
            ReadLn (text, RdStr);
            if (RdStr = '[HEADER]') then begin
                nReadMode := 1;
                nRow := 1;
                continue;
            end else
            if (RdStr = '[DATA]') then begin
                nReadMode := 2;
                nRow := 5;
                continue;
            end;

            case nReadMode of
                1: begin
                    Sheet.TextRC[nRow, 1] := GetToken(RdStr, '=');
                    Sheet.TextRC[nRow, 2] := RdStr; //GetToken(RdStr, ' ');
                end;

                2: begin
                    nCol := 2;
                    while (RdStr <> '') do begin
                        Str := GetToken(RdStr, ';');
                        if (nCol = 2) and (Str <> '') then begin
                            Sheet.NumberRC[nRow, 1] := nStepIdx;
                            Inc(nStepIdx);
                        end;
                        
                        if (Str = 'OK') then begin
                            Sheet.Row := nRow; Sheet.Col := nCol;
                            clFont := clGreen;
                            Sheet.SetFont ('±¼¸²', 10, clFont = clRed, False, False, False, clFont, False, False);
                        end else

                        if (Str = 'NG') then begin
                            Sheet.Row := nRow; Sheet.Col := nCol;
                            clFont := clRed;
                            Sheet.SetFont ('±¼¸²', 10, clFont = clRed, False, False, False, clFont, False, False);
                        end;

                        if IsFloat(Str) then Sheet.NumberRC[nRow, nCol] := StrToFloatDef(Str, 0)
                                        else Sheet.TextRC[nRow, nCol] := Str;
                        Inc(nCol);
                    end;
                end;
            end;
            Inc(nRow);
        end;
        Result := False;
    finally
        CloseFile(text);
    end;
end;

procedure TFrmSheet.BtnSaveClick(Sender: TObject);
begin
    with SaveDialog do begin
        if Execute then begin
            Sheet.Write (FileName, F1FileExcel5);
        end;
    end;
end;

procedure TFrmSheet.BtnPrintClick(Sender: TObject);
begin
    if PrintDialog.Execute then begin
        Sheet.FilePrint(False);
    end;
end;

procedure TFrmSheet.BtnCloseClick(Sender: TObject);
begin
    Close();
end;

end.

unit FormIOScale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, ComCtrls, XiButton, ExtCtrls,
  StdCtrls, ZINICtrl, AdvObj;

Const
  MAX_CHANNEL_COUNT   = 32;

type
  TFrmIOScale = class(TForm)
    Panel1: TPanel;
    btnSave: TXiButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GridAD: TAdvStringGrid;
    GridDA: TAdvStringGrid;
    Panel2: TPanel;
    cbItem: TComboBox;
    edtValue: TEdit;
    btnApply: TXiButton;
    cbRange: TComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GridADGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnFileLoadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure GridADGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure cbItemChange(Sender: TObject);
  private
    procedure MakeGrid(Grid: TAdvStringGrid);
    procedure LoadScaleFile();
    { Private declarations }
  public
    procedure SaveScaleFile();
    { Public declarations }
  end;

var
  FrmIOScale: TFrmIOScale;

implementation

{$R *.dfm}

uses GenUtils, FormHWMain;

procedure TFrmIOScale.MakeGrid(Grid:TAdvStringGrid);
var i : Integer;
begin
    with Grid do
    begin
        Clear;
        DefaultRowHeight := 17;
        ColCount := 10;
        RowCount := 2;
        i := 0;
        Cells[i,0] := 'I/O';     ColWidths[i] := 80;   Inc(i);
        Cells[i,0] := 'RANGE';   ColWidths[i] := 80;   Inc(i);
        Cells[i,0] := 'MIN';     ColWidths[i] := 80;   Inc(i);
        Cells[i,0] := 'MAX';     ColWidths[i] := 80;   Inc(i);
        Cells[i,0] := 'UNIT';    ColWidths[i] := 80;   Inc(i);
        Cells[i,0] := 'SCALE';   ColWidths[i] := 80;   Inc(i);
        Cells[i,0] := 'OFFSET';  ColWidths[i] := 80;   Inc(i);
        ColCount := i;
    end;

end;

procedure TFrmIOScale.FormCreate(Sender: TObject);
begin
    MakeGrid(GridAD);
    MakeGrid(GridDA);
    LoadScaleFile();
    cbItemChange(Self);
    FrmHWMain.MakeADScale;
end;

procedure TFrmIOScale.GridADGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    HAlign := taCenter;
end;

procedure TFrmIOScale.btnFileLoadClick(Sender: TObject);
begin
end;

{

[Info]
Serial Num=2012-01-06 17-08-25
[AD1  : scale,offset,range,min,max,unit]
AD#1=1.0010,-0.0352
AD#2=0.9932,-0.0223
AD#3=0.9972,-0.0113
AD#4=0.9909,-0.0153
.
.
.
AD#30=0.9927,0.0055
AD#31=0.9963,-0.0109
AD#32=1.0018,0.0010
[AD2  : scale,offset,range,min,max,unit]
AD#1=1.0010,-0.0352
AD#2=0.9932,-0.0223
AD#3=0.9972,-0.0113
AD#4=0.9909,-0.0153
.
.
.
.
AD#30=0.9927,0.0055
AD#31=0.9963,-0.0109
AD#32=1.0018,0.0010
}


// Station 별 Slot 정보를 로드한다.
procedure TFrmIOScale.LoadScaleFile();
var StrList : TStringList;
    i, j, nADBdNo, nChannel, nStationCount, nRow : Integer;
    sTemp, sChannel : String;
    bAdd : Boolean;
    nCount: integer;
begin
    nCount := FrmHwMain.GetAdBoardCount();
    if FileExists(GetAppDir('')+'IOCONFIG.INI') then
    begin
        StrList := TStringList.Create;
        try
            StrList.LoadFromFile(GetAppDir('')+'IOCONFIG.INI');
            nRow := 0;
            bAdd := False;
            for i:= 0 to StrList.Count-1 do
            begin
                sTemp := StrList.Strings[i];
                if Pos('[AD',sTemp) > 0 then
                begin
                    bAdd  := True;
                    sTemp := GetToKen(sTemp,' ');
                    GetToKen(sTemp,'AD');
                    nADBdNo := StrToIntDef(sTemp,-1);
                    Continue;
                end;

                if bAdd then
                begin
                    Inc(nRow);
                    sChannel := GetToKen(sTemp,'=');
                    GetToKen(sChannel,'#');
                    GridAD.Cells[0,nRow] := Format('AD%d_%0.2d',[nADBdNo,StrToIntDef(sChannel,0)]);
                    GridAD.Cells[5,nRow] := GetToKen(sTemp,',');
                    GridAD.Cells[6,nRow] := GetToKen(sTemp,',');
                    GridAD.Cells[1,nRow] := GetToKen(sTemp,',');
                    GridAD.Cells[2,nRow] := GetToKen(sTemp,',');
                    GridAD.Cells[3,nRow] := GetToKen(sTemp,',');
                    GridAD.Cells[4,nRow] := GetToKen(sTemp,',');
                    if (nRow mod MAX_CHANNEL_COUNT) = 0 then bAdd := False;
                end;
            end;

            if StrList.Count = 0 then
                GridAD.RowCount := 2
            else
                GridAD.RowCount := nRow+1;

        finally
            StrList.Free;
        end;
    end
    else begin
        if nCount > 0 then
        begin
            with GridAD do
            begin
                ClearRect(0, 1, ColCount-1, RowCount-1);
                RowCount := 2;
                for i := 1 to nCount do
                begin
                    for j := 1 to 32 do
                    begin
                        nRow := j + ((i-1) * 32);
                        Cells[0, nRow] := Format('AD%d_%.2d',[i, j]);
                        Cells[1, nRow] := '±10V';  // Range
                        Cells[2, nRow] := '-30';  // Min
                        Cells[3, nRow] := '30';   // Max
                        Cells[4, nRow] := 'V';    // sUnit
                        Cells[5, nRow] := '1';    // Scale
                        Cells[6, nRow] := '0';    // offset

                        if nRow > 1 then
                            RowCount := RowCount+1;
                    end;
                end;
            end;
        end;
    end;       
end;


// Station 별 Slot 정보를 저장한다.
procedure TFrmIOScale.SaveScaleFile;
var StrList : TStringList;
    i, j, nADBdNo, nADBdOldNo, nChannel : Integer;
    sBoard, sTemp : String;
begin
    StrList := TStringList.Create;
    try
        nADBdNo := -1;
        nADBdOldNo := -1;

        with GridAD do
        for i:= 1 to RowCount-1 do
        begin
            sTemp := Cells[0,i];
            sBoard := GetToKen(sTemp,'_');
            GetToKen(sBoard,'AD');
            nADBdNo := StrToIntDef(sBoard,-1);
            nChannel := StrToIntDef(sTemp,-1);
            if nADBdNo = -1 then Continue;
            if nADBdNo <> nADBdOldNo then
            begin
                StrList.Add(Format('[AD%d  : scale,offset,range,min,max,unit]',[nADBdNo]));
                StrList.Add(Format('AD#%d=%s,%s,%s,%s,%s,%s',[nChannel,
                                                              Cells[5,i],
                                                              Cells[6,i],
                                                              Cells[1,i],
                                                              Cells[2,i],
                                                              Cells[3,i],
                                                              Cells[4,i]]));
                nADBdOldNo := nADBdNo;
                Continue;
            end;
            StrList.Add(Format('AD#%d=%s,%s,%s,%s,%s,%s',[nChannel,
                                                          Cells[5,i],
                                                          Cells[6,i],
                                                          Cells[1,i],
                                                          Cells[2,i],
                                                          Cells[3,i],
                                                          Cells[4,i]]));
        end;
        StrList.SaveToFile(GetAppDir('')+'IOCONFIG.INI');
    finally
        StrList.Free;
    end;

end;

procedure TFrmIOScale.FormShow(Sender: TObject);
begin
   // width := 600;
    MakeGrid(GridAD);
    MakeGrid(GridDA);
    LoadScaleFile;
    cbItemChange(Self);    
end;

procedure TFrmIOScale.btnApplyClick(Sender: TObject);
var i : Integer;
    Str : String;
begin
    if IDOK = MessageBox(cbItem.Text +' Change?', cbItem.Text , MB_OKCANCEL	or MB_ICONQUESTION ) then
    begin
        if cbItem.ItemIndex = 0 then Str := cbRange.Text
        else Str := edtValue.Text;

        with GridAD do
        for i:=1 to RowCount-1 do
        begin
            Cells[cbItem.ItemIndex+1,i] := Str;
        end;
    end;

end;

procedure TFrmIOScale.btnSaveClick(Sender: TObject);
begin
    if IDOK = MessageBox('SAVE?', 'SAVE', MB_OKCANCEL	or MB_ICONQUESTION ) then
    begin
        FrmHWMain.MakeADScale;
        SaveScaleFile;
        ModalResult := mrOK;
    end;
end;

procedure TFrmIOScale.GridADGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
    if (ARow > 0) and (ACol = 1) then
    begin
        aEditor := edComboList;
        GridAD.ClearComboString;
        GridAD.AddComboString('±10V');
        GridAD.AddComboString('+10V');
        GridAD.AddComboString('±20V');
        GridAD.AddComboString('+20V');
    end;
end;


procedure TFrmIOScale.cbItemChange(Sender: TObject);
begin
    if cbItem.ItemIndex = 0 then
    begin
        cbRange.visible := True;
        edtValue.visible := False;
    end else begin
        cbRange.visible := False;
        edtValue.visible := True;
    end;

end;

end.




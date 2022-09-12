unit FormSetGraph;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, UnitGraph, Buttons, Spin, ExtCtrls;

type
  TFrmSetGraph = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    grp1: TGroupBox;
    ts2: TTabSheet;
    ts3: TTabSheet;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    lbl1: TLabel;
    edt_Title: TEdit;
    lbl2: TLabel;
    se_Top: TSpinEdit;
    se_Left: TSpinEdit;
    se_Bottom: TSpinEdit;
    se_Right: TSpinEdit;
    shp1: TShape;
    grp2: TGroupBox;
    lbl3: TLabel;
    shp_BackColor: TShape;
    lbl4: TLabel;
    shp_FrontColor: TShape;
    shp_LineColor: TShape;
    lbl5: TLabel;
    shp_GridColor: TShape;
    lbl6: TLabel;
    btn4: TSpeedButton;
    btn3: TSpeedButton;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    ColorDlg: TColorDialog;
    btn1: TBitBtn;
    btn2: TBitBtn;
    grp3: TGroupBox;
    lbl12: TLabel;
    edt_AxisName: TEdit;
    lbl13: TLabel;
    edtAxisMin: TEdit;
    edtAxisMax: TEdit;
    chk_AxisVisible: TCheckBox;
    edtAxisStep: TEdit;
    lbl14: TLabel;
    shp_AxisColor: TShape;
    lbl11: TLabel;
    cbb_AxisList: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edt_ChannelName: TEdit;
    chk_ChVisible: TCheckBox;
    cbb_ChList: TComboBox;
    Label2: TLabel;
    cbb_AxisList2: TComboBox;
    Label5: TLabel;
    BtnAxisApply: TBitBtn;
    BtnChannelApply: TBitBtn;
    shp_ChColor: TShape;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    cbb_BottomAxis: TComboBox;
    Label10: TLabel;
    cbb_LeftAxis: TComboBox;
    BtnRefAxisApply: TBitBtn;
    dlgSave: TSaveDialog;
    dlgOpen: TOpenDialog;
    Label11: TLabel;
    cbb_RightAxis: TComboBox;
    Cb_Split: TCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure shpColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure cbb_AxisListChange(Sender: TObject);
    procedure BtnAxisApplyClick(Sender: TObject);
    procedure cbb_ChListChange(Sender: TObject);
    procedure BtnChannelApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure BtnRefAxisApplyClick(Sender: TObject);
  private
    { Private declarations }
    SelGraph : TGraph;
  public
    { Public declarations }
    function Execute(Graph : TGraph) : Boolean;
  end;

var
  FrmSetGraph: TFrmSetGraph;

implementation

uses GenUtils;

{$R *.dfm}

function TFrmSetGraph.Execute(Graph : TGraph) : Boolean;
var i : Integer;
    Axis : TAxis;
    ChData : TChData;
    WtStr : String;
begin
    Result := False;
    if Graph = nil then exit;
    SelGraph := Graph;

    if (ShowModal <> mrOk) then exit;

    SelGraph.Title        := edt_Title.Text;
    SelGraph.LeftMargin   := se_Left.Value;
    SelGraph.RightMargin  := se_Right.Value;
    SelGraph.TopMargin    := se_Top.Value;
    SelGraph.BottomMargin := se_Bottom.Value;

    SelGraph.BackColor  := shp_BackColor.Brush.Color;
    SelGraph.FrontColor := shp_FrontColor.Brush.Color;
    SelGraph.LineColor  := shp_LineColor.Brush.Color;
    SelGraph.GridColor  := shp_GridColor.Brush.Color;

    SelGraph.bViewSplit := Cb_Split.Checked;

    SelGraph := nil;
    Result := True;
end;

procedure TFrmSetGraph.FormShow(Sender: TObject);
var i : Integer;
    Axis : TAxis;
    ChData : TChData;
    WtStr : String;
begin
    if SelGraph = nil then begin
        Close;
        exit;
    end;

    edt_Title.Text := SelGraph.Title;

    se_Left.Value   := SelGraph.LeftMargin;
    se_Right.Value  := SelGraph.RightMargin;
    se_Top.Value    := SelGraph.TopMargin;
    se_Bottom.Value := SelGraph.BottomMargin;

    Cb_Split.Checked  := SelGraph.bViewSplit;

    shp_BackColor.Brush.Color  := SelGraph.BackColor;
    shp_FrontColor.Brush.Color := SelGraph.FrontColor;
    shp_LineColor.Brush.Color  := SelGraph.LineColor;
    shp_GridColor.Brush.Color  := SelGraph.GridColor;

    // 축목록을 가져온다.
    cbb_AxisList.Clear;

    for i := 0 to SelGraph.AxisCount-1 do begin
        Axis := SelGraph.GetAxis(i);
        WtStr := Format('%d : %s', [i+1, Axis.AxisName] );
        cbb_AxisList.Items.Add( WtStr );
        cbb_AxisList.ItemIndex := 0;
    end;
    cbb_AxisList2.Items.Assign(cbb_AxisList.Items);

    with cbb_BottomAxis do begin
        Clear;
        Items.Add('NONE');
        Items.AddStrings(cbb_AxisList.Items);
        ItemIndex := SelGraph.GetAxisIdx( SelGraph.BottomAxis ) + 1;
    end;

    with cbb_LeftAxis do begin
        Clear;
        Items.Add('NONE');
        Items.AddStrings(cbb_AxisList.Items);
        ItemIndex := SelGraph.GetAxisIdx( SelGraph.LeftAxis ) + 1;
    end;

    with cbb_RightAxis do begin
        Clear;
        Items.Add('NONE');
        Items.AddStrings(cbb_AxisList.Items);
        ItemIndex := SelGraph.GetAxisIdx( SelGraph.RightAxis ) + 1;
    end;


    // cbb_BottomAxis.ItemIndex := SelGraph.GetAxisIdx( SelGraph.BottomAxis );

    // 채널목록을 가져온다.
    cbb_ChList.Clear;
    for i := 0 to SelGraph.ChannelCount-1 do begin
        ChData := SelGraph.GetChannel(i);
        WtStr := Format('%d : %s', [i+1, ChData.ChName] );
        cbb_ChList.Items.Add( WtStr );
        cbb_ChList.ItemIndex := 0;
    end;

    cbb_AxisListChange(nil);
    cbb_ChListChange(Sender);
end;

procedure TFrmSetGraph.btnOKClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

procedure TFrmSetGraph.btnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;




procedure TFrmSetGraph.shpColorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Shape : TShape;
begin
    Shape := TShape(Sender);
    ColorDlg.Color := Shape.Brush.Color;
    if ColorDlg.Execute then
        Shape.Brush.Color := ColorDlg.Color;
end;
procedure TFrmSetGraph.btn4Click(Sender: TObject);
begin
    shp_BackColor.Brush.Color  := clWhite;
    shp_FrontColor.Brush.Color := clWhite;
    shp_LineColor.Brush.Color  := clBlack;
    shp_GridColor.Brush.Color  := clSilver;
end;

procedure TFrmSetGraph.btn3Click(Sender: TObject);
begin
    shp_BackColor.Brush.Color  := clSilver;
    shp_FrontColor.Brush.Color := clBlack;
    shp_LineColor.Brush.Color  := clGray;
    shp_GridColor.Brush.Color  := clGray;
end;

procedure TFrmSetGraph.cbb_AxisListChange(Sender: TObject);
var Axis : TAxis;
begin
    Axis := SelGraph.GetAxis(cbb_AxisList.ItemIndex);
    if Axis <> nil then begin
        edt_AxisName.Text := Axis.AxisName;
        edtAxisMin.Text   := FormatFloat('0.####', Axis.fAxisMin);
        edtAxisMax.Text   := FormatFloat('0.####', Axis.fAxisMax);
        edtAxisStep.Text  := FormatFloat('0.####', Axis.AxisStep);
        shp_AxisColor.Brush.Color := Axis.AxisColor;
        chk_AxisVisible.Checked   := Axis.Visible;
        BtnAxisApply.Enabled := True;
    end else begin
        edt_AxisName.Text := '';
        edtAxisMin.Text   := '';
        edtAxisMax.Text   := '';
        edtAxisStep.Text  := '';
        shp_AxisColor.Brush.Color := clBtnFace;
        chk_AxisVisible.Checked   := False;
        BtnAxisApply.Enabled := False;
    end;
end;

procedure TFrmSetGraph.BtnAxisApplyClick(Sender: TObject);
var Axis : TAxis;
    fMin, fMax, fStep : Double;
begin
    Axis := SelGraph.GetAxis(cbb_AxisList.ItemIndex);
    if Axis <> nil then begin
        Axis.AxisName  := edt_AxisName.Text;
        fMin  := StrToFloatDef(edtAxisMin.Text, 0);
        fMax  := StrToFloatDef(edtAxisMax.Text, 100);
        fStep := StrToFloatDef(edtAxisStep.Text, 0);

        Axis.SetAxisRange( fMin, fMax, fStep );
        Axis.AxisColor := shp_AxisColor.Brush.Color;
        Axis.Visible   := chk_AxisVisible.Checked;
    end;
end;

procedure TFrmSetGraph.cbb_ChListChange(Sender: TObject);
var ChData : TChData;
begin
    ChData := SelGraph.GetChannel(cbb_ChList.ItemIndex);
    if ChData <> nil then begin
        edt_ChannelName.Text    := ChData.ChName;
        cbb_AxisList2.ItemIndex := SelGraph.GetAxisIdx(ChData.RefAxisY);
        shp_ChColor.Brush.Color := ChData.Color;
        chk_ChVisible.Checked   := ChData.Visible;
    end else begin
        edt_ChannelName.Text    := '';
        cbb_AxisList2.ItemIndex := -1;
        shp_ChColor.Brush.Color := clBtnFace;
        chk_ChVisible.Checked   := False;
    end;
end;

procedure TFrmSetGraph.BtnChannelApplyClick(Sender: TObject);
var ChData : TChData;
begin
    ChData := SelGraph.GetChannel(cbb_ChList.ItemIndex);
    if ChData <> nil then begin
        ChData.ChName := edt_ChannelName.Text;
        ChData.RefAxisY := SelGraph.GetAxis(cbb_AxisList2.ItemIndex);
        ChData.Color    := shp_ChColor.Brush.Color;
        ChData.Visible  := chk_ChVisible.Checked;
    end;
end;



procedure TFrmSetGraph.btn1Click(Sender: TObject);
begin
    if dlgOpen.Execute then begin
        SelGraph.LoadFromFile(dlgOpen.FileName);
    end;
end;

procedure TFrmSetGraph.btn2Click(Sender: TObject);
begin
    if dlgSave.Execute then begin
        SelGraph.SaveToFile(dlgSave.FileName);
    end;
end;

procedure TFrmSetGraph.BtnRefAxisApplyClick(Sender: TObject);
begin
    SelGraph.BottomAxis := SelGraph.GetAxis(cbb_BottomAxis.ItemIndex-1);
    SelGraph.LeftAxis   := SelGraph.GetAxis(cbb_LeftAxis.ItemIndex-1);
    SelGraph.RightAxis  := SelGraph.GetAxis(cbb_RightAxis.ItemIndex-1);
end;

end.

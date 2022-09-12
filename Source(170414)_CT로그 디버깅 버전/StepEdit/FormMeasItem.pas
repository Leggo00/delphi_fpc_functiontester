unit FormMeasItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Global;

type
  TFrmMeasItem = class(TForm)
    BitBtn2: TBitBtn;
    BtnClose: TBitBtn;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Edit_Min: TEdit;
    Edit_Max: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    Edit_ItemName: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    ComboBox_Item1: TComboBox;
    RadioGroup_Type1: TRadioGroup;
    Edit_Level1: TEdit;
    Edit_Opt1: TEdit;
    Label_ItemVal1: TLabel;
    Label_Delay1: TLabel;
    Edit_Skip1: TEdit;
    Label_Skip1: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label_ItemVal2: TLabel;
    Label_Delay2: TLabel;
    ComboBox_Item2: TComboBox;
    RadioGroup_Type2: TRadioGroup;
    Edit_Level2: TEdit;
    Edit_Opt2: TEdit;
    Edit_Skip2: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Label_Skip2: TLabel;
    BtnInputAdd: TSpeedButton;
    Image7: TImage;
    Image8: TImage;
    chkCP: TCheckBox;
    img1: TImage;
    Label2: TLabel;
    Edit_Unit: TEdit;
    img2: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup_Type1Click(Sender: TObject);
    procedure RadioGroup_Type2Click(Sender: TObject);
    procedure BtnInputAddClick(Sender: TObject);
    procedure ComboBox_Item1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute(CurrStep : TTestStep; var NewItem, NewParam, NewOption, NewCP, NewUnit : String): Boolean;
  end;

var
  FrmMeasItem: TFrmMeasItem;

implementation

uses GenUtils, FormSelInput;

{$R *.dfm}

function TFrmMeasItem.Execute(CurrStep : TTestStep; var NewItem, NewParam, NewOption, NewCP, NewUnit : String): Boolean;
var i, nCount : Integer;
    RdStr1, RdStr2, Str, Str1, sIndex : String;
begin
    Result := False;
    
    if CurrStep = nil then exit;

    nCount := CurrStep.OutputList.Count;
    if nCount < 1 then exit;

    ComboBox_Item1.Clear;
    ComboBox_Item2.Clear;

    ComboBox_Item2.Items.Add('');
    for i:=0 to nCount-1 do begin
        RdStr1 := CurrStep.OutputList[i];
        Str := GetToken(RdStr1, ';');

        if (Str <> '') then begin
            ComboBox_Item1.Items.Add(Str);
            ComboBox_Item2.Items.Add(Str);
        end;
    end;
    ComboBox_Item1.ItemIndex := 0;
    ComboBox_Item2.ItemIndex := 0;     

    Edit_ItemName.Text := NewItem;

    RdStr1 := NewParam;
    Edit_Min.Text  := GetToken(RdStr1, '~');
    Edit_Max.Text  := GetToken(RdStr1, ' ');

    Edit_Unit.Text := NewUnit;

    RdStr2 := NewOption;
    Str1   := GetToken(RdStr2, '~');
    RdStr1 := GetToken(Str1, '=');


    ComboBox_Item1.Text := GetToken(RdStr1, ':');
    Str := GetToken(RdStr1, ':');
    if Str = 'U'   then RadioGroup_Type1.ItemIndex := 1 else
    if Str = 'D'   then RadioGroup_Type1.ItemIndex := 2 else
    if Str = 'P'   then RadioGroup_Type1.ItemIndex := 3 else
    if Str = 'HL'  then RadioGroup_Type1.ItemIndex := 4 else
    if Str = 'LL'  then RadioGroup_Type1.ItemIndex := 5 else
    if Str = 'MIN' then RadioGroup_Type1.ItemIndex := 6 else
    if Str = 'MAX' then RadioGroup_Type1.ItemIndex := 7 else
                        RadioGroup_Type1.ItemIndex := 0;

    sIndex := GetToken(RdStr1, ':');
    if (RadioGroup_Type1.ItemIndex = 3) and (sIndex = '') then
        Edit_Level1.Text := '0'
    else
        Edit_Level1.Text := sIndex;

    Edit_Opt1.Text  := GetToken(RdStr1, ':');
    Edit_Skip1.Text := Str1;        

    ComboBox_Item2.Text := GetToken(RdStr2, ':');
    Str := GetToken(RdStr2, ':');
    if Str = 'U'  then RadioGroup_Type2.ItemIndex := 1 else
    if Str = 'D'  then RadioGroup_Type2.ItemIndex := 2 else
    if Str = 'UC' then RadioGroup_Type2.ItemIndex := 3 else
    if Str = 'DC' then RadioGroup_Type2.ItemIndex := 4 else
                       RadioGroup_Type2.ItemIndex := 0;

    Str1             := RdStr2;
    RdStr2           := GetToken(Str1, '=');
    Edit_Level2.Text := GetToken(RdStr2, ':');
    Edit_Opt2.Text   := GetToken(RdStr2, ':');
    Edit_Skip2.Text  := Str1;

    chkCP.Checked    := (NewCP = 'T');


    if (ShowModal() = mrOk) then
    begin
        NewItem   := Edit_ItemName.Text;
        NewParam  := Edit_Min.Text + '~' + Edit_Max.Text;
        NewUnit   := Edit_Unit.Text;
        NewOption := '';
        if chkCP.Checked then
            NewCP := 'T'
        else
            NewCP := 'F';

        if (ComboBox_Item1.Text <>  '') then begin
            NewOption := ComboBox_Item1.Text;
            case RadioGroup_Type1.ItemIndex of
                0: NewOption := NewOption + ':L:';
                1: NewOption := NewOption + ':U:';
                2: NewOption := NewOption + ':D:';
                3: NewOption := NewOption + ':P:';
                4: NewOption := NewOption + ':HL:';
                5: NewOption := NewOption + ':LL:';
                6: NewOption := NewOption + ':MIN:';
                7: NewOption := NewOption + ':MAX:';
           end;
            NewOption := NewOption + Edit_Level1.Text;
            if Edit_Opt1.Text <> '' then
                NewOption := NewOption + ':' + Edit_Opt1.Text;

            if Edit_Skip1.Text <> '' then
                NewOption := NewOption + '=' + Edit_Skip1.Text;
        end;

        if (ComboBox_Item2.Text <>  '') and (RadioGroup_Type1.ItemIndex <> 0) then begin
            NewOption := NewOption + '~' + ComboBox_Item2.Text;
            case RadioGroup_Type2.ItemIndex of
                0: NewOption := NewOption + ':L:';
                1: NewOption := NewOption + ':U:';
                2: NewOption := NewOption + ':D:';
                3: NewOption := NewOption + ':UC:';
                4: NewOption := NewOption + ':DC:';
            end;
            NewOption := NewOption + Edit_Level2.Text;
            if Edit_Opt2.Text <> '' then
                NewOption := NewOption + ':' + Edit_Opt2.Text;

            if Edit_Skip2.Text <> '' then
                NewOption := NewOption + '=' + Edit_Skip2.Text;
        end;

        Result := True;
    end;
end;

procedure TFrmMeasItem.FormCreate(Sender: TObject);
begin
    //
end;

procedure TFrmMeasItem.RadioGroup_Type1Click(Sender: TObject);
var Flag : Boolean;
begin
//    Flag := (RadioGroup_Type1.ItemIndex <> 0);
    Flag := (RadioGroup_Type1.ItemIndex in [1, 2]);
    if Flag then Label_ItemVal1.Caption := 'LEVEL'
            else Label_ItemVal1.Caption := 'TIME';

    case RadioGroup_Type1.ItemIndex of
        3..7: begin
            Label_ItemVal1.Caption := 'CHANNEL';
            Label_ItemVal1.Enabled := False;
            Edit_Level1.Text       := IntToStr(ComboBox_Item1.ItemIndex);
            Edit_Level1.Enabled    := False;
        end;
    else
        begin
            Label_ItemVal1.Enabled := True;
            Edit_Level1.Enabled    := True;
        end;
    end;

    Label_Delay1.Enabled     := Flag;
    Label_Skip1.Enabled      := Flag;
    Edit_Opt1.Enabled        := Flag;
    Edit_Skip1.Enabled       := Flag;

    ComboBox_Item2.ItemIndex := 0;
    ComboBox_Item2.Enabled   := Flag;
    RadioGroup_Type2.Enabled := Flag;
    Edit_Level2.Enabled      := Flag;
    Label_ItemVal2.Enabled   := Flag;

    RadioGroup_Type2Click(Sender);
end;

procedure TFrmMeasItem.RadioGroup_Type2Click(Sender: TObject);
var Flag : Boolean;
begin
    Flag := (RadioGroup_Type1.ItemIndex <> 0) and (RadioGroup_Type2.ItemIndex <> 0);

    if Flag then Label_ItemVal2.Caption := 'LEVEL'
            else Label_ItemVal2.Caption := 'TIME';
    
    Label_Delay2.Enabled   := Flag;
    Label_Skip2.Enabled    := Flag;
    Edit_Opt2.Enabled      := Flag;
    Edit_Skip2.Enabled     := Flag;
end;

procedure TFrmMeasItem.BtnInputAddClick(Sender: TObject);
var Str, RdStr : String;
begin
     RdStr := FrmSelInput.Execute(nil, ITEM_OUTPUT);

     Edit_ItemName.Text := GetToken(RdStr, ';');
     ComboBox_Item1.Text := '';
     ComboBox_Item2.Text := '';
end;

procedure TFrmMeasItem.ComboBox_Item1Change(Sender: TObject);
begin
    if RadioGroup_Type1.ItemIndex in [3..7] then
    begin
        Edit_Level1.Text := IntToStr(ComboBox_Item1.ItemIndex);
    end;
end;

end.

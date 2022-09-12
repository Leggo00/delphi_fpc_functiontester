unit UnitImage;

interface

uses
  SysUtils, Classes, ImgList, Controls;

const
  IMAGE_FOLDER  = 0;
  IMAGE_FOLDERX = 1;
  IMAGE_DOC     = 2;
  IMAGE_ECU     = 3;
  IMAGE_FRAME   = 4;
  IMAGE_MESSAGE = 5;

type
  TImageModule = class(TDataModule)
    ImageList: TImageList;
    ImageList_Led: TImageList;
    ImageList_SW: TImageList;
    ImageList_Led2: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImageModule: TImageModule;

implementation

{$R *.dfm}

end.

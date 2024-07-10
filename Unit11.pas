unit Unit11;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, frxClass, frxDBSet;

type
  TDataModule11 = class(TDataModule)
    ZQuery1: TZQuery;
    ZQuery2: TZQuery;
    ZQuery3: TZQuery;
    ZQuery4: TZQuery;
    ds1: TDataSource;
    ds2: TDataSource;
    ds3: TDataSource;
    ds4: TDataSource;
    ZConnection1: TZConnection;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxReport2: TfrxReport;
    frxReport3: TfrxReport;
    frxDBDataset3: TfrxDBDataset;
    ZQuery5: TZQuery;
    ds5: TDataSource;
    frxDBDataset4: TfrxDBDataset;
    frxReport4: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule11: TDataModule11;

implementation

{$R *.dfm}

end.

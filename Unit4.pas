unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm4 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TButton;
    dbgrd1: TDBGrid;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    edt2: TEdit;
    lbl2: TLabel;
    btn6: TButton;
    edt3: TEdit;
    lbl3: TLabel;
    edt4: TEdit;
    lbl4: TLabel;
    edt5: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    edt7: TEdit;
    lbl7: TLabel;
    edt8: TEdit;
    lbl8: TLabel;
    edt9: TEdit;
    lbl9: TLabel;
    cbb1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    procedure posisiawal;
    procedure baru;       
    procedure UpdateGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses
  Unit11;

{$R *.dfm}

procedure TForm4.posisiawal;
begin
  btn1.Enabled := True;
  btn2.Enabled := False;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := False;
  btn6.Enabled := False;
  edt1.Enabled := False;
  edt3.Enabled := False;
  edt4.Enabled := False;
  edt5.Enabled := False;
  cbb1.Enabled := False;
  edt7.Enabled := False;
  edt8.Enabled := False;
  edt9.Enabled := False;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
    posisiawal();
end;

procedure TForm4.baru;
begin
  btn1.Enabled := False;
  btn2.Enabled := True;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := True;
  edt1.Enabled := True;
  edt3.Enabled := True;
  edt4.Enabled := True;
  edt5.Enabled := True;
  cbb1.Enabled := True;
  edt7.Enabled := True;
  edt8.Enabled := True;
  edt9.Enabled := True;

  edt1.SetFocus;
end;

procedure TForm4.btn1Click(Sender: TObject);
begin
  baru();
end;

procedure TForm4.btn5Click(Sender: TObject);
begin
  posisiawal();
  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  cbb1.Clear;
  edt7.Clear;
  edt8.Clear;
  edt9.Clear;
end;

procedure TForm4.UpdateGrid;
begin
DataModule11.ZQuery4.Close;
  DataModule11.ZQuery4.SQL.Clear;
  DataModule11.ZQuery4.SQL.Add('SELECT * FROM user');
  DataModule11.ZQuery4.Open;
end;

procedure TForm4.btn2Click(Sender: TObject);
begin
DataModule11.ZQuery3.Append;

DataModule11.ZQuery3.Post;
end;

end.


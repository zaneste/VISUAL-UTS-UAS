unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, frxClass, frxDBSet;

type
  TForm1 = class(TForm)
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
    btn7: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject); 
  private
    procedure posisiawal;
    procedure baru;
    procedure ubah;
    procedure UpdateGrid;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Unit11;

{$R *.dfm}

{ TForm1 }

procedure TForm1.posisiawal;
begin
  btn1.Enabled := True;
  btn2.Enabled := False;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := False;
  edt1.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  posisiawal();
end;

procedure TForm1.baru;
begin
  btn1.Enabled := False;
  btn2.Enabled := True;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := True;
  edt1.Enabled := True;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  baru();
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  DataModule11.ZQuery1.Append;
  DataModule11.ZQuery1.FieldByName('name').AsString := edt1.Text;

  DataModule11.ZQuery1.Post;
  UpdateGrid();
  edt1.Clear;
  edt1.SetFocus;

  ShowMessage('Data Berhasil di Simpan');
end;


procedure TForm1.ubah;
begin
  btn1.Enabled := False;
  btn2.Enabled := False;
  btn3.Enabled := True;
  btn4.Enabled := True;
  btn5.Enabled := True;
  edt1.Enabled := True;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
  ubah();
  edt1.Text := DataModule11.ZQuery1.fieldbyname('name').AsString;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  DataModule11.ZQuery1.Edit;
  DataModule11.ZQuery1.FieldByName('name').AsString := edt1.Text;

  DataModule11.ZQuery1.Post;
  edt1.Clear;
  edt1.SetFocus;

  ShowMessage('Data Berhasil di Ubah');
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  if DataModule11.ZQuery1.RecordCount <= 0 then
    MessageDlg('Data Tidak Ada', mtWarning, [mbOK], 0)
  else
  begin
    if MessageDlg('Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DataModule11.ZQuery1.Delete;
      ShowMessage('Data Berhasil Dihapus');
    end;
  end;

  edt1.Clear;
  edt1.SetFocus;
end;


procedure TForm1.btn5Click(Sender: TObject);
begin
  posisiawal();
  edt1.Clear;
  UpdateGrid();
end;

procedure TForm1.btn6Click(Sender: TObject);
var
  searchText: string;
begin
  ubah();
  searchText := edt2.Text;

  DataModule11.ZQuery1.SQL.Clear;
  DataModule11.ZQuery1.SQL.Add('SELECT * FROM kategori WHERE name LIKE :searchText');
  DataModule11.ZQuery1.Params.ParamByName('searchText').AsString := '%' + searchText + '%';
  DataModule11.ZQuery1.Open;

  if DataModule11.ZQuery1.RecordCount = 0 then
    ShowMessage('Data tidak ditemukan');
    edt2.Clear;
end;

procedure TForm1.UpdateGrid;
begin
  DataModule11.ZQuery1.Close;
  DataModule11.ZQuery1.SQL.Clear;
  DataModule11.ZQuery1.SQL.Add('SELECT * FROM kategori');
  DataModule11.ZQuery1.Open;
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
DataModule11.frxReport1.ShowReport();
end;

end.


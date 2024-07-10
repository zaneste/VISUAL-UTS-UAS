unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
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
    edt6: TEdit;
    lbl6: TLabel;
    edt7: TEdit;
    lbl7: TLabel;
    edt8: TEdit;
    lbl8: TLabel;
    edt9: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    edt10: TEdit;
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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses
  Unit11;

{$R *.dfm}

procedure TForm3.posisiawal;
begin
btn1.Enabled := True;
btn2.Enabled := False;
btn3.Enabled := False;
btn4.Enabled := False;
btn5.Enabled := False;
edt1.Enabled := False;
edt3.Enabled := False;
edt4.Enabled := False;
edt5.Enabled := False;
edt6.Enabled := False;
edt7.Enabled := False;
edt8.Enabled := False;
edt9.Enabled := False;
edt10.Enabled := False;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
posisiawal();
end;

procedure TForm3.baru;
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
  edt6.Enabled := True;
  edt7.Enabled := True;
  edt8.Enabled := True;
  edt9.Enabled := True;
  edt10.Enabled := True;

  edt1.SetFocus;
end;

procedure TForm3.ubah;
begin
btn1.Enabled := False;
  btn2.Enabled := False;
  btn3.Enabled := True;
  btn4.Enabled := True;
  btn5.Enabled := True;
  edt1.Enabled := True;
  edt3.Enabled := True;
  edt4.Enabled := True;
  edt5.Enabled := True;
  edt6.Enabled := True;
  edt7.Enabled := True;
  edt8.Enabled := True;
  edt9.Enabled := True;
  edt10.Enabled := True;
end;

procedure TForm3.UpdateGrid;
begin
DataModule11.ZQuery3.Close;
  DataModule11.ZQuery3.SQL.Clear;
  DataModule11.ZQuery3.SQL.Add('SELECT * FROM supplier');
  DataModule11.ZQuery3.Open;
end;

procedure TForm3.btn1Click(Sender: TObject);
begin
baru();
end;

procedure TForm3.btn2Click(Sender: TObject);
begin
DataModule11.ZQuery3.Append;
  DataModule11.ZQuery3.FieldByName('Nik').AsString := edt1.Text;
  DataModule11.ZQuery3.FieldByName('name').AsString := edt3.Text;
  DataModule11.ZQuery3.FieldByName('telp').AsString := edt4.Text;
  DataModule11.ZQuery3.FieldByName('email').AsString := edt5.Text;
  DataModule11.ZQuery3.FieldByName('alamat').AsString := edt6.Text;
  DataModule11.ZQuery3.FieldByName('perusahaan').AsString := edt7.Text;
  DataModule11.ZQuery3.FieldByName('nama_bank').AsString := edt8.Text;
  DataModule11.ZQuery3.FieldByName('nama_akun_bank').AsString := edt9.Text;
  DataModule11.ZQuery3.FieldByName('no_akun_bank').AsString := edt10.Text;

  DataModule11.ZQuery3.Post;
  UpdateGrid();
  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  edt7.Clear;
  edt8.Clear;
  edt9.Clear;
  edt10.Clear;

  edt1.SetFocus;

  ShowMessage('Data Berhasil di Simpan');
end;

procedure TForm3.dbgrd1CellClick(Column: TColumn);
begin
  ubah();
  edt1.Text := DataModule11.ZQuery3.fieldbyname('Nik').AsString;
  edt3.Text := DataModule11.ZQuery3.fieldbyname('name').AsString;
  edt4.Text := DataModule11.ZQuery3.fieldbyname('telp').AsString;
  edt5.Text := DataModule11.ZQuery3.fieldbyname('email').AsString;
  edt6.Text := DataModule11.ZQuery3.fieldbyname('alamat').AsString;
  edt7.Text := DataModule11.ZQuery3.fieldbyname('perusahaan').AsString;
  edt8.Text := DataModule11.ZQuery3.fieldbyname('nama_bank').AsString;
  edt9.Text := DataModule11.ZQuery3.fieldbyname('nama_akun_bank').AsString;
  edt10.Text := DataModule11.ZQuery3.fieldbyname('no_akun_bank').AsString;

end;

procedure TForm3.btn4Click(Sender: TObject);
begin
DataModule11.ZQuery3.Edit;
  DataModule11.ZQuery3.FieldByName('Nik').AsString := edt1.Text;
  DataModule11.ZQuery3.FieldByName('name').AsString := edt3.Text;
  DataModule11.ZQuery3.FieldByName('telp').AsString := edt4.Text;
  DataModule11.ZQuery3.FieldByName('email').AsString := edt5.Text;
  DataModule11.ZQuery3.FieldByName('alamat').AsString := edt6.Text;
  DataModule11.ZQuery3.FieldByName('perusahaan').AsString := edt7.Text;
  DataModule11.ZQuery3.FieldByName('nama_bank').AsString := edt8.Text;
  DataModule11.ZQuery3.FieldByName('nama_akun_bank').AsString := edt9.Text;
  DataModule11.ZQuery3.FieldByName('no_akun_bank').AsString := edt10.Text;

  DataModule11.ZQuery3.Post;
  UpdateGrid();
  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  edt7.Clear;
  edt8.Clear;
  edt9.Clear;
  edt10.Clear;

  ShowMessage('Data Berhasil di Ubah');
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
  if DataModule11.ZQuery3.RecordCount <= 0 then
    MessageDlg('Data Tidak Ada', mtWarning, [mbOK], 0)
  else
  begin
    if MessageDlg('Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DataModule11.ZQuery3.Delete;
      ShowMessage('Data Berhasil Dihapus');
    end;
  end;

  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  edt7.Clear;
  edt8.Clear;
  edt9.Clear;
  edt1.SetFocus;
end;

procedure TForm3.btn5Click(Sender: TObject);
begin
posisiawal();
UpdateGrid();
edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  edt7.Clear;
  edt8.Clear;
  edt9.Clear;
  edt10.Clear;

end;

procedure TForm3.btn6Click(Sender: TObject);
var
  searchText: string;
begin
  ubah();
  searchText := edt2.Text;

  DataModule11.ZQuery3.SQL.Clear;
  DataModule11.ZQuery3.SQL.Add('SELECT * FROM supplier WHERE ' +
                               'name LIKE :searchText OR ' +
                               'nik LIKE :searchText OR ' +
                               'alamat LIKE :searchText OR ' +
                               'telp LIKE :searchText OR ' +
                               'email LIKE :searchText OR ' +
                               'perusahaan LIKE :searchText');
  DataModule11.ZQuery3.Params.ParamByName('searchText').AsString := '%' + searchText + '%';
  DataModule11.ZQuery3.Open;

  if DataModule11.ZQuery3.RecordCount = 0 then
    ShowMessage('Data tidak ditemukan');
  edt2.Clear;
end;


procedure TForm3.btn7Click(Sender: TObject);
begin
DataModule11.frxReport3.ShowReport();
end;

end.

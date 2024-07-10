unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm10 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    edt2: TEdit;
    btn6: TButton;
    lbl3: TLabel;
    edt3: TEdit;
    lbl4: TLabel;
    edt4: TEdit;
    lbl5: TLabel;
    edt5: TEdit;
    lbl6: TLabel;
    edt6: TEdit;
    lbl10: TLabel;
    cbb1: TComboBox;
    lbl8: TLabel;
    lbl9: TLabel;
    dbgrd1: TDBGrid;
    btn7: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn7Click(Sender: TObject);
  private
    procedure posisiawal;
    procedure baru;
    procedure ubah;
    procedure UpdateGrid;
    procedure member;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses
  Unit11;

{$R *.dfm}

procedure TForm10.baru;
begin
  btn1.Enabled := False;
  btn2.Enabled := True;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := True;
  edt1.Enabled := True;
  edt2.Enabled := True;
  edt3.Enabled := True;
  edt4.Enabled := True;
  edt5.Enabled := True;
  cbb1.Enabled := True;
end;

procedure TForm10.posisiawal;
begin
  btn1.Enabled := True;
  btn2.Enabled := False;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := False;
  edt1.Enabled := False;
  edt2.Enabled := False;
  edt3.Enabled := False;
  edt4.Enabled := False;
  edt5.Enabled := False;
  cbb1.Enabled := False;
  cbb1.Text := '---PILIH---';
end;

procedure TForm10.ubah;
begin
  btn1.Enabled := False;
  btn2.Enabled := False;
  btn3.Enabled := True;
  btn4.Enabled := True;
  btn5.Enabled := True;
  edt1.Enabled := True;
  edt2.Enabled := True;
  edt3.Enabled := True;
  edt4.Enabled := True;
  edt5.Enabled := True;
  cbb1.Enabled := True;
end;

procedure TForm10.UpdateGrid;
begin
  DataModule11.ZQuery5.Close;
  DataModule11.ZQuery5.SQL.Clear;
  DataModule11.ZQuery5.SQL.Add('SELECT * FROM kustomer');
  DataModule11.ZQuery5.Open;
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  posisiawal();
  member();
end;

procedure TForm10.btn1Click(Sender: TObject);
begin
  baru();
  cbb1.Clear;
  cbb1.Text := '---PILIH---';
  member();
end;

procedure TForm10.dbgrd1CellClick(Column: TColumn);
begin
  ubah();
  edt1.Text := DataModule11.ZQuery5.fieldbyname('nik').AsString;
  edt3.Text := DataModule11.ZQuery5.fieldbyname('name').AsString;
  edt4.Text := DataModule11.ZQuery5.fieldbyname('telp').AsString;
  edt5.Text := DataModule11.ZQuery5.fieldbyname('email').AsString;
  edt6.Text := DataModule11.ZQuery5.fieldbyname('alamat').AsString;
  cbb1.Text := DataModule11.ZQuery5.fieldbyname('member').AsString;
  cbb1Change(cbb1); // Call change event to update lbl9 accordingly
end;

procedure TForm10.btn2Click(Sender: TObject);
begin
  DataModule11.ZQuery5.Append;
  DataModule11.ZQuery5.FieldByName('nik').AsString := edt1.Text;
  DataModule11.ZQuery5.FieldByName('name').AsString := edt3.Text;
  DataModule11.ZQuery5.FieldByName('telp').AsString := edt4.Text;
  DataModule11.ZQuery5.FieldByName('email').AsString := edt5.Text;
  DataModule11.ZQuery5.FieldByName('alamat').AsString := edt6.Text;
  DataModule11.ZQuery5.FieldByName('member').AsString := cbb1.Text;

  DataModule11.ZQuery5.Post;
  UpdateGrid();
  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  cbb1.Clear;
  edt1.SetFocus;

  ShowMessage('Data Berhasil di Simpan');
end;

procedure TForm10.btn4Click(Sender: TObject);
begin
  DataModule11.ZQuery5.Edit;
  DataModule11.ZQuery5.FieldByName('nik').AsString := edt1.Text;
  DataModule11.ZQuery5.FieldByName('name').AsString := edt3.Text;
  DataModule11.ZQuery5.FieldByName('telp').AsString := edt4.Text;
  DataModule11.ZQuery5.FieldByName('email').AsString := edt5.Text;
  DataModule11.ZQuery5.FieldByName('alamat').AsString := edt6.Text;
  DataModule11.ZQuery5.FieldByName('member').AsString := cbb1.Text;

  DataModule11.ZQuery5.Post;
  UpdateGrid();
  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  cbb1.ItemIndex := -1;
  member();
  edt1.SetFocus;

  ShowMessage('Data Berhasil di Ubah');
end;

procedure TForm10.btn3Click(Sender: TObject);
begin
  if DataModule11.ZQuery5.RecordCount <= 0 then
    MessageDlg('Data Tidak Ada', mtWarning, [mbOK], 0)
  else
  begin
    if MessageDlg('Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DataModule11.ZQuery5.Delete;
      ShowMessage('Data Berhasil Dihapus');
    end;
  end;

  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  cbb1.Clear;
  edt1.SetFocus;
end;

procedure TForm10.btn5Click(Sender: TObject);
begin
  posisiawal();
  edt1.Clear;
  edt3.Clear;
  edt4.Clear;
  edt5.Clear;
  edt6.Clear;
  UpdateGrid();
end;

procedure TForm10.btn6Click(Sender: TObject);
var
  searchText: string;
begin
  ubah();
  searchText := edt2.Text;

  DataModule11.ZQuery5.SQL.Clear;
  DataModule11.ZQuery5.SQL.Add('SELECT * FROM kustomer WHERE name LIKE :searchText');
  DataModule11.ZQuery5.Params.ParamByName('searchText').AsString := '%' + searchText + '%';
  DataModule11.ZQuery5.Open;

  if DataModule11.ZQuery5.RecordCount = 0 then
    ShowMessage('Data tidak ditemukan');
  edt2.Clear;
end;

procedure TForm10.cbb1Change(Sender: TObject);
begin
  if cbb1.Text = 'Yes' then
    lbl9.Caption := '10%'
  else if cbb1.Text = 'No' then
    lbl9.Caption := '5%';
end;

procedure TForm10.member;
begin
  cbb1.Items.Clear;
  cbb1.Items.Add('Yes');
  cbb1.Items.Add('No');
  cbb1.OnChange := cbb1Change; // Set event handler for change event
end;

procedure TForm10.btn7Click(Sender: TObject);
begin
DataModule11.frxReport4.ShowReport();
end;

end.


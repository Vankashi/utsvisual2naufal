unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm2 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    btn1: TButton;
    dbgrd1: TDBGrid;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    edt2: TEdit;
    btn6: TButton;
    lbl3: TLabel;
    edt3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
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
  Form2: TForm2;

implementation

uses
   Unit2;

{$R *.dfm}



{ TForm2 }

procedure TForm2.baru;
begin
btn1.Enabled := False;
  btn2.Enabled := True;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := True;
  edt1.Enabled := True;
  edt3.Enabled := True;

  edt1.SetFocus;
end;

procedure TForm2.posisiawal;
begin
btn1.Enabled := True;
  btn2.Enabled := False;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := False;
  edt1.Enabled := False;
  edt3.Enabled := False;
end;

procedure TForm2.ubah;
begin
  btn1.Enabled := False;
  btn2.Enabled := False;
  btn3.Enabled := True;
  btn4.Enabled := True;
  btn5.Enabled := True;
  edt1.Enabled := True;
  edt3.Enabled := True;
end;

procedure TForm2.UpdateGrid;
begin
  DataModule2.zqrysatuan.Close;
  DataModule2.zqrysatuan.SQL.Clear;
  DataModule2.zqrysatuan.SQL.Add('SELECT * FROM satuan');
  DataModule2.zqrysatuan.Open;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
posisiawal();
end;

procedure TForm2.btn1Click(Sender: TObject);
begin
baru();
end;

procedure TForm2.btn2Click(Sender: TObject);
begin
  DataModule2.zqrysatuan.Append;
  DataModule2.zqrysatuan.FieldByName('name').AsString := edt1.Text;
  DataModule2.zqrysatuan.FieldByName('diskripsi').AsString := edt3.Text;

  DataModule2.zqrysatuan.Post;
  UpdateGrid();
  edt1.Clear;
  edt3.Clear;
  edt1.SetFocus;

  ShowMessage('Data Berhasil di Simpan');
end;

procedure TForm2.dbgrd1CellClick(Column: TColumn);
begin
  ubah();
  edt1.Text := DataModule2.zqrysatuan.fieldbyname('name').AsString;
  edt3.Text := DataModule2.zqrysatuan.fieldbyname('diskripsi').AsString;
end;

procedure TForm2.btn4Click(Sender: TObject);
begin
  DataModule2.zqrysatuan.Edit;
  DataModule2.zqrysatuan.FieldByName('name').AsString := edt1.Text;
  DataModule2.zqrysatuan.FieldByName('diskripsi').AsString := edt3.Text;

  DataModule2.zqrysatuan.Post;
  edt1.Clear;
  edt3.Clear;
  edt1.SetFocus;

  ShowMessage('Data Berhasil di Ubah');
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
  if DataModule2.zqrysatuan.RecordCount <= 0 then
    MessageDlg('Data Tidak Ada', mtWarning, [mbOK], 0)
  else
  begin
    if MessageDlg('Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DataModule2.zqrysatuan.Delete;
      ShowMessage('Data Berhasil Dihapus');
    end;
  end;

  edt1.Clear;
  edt1.SetFocus;
end;

procedure TForm2.btn5Click(Sender: TObject);
begin
  posisiawal();
  edt1.Clear;
  edt3.Clear;
  UpdateGrid();
end;

procedure TForm2.btn6Click(Sender: TObject);
var
  searchText: string;
begin
  ubah();
  ubah();
  searchText := edt2.Text;
  DataModule2.zqrysatuan.Close; // Tutup query yang sedang berjalan
  DataModule2.zqrysatuan.SQL.Clear; // Hapus pernyataan SQL
  DataModule2.zqrysatuan.SQL.Add('SELECT * FROM satuan WHERE name LIKE :searchText');
  DataModule2.zqrysatuan.Params.ParamByName('searchText').AsString := '%' + searchText + '%';
  DataModule2.zqrysatuan.Open; // Buka query

  if DataModule2.zqrysatuan.RecordCount = 0 then
    ShowMessage('Data tidak ditemukan');
    edt2.Clear;
end;


end.

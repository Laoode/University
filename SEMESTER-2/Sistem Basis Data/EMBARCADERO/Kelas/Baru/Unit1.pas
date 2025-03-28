unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, MemDS, DBAccess,
  MyAccess, Vcl.WinXPickers, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    Button1: TButton;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Edit5: TEdit;
    DatePicker1: TDatePicker;
    Button2: TButton;
    Button3: TButton;
    MyQuery2: TMyQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button4: TButton;
    Memo1: TMemo;
    Image1: TImage;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  TableName, btn: string;
  DateValue: TDateTime;
begin
  TableName := ComboBox1.Text; // Mendapatkan nama tabel yang dipilih dari ComboBox1
  DateValue := DatePicker1.Date;
  MyQuery1.Connection := MyConnection1;
  btn:= 'INSERT INTO ' + TableName + ' VALUES (:nilai1, :nilai2, :nilai3, :nilai4';
  try
    if ComboBox1.Text = 'tb_artis' then
    begin
      MyQuery1.Close;
      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add(btn+')') ;
      MyQuery1.ParamByName('nilai1').AsInteger := StrToInt(Edit1.Text);
      MyQuery1.ParamByName('nilai2').AsString := Edit2.Text;
      MyQuery1.ParamByName('nilai3').AsString := Edit3.Text;
      MyQuery1.ParamByName('nilai4').AsDate := DateValue;
      MyQuery1.ExecSQL;
    end
    else if ComboBox1.Text = 'tb_lagu' then
    begin
      MyQuery1.Close;
      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add(btn+', :nilai5)') ;
      MyQuery1.ParamByName('nilai1').AsInteger := StrToInt(Edit1.Text);
      MyQuery1.ParamByName('nilai2').AsInteger := StrToInt(Edit2.Text);
      MyQuery1.ParamByName('nilai3').AsInteger := StrToInt(Edit3.Text);
      MyQuery1.ParamByName('nilai4').AsString := Edit4.Text;
      MyQuery1.ParamByName('nilai5').AsInteger := StrToInt(Edit5.Text);
      MyQuery1.ExecSQL;
    end
    else if ComboBox1.Text = 'tb_album' then
    begin
      MyQuery1.Close;
      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add(btn+', :nilai5)') ;
      MyQuery1.ParamByName('nilai1').AsInteger := StrToInt(Edit1.Text);
      MyQuery1.ParamByName('nilai2').AsInteger := StrToInt(Edit2.Text);
      MyQuery1.ParamByName('nilai3').Asstring := Edit3.Text;
      MyQuery1.ParamByName('nilai4').AsFloat := StrToFloat(Edit4.Text);
      MyQuery1.ParamByName('nilai5').AsInteger := StrToInt(Edit5.Text);
      MyQuery1.ExecSQL;
    end;

    ShowMessage('Data berhasil ditambahkan ke tabel ' + TableName);
  finally
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  TableName, btn2: string;
  DateValue: TDate;
begin
  TableName := ComboBox1.Text; // Mendapatkan nama tabel yang dipilih dari ComboBox1
  DateValue := DatePicker1.Date;
  MyQuery1.Connection := MyConnection1;
  try
    if ComboBox1.Text = 'tb_artis' then
    begin
      MyQuery1.Close;
      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add('UPDATE ' + TableName + ' SET Nama_artis= :nilai2, Alamat= :nilai3, Tgl_lahir= :nilai4 WHERE Id_artis= :nilai1') ;
      MyQuery1.ParamByName('nilai1').AsInteger := StrToInt(Edit1.Text);
      MyQuery1.ParamByName('nilai2').AsString := Edit2.Text;
      MyQuery1.ParamByName('nilai3').AsString := Edit3.Text;
      MyQuery1.ParamByName('nilai4').AsDate := DateValue;
      MyQuery1.ExecSQL;
    end
    else if ComboBox1.Text = 'tb_lagu' then
    begin
      MyQuery1.Close;
      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add('UPDATE ' + TableName + ' SET Id_album= :nilai2, Id_artis= :nilai3, Judul= :nilai4, Durasi= :nilai5 WHERE Id_lagu= :nilai1') ;
      MyQuery1.ParamByName('nilai1').AsInteger := StrToInt(Edit1.Text);
      MyQuery1.ParamByName('nilai2').AsInteger := StrToInt(Edit2.Text);
      MyQuery1.ParamByName('nilai3').AsInteger := StrToInt(Edit3.Text);
      MyQuery1.ParamByName('nilai4').AsString := Edit4.Text;
      MyQuery1.ParamByName('nilai5').AsTime := StrToTime(Edit5.Text);
      MyQuery1.ExecSQL;
    end
    else if ComboBox1.Text = 'tb_album' then
    begin
      MyQuery1.Close;
      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add('UPDATE ' + TableName + ' SET Id_artis= :nilai2, Nama_album= :nilai3, Harga= :nilai4, Thn_rilis= :nilai5 WHERE Id_album= :nilai1') ;
      MyQuery1.ParamByName('nilai1').AsInteger := StrToInt(Edit1.Text);
      MyQuery1.ParamByName('nilai2').AsInteger := StrToInt(Edit2.Text);
      MyQuery1.ParamByName('nilai3').AsString := Edit3.Text;
      MyQuery1.ParamByName('nilai4').AsFloat := StrToFloat(Edit4.Text);
      MyQuery1.ParamByName('nilai5').AsInteger := StrToInt(Edit5.Text);
      MyQuery1.ExecSQL;
    end;
    ShowMessage('Data ' + TableName + 'berhasil diubah');
    finally
  end;
end;
procedure TForm1.Button3Click(Sender: TObject);
var
  TableName : string;
begin
  TableName := ComboBox1.Text; // Mendapatkan nama tabel yang dipilih dari ComboBox1
  MyQuery1.Connection := MyConnection1;
  try
    if ComboBox1.Text = 'tb_artis' then
    begin
      MyQuery1.Close;
      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add('DELETE FROM ' + TableName + ' WHERE Id_artis= :nilai1') ;
      MyQuery1.ParamByName('nilai1').AsInteger := StrToInt(Edit1.Text);
      MyQuery1.ExecSQL;
    end
    else if ComboBox1.Text = 'tb_lagu' then
    begin
      MyQuery1.Close;
      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add('DELETE FROM ' + TableName + ' WHERE Id_lagu= :nilai1') ;
      MyQuery1.ParamByName('nilai1').AsInteger := StrToInt(Edit1.Text);
      MyQuery1.ExecSQL;
    end
    else if ComboBox1.Text = 'tb_album' then
    begin
      MyQuery1.Close;
      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add('DELETE FROM ' + TableName + ' WHERE Id_album= :nilai1') ;
      MyQuery1.ParamByName('nilai1').AsInteger := StrToInt(Edit1.Text);
      MyQuery1.ExecSQL;
    end;
    ShowMessage('Data ' + TableName + 'berhasil dihapus');
    finally
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  btn : string;
begin
  MyQuery1.Connection := MyConnection1;
  btn := Memo1.Text;
  MyQuery2.Close;
  MyQuery2.SQL.Clear;
  MyQuery2.SQL.Add(btn);
  MyQuery2.Execute;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
    MyQuery1 := TMyQuery.Create(Self);
   if ComboBox1.Text = 'tb_artis' then
  begin
    Label1.Caption := 'ID Artis';
    Label2.Caption := 'Nama Artis';
    Label3.Caption := 'Alamat';
    Label4.Caption := 'Tanggal Lahir';
    Label5.Caption := 'Blank';
    Edit4.Visible := False; // Menyembunyikan TEdit
    DatePicker1.Visible := True; // Menampilkan TDatePicker
    Edit5.Enabled := False;
  end
  else if ComboBox1.Text = 'tb_lagu' then
  begin
    Label1.Caption := 'ID Lagu';
    Label2.Caption := 'ID Album';
    Label3.Caption := 'ID Artis';
    Label4.Caption := 'Judul';
    Label5.Caption := 'Durasi';
    DatePicker1.Visible := False;
    Edit4.Visible := True;
    Edit5.Enabled := True;
  end
  else
  begin
    Label1.Caption := 'ID Album';
    Label2.Caption := 'ID Artis';
    Label3.Caption := 'Nama Album';
    Label4.Caption := 'Harga';
    Label5.Caption := 'Tahun Rilis';
    Edit4.Visible := True;
    DatePicker1.Visible := False;
    Edit5.Enabled := True;
  end;
  // Mengupdate query untuk menggunakan tabel yang dipilih
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 i: Integer;
begin
  // Mengambil daftar tabel dari database dan mengisinya ke dalam ComboBox
  MyConnection1.Connected := True; // Terhubung ke database

  MyQuery1.Close;
  MyQuery1.SQL.Text := 'SHOW TABLES'; // Query untuk mendapatkan daftar tabel
  MyQuery1.Open;

  ComboBox1.Items.Clear;
  while not MyQuery1.Eof do
  begin
    ComboBox1.Items.Add(MyQuery1.Fields[0].AsString);
    MyQuery1.Next;
  end;

  end;
end.

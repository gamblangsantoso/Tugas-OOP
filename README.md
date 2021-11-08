# Tugas-OOP

LEMBAR TUGAS
Pemograman Orientasi Objek

Nama	: Gamblang Santoso
NIM	: 311910253
Kelas	: TI.19.E2
https://github.com/gamblangsantoso/Tugas-OOP

TUGAS PERHITUNGAN PENJUALAN BARANG
Dengan Data Sebagai berikut :
Kode	Nama Barang	Harga Barang
A01	Speaker	50000
B02	Mouse	25000
C03	Harddisk	750000
D04	Mouse Pad	5000

Dengan Ketentuan Sebagai berikut :
Sub Total	Diskon
>=100000	15&
>=50000	10%
>=25000	5%
<25000	0%

PENYELESAIAN
1.	Tampilan Sebelum Dijalankan
 
2.	Tampilkan Saat Dijalankan 
 
3.	Memilih Kode Barang yang di Jual
 
Jika Kode Barang yang di pilih “A01” maka otomatis akan muncul Nama Barang “Speaker” dengan Harga “50000”,
 
Jika Kode Barang yang di pilih “B02” maka otomatis akan muncul Nama Barang “Mouse” dengan Harga “25000”,
 
Jika Kode Barang yang di pilih “C03” maka otomatis akan muncul Nama Barang “Harddisk” dengan Harga “750000”,

Jika Kode Barang yang di pilih “D04” maka otomatis akan muncul Nama Barang  “Mouse Pad” dengan Harga “5000”,
 
Dengan Ketentuan :
•	Jika Sub Total lebih dari Rp 100.000,- maka diberi diskon sebesar 15%
•	Jika Sub Total lebih dari Rp 50.000,- maka diberi diskon sebesar 10%
•	Jika Sub Total lebih dari Rp 25.000,- maka diberi diskon sebesar 5%
•	Jika Sub Total Kurang dari Rp 25.000,- maka diberi diskon sebesar 0%

4.	Tekan Tombol “Ulang” untuk Membersihkan Kembali Tempat Penginputan
 
5.	Klik Tombol Keluar untuk Keluar dari Program
 
6.	Jika Quantity >10 Maka akan Muncul Notifikasi
 
Source Code-nya:
unit Unit1GamblangSantoso_PB;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList;
type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EQty: TEdit;
    ENama: TEdit;
    EHarga: TEdit;
    ESubTotal: TEdit;
    EDiskon: TEdit;
    ETotal: TEdit;
    Tbl_Hitung: TButton;
    Tbl_Ulang: TButton;
    Tbl_Keluar: TButton;
    cbkode: TComboBox;
    Label8: TLabel;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    Label9: TLabel;
    Label12: TLabel;
    procedure EQtyChange(Sender: TObject);
    procedure Tbl_HitungClick(Sender: TObject);
    procedure Tbl_UlangClick(Sender: TObject);
    procedure Tbl_KeluarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
procedure TForm1.Tbl_HitungClick(Sender: TObject);
var
 kode, nama:string;
 harga, diskon, subtotal,total:currency;
 qty:integer;
begin
 kode:=cbkode.Text;
 kode:=trim(kode);
 kode:=uppercase(kode);
 kode:=copy(kode,1,3);
 // Di baris ini, kode sudah pasti tidak ada spasi di awal dan diakhir
 // kode sudah pasti capital (tidak mempunyai huruf kecil)
 // kode pasti 3 huruf atau kurang
 if length(kode)<>3 then
 begin
 showmessage('Kode harus 3 karakter');
 cbkode.SetFocus;
 exit;
 end;
 // Di baris ini, kode sudah pasti tidak ada spasi di awal dan diakhir
 // kode sudah pasti capital (tidak mempunyai huruf kecil)
 // kode pasti 3 huruf tidak mungkin kurang
 if kode='A01' then
 begin
 harga:=50000;
 nama:='Speaker';
 end
 else
 if kode='B02' then
 begin
 harga:=25000;
 nama:='Mouse';
 end
 else
 if kode='C03' then
 begin
 harga:=750000;
 nama:='Hardisk';
 end
 else
 if kode='D04' then
 begin
 harga:=5000;
 nama:='Mouse Pad';
 end
 else // Jika kode tidak terdaftar
 begin
 showmessage('Kode tidak dikenal');
 exit;
 end;
 if TryStrToInt(EQty.Text,qty)=false then
 begin
 showmessage('Quantity harus angka.');
 exit;
 end;
 // Di baris ini, Qty pasti bilangan bulat tetapi masih mungkin diatas 10
 if (qty<1) or (qty>10) then
 begin
 showmessage('Hanya boleh beli 1 s/d 10 saja');
 exit;
 end;
 // Di baris ini, Qty pasti bilangan bulat dan pasti berisi 1 s/d 10
 ENama.text:=nama;
 EHarga.text:=CurrToSTr(harga);
 Subtotal:= harga * qty;
 ESubTotal.Text:=CurrToStr(subtotal);
 if subtotal>=100000 then diskon:=0.15 * subtotal else
 if subtotal>=50000 then diskon:=0.1 * subtotal else
 if subtotal>=25000 then diskon:=0.05 * subtotal else
 diskon:=0;
 EDiskon.text:=CurrToStr(diskon);
 Total:=Subtotal-Diskon;
 ETotal.text:=CurrToStr(Total);
end;
procedure TForm1.Tbl_UlangClick(Sender: TObject);
begin
cbkode.Text := '';
EQty.Text := '0';
ENama.Text := '';
EHarga.Text := '0';
ESubTotal.Text := '0';
EDiskon.Text := '0';
ETotal.Text := '0';
cbkode.SetFocus;
end;
procedure TForm1.Tbl_KeluarClick(Sender: TObject);
begin
if(application.MessageBox('Yakin akan keluar dari Program?','Konfirmasi',MB_YesNo)=ID_Yes) then
begin
close;
end
end;
procedure TForm1.EQtyChange(Sender: TObject);
begin
if StrToInt(EQty.Text) > 10 then
ShowMessage('Quantity tidak boleh lebih dari 10');
EQty.SetFocus;
end;
end.

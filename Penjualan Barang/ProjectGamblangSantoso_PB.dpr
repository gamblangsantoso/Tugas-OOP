program ProjectGamblangSantoso_PB;

uses
  Vcl.Forms,
  Unit1GamblangSantoso_PB in 'Unit1GamblangSantoso_PB.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

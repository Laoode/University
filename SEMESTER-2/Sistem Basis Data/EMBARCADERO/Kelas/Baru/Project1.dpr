program Project1;

uses
  Vcl.Forms,
  Unit1 in 'D:\Documents\Semeseter-2\Sistem Basis Data\EMBARCADERO\Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

program DadosJahDFe;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uDadosJahDFe in 'DadosJahDFe\uDadosJahDFe.pas',
  uDadosJahDFeConsts in 'DadosJahDFe\uDadosJahDFeConsts.pas',
  uDadosJahDFeConversion in 'DadosJahDFe\uDadosJahDFeConversion.pas',
  uDadosJahDFeJson in 'DadosJahDFe\uDadosJahDFeJson.pas',
  uDadosJahDFeTypes in 'DadosJahDFe\uDadosJahDFeTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.


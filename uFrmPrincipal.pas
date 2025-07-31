unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Winapi.ShellApi, StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, uDadosJahDFe, uDadosJahDFeTypes, Vcl.ComCtrls,
  DateUtils;

type
  TFrmPrincipal = class(TForm)
    PnLogs: TPanel;
    Memo: TMemo;
    PnPages: TPanel;
    PageControl: TPageControl;
    TsAutenticacao: TTabSheet;
    TsCadastro: TTabSheet;
    TsCertificado: TTabSheet;
    TsEmitente: TTabSheet;
    TsAutXML: TTabSheet;
    TsNFe: TTabSheet;
    TsNFCe: TTabSheet;
    TsInicio: TTabSheet;
    BtnIniciliazarClasse1: TBitBtn;
    BtnLoginSystem: TBitBtn;
    BtnLoginUser: TBitBtn;
    BtnEnviarCertificado: TBitBtn;
    BtnBuscarCertificado: TBitBtn;
    BtnCadEmit: TBitBtn;
    BtnBuscarEmit: TBitBtn;
    BtnCadAutXML: TBitBtn;
    BtnBuscarAutXML: TBitBtn;
    BtnIniciliazarClasse2: TBitBtn;
    Label1: TLabel;
    EdtEmailSystem: TEdit;
    EdtSenhaSystem: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtEmailUser: TEdit;
    EdtSenhaUser: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdtTokenSystem: TEdit;
    EdtExpiracaoSystem: TEdit;
    Label6: TLabel;
    EdtResetTokenSystem: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    EdtTokenUser: TEdit;
    EdtExpiracaoUser: TEdit;
    Label9: TLabel;
    EdtResetTokenUser: TEdit;
    Label10: TLabel;
    BtnSairSystem: TBitBtn;
    BtnSairUser: TBitBtn;
    BtnEsqueciSenhaSystem: TBitBtn;
    BtnEsqueciSenhaUser: TBitBtn;
    BtnRestaurarSenhaSystem: TBitBtn;
    BtnRestaurarSenhaUser: TBitBtn;
    BtnLimparLogs: TBitBtn;
    BtnExibirSenhaSystem: TBitBtn;
    BtnExibirSenhaUser: TBitBtn;
    BtnAbrirPastaSistema: TBitBtn;
    EdtCertificado: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    EdtSenhaCertificado: TEdit;
    BtnExibirSenhaCertificado: TBitBtn;
    PageControlNFe: TPageControl;
    TsEmissaoNFe: TTabSheet;
    TsEventosNFe: TTabSheet;
    TsConsultaNFe: TTabSheet;
    TsStatusServicoNFe: TTabSheet;
    PageControlNFCe: TPageControl;
    TsEmissaoNFCe: TTabSheet;
    TsEventosNFCe: TTabSheet;
    TsConsultaNFCe: TTabSheet;
    TsStatusServicoNFCe: TTabSheet;
    BtnNFeStatusServiceProdMG: TBitBtn;
    BtnNFeStatusServiceHomologMG: TBitBtn;
    BtnNFCeStatusServiceHomologMG: TBitBtn;
    BtnNFCeStatusServiceProdMG: TBitBtn;
    BtnModificarSystem: TBitBtn;
    BtnMinhaContaSystem: TBitBtn;
    BtnModificarUserPeloSystem: TBitBtn;
    BtnModificarUser: TBitBtn;
    BtnMinhaContaUser: TBitBtn;
    BtnDeletarUser: TBitBtn;
    BtnRestaurarUser: TBitBtn;
    BtnListarUser: TBitBtn;
    BtnAdicionarUser: TBitBtn;
    BtnBuscarUser: TBitBtn;
    BtnListarNotificacoesUsuario: TBitBtn;
    BtnAddNotificacaoUsuario: TBitBtn;
    BtnExcluirNotificacaoUsuario: TBitBtn;
    BtnNFeEmisaoAssincrono1: TBitBtn;
    BtnNFeEmisaoSincrono: TBitBtn;
    BtnConsultarNFeIdBatch: TBitBtn;
    BtnConsultarNFeChaveDFe: TBitBtn;
    EdtConsultarNFeIdBatch: TEdit;
    Label13: TLabel;
    BtnConsultarNFeNumero: TBitBtn;
    BtnConsultarNFeIdDFe: TBitBtn;
    BtnConsultarNFeIdExternal: TBitBtn;
    EdtConsultarNFeIdExternal: TEdit;
    Label14: TLabel;
    EdtConsultarNFeChaveDFe: TEdit;
    Label15: TLabel;
    EdtConsultarNFeNumero: TEdit;
    Label16: TLabel;
    EdtConsultarNFeSerie: TEdit;
    Label17: TLabel;
    EdtConsultarNFeIdDFe: TEdit;
    Label18: TLabel;
    BtnCancelamentoNFeAssincrono1: TBitBtn;
    BtnInutilizacaoNumeracaoNFeAssincrono1: TBitBtn;
    BtnInutilizacaoNumeracaoNFeSincrono: TBitBtn;
    BtnCartaCorrecaoNFeAssincrono1: TBitBtn;
    BtnCartaCorrecaoNFeSincrono: TBitBtn;
    EdtEventosNFeIdDfe: TEdit;
    Label20: TLabel;
    EdtEventosNFeChaveDFe: TEdit;
    Label24: TLabel;
    EdtEventosNFeJustCorrecao: TEdit;
    Label25: TLabel;
    EdtEventosNFeNumeroIni: TEdit;
    EdtEventosNFeNumeroFim: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    EdtEventosNFeIdExternal: TEdit;
    Label28: TLabel;
    EdtEventosNFeProtocolo: TEdit;
    Label29: TLabel;
    BtnCancelamentoNFeSincrono: TBitBtn;
    TsConsultaEventoNFe: TTabSheet;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    EdtConEventosNFeIdBatch: TEdit;
    EdtConEventosNFeIddfe: TEdit;
    EdtConEventosNFeIdCan: TEdit;
    EdtConEventosNFeIdinu: TEdit;
    EdtConEventosNFeIdcce: TEdit;
    EdtConEventosNFechavedfe: TEdit;
    BtnConsultNFeCanIdCan: TBitBtn;
    BtnConsultNFeCanIdBatch: TBitBtn;
    BtnConsultNFeCanIdDFe: TBitBtn;
    BtnConsultNFeCanChaveDFe: TBitBtn;
    BtnConsultNFeInuIdBatch: TBitBtn;
    BtnConsultNFeInuIdInu: TBitBtn;
    BtnConsultNFeCorIdBatch: TBitBtn;
    BtnConsultNFeCorIdCCe: TBitBtn;
    BtnConsultNFeCorIdDfe: TBitBtn;
    BtnConsultNFeCorChaveDFe: TBitBtn;
    TsXMLNFe: TTabSheet;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    BtnXmlNFeIdExternal: TBitBtn;
    BtnXmlNFechavedfe: TBitBtn;
    BtnXmlNFeNumero: TBitBtn;
    BtnXmlNFeIddfe: TBitBtn;
    EdtXmlNFeIdExternal: TEdit;
    EdtXmlNFechavedfe: TEdit;
    EdtXmlNFeNumero: TEdit;
    EdtXmlNFeserie: TEdit;
    EdtXmlNFeIddfe: TEdit;
    TsDANFeNFe: TTabSheet;
    Label41: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    BtnDanfeXML: TBitBtn;
    BtnDanfeChavedfe: TBitBtn;
    EdtDanfeXml: TEdit;
    BtnDanfeNumero: TBitBtn;
    BtnDanfeIdDfe: TBitBtn;
    BtnDanfeIdexternal: TBitBtn;
    EdtDanfeIdExternal: TEdit;
    EdtDanfeChaveDfe: TEdit;
    EdtDanfeNumero: TEdit;
    EdtDanfeSerie: TEdit;
    EdtDanfeIdDfe: TEdit;
    TsImpressaoEventoNFe: TTabSheet;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    EdtNFeImpEventoIdDfe: TEdit;
    EdtNFeImpEventoIdCan: TEdit;
    EdtNFeImpEventoIdInu: TEdit;
    EdtNFeImpEventoIdCCe: TEdit;
    EdtNFeImpEventoChaveDfe: TEdit;
    BtnNFeImpEventoCanIdDfe: TBitBtn;
    BtnNFeImpEventoCanIdCan: TBitBtn;
    BtnNFeImpEventoCanChaveDFe: TBitBtn;
    BtnNFeImpEventoInuIdInu: TBitBtn;
    BtnNFeImpEventoCorIdCCe: TBitBtn;
    BtnNFeImpEventoCorIdDFE: TBitBtn;
    BtnNFeImpEventoCorChaveDfe: TBitBtn;
    CmbDanfeTipoImpressao: TComboBox;
    Label19: TLabel;
    TsConsultaEventoNFCe: TTabSheet;
    TsXMLNFCe: TTabSheet;
    TsDANFCeNFCe: TTabSheet;
    TsImpressaoEventoNFCe: TTabSheet;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    BtnCancelamentoNFCeAssincrono1: TBitBtn;
    BtnCancelamentoNFCeSincrono: TBitBtn;
    BtnInutilizacaoNumeracaoNFCeAssincrono1: TBitBtn;
    BtnInutilizacaoNumeracaoNFCeSincrono: TBitBtn;
    EdtEventosNFCeIdDfe: TEdit;
    EdtEventosNFCeChaveDFe: TEdit;
    EdtEventosNFCeJustCorrecao: TEdit;
    EdtEventosNFCeNumeroIni: TEdit;
    EdtEventosNFCeNumeroFim: TEdit;
    EdtEventosNFCeIdExternal: TEdit;
    EdtEventosNFCeProtocolo: TEdit;
    BtnNFCeEmisaoAssincrono1: TBitBtn;
    BtnNFCeEmisaoSincrono: TBitBtn;
    Label40: TLabel;
    Label52: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label61: TLabel;
    EdtConEventosNFCeIdBatch: TEdit;
    EdtConEventosNFCeIddfe: TEdit;
    EdtConEventosNFCeIdCan: TEdit;
    EdtConEventosNFCeIdinu: TEdit;
    EdtConEventosNFCechavedfe: TEdit;
    BtnConsultNFCeCanIdCan: TBitBtn;
    BtnConsultNFCeCanIdBatch: TBitBtn;
    BtnConsultNFCeCanIdDFe: TBitBtn;
    BtnConsultNFCeCanChaveDFe: TBitBtn;
    BtnConsultNFCeInuIdBatch: TBitBtn;
    BtnConsultNFCeInuIdInu: TBitBtn;
    Label60: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    BtnConsultarNFCeIdBatch: TBitBtn;
    BtnConsultarNFCeChaveDFe: TBitBtn;
    EdtConsultarNFCeIdBatch: TEdit;
    BtnConsultarNFCeNumero: TBitBtn;
    BtnConsultarNFCeIdDFe: TBitBtn;
    BtnConsultarNFCeIdExternal: TBitBtn;
    EdtConsultarNFCeIdExternal: TEdit;
    EdtConsultarNFCeChaveDFe: TEdit;
    EdtConsultarNFCeNumero: TEdit;
    EdtConsultarNFCeSerie: TEdit;
    EdtConsultarNFCeIdDFe: TEdit;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    BtnXmlNFCeIdExternal: TBitBtn;
    BtnXmlNFCechavedfe: TBitBtn;
    BtnXmlNFCeNumero: TBitBtn;
    BtnXmlNFCeIddfe: TBitBtn;
    EdtXmlNFCeIdExternal: TEdit;
    EdtXmlNFCechavedfe: TEdit;
    EdtXmlNFCeNumero: TEdit;
    EdtXmlNFCeserie: TEdit;
    EdtXmlNFCeIddfe: TEdit;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    BtnDanfceXML: TBitBtn;
    BtnDanfceChavedfe: TBitBtn;
    EdtDanfceXml: TEdit;
    BtnDanfceNumero: TBitBtn;
    BtnDanfceIdDfe: TBitBtn;
    BtnDanfceIdexternal: TBitBtn;
    EdtDanfceIdExternal: TEdit;
    EdtDanfceChaveDfe: TEdit;
    EdtDanfceNumero: TEdit;
    EdtDanfceSerie: TEdit;
    EdtDanfceIdDfe: TEdit;
    CmbDanfceTipoImpressao: TComboBox;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label83: TLabel;
    EdtNFCeImpEventoIdDfe: TEdit;
    EdtNFCeImpEventoIdCan: TEdit;
    EdtNFCeImpEventoIdInu: TEdit;
    EdtNFCeImpEventoChaveDfe: TEdit;
    BtnNFCeImpEventoCanIdDfe: TBitBtn;
    BtnNFCeImpEventoCanIdCan: TBitBtn;
    BtnNFCeImpEventoCanChaveDFe: TBitBtn;
    BtnNFCeImpEventoInuIdInu: TBitBtn;
    EdtNfceEmissaoIdExternal: TEdit;
    Label82: TLabel;
    Label84: TLabel;
    EdtNfceEmissaoNumeroNota: TEdit;
    EdtNfeEmissaoNumeroNota: TEdit;
    EdtNfeEmissaoIdExternal: TEdit;
    Label85: TLabel;
    Label86: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnIniciliazarClasse1Click(Sender: TObject);
    procedure BtnLoginSystemClick(Sender: TObject);
    procedure BtnLoginUserClick(Sender: TObject);
    procedure BtnEnviarCertificadoClick(Sender: TObject);
    procedure BtnBuscarCertificadoClick(Sender: TObject);
    procedure BtnCadEmitClick(Sender: TObject);
    procedure BtnBuscarEmitClick(Sender: TObject);
    procedure BtnCadAutXMLClick(Sender: TObject);
    procedure BtnBuscarAutXMLClick(Sender: TObject);
    procedure BtnNFeStatusServiceProdMGClick(Sender: TObject);
    procedure BtnNFeStatusServiceHomologMGClick(Sender: TObject);
    procedure BtnNFCeStatusServiceProdMGClick(Sender: TObject);
    procedure BtnNFCeStatusServiceHomologMGClick(Sender: TObject);
    procedure BtnIniciliazarClasse2Click(Sender: TObject);
    procedure BtnLimparLogsClick(Sender: TObject);
    procedure BtnExibirSenhaSystemClick(Sender: TObject);
    procedure BtnExibirSenhaUserClick(Sender: TObject);
    procedure BtnAbrirPastaSistemaClick(Sender: TObject);
    procedure BtnSairSystemClick(Sender: TObject);
    procedure BtnSairUserClick(Sender: TObject);
    procedure BtnEsqueciSenhaSystemClick(Sender: TObject);
    procedure BtnEsqueciSenhaUserClick(Sender: TObject);
    procedure BtnRestaurarSenhaSystemClick(Sender: TObject);
    procedure BtnRestaurarSenhaUserClick(Sender: TObject);
    procedure BtnExibirSenhaCertificadoClick(Sender: TObject);
    procedure BtnMinhaContaSystemClick(Sender: TObject);
    procedure BtnModificarSystemClick(Sender: TObject);
    procedure BtnMinhaContaUserClick(Sender: TObject);
    procedure BtnModificarUserPeloSystemClick(Sender: TObject);
    procedure BtnModificarUserClick(Sender: TObject);
    procedure BtnDeletarUserClick(Sender: TObject);
    procedure BtnRestaurarUserClick(Sender: TObject);
    procedure BtnListarUserClick(Sender: TObject);
    procedure BtnBuscarUserClick(Sender: TObject);
    procedure BtnListarNotificacoesUsuarioClick(Sender: TObject);
    procedure BtnAddNotificacaoUsuarioClick(Sender: TObject);
    procedure BtnExcluirNotificacaoUsuarioClick(Sender: TObject);
    procedure BtnAdicionarUserClick(Sender: TObject);
    procedure BtnNFeEmisaoAssincrono1Click(Sender: TObject);
    procedure BtnConsultarNFeIdBatchClick(Sender: TObject);
    procedure BtnNFeEmisaoSincronoClick(Sender: TObject);
    procedure BtnConsultarNFeChaveDFeClick(Sender: TObject);
    procedure BtnConsultarNFeNumeroClick(Sender: TObject);
    procedure BtnConsultarNFeIdDFeClick(Sender: TObject);
    procedure BtnConsultarNFeIdExternalClick(Sender: TObject);
    procedure BtnCancelamentoNFeAssincrono1Click(Sender: TObject);
    procedure BtnCancelamentoNFeSincronoClick(Sender: TObject);
    procedure BtnInutilizacaoNumeracaoNFeAssincrono1Click(Sender: TObject);
    procedure BtnInutilizacaoNumeracaoNFeSincronoClick(Sender: TObject);
    procedure BtnCartaCorrecaoNFeAssincrono1Click(Sender: TObject);
    procedure BtnCartaCorrecaoNFeSincronoClick(Sender: TObject);
    procedure BtnConsultNFeCanIdBatchClick(Sender: TObject);
    procedure BtnConsultNFeCanIdCanClick(Sender: TObject);
    procedure BtnConsultNFeCanIdDFeClick(Sender: TObject);
    procedure BtnConsultNFeCanChaveDFeClick(Sender: TObject);
    procedure BtnConsultNFeInuIdBatchClick(Sender: TObject);
    procedure BtnConsultNFeInuIdInuClick(Sender: TObject);
    procedure BtnConsultNFeCorIdBatchClick(Sender: TObject);
    procedure BtnConsultNFeCorIdCCeClick(Sender: TObject);
    procedure BtnConsultNFeCorIdDfeClick(Sender: TObject);
    procedure BtnConsultNFeCorChaveDFeClick(Sender: TObject);
    procedure BtnXmlNFeIdExternalClick(Sender: TObject);
    procedure BtnXmlNFechavedfeClick(Sender: TObject);
    procedure BtnXmlNFeNumeroClick(Sender: TObject);
    procedure BtnXmlNFeIddfeClick(Sender: TObject);
    procedure BtnDanfeIdexternalClick(Sender: TObject);
    procedure BtnDanfeXMLClick(Sender: TObject);
    procedure BtnDanfeChavedfeClick(Sender: TObject);
    procedure BtnDanfeNumeroClick(Sender: TObject);
    procedure BtnDanfeIdDfeClick(Sender: TObject);
    procedure BtnNFeImpEventoCanIdCanClick(Sender: TObject);
    procedure BtnNFeImpEventoCanIdDfeClick(Sender: TObject);
    procedure BtnNFeImpEventoCanChaveDFeClick(Sender: TObject);
    procedure BtnNFeImpEventoInuIdInuClick(Sender: TObject);
    procedure BtnNFeImpEventoCorIdCCeClick(Sender: TObject);
    procedure BtnNFeImpEventoCorIdDFEClick(Sender: TObject);
    procedure BtnNFeImpEventoCorChaveDfeClick(Sender: TObject);
    procedure BtnNFCeEmisaoAssincrono1Click(Sender: TObject);
    procedure BtnNFCeEmisaoSincronoClick(Sender: TObject);
    procedure BtnCancelamentoNFCeAssincrono1Click(Sender: TObject);
    procedure BtnCancelamentoNFCeSincronoClick(Sender: TObject);
    procedure BtnInutilizacaoNumeracaoNFCeAssincrono1Click(Sender: TObject);
    procedure BtnInutilizacaoNumeracaoNFCeSincronoClick(Sender: TObject);
    procedure BtnConsultNFCeCanIdBatchClick(Sender: TObject);
    procedure BtnConsultNFCeCanIdCanClick(Sender: TObject);
    procedure BtnConsultNFCeCanIdDFeClick(Sender: TObject);
    procedure BtnConsultNFCeCanChaveDFeClick(Sender: TObject);
    procedure BtnConsultNFCeInuIdBatchClick(Sender: TObject);
    procedure BtnConsultNFCeInuIdInuClick(Sender: TObject);
    procedure BtnConsultarNFCeIdBatchClick(Sender: TObject);
    procedure BtnConsultarNFCeChaveDFeClick(Sender: TObject);
    procedure BtnConsultarNFCeNumeroClick(Sender: TObject);
    procedure BtnConsultarNFCeIdDFeClick(Sender: TObject);
    procedure BtnConsultarNFCeIdExternalClick(Sender: TObject);
    procedure BtnXmlNFCeIdExternalClick(Sender: TObject);
    procedure BtnXmlNFCechavedfeClick(Sender: TObject);
    procedure BtnXmlNFCeNumeroClick(Sender: TObject);
    procedure BtnXmlNFCeIddfeClick(Sender: TObject);
    procedure BtnDanfceXMLClick(Sender: TObject);
    procedure BtnDanfceChavedfeClick(Sender: TObject);
    procedure BtnDanfceNumeroClick(Sender: TObject);
    procedure BtnDanfceIdDfeClick(Sender: TObject);
    procedure BtnDanfceIdexternalClick(Sender: TObject);
    procedure BtnNFCeImpEventoCanIdCanClick(Sender: TObject);
    procedure BtnNFCeImpEventoCanIdDfeClick(Sender: TObject);
    procedure BtnNFCeImpEventoCanChaveDFeClick(Sender: TObject);
    procedure BtnNFCeImpEventoInuIdInuClick(Sender: TObject);
  private
    FCaption: String;
    DadosJahDFe: TDadosJahDFe;
    function ExemploEmissaoNFe1: TNFeNFCe;
    function ExemploEmissaoNFe2: TNFeNFCe;
    function ExemploTIde1: TIde;
    function ExemploTIde2: TIde;
    function ExemploTDest1: TDest;
    function ExemploTDest2: TDest;
    function ExemploTInfIntermed1: TInfIntermed;
    function ExemploTListAutXML1: TListAutXML;
    function ExemploTListAutXML2: TListAutXML;
    function ExemploTEmit1: TEmit;
    function ExemploTEmit2: TEmit;
    function ExemploTListDet1: TListDet;
    function ExemploTListDet2: TListDet;
    function ExemploTDet1(Indice: Integer): TDet;
    function ExemploTDet2(Indice: Integer): TDet;
    function ExemploTProd1: TProd;
    function ExemploTProd2: TProd;
    function ExemploTImposto1: TImposto;
    function ExemploTImposto2: TImposto;
    function ExemploTTotal1: TTotal;
    function ExemploTTotal2: TTotal;
    function ExemploTRetirada1: TRetirada;
    function ExemploTEntrega1: TEntrega;
    function ExemploTTransp1: TTransp;
    function ExemploTTransp2: TTransp;
    function ExemploTInfAdic1: TInfAdic;
    function ExemploTInfAdic2: TInfAdic;
    function ExemploTcobr1: Tcobr;
    function ExemplotPag1: tPag;
    function ExemplotPag2: tPag;
    function ExemploTExporta1: TExporta;
    function ExemploTCompra1: TCompra;
    function ExemploTCana1: TCana;
    function ExemploTAgropecuario1: TAgropecuario;
    function ExemploTInfRespTec1: TInfRespTec;
    function ExemploTInfRespTec2: TInfRespTec;
    function ExemploTListNFref1: TListNFref;
    function ExemploTListNVE1: TListNVE;
    function ExemploTListDI1: TListDI;
    function ExemploTListDetExport1: TListDetExport;
    function ExemploTListRastro1: TListRastro;
    function ExemploTVeicProd1: TVeicProd;
    function ExemploTMed1: TMed;
    function ExemploTListArma1: TListArma;
    function ExemploTComb1: TComb;
    function ExemploTIPI1: TIPI;
    function ExemploTPIS1: TPIS;
    function ExemploTPISST1: TPISST;
    function ExemploTCOFINS1: TCOFINS;
    function ExemploTCOFINSST1: TCOFINSST;
    function ExemploTII1: TII;
    function ExemploTImpostoDevol1: TImpostoDevol;
    function ExemploTISSQN1: TISSQN;
    function ExemploTICMSUFDest1: TICMSUFDest;
    function ExemploTICMS00_1: TICMS00;
    function ExemploTICMS02_1: TICMS02;
    function ExemploTICMS10_1: TICMS10;
    function ExemploTICMS15_1: TICMS15;
    function ExemploTICMS20_1: TICMS20;
    function ExemploTICMS30_1: TICMS30;
    function ExemploTICMS40_1: TICMS40;
    function ExemploTICMS41_1: TICMS41;
    function ExemploTICMS50_1: TICMS50;
    function ExemploTICMS51_1: TICMS51;
    function ExemploTICMS53_1: TICMS53;
    function ExemploTICMS60_1: TICMS60;
    function ExemploTICMS61_1: TICMS61;
    function ExemploTICMS70_1: TICMS70;
    function ExemploTICMS90_1: TICMS90;
    function ExemploTICMSPart10_1: TICMSPart10;
    function ExemploTICMSPart90_1: TICMSPart90;
    function ExemploTICMSRep41_1: TICMSRep41;
    function ExemploTICMSRep60_1: TICMSRep60;
    function ExemploTICMS101_1: TICMS101;
    function ExemploTICMS201_1: TICMS201;
    function ExemploTICMS202_1: TICMS202;
    function ExemploTICMS203_1: TICMS203;
    function ExemploTICMS500_1: TICMS500;
    function ExemploTICMS900_1: TICMS900;
    function ExemploCancelamentoNFe1: TEventCancel;
    function ExemploCancelamentoNFCe1: TEventCancel;
    function ExemploInutilizacaoNFe1: TEventDisenable;
    function ExemploInutilizacaoNFCe1: TEventDisenable;
    function ExemploCorrecaoNFe1: TEventCorrection;
    function ExemploEmissaoNFCe1: TNFeNFCe;
    function ExemploTIde3: TIde;
  public
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}


uses uDadosJahDFeConversion;

function TFrmPrincipal.ExemploTAgropecuario1: TAgropecuario;
begin
  Result.nReceituario := 'RX987654';
  Result.CPFRespTec := '01234567890';
  Result.tpGuia := tpgGTA;
  Result.UFGuia := 'SP';
  Result.serieGuia := '002';
  Result.nGuia := '456789';
end;

function TFrmPrincipal.ExemploTCana1: TCana;
begin
  Result.qTotMes := 5000.0;
  Result.qTotAnt := 4500.0;
  Result.qTotGer := 9500.0;
  Result.vFor := 12000.0;
  Result.vTotDed := 500.0;
  Result.vLiqFor := Result.vFor - Result.vTotDed;
  Result.safra := '2024/2025';
  Result.ref := 'REF789654';

  SetLength(Result.forDia, 3);
  Result.forDia[0].dia := 1;
  Result.forDia[0].qtde := 250.0;
  Result.forDia[1].dia := 2;
  Result.forDia[1].qtde := 275.0;
  Result.forDia[2].dia := 3;
  Result.forDia[2].qtde := 300.0;

  SetLength(Result.deduc, 2);
  Result.deduc[0].xDed := 'Impostos';
  Result.deduc[0].vDed := 300.0;
  Result.deduc[1].xDed := 'Taxa de Serviço';
  Result.deduc[1].vDed := 200.0;
end;

function TFrmPrincipal.ExemploTcobr1: Tcobr;
begin
  Result.fat.nFat := 'FAT123456';
  Result.fat.vOrig := 5000.0;
  Result.fat.vDesc := 200.0;
  Result.fat.vLiq := Result.fat.vOrig - Result.fat.vDesc;

  SetLength(Result.dup, 2);
  Result.dup[0].nDup := 'DUP001';
  Result.dup[0].dVenc := Date + 30;
  Result.dup[0].vDup := 2500.0;

  Result.dup[1].nDup := 'DUP002';
  Result.dup[1].dVenc := Date + 60;
  Result.dup[1].vDup := 2500.0;
end;

function TFrmPrincipal.ExemploTComb1: TComb;
begin
  Result.cProdANP := 123456;
  Result.descANP := 'Diesel S10';
  Result.pGLP := 0.0;
  Result.pGNn := 0.0;
  Result.pGNi := 0.0;
  Result.vPart := 4.50;
  Result.CODIF := 'COD789654';
  Result.qTemp := 1000.0;
  Result.UFCons := 'MG';
  Result.pBio := 10.0;

  Result.CIDE.qBCProd := 500.0;
  Result.CIDE.vAliqProd := 0.1;
  Result.CIDE.vCIDE := 50.0;

  Result.encerrante.nBico := 1;
  Result.encerrante.nBomba := 2;
  Result.encerrante.nTanque := 3;
  Result.encerrante.vEncIni := 1000.0;
  Result.encerrante.vEncFin := 1500.0;

  SetLength(Result.origComb, 1);
  Result.origComb[0].indImport := iiNacional;
  Result.origComb[0].cUFOrig := UFToCodigo('MG'); // Código de Minas Gerais
  Result.origComb[0].pOrig := 100.0;
end;

function TFrmPrincipal.ExemploTCompra1: TCompra;
begin
  Result.xNEmp := 'Empresa XYZ Ltda';
  Result.xPed := 'PED789654';
  Result.xCont := 'CONT321987';
end;

function TFrmPrincipal.ExemploTDest1: TDest;
begin
  Result.CNPJCPF := '20194529000158';
  Result.xNome := 'Indústria de Carros ZY';
  Result.idEstrangeiro := '';
  Result.indIEDest := tiedContribuinte;
  Result.IE := '123456789012';
  Result.ISUF := 'MG';
  Result.IM := '987654321';
  Result.Email := 'contato@carroszy.com.br';

  Result.enderDest.xLgr := 'Avenida Central';
  Result.enderDest.nro := '1500';
  Result.enderDest.xCpl := 'Bloco B';
  Result.enderDest.xBairro := 'Centro';
  Result.enderDest.cMun := 3106200; // Código IBGE de Belo Horizonte
  Result.enderDest.xMun := 'Belo Horizonte';
  Result.enderDest.UF := 'MG';
  Result.enderDest.CEP := '30140000';
  Result.enderDest.cPais := 1058; // Código do Brasil
  Result.enderDest.xPais := 'Brasil';
  Result.enderDest.fone := '31987654321';
end;

function TFrmPrincipal.ExemploTDest2: TDest;
begin
  Result.CNPJCPF := '10753581671';
  Result.xNome := 'MATEUS BARBOSA';
  Result.idEstrangeiro := '';
  Result.indIEDest := tiedNaoContribuinte;
  Result.IE := '';
  Result.Email := 'patrick@ctec.com.br';

  Result.enderDest.xLgr := 'RUA BELO HORIZONTE ';
  Result.enderDest.nro := '803';
  Result.enderDest.xCpl := 'sala 05';
  Result.enderDest.xBairro := 'Centro';
  Result.enderDest.cMun := 3127701; // Código IBGE de Governador Valadares
  Result.enderDest.xMun := 'Governador Valadares';
  Result.enderDest.UF := 'MG';
  Result.enderDest.CEP := '35010050';
  Result.enderDest.cPais := 1058; // Código do Brasil
  Result.enderDest.xPais := 'Brasil';
  Result.enderDest.fone := '';
end;

function TFrmPrincipal.ExemploTDet1(Indice: Integer): TDet;
begin
  Result.nItem := Indice;
  Result.infAdPro := 'observação';
  Result.prod := ExemploTProd1;
  Result.imposto := ExemploTImposto1;
end;

function TFrmPrincipal.ExemploTDet2(Indice: Integer): TDet;
begin
  Result.nItem := Indice;
  Result.infAdPro := 'observação';
  Result.prod := ExemploTProd2;
  Result.imposto := ExemploTImposto2;
end;

function TFrmPrincipal.ExemploTEmit1: TEmit;
begin
  Result.CNPJCPF := '12345678000199';
  Result.xNome := 'Tech Solutions LTDA';
  Result.xFant := 'TechSol';
  Result.IE := '987654321012';
  Result.IEST := 'MG';
  Result.IM := '543216789';
  Result.CNAE := '6202100'; // Desenvolvimento de programas de computador
  Result.CRT := crtRegimeNormal;

  Result.enderEmit.xLgr := 'Rua da Inovação';
  Result.enderEmit.nro := '350';
  Result.enderEmit.xCpl := 'Sala 402';
  Result.enderEmit.xBairro := 'Tecnologia';
  Result.enderEmit.cMun := 3106200; // Código IBGE de Belo Horizonte
  Result.enderEmit.xMun := 'Belo Horizonte';
  Result.enderEmit.UF := 'MG';
  Result.enderEmit.CEP := '30140000';
  Result.enderEmit.cPais := 1058; // Código do Brasil
  Result.enderEmit.xPais := 'Brasil';
  Result.enderEmit.fone := '31987654321';
end;

function TFrmPrincipal.ExemploTEmit2: TEmit;
begin
  Result.CNPJCPF := '02598982000190';
  Result.xNome := 'CTEC SERVICE LTDA';
  Result.xFant := 'CTEC';
  Result.IE := '0010694080020';
  Result.CRT := crtSimplesNacional;

  Result.enderEmit.xLgr := 'RUA BELO HORIZONTE';
  Result.enderEmit.nro := '803';
  Result.enderEmit.xCpl := '';
  Result.enderEmit.xBairro := 'Centro';
  Result.enderEmit.cMun := 3127701; // Código IBGE de Governador Valadares
  Result.enderEmit.xMun := 'Governador Valadares';
  Result.enderEmit.UF := 'MG';
  Result.enderEmit.CEP := '35010050';
  Result.enderEmit.cPais := 1058; // Código do Brasil
  Result.enderEmit.xPais := 'Brasil';
  Result.enderEmit.fone := '';
end;

function TFrmPrincipal.ExemploTEntrega1: TEntrega;
begin
  Result.CNPJCPF := '98765432000199';
  Result.xNome := 'Transportadora Rápida Express';
  Result.xLgr := 'Rodovia BR-381';
  Result.nro := '2000';
  Result.xCpl := 'Depósito Central';
  Result.xBairro := 'Zona Industrial';
  Result.cMun := 3106200; // Código IBGE de Belo Horizonte
  Result.xMun := 'Belo Horizonte';
  Result.UF := 'MG';
  Result.CEP := '30140000';
  Result.cPais := 1058; // Código do Brasil
  Result.xPais := 'Brasil';
  Result.fone := '31976543210';
  Result.Email := 'contato@transportadorarapida.com.br';
  Result.IE := '123456789012';
end;

function TFrmPrincipal.ExemploTExporta1: TExporta;
begin
  Result.UFSaidaPais := 'SP';
  Result.xLocExporta := 'Porto de Santos';
  Result.xLocDespacho := 'Terminal de Cargas - Guarulhos';
end;

function TFrmPrincipal.ExemploTIde1: TIde;
begin
  Result.CUF := UFToCodigo('MG'); // Código de Minas Gerais
  Result.cNF := 12345678; // Número fictício
  Result.natOp := 'Venda de produtos eletrônicos';
  Result.serie := 1;
  Result.nNF := 987654;
  Result.dhEmi := Now;
  Result.dhSaiEnt := Now + 1; // Saída no dia seguinte
  Result.tpNF := tnfSaida;
  Result.idDest := tdInterestadual;
  Result.cMunFG := 3106200; // Código IBGE de Belo Horizonte
  Result.tmImp := tiPaisagem;
  Result.tmEmis := teNormal;
  Result.tpAmb := taHomologacao; // HOMOLOGAÇÃO
  Result.finNFe := tfNormal;
  Result.indFinal := tifConsumidorFinal;
  Result.indPres := tipPresencial;
  Result.indIntermed := tiOperacaoSemIntermediador;
  Result.procEmi := tpeAplicativoContribuinte;
  Result.verProc := '1.0.0';
  Result.dhCont := Now;
  Result.xJust := 'Correção de informações na nota fiscal';
  Result.NFref := ExemploTListNFref1;
end;

function TFrmPrincipal.ExemploTIde2: TIde;
begin
  Result.CUF := UFToCodigo('MG'); // Código de Minas Gerais
  Result.cNF := 1001; //
  Result.natOp := 'Venda de produtos eletrônicos';
  Result.serie := 4;
  Result.nNF := StrToIntDef(EdtNfeEmissaoNumeroNota.Text, 0);
  Result.dhEmi := Now;
  Result.dhSaiEnt := Now; // Saída no dia seguinte
  Result.tpNF := tnfSaida;
  Result.idDest := tdInterna;
  Result.cMunFG := 3127701; // Código IBGE de Governador Valadares
  Result.tmImp := tiPaisagem;
  Result.tmEmis := teNormal;
  Result.tpAmb := taHomologacao; // HOMOLOGAÇÃO
  Result.finNFe := tfNormal;
  Result.indFinal := tifConsumidorFinal;
  Result.indPres := tipPresencial;
  Result.indIntermed := tiOperacaoSemIntermediador;
  Result.procEmi := tpeAplicativoContribuinte;
  Result.verProc := '1.0.0';
end;

function TFrmPrincipal.ExemploTIPI1: TIPI;
begin
  Result.CST := ipi00;
  Result.CNPJProd := '12345678000195';
  Result.cSelo := 'SELO123';
  Result.qSelo := 5;
  Result.cEnq := '999';

  Result.IPITrib.qUnid := 100.0;
  Result.IPITrib.vUnid := 50.0;
  Result.IPITrib.vBC := 5000.0;
  Result.IPITrib.pIPI := 5.0;
  Result.IPITrib.vIPI := 250.0;
end;

function TFrmPrincipal.ExemploTPIS1: TPIS;
begin
  Result.CST := pis01;

  Result.PISAliq.vBC := 5000.0;
  Result.PISAliq.pPIS := 1.65;
  Result.PISAliq.vPIS := 82.5;

  Result.PISQtde.qBCProd := 100.0;
  Result.PISQtde.vAliqProd := 0.75;
  Result.PISQtde.vPIS := 75.0;

  Result.PISOutr.qBCProd := 120.0;
  Result.PISOutr.vAliqProd := 0.60;
  Result.PISOutr.vBC := 6000.0;
  Result.PISOutr.pPIS := 2.00;
  Result.PISOutr.vPIS := 120.0;
end;

function TFrmPrincipal.ExemploTCOFINS1: TCOFINS;
begin
  Result.CST := cof01;

  Result.COFINSAliq.vBC := 5500.0;
  Result.COFINSAliq.pCOFINS := 3.00;
  Result.COFINSAliq.vCOFINS := 165.0;

  Result.COFINSQtde.qBCProd := 250.0;
  Result.COFINSQtde.vAliqProd := 1.20;
  Result.COFINSQtde.vCOFINS := 300.0;

  Result.COFINSOutr.qBCProd := 180.0;
  Result.COFINSOutr.vAliqProd := 0.90;
  Result.COFINSOutr.vBC := 6200.0;
  Result.COFINSOutr.pCOFINS := 2.50;
  Result.COFINSOutr.vCOFINS := 155.0;
end;

function TFrmPrincipal.ExemploTPISST1: TPISST;
begin
  Result.vBC := 4500.0;
  Result.pPIS := 1.65;
  Result.qBCProd := 200.0;
  Result.vAliqProd := 0.80;
  Result.vPIS := 132.0;
  Result.indSomaPISST := ispPISSTCompoe;
end;

function TFrmPrincipal.ExemploTCOFINSST1: TCOFINSST;
begin
  Result.vBC := 4800.0;
  Result.pCOFINS := 3.50;
  Result.qBCProd := 220.0;
  Result.vAliqProd := 1.10;
  Result.vCOFINS := 242.0;
  Result.indSomaCOFINSST := iscCOFINSSTCompoe;
end;

function TFrmPrincipal.ExemploTII1: TII;
begin
  Result.vBC := 10000.0;
  Result.vDespAdu := 500.0;
  Result.vII := 800.0;
  Result.vIOF := 250.0;
end;

function TFrmPrincipal.ExemploTImpostoDevol1: TImpostoDevol;
begin
  Result.pDevol := 10.0;
  Result.vIPIDevol := 150.0;
end;

function TFrmPrincipal.ExemploTISSQN1: TISSQN;
begin
  Result.vBC := 7500.0;
  Result.vAliq := 5.00;
  Result.vISSQN := 375.0;
  Result.cMunFG := 3106200;
  Result.cListServ := '101';
  Result.vDeducao := 500.0;
  Result.vOutro := 200.0;
  Result.vDescIncond := 150.0;
  Result.vDescCond := 100.0;
  Result.vISSRet := 50.0;
  Result.indISS := iiExigivel;
  Result.cServico := '123456';
  Result.cMun := 3106200;
  Result.cPais := 1058;
  Result.nProcesso := 'PROC20251234';
  Result.indIncentivo := snNao;
end;

function TFrmPrincipal.ExemploTICMSUFDest1: TICMSUFDest;
begin
  Result.vBCUFDest := 12000.0;
  Result.vBCFCPUFDest := 15000.0;
  Result.pFCPUFDest := 2.00;
  Result.pICMSUFDest := 7.00;
  Result.pICMSInter := 12.00;
  Result.pICMSInterPart := 40.00;
  Result.vFCPUFDest := 300.0;
  Result.vICMSUFDest := 840.0;
  Result.vICMSUFRemet := 560.0;
end;

function TFrmPrincipal.ExemploTICMS00_1: TICMS00;
begin
  Result.modBC := dbiValorOperacao;
  Result.vBC := 10000.0;
  Result.pICMS := 18.00;
  Result.vICMS := 1800.0;
  Result.pFCP := 2.00;
  Result.vFCP := 200.0;
end;

function TFrmPrincipal.ExemploTICMS02_1: TICMS02;
begin
  Result.qBCMono := 500.0;
  Result.adRemICMS := 10.00;
  Result.vICMSMono := 50.0;
end;

function TFrmPrincipal.ExemploTICMS10_1: TICMS10;
begin
  Result.modBC := dbiMargemValorAgregado;
  Result.vBC := 12000.0;
  Result.pRedBC := 5.00;
  Result.pICMS := 17.00;
  Result.vICMS := 2040.0;
  Result.vBCFCP := 12500.0;
  Result.pFCP := 2.50;
  Result.vFCP := 312.5;

  Result.modBCST := dbisMargemValorAgregado;
  Result.pMVAST := 30.00;
  Result.pRedBCST := 10.00;
  Result.vBCST := 14000.0;
  Result.pICMSST := 18.00;
  Result.vICMSST := 2520.0;
  Result.vBCFCPST := 14500.0;
  Result.pFCPST := 2.00;
  Result.vFCPST := 290.0;
  Result.pBCOp := 20.00;
  Result.UFST := 'SP';
  Result.vICMSSTDeson := 100.0;
  Result.motDesICMSST := mdiOutros;
end;

function TFrmPrincipal.ExemploTICMS15_1: TICMS15;
begin
  Result.qBCMono := 1000.0;
  Result.adRemICMS := 8.00;
  Result.vICMSMono := 80.0;
  Result.qBCMonoReten := 500.0;
  Result.adRemICMSReten := 5.00;
  Result.vICMSMonoReten := 25.0;
  Result.pRedAdRem := 10.00;
  Result.motRedAdRem := motOutros;
end;

function TFrmPrincipal.ExemploTICMS20_1: TICMS20;
begin
  Result.modBC := dbiValorOperacao;
  Result.pRedBC := 15.00;
  Result.vBC := 9000.0;
  Result.pICMS := 17.00;
  Result.vICMS := 1530.0;
  Result.vBCFCP := 9500.0;
  Result.pFCP := 2.00;
  Result.vFCP := 190.0;
  Result.vICMSDeson := 120.0;
  Result.motDesICMS := mdiOutros;
  Result.indDeduzDeson := snnNao;
end;

function TFrmPrincipal.ExemploTICMS30_1: TICMS30;
begin
  Result.modBCST := dbisMargemValorAgregado;
  Result.pMVAST := 25.00;
  Result.pRedBCST := 5.00;
  Result.vBCST := 11000.0;
  Result.pICMSST := 18.00;
  Result.vICMSST := 1980.0;
  Result.vBCFCPST := 11500.0;
  Result.pFCPST := 2.50;
  Result.vFCPST := 287.5;
  Result.vICMSDeson := 130.0;
  Result.motDesICMS := mdiVendaOrgaosPublicos;
  Result.indDeduzDeson := snnSim;
end;

function TFrmPrincipal.ExemploTICMS40_1: TICMS40;
begin
  Result.vICMSDeson := 200.0;
  Result.motDesICMS := mdiVendaOrgaosPublicos;
  Result.indDeduzDeson := snnSim;
end;

function TFrmPrincipal.ExemploTICMS41_1: TICMS41;
begin
  Result.vICMSDeson := 180.0;
  Result.motDesICMS := mdiAmazoniaLivreComercio;
  Result.indDeduzDeson := snnNao;
end;

function TFrmPrincipal.ExemploTICMS50_1: TICMS50;
begin
  Result.vICMSDeson := 250.0;
  Result.motDesICMS := mdiDiplomaticoConsular;
  Result.indDeduzDeson := snnNenhum;
end;

function TFrmPrincipal.ExemploTICMS51_1: TICMS51;
begin
  Result.modBC := dbiValorOperacao;
  Result.pRedBC := 10.00;
  Result.cBenefRBC := '123456';
  Result.vBC := 8000.0;
  Result.pICMS := 18.00;
  Result.vICMSOp := 1440.0;
  Result.pDif := 5.00;
  Result.vICMSDif := 400.0;
  Result.vICMS := 1040.0;
  Result.vBCFCP := 8500.0;
  Result.pFCP := 2.00;
  Result.vFCP := 170.0;
  Result.pFCPDif := 1.50;
  Result.vFCPDif := 127.5;
  Result.vFCPEfet := 42.5;
end;

function TFrmPrincipal.ExemploTICMS53_1: TICMS53;
begin
  Result.qBCMono := 1200.0;
  Result.adRemICMS := 7.50;
  Result.vICMSMonoOp := 90.0;
  Result.pDif := 3.00;
  Result.vICMSMonoDif := 36.0;
  Result.vICMSMono := 54.0;
end;

function TFrmPrincipal.ExemploTICMS60_1: TICMS60;
begin
  Result.vBCSTRet := 14000.0;
  Result.pST := 18.00;
  Result.vICMSSubstituto := 2520.0;
  Result.vICMSSTRet := 2480.0;
  Result.vBCFCPSTRet := 14500.0;
  Result.pFCPSTRet := 2.50;
  Result.vFCPSTRet := 362.5;
  Result.pRedBCEfet := 5.00;
  Result.vBCEfet := 13500.0;
  Result.pICMSEfet := 17.00;
  Result.vICMSEfet := 2295.0;
end;

function TFrmPrincipal.ExemploTICMS61_1: TICMS61;
begin
  Result.qBCMonoRet := 800.0;
  Result.adRemICMSRet := 6.00;
  Result.vICMSMonoRet := 48.0;
end;

function TFrmPrincipal.ExemploTICMS70_1: TICMS70;
begin
  Result.modBC := dbiMargemValorAgregado;
  Result.pRedBC := 12.00;
  Result.vBC := 11000.0;
  Result.pICMS := 18.00;
  Result.vICMS := 1980.0;
  Result.vBCFCP := 11500.0;
  Result.pFCP := 2.50;
  Result.vFCP := 287.5;

  Result.modBCST := dbisPrecoTabelado;
  Result.pMVAST := 20.00;
  Result.pRedBCST := 8.00;
  Result.vBCST := 13000.0;
  Result.pICMSST := 19.00;
  Result.vICMSST := 2470.0;
  Result.vBCFCPST := 13500.0;
  Result.pFCPST := 3.00;
  Result.vFCPST := 405.0;
  Result.vICMSDeson := 220.0;
  Result.motDesICMS := mdiDeficienteFisico;
  Result.indDeduzDeson := snnSim;
  Result.vICMSSTDeson := 180.0;
  Result.motDesICMSST := mdiVendaOrgaosPublicos;
end;

function TFrmPrincipal.ExemploTICMS90_1: TICMS90;
begin
  Result.modBC := dbiValorOperacao;
  Result.vBC := 13000.0;
  Result.pRedBC := 10.00;
  Result.pICMS := 18.00;
  Result.vICMS := 2340.0;
  Result.vBCFCP := 13500.0;
  Result.pFCP := 2.00;
  Result.vFCP := 270.0;

  Result.modBCST := dbisMargemValorAgregado;
  Result.pMVAST := 25.00;
  Result.pRedBCST := 5.00;
  Result.vBCST := 14500.0;
  Result.pICMSST := 19.00;
  Result.vICMSST := 2755.0;
  Result.vBCFCPST := 15000.0;
  Result.pFCPST := 2.50;
  Result.vFCPST := 375.0;

  Result.vICMSDeson := 150.0;
  Result.motDesICMS := mdiDeficienteFisico;
  Result.indDeduzDeson := snnSim;
  Result.pBCOp := 20.00;
  Result.UFST := 'RJ';
  Result.vICMSSTDeson := 100.0;
  Result.motDesICMSST := mdiVendaOrgaosPublicos;
end;

function TFrmPrincipal.ExemploTICMSPart10_1: TICMSPart10;
begin
  Result.modBC := dbiMargemValorAgregado;
  Result.vBC := 11500.0;
  Result.pRedBC := 7.00;
  Result.pICMS := 17.00;
  Result.vICMS := 1955.0;
  Result.vBCFCP := 12000.0;
  Result.pFCP := 2.50;
  Result.vFCP := 300.0;

  Result.modBCST := dbisPrecoTabelado;
  Result.pMVAST := 15.00;
  Result.pRedBCST := 3.00;
  Result.vBCST := 12500.0;
  Result.pICMSST := 18.00;
  Result.vICMSST := 2250.0;
  Result.vBCFCPST := 13000.0;
  Result.pFCPST := 3.00;
  Result.vFCPST := 390.0;

  Result.pBCOp := 22.00;
  Result.UFST := 'SP';
  Result.vICMSSTDeson := 120.0;
  Result.motDesICMSST := mdiOrgaoFomento;
end;

function TFrmPrincipal.ExemploTICMSPart90_1: TICMSPart90;
begin
  Result.modBC := dbiPrecoTabelado;
  Result.vBC := 14000.0;
  Result.pRedBC := 12.00;
  Result.pICMS := 20.00;
  Result.vICMS := 2800.0;
  Result.vBCFCP := 14500.0;
  Result.pFCP := 2.00;
  Result.vFCP := 290.0;

  Result.modBCST := dbisMargemValorAgregado;
  Result.pMVAST := 18.00;
  Result.pRedBCST := 6.00;
  Result.vBCST := 15000.0;
  Result.pICMSST := 19.00;
  Result.vICMSST := 2850.0;
  Result.vBCFCPST := 15500.0;
  Result.pFCPST := 2.50;
  Result.vFCPST := 387.5;

  Result.pBCOp := 25.00;
  Result.UFST := 'MG';
  Result.vICMSSTDeson := 130.0;
  Result.motDesICMSST := mdiFrotistaLocadora;
end;

function TFrmPrincipal.ExemploTICMSRep41_1: TICMSRep41;
begin
  Result.vBCSTRet := 15000.0;
  Result.pST := 18.00;
  Result.vICMSSubstituto := 2700.0;
  Result.vICMSSTRet := 2600.0;
  Result.vBCFCPSTRet := 15500.0;
  Result.pFCPSTRet := 2.50;
  Result.vFCPSTRet := 387.5;
  Result.vBCSTDest := 16000.0;
  Result.vICMSSTDest := 2880.0;
  Result.pRedBCEfet := 5.00;
  Result.vBCEfet := 14500.0;
  Result.pICMSEfet := 17.00;
  Result.vICMSEfet := 2465.0;
end;

function TFrmPrincipal.ExemploTICMSRep60_1: TICMSRep60;
begin
  Result.vBCSTRet := 14000.0;
  Result.pST := 17.50;
  Result.vICMSSubstituto := 2450.0;
  Result.vICMSSTRet := 2400.0;
  Result.vBCFCPSTRet := 14550.0;
  Result.pFCPSTRet := 2.00;
  Result.vFCPSTRet := 291.0;
  Result.vBCSTDest := 15000.0;
  Result.vICMSSTDest := 2700.0;
  Result.pRedBCEfet := 6.00;
  Result.vBCEfet := 13500.0;
  Result.pICMSEfet := 16.50;
  Result.vICMSEfet := 2227.5;
end;

function TFrmPrincipal.ExemploTICMS101_1: TICMS101;
begin
  Result.pCredSN := 3.50;
  Result.vCredICMSSN := 350.0;
end;

function TFrmPrincipal.ExemploTICMS201_1: TICMS201;
begin
  Result.modBCST := dbisMargemValorAgregado;
  Result.pMVAST := 20.00;
  Result.pRedBCST := 5.00;
  Result.vBCST := 12000.0;
  Result.pICMSST := 18.00;
  Result.vICMSST := 2160.0;
  Result.vBCFCPST := 12500.0;
  Result.pFCPST := 2.50;
  Result.vFCPST := 312.5;
  Result.pCredSN := 3.00;
  Result.vCredICMSSN := 300.0;
end;

function TFrmPrincipal.ExemploTICMS202_1: TICMS202;
begin
  Result.modBCST := dbisListaPositiva;
  Result.pMVAST := 18.00;
  Result.pRedBCST := 6.00;
  Result.vBCST := 11000.0;
  Result.pICMSST := 19.00;
  Result.vICMSST := 2090.0;
  Result.vBCFCPST := 11500.0;
  Result.pFCPST := 2.00;
  Result.vFCPST := 230.0;
end;

function TFrmPrincipal.ExemploTICMS203_1: TICMS203;
begin
  Result.modBCST := dbisListaNegativa;
  Result.pMVAST := 15.00;
  Result.pRedBCST := 4.00;
  Result.vBCST := 9500.0;
  Result.pICMSST := 17.50;
  Result.vICMSST := 1662.5;
  Result.vBCFCPST := 10000.0;
  Result.pFCPST := 2.00;
  Result.vFCPST := 200.0;
end;

function TFrmPrincipal.ExemploTICMS500_1: TICMS500;
begin
  Result.vBCSTRet := 13000.0;
  Result.pST := 18.00;
  Result.vICMSSubstituto := 2340.0;
  Result.vICMSSTRet := 2200.0;
  Result.vBCFCPSTRet := 13500.0;
  Result.pFCPSTRet := 2.50;
  Result.vFCPSTRet := 337.5;
  Result.pRedBCEfet := 5.00;
  Result.vBCEfet := 12500.0;
  Result.pICMSEfet := 16.50;
  Result.vICMSEfet := 2062.5;
end;

function TFrmPrincipal.ExemploTICMS900_1: TICMS900;
begin
  Result.modBC := dbiPrecoTabelado;
  Result.vBC := 14000.0;
  Result.pRedBC := 12.00;
  Result.pICMS := 20.00;
  Result.vICMS := 2800.0;

  Result.modBCST := dbisMargemValorAgregado;
  Result.pMVAST := 18.00;
  Result.pRedBCST := 6.00;
  Result.vBCST := 15000.0;
  Result.pICMSST := 19.00;
  Result.vICMSST := 2850.0;
  Result.vBCFCPST := 15500.0;
  Result.pFCPST := 2.50;
  Result.vFCPST := 387.5;

  Result.pCredSN := 3.00;
  Result.vCredICMSSN := 300.0;
end;

function TFrmPrincipal.ExemploTImposto1: TImposto;
begin
  Result.IPI := ExemploTIPI1;
  Result.PIS := ExemploTPIS1;
  Result.PISST := ExemploTPISST1;
  Result.COFINS := ExemploTCOFINS1;
  Result.COFINSST := ExemploTCOFINSST1;
  Result.II := ExemploTII1;
  Result.impostoDevol := ExemploTImpostoDevol1;
  Result.ISSQN := ExemploTISSQN1;
  Result.ICMSUFDest := ExemploTICMSUFDest1;

  Result.ICMS.orig := omNacional;
  Result.ICMS.CST_CSOSN := cst00;
  Result.ICMS.ICMS00 := ExemploTICMS00_1;
  Result.ICMS.ICMS02 := ExemploTICMS02_1;
  Result.ICMS.ICMS10 := ExemploTICMS10_1;
  Result.ICMS.ICMS15 := ExemploTICMS15_1;
  Result.ICMS.ICMS20 := ExemploTICMS20_1;
  Result.ICMS.ICMS30 := ExemploTICMS30_1;
  Result.ICMS.ICMS40 := ExemploTICMS40_1;
  Result.ICMS.ICMS41 := ExemploTICMS41_1;
  Result.ICMS.ICMS50 := ExemploTICMS50_1;
  Result.ICMS.ICMS51 := ExemploTICMS51_1;
  Result.ICMS.ICMS53 := ExemploTICMS53_1;
  Result.ICMS.ICMS60 := ExemploTICMS60_1;
  Result.ICMS.ICMS61 := ExemploTICMS61_1;
  Result.ICMS.ICMS70 := ExemploTICMS70_1;
  Result.ICMS.ICMS90 := ExemploTICMS90_1;
  Result.ICMS.ICMSPart10 := ExemploTICMSPart10_1;
  Result.ICMS.ICMSPart90 := ExemploTICMSPart90_1;
  Result.ICMS.ICMSRep41 := ExemploTICMSRep41_1;
  Result.ICMS.ICMSRep60 := ExemploTICMSRep60_1;
  Result.ICMS.ICMS101 := ExemploTICMS101_1;
  Result.ICMS.ICMS201 := ExemploTICMS201_1;
  Result.ICMS.ICMS202 := ExemploTICMS202_1;
  Result.ICMS.ICMS203 := ExemploTICMS203_1;
  Result.ICMS.ICMS500 := ExemploTICMS500_1;
  Result.ICMS.ICMS900 := ExemploTICMS900_1;
end;

function TFrmPrincipal.ExemploTImposto2: TImposto;
begin
  Result.IPI.CST := ipi53;
  Result.IPI.cSelo := '0';
  Result.IPI.cEnq := '999';

  Result.PIS.CST := pis07;
  Result.COFINS.CST := cof07;

  Result.ICMS.orig := omNacional;
  Result.ICMS.CST_CSOSN := csosn102;
end;

function TFrmPrincipal.ExemploTInfAdic1: TInfAdic;
begin
  Result.infAdFisco := 'Informações adicionais exigidas pela SEFAZ.';
  Result.infCpl := 'Venda sujeita a tributação especial conforme legislação vigente.';

  SetLength(Result.obsCont, 1);
  Result.obsCont[0].xCampo := 'Observação1';
  Result.obsCont[0].xTexto := 'Entrega prevista em até 5 dias úteis.';

  SetLength(Result.obsFisco, 1);
  Result.obsFisco[0].xCampo := 'Fiscalização';
  Result.obsFisco[0].xTexto := 'Nota fiscal emitida conforme legislação do estado de MG.';

  SetLength(Result.procRef, 1);
  Result.procRef[0].nProc := 'PROC123456';
  Result.procRef[0].indProc := ipSEFAZ;
  Result.procRef[0].tpAto := taRegimeEspecial;
end;

function TFrmPrincipal.ExemploTInfAdic2: TInfAdic;
begin
  Result.infCpl := 'Imposto de Renda Retido na Fonte. Base de Calculo: 5,00. Valor: 0,15. Conforme art. 64 da Lei 9.430/1996.|PRODUTO SEM DESTAQUE DE ICM SST, ' +
    ' TRATA-SE DE MATERIA PRIMA, UTILIZADA NA PRODUCAO, |CONFORME O INCISO 4. ALIQUOTA 3,85%||';
end;

function TFrmPrincipal.ExemploTInfIntermed1: TInfIntermed;
begin
  Result.CNPJ := '12345678000199';
  Result.idCadIntTran := 'INTERMEDIADORXYZ987';
end;

function TFrmPrincipal.ExemploTListArma1: TListArma;
begin
  SetLength(Result, 2);

  Result[0].tpArma := taUsoPermitido;
  Result[0].nSerie := 'ARM123456';
  Result[0].nCano := 'CANO7890';
  Result[0].descr := 'Arma de caça calibre 12';

  Result[1].tpArma := taUsoRestrito;
  Result[1].nSerie := 'ARM987654';
  Result[1].nCano := 'CANO6543';
  Result[1].descr := 'Arma tática de precisão';
end;

function TFrmPrincipal.ExemploTListAutXML1: TListAutXML;
begin
  SetLength(Result, 2);
  Result[0] := '02598982000190';
  Result[1] := '23587735000169';
end;

function TFrmPrincipal.ExemploTListAutXML2: TListAutXML;
begin
  SetLength(Result, 3);
  Result[0] := '02598982000190';
  Result[1] := '08412248627';
  Result[2] := '23587735000169';
end;

function TFrmPrincipal.ExemploTListDet1: TListDet;
begin
  SetLength(Result, 1);
  Result[0] := ExemploTDet1(1);
end;

function TFrmPrincipal.ExemploTListDet2: TListDet;
begin
  SetLength(Result, 1);
  Result[0] := ExemploTDet2(1);
end;

function TFrmPrincipal.ExemploTListDetExport1: TListDetExport;
begin
  SetLength(Result, 2);

  Result[0].nDraw := 'DRAW001';
  Result[0].exportInd_nRE := 'RE123456';
  Result[0].exportInd_chNFe := '32198765432198765432198765432198765432198765';
  Result[0].exportInd_qExport := 500.0;

  Result[1].nDraw := 'DRAW002';
  Result[1].exportInd_nRE := 'RE654321';
  Result[1].exportInd_chNFe := '87654321987654321987654321987654321987654321';
  Result[1].exportInd_qExport := 1000.0;
end;

function TFrmPrincipal.ExemploTListDI1: TListDI;
begin
  SetLength(Result, 1);

  Result[0].nDI := 'DI123456';
  Result[0].dDI := EncodeDate(2025, 5, 1);
  Result[0].xLocDesemb := 'Porto de Santos';
  Result[0].UFDesemb := 'SP';
  Result[0].dDesemb := EncodeDate(2025, 5, 5);
  Result[0].tpViaTransp := tvMaritima;
  Result[0].vAFRMM := 500.0;
  Result[0].tpIntermedio := tiContaPropria;
  Result[0].CNPJ := '98765432000199';
  Result[0].UFTerceiro := 'SP';
  Result[0].cExportador := 'EXPORTXYZ';

  SetLength(Result[0].adi, 2);
  Result[0].adi[0].nAdicao := 1;
  Result[0].adi[0].nSeqAdic := 1;
  Result[0].adi[0].cFabricante := 'Fabricante ABC';
  Result[0].adi[0].vDescDI := 200.0;
  Result[0].adi[0].nDraw := 'DRAW001';

  Result[0].adi[1].nAdicao := 2;
  Result[0].adi[1].nSeqAdic := 2;
  Result[0].adi[1].cFabricante := 'Fabricante XYZ';
  Result[0].adi[1].vDescDI := 150.0;
  Result[0].adi[1].nDraw := 'DRAW002';
end;

function TFrmPrincipal.ExemploTListNFref1: TListNFref;
begin
  SetLength(Result, 1);
  Result[0].refNFe := '32198765432198765432198765432198765432198765';
  Result[0].refNFeSig := '87654321987654321987654321987654321987654321';
  Result[0].refCTe := '45678912345678912345678912345678912345678912';
end;

function TFrmPrincipal.ExemploTListNVE1: TListNVE;
begin
  SetLength(Result, 2);
  Result[0] := '';
  Result[1] := '';
end;

function TFrmPrincipal.ExemplotPag1: tPag;
begin
  SetLength(Result.detPag, 2);

  Result.detPag[0].indPag := tipVista;
  Result.detPag[0].tPag := fpCartaoCredito;
  Result.detPag[0].xPag := 'Pagamento via cartão de crédito';
  Result.detPag[0].vPag := 2500.0;
  Result.detPag[0].dPag := EncodeDate(2025, 5, 10);
  Result.detPag[0].CNPJPag := '12345678000199';
  Result.detPag[0].UFPag := 'MG';

  Result.detPag[0].card.tpIntegra := tiPagIntegrado;
  Result.detPag[0].card.CNPJ := '98765432000199';
  Result.detPag[0].card.tBand := bcVisa;
  Result.detPag[0].card.cAut := 'AUT123456';
  Result.detPag[0].card.CNPJReceb := '32165498000199';
  Result.detPag[0].card.idTermPag := 'TERM98765';

  Result.detPag[1].indPag := tipPrazo;
  Result.detPag[1].tPag := fpBoletoBancario;
  Result.detPag[1].xPag := 'Pagamento via boleto bancário';
  Result.detPag[1].vPag := 2500.0;
  Result.detPag[1].dPag := EncodeDate(2025, 6, 10);
  Result.detPag[1].CNPJPag := '32165498000199';
  Result.detPag[1].UFPag := 'SP';

  Result.vTroco := 0.0;
end;

function TFrmPrincipal.ExemplotPag2: tPag;
begin
  SetLength(Result.detPag, 1);
  Result.detPag[0].tPag := fpOutro;
  Result.detPag[0].xPag := 'Outros meios de pagamento';
  Result.detPag[0].vPag := 5.00;
end;

function TFrmPrincipal.ExemploTProd1: TProd;
begin
  Result.cProd := 'PROD123456';
  Result.cEAN := '7896541239874';
  Result.cBarra := '7896541239874';
  Result.xProd := 'Notebook UltraTech';
  Result.NCM := '84713019'; // Código NCM fictício

  Result.CEST := '1234567';
  Result.indEscala := ieRelevante;
  Result.CNPJFab := '12345678000199';
  Result.cBenef := 'BENEF123';
  {Result.gCred.cCredPresumido := '';
  Result.gCred.pCredPresumido := 0;
  Result.gCred.vCredPresumido := 0;}
  Result.EXTIPI := 'EX001';
  Result.CFOP := 5102;
  Result.uCom := 'UN';
  Result.qCom := 1.0;
  Result.vUnCom := 2500.0;
  Result.vProd := Result.qCom * Result.vUnCom;
  Result.cEANTrib := '7896541239874';
  Result.cBarraTrib := '7896541239874';
  Result.uTrib := 'UN';
  Result.qTrib := 1.0;
  Result.vUnTrib := 2500.0;
  Result.vFrete := 50.0;
  Result.vSeg := 20.0;
  Result.vDesc := 0.0;
  Result.vOutro := 10.0;
  Result.indTot := itSomaTotalNFe;
  Result.xPed := 'PED987654';
  Result.nItemPed := '1';
  Result.nFCI := 'FCI123456';
  Result.nRECOPI := 'RECOPI123456';
  Result.vTotTrib := 250.00;

  Result.NVE := ExemploTListNVE1;
  Result.DI := ExemploTListDI1;
  Result.detExport := ExemploTListDetExport1;
  Result.rastro := ExemploTListRastro1;
  Result.veicProd := ExemploTVeicProd1;
  Result.med := ExemploTMed1;
  Result.arma := ExemploTListArma1;
  Result.comb := ExemploTComb1;
end;

function TFrmPrincipal.ExemploTProd2: TProd;
begin
  Result.cProd := '14449';
  Result.cEAN := 'SEM GTIN';
  Result.xProd := 'BLUSA';
  Result.NCM := '61062000';

  Result.CEST := '';
  Result.indEscala := ieNenhum;
  Result.CNPJFab := '';
  Result.cBenef := '';
  {Result.gCred.cCredPresumido := '';
  Result.gCred.pCredPresumido := 0;
  Result.gCred.vCredPresumido := 0;}
  Result.EXTIPI := '';
  Result.CFOP := 5102;
  Result.uCom := 'UN';
  Result.qCom := 1.0;
  Result.vUnCom := 5.0;
  Result.vProd := Result.qCom * Result.vUnCom;
  Result.cEANTrib := 'SEM GTIN';
  Result.uTrib := 'UN';
  Result.qTrib := 1.0;
  Result.vUnTrib := 5.0;
  Result.vFrete := 0.0;
  Result.vSeg := 0.0;
  Result.vDesc := 0.0;
  Result.vOutro := 0.0;
  Result.indTot := itSomaTotalNFe;
  Result.nItemPed := '1';
  Result.vTotTrib := 2.47;

  SetLength(Result.NVE, 0);
  SetLength(Result.DI, 0);
  SetLength(Result.detExport, 0);
  SetLength(Result.rastro, 0);
end;

function TFrmPrincipal.ExemploTListRastro1: TListRastro;
begin
  SetLength(Result, 1);

  Result[0].nLote := 'LOT987654';
  Result[0].qLote := 100.0;
  Result[0].dFab := EncodeDate(2025, 4, 15);
  Result[0].dVal := EncodeDate(2026, 4, 15);
  Result[0].cAgreg := 'AGREG123';
end;

function TFrmPrincipal.ExemploTMed1: TMed;
begin
  Result.cProdANVISA := '1234567890123';
  Result.xMotivoIsencao := 'Medicamento isento de registro conforme RDC 200/2025';
  Result.vPMC := 150.75;
end;

function TFrmPrincipal.ExemploTRetirada1: TRetirada;
begin
  Result.CNPJCPF := '12345678000199';
  Result.xNome := 'Distribuidora Rápida LTDA';
  Result.xLgr := 'Rua das Entregas';
  Result.nro := '150';
  Result.xCpl := 'Galpão 3';
  Result.xBairro := 'Logística';
  Result.cMun := 3106200; // Código IBGE de Belo Horizonte
  Result.xMun := 'Belo Horizonte';
  Result.UF := 'MG';
  Result.CEP := '30140000';
  Result.cPais := 1058; // Código do Brasil
  Result.xPais := 'Brasil';
  Result.fone := '31987654321';
  Result.Email := 'contato@distribuidorarapida.com.br';
  Result.IE := '987654321012';
end;

function TFrmPrincipal.ExemploTTotal1: TTotal;
begin
  Result.ICMSTot.vBC := 10000.0;
  Result.ICMSTot.vICMS := 1800.0;
  Result.ICMSTot.vICMSDeson := 100.0;
  Result.ICMSTot.vFCPUFDest := 50.0;
  Result.ICMSTot.vICMSUFDest := 1200.0;
  Result.ICMSTot.vICMSUFRemet := 600.0;
  Result.ICMSTot.vFCP := 200.0;
  Result.ICMSTot.vBCST := 5000.0;
  Result.ICMSTot.vST := 750.0;
  Result.ICMSTot.vFCPST := 90.0;
  Result.ICMSTot.vFCPSTRet := 30.0;
  Result.ICMSTot.qBCMono := 0.0;
  Result.ICMSTot.vICMSMono := 0.0;
  Result.ICMSTot.qBCMonoReten := 0.0;
  Result.ICMSTot.vICMSMonoReten := 0.0;
  Result.ICMSTot.qBCMonoRet := 0.0;
  Result.ICMSTot.vICMSMonoRet := 0.0;
  Result.ICMSTot.vProd := 9000.0;
  Result.ICMSTot.vFrete := 250.0;
  Result.ICMSTot.vSeg := 80.0;
  Result.ICMSTot.vDesc := 150.0;
  Result.ICMSTot.vII := 300.0;
  Result.ICMSTot.vIPI := 450.0;
  Result.ICMSTot.vIPIDevol := 20.0;
  Result.ICMSTot.vPIS := 165.0;
  Result.ICMSTot.vCOFINS := 760.0;
  Result.ICMSTot.vOutro := 90.0;
  Result.ICMSTot.vNF := 11500.0;
  Result.ICMSTot.vTotTrib := 2500.0;

  Result.ISSQNtot.vServ := 5000.0;
  Result.ISSQNtot.vBC := 5000.0;
  Result.ISSQNtot.vISS := 250.0;
  Result.ISSQNtot.vPIS := 75.0;
  Result.ISSQNtot.vCOFINS := 380.0;
  Result.ISSQNtot.dCompet := Date;
  Result.ISSQNtot.vDeducao := 100.0;
  Result.ISSQNtot.vOutro := 50.0;
  Result.ISSQNtot.vDescIncond := 30.0;
  Result.ISSQNtot.vDescCond := 40.0;
  Result.ISSQNtot.vISSRet := 20.0;
  Result.ISSQNtot.cRegTrib := RTISSNenhum;

  Result.retTrib.vRetPIS := 50.0;
  Result.retTrib.vRetCOFINS := 190.0;
  Result.retTrib.vRetCSLL := 120.0;
  Result.retTrib.vBCIRRF := 3000.0;
  Result.retTrib.vIRRF := 300.0;
  Result.retTrib.vBCRetPrev := 4500.0;
  Result.retTrib.vRetPrev := 400.0;
end;

function TFrmPrincipal.ExemploTTotal2: TTotal;
begin
  Result.ICMSTot.vBC := 0;
  Result.ICMSTot.vICMS := 0;
  Result.ICMSTot.vICMSDeson := 0;
  Result.ICMSTot.vFCP := 0;
  Result.ICMSTot.vBCST := 0;
  Result.ICMSTot.vST := 0;
  Result.ICMSTot.vFCPST := 0;
  Result.ICMSTot.vFCPSTRet := 0;
  Result.ICMSTot.vProd := 5.00;
  Result.ICMSTot.vFrete := 0;
  Result.ICMSTot.vSeg := 0;
  Result.ICMSTot.vDesc := 0;
  Result.ICMSTot.vII := 0;
  Result.ICMSTot.vIPI := 0;
  Result.ICMSTot.vIPIDevol := 0;
  Result.ICMSTot.vPIS := 0;
  Result.ICMSTot.vCOFINS := 0;
  Result.ICMSTot.vOutro := 0;
  Result.ICMSTot.vNF := 5.00;
  Result.ICMSTot.vTotTrib := 2.47;
end;

function TFrmPrincipal.ExemploTTransp1: TTransp;
begin
  Result.modFrete := tmfContaEmitente;
  Result.vagao := 'VG12345';
  Result.balsa := 'BL9876';

  Result.transporta.CNPJ := '12345678000199';
  Result.transporta.CPF := '';
  Result.transporta.xNome := 'Transportadora Rápida Express';
  Result.transporta.IE := '123456789012';
  Result.transporta.xEnder := 'Rodovia BR-381, 2000 - Zona Industrial';
  Result.transporta.xMun := 'Belo Horizonte';
  Result.transporta.UF := 'MG';

  Result.retTransp.vServ := 500.0;
  Result.retTransp.vBCRet := 1000.0;
  Result.retTransp.pICMSRet := 12.0;
  Result.retTransp.vICMSRet := 120.0;
  Result.retTransp.CFOP := 5932;
  Result.retTransp.cMunFG := 3106200; // Código IBGE de Belo Horizonte

  Result.veicTransp.placa := 'ABC1D23';
  Result.veicTransp.UF := 'MG';
  Result.veicTransp.RNTC := 'RNTC12345';

  SetLength(Result.reboque, 1);
  Result.reboque[0].placa := 'XYZ4E56';
  Result.reboque[0].UF := 'MG';
  Result.reboque[0].RNTC := 'RNTC67890';

  SetLength(Result.vol, 1);
  Result.vol[0].qVol := 10;
  Result.vol[0].esp := 'Caixa';
  Result.vol[0].marca := 'Embalagens Express';
  Result.vol[0].nVol := 'VOL123456';
  Result.vol[0].pesoL := 150.0;
  Result.vol[0].pesoB := 160.0;

  SetLength(Result.vol[0].lacres, 1);
  Result.vol[0].lacres[0] := 'LACRE98765';
end;

function TFrmPrincipal.ExemploTTransp2: TTransp;
begin
  Result.modFrete := tmfSemFrete;
  SetLength(Result.vol, 0);
end;

function TFrmPrincipal.ExemploTVeicProd1: TVeicProd;
begin
  Result.tpOp := toVendaDireta;
  Result.chassi := '9BGRD08X04C123456';
  Result.cCor := '001';
  Result.xCor := 'Preto';
  Result.pot := '150';
  Result.cilin := '2000';
  Result.pesoB := '1500';
  Result.pesoL := '1200';
  Result.nSerie := 'SER123456';
  Result.tpComb := 'Gasolina';
  Result.nMotor := 'MTR987654';
  Result.CMT := '3500';
  Result.dist := '2700';
  Result.anoMod := 2025;
  Result.anoFab := 2024;
  Result.tpPint := 'Metálica';
  Result.tpVeic := 1;
  Result.espVeic := 2;
  Result.VIN := 'VIN987654321';
  Result.condVeic := cvAcabado;
  Result.cMod := 'MOD2025';
  Result.cCorDENATRAN := '005';
  Result.lota := 5;
  Result.tpRest := 0;
end;

procedure TFrmPrincipal.BtnMinhaContaSystemClick(Sender: TObject);
var
  systemRetorno: TResponseSystem;
  I: Integer;
begin
  Memo.Lines.Add('BtnMinhaContaSystemClick - Requisição. Minha Conta System');
  try
    systemRetorno := DadosJahDFe.SystemMyAccount;

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnMinhaContaSystemClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnMinhaContaSystemClick - Página Atual: ' + systemRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + systemRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + systemRetorno.Pages.totalItens.ToString);
      for I := 0 to High(systemRetorno.ListSystem) do
        Memo.Lines.Add('BtnMinhaContaSystemClick - ' + (I + 1).ToString + '/' + IntToStr(Length(systemRetorno.ListSystem)) + ' - idSystem: ' +
          systemRetorno.ListSystem[I].idSystem + '; nameCompany: ' + systemRetorno.ListSystem[I].nameCompany + '; nameSystem: ' + systemRetorno.ListSystem[I].nameSystem +
          '; Email: ' + systemRetorno.ListSystem[I].Email + '; CNPJ: ' + systemRetorno.ListSystem[I].CNPJ + '; timezone: ' + TimeZoneToStr(systemRetorno.ListSystem[I].timezone) +
          '; createAt: ' + DateTimeToStr(systemRetorno.ListSystem[I].createAt) + '; updatedAt: ' + DateTimeToStr(systemRetorno.ListSystem[I].updatedAt) +
          '; deletedAt: ' + DateTimeToStr(systemRetorno.ListSystem[I].deletedAt));
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnMinhaContaSystemClick - Erro "DadosJahDFe.SystemMyAccount": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnModificarSystemClick(Sender: TObject);
var
  systemRetorno: TResponseSystem;
  I: Integer;
begin
  Memo.Lines.Add('BtnModificarSystemClick - Requisição. Modificar System.');
  try
    systemRetorno := DadosJahDFe.SystemModify('Sistema 3 Ltda', '');

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnModificarSystemClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnModificarSystemClick - Página Atual: ' + systemRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + systemRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + systemRetorno.Pages.totalItens.ToString);
      for I := 0 to High(systemRetorno.ListSystem) do
        Memo.Lines.Add('BtnModificarSystemClick - ' + (I + 1).ToString + '/' + IntToStr(Length(systemRetorno.ListSystem)) + ' - idSystem: ' +
          systemRetorno.ListSystem[I].idSystem + '; nameCompany: ' + systemRetorno.ListSystem[I].nameCompany + '; nameSystem: ' + systemRetorno.ListSystem[I].nameSystem +
          '; Email: ' + systemRetorno.ListSystem[I].Email + '; CNPJ: ' + systemRetorno.ListSystem[I].CNPJ + '; timezone: ' + TimeZoneToStr(systemRetorno.ListSystem[I].timezone) +
          '; createAt: ' + DateTimeToStr(systemRetorno.ListSystem[I].createAt) + '; updatedAt: ' + DateTimeToStr(systemRetorno.ListSystem[I].updatedAt) +
          '; deletedAt: ' + DateTimeToStr(systemRetorno.ListSystem[I].deletedAt));
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnModificarSystemClick - Erro "DadosJahDFe.SystemModify": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnMinhaContaUserClick(Sender: TObject);
var
  UserRetorno: TResponseUser;
  I: Integer;
begin
  Memo.Lines.Add('BtnMinhaContaUserClick - Requisição. Minha Conta User');
  try
    UserRetorno := DadosJahDFe.UserMyAccount;

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnMinhaContaUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnMinhaContaUserClick - Página Atual: ' + UserRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + UserRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + UserRetorno.Pages.totalItens.ToString);
      for I := 0 to High(UserRetorno.ListUser) do
      begin
        Memo.Lines.Add('BtnMinhaContaUserClick - ' + (I + 1).ToString + '/' + IntToStr(Length(UserRetorno.ListUser)) + ' - idUser: ' +
          UserRetorno.ListUser[I].idUser + '; idExternal: ' + UserRetorno.ListUser[I].idExternal + '; name: ' + UserRetorno.ListUser[I].name +
          '; Email: ' + UserRetorno.ListUser[I].Email + '; CNPJ: ' + UserRetorno.ListUser[I].CNPJ + '; timezone: ' + TimeZoneToStr(UserRetorno.ListUser[I].timezone) +
          '; expirationCertificate: ' + DateToStr(UserRetorno.ListUser[I].expirationCertificate) + '; notification: ' +
          IfThen(UserRetorno.ListUser[I].notification, 'Sim', 'Não') + '; createAt: ' + DateTimeToStr(UserRetorno.ListUser[I].createAt) + '; updatedAt: ' +
          DateTimeToStr(UserRetorno.ListUser[I].updatedAt) + '; deletedAt: ' + DateTimeToStr(UserRetorno.ListUser[I].deletedAt));

        Memo.Lines.Add('BtnMinhaContaUserClick - Autorização XML. Quant: ' + IntToStr(Length(UserRetorno.ListUser[I].autXML)) + '; CPF/CNPJ: ' +
          ArrayListToStr(UserRetorno.ListUser[I].autXML));

        Memo.Lines.Add('BtnMinhaContaUserClick - Emitente. CNPJCPF: ' + UserRetorno.ListUser[I].emit.CNPJCPF + '; xNome: ' + UserRetorno.ListUser[I].emit.xNome + '; xFant: ' +
          UserRetorno.ListUser[I].emit.xFant + '; IE :' + UserRetorno.ListUser[I].emit.IE + '; IEST: ' + UserRetorno.ListUser[I].emit.IEST + '; IM: ' +
          UserRetorno.ListUser[I].emit.IM + '; CNAE: ' + UserRetorno.ListUser[I].emit.CNAE + '; CRT: ' + CRTToStr(UserRetorno.ListUser[I].emit.CRT) + '; xLgr: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xLgr + '; nro: ' + UserRetorno.ListUser[I].emit.enderEmit.nro + '; xCpl: ' + UserRetorno.ListUser[I].emit.enderEmit.xCpl +
          '; xBairro: ' + UserRetorno.ListUser[I].emit.enderEmit.xBairro + '; cMun: ' + UserRetorno.ListUser[I].emit.enderEmit.cMun.ToString + '; xMun: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xMun + '; UF: ' + UserRetorno.ListUser[I].emit.enderEmit.UF + '; CEP: ' + UserRetorno.ListUser[I].emit.enderEmit.CEP +
          '; cPais: ' + UserRetorno.ListUser[I].emit.enderEmit.cPais.ToString + '; xPais: ' + UserRetorno.ListUser[I].emit.enderEmit.xPais + '; fone: ' +
          UserRetorno.ListUser[I].emit.enderEmit.fone);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnMinhaContaUserClick - Erro "DadosJahDFe.UserMyAccount": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnModificarUserPeloSystemClick(Sender: TObject);
var
  vListUserModifySystem: TListUserModifySystem;
  UserRetorno: TResponseUser;
  I: Integer;
begin
  Memo.Lines.Add('BtnModificarUserPeloSystemClick - Requisição. Modificar User pelo System.');
  try
    SetLength(vListUserModifySystem, 1);
    vListUserModifySystem[0].idUser := '';
    vListUserModifySystem[0].name := 'Administrador Sistema 3';
    vListUserModifySystem[0].Email := 'admin@sistema3.com.br';
    vListUserModifySystem[0].Password := '';

    UserRetorno := DadosJahDFe.SystemModifyUser(vListUserModifySystem);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnModificarUserPeloSystemClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnModificarUserPeloSystemClick - Página Atual: ' + UserRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + UserRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + UserRetorno.Pages.totalItens.ToString);
      for I := 0 to High(UserRetorno.ListUser) do
      begin
        Memo.Lines.Add('BtnModificarUserPeloSystemClick - ' + (I + 1).ToString + '/' + IntToStr(Length(UserRetorno.ListUser)) + ' - idUser: ' +
          UserRetorno.ListUser[I].idUser + '; idExternal: ' + UserRetorno.ListUser[I].idExternal + '; name: ' + UserRetorno.ListUser[I].name +
          '; Email: ' + UserRetorno.ListUser[I].Email + '; CNPJ: ' + UserRetorno.ListUser[I].CNPJ + '; timezone: ' + TimeZoneToStr(UserRetorno.ListUser[I].timezone) +
          '; expirationCertificate: ' + DateToStr(UserRetorno.ListUser[I].expirationCertificate) + '; notification: ' +
          IfThen(UserRetorno.ListUser[I].notification, 'Sim', 'Não') + '; createAt: ' + DateTimeToStr(UserRetorno.ListUser[I].createAt) + '; updatedAt: ' +
          DateTimeToStr(UserRetorno.ListUser[I].updatedAt) + '; deletedAt: ' + DateTimeToStr(UserRetorno.ListUser[I].deletedAt));

        Memo.Lines.Add('BtnModificarUserPeloSystemClick - Autorização XML. Quant: ' + IntToStr(Length(UserRetorno.ListUser[I].autXML)) + '; CPF/CNPJ: ' +
          ArrayListToStr(UserRetorno.ListUser[I].autXML));

        Memo.Lines.Add('BtnModificarUserPeloSystemClick - Emitente. CNPJCPF: ' + UserRetorno.ListUser[I].emit.CNPJCPF + '; xNome: ' + UserRetorno.ListUser[I].emit.xNome + '; xFant: ' +
          UserRetorno.ListUser[I].emit.xFant + '; IE :' + UserRetorno.ListUser[I].emit.IE + '; IEST: ' + UserRetorno.ListUser[I].emit.IEST + '; IM: ' +
          UserRetorno.ListUser[I].emit.IM + '; CNAE: ' + UserRetorno.ListUser[I].emit.CNAE + '; CRT: ' + CRTToStr(UserRetorno.ListUser[I].emit.CRT) + '; xLgr: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xLgr + '; nro: ' + UserRetorno.ListUser[I].emit.enderEmit.nro + '; xCpl: ' + UserRetorno.ListUser[I].emit.enderEmit.xCpl +
          '; xBairro: ' + UserRetorno.ListUser[I].emit.enderEmit.xBairro + '; cMun: ' + UserRetorno.ListUser[I].emit.enderEmit.cMun.ToString + '; xMun: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xMun + '; UF: ' + UserRetorno.ListUser[I].emit.enderEmit.UF + '; CEP: ' + UserRetorno.ListUser[I].emit.enderEmit.CEP +
          '; cPais: ' + UserRetorno.ListUser[I].emit.enderEmit.cPais.ToString + '; xPais: ' + UserRetorno.ListUser[I].emit.enderEmit.xPais + '; fone: ' +
          UserRetorno.ListUser[I].emit.enderEmit.fone);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnModificarUserPeloSystemClick - Erro "DadosJahDFe.SystemModifyUser": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnModificarUserClick(Sender: TObject);
var
  UserRetorno: TResponseUser;
  I: Integer;
  nfce : TNFCeUser;
begin
  Memo.Lines.Add('BtnModificarUserClick - Requisição. Modificar User.');
  try
    nfce.CSC := '4f39884b8b38defdf084eeb51d999929';
    nfce.IdCSC := '1';
    nfce.versaoQRCode := vqc2;

    UserRetorno := DadosJahDFe.UserModify('Administrador Sistema 3', 'admin@sistema3.com.br', True, nfce);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnModificarUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnModificarUserClick - Página Atual: ' + UserRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + UserRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + UserRetorno.Pages.totalItens.ToString);
      for I := 0 to High(UserRetorno.ListUser) do
      begin
        Memo.Lines.Add('BtnModificarUserClick - ' + (I + 1).ToString + '/' + IntToStr(Length(UserRetorno.ListUser)) + ' - idUser: ' +
          UserRetorno.ListUser[I].idUser + '; idExternal: ' + UserRetorno.ListUser[I].idExternal + '; name: ' + UserRetorno.ListUser[I].name +
          '; Email: ' + UserRetorno.ListUser[I].Email + '; CNPJ: ' + UserRetorno.ListUser[I].CNPJ + '; timezone: ' + TimeZoneToStr(UserRetorno.ListUser[I].timezone) +
          '; expirationCertificate: ' + DateToStr(UserRetorno.ListUser[I].expirationCertificate) + '; notification: ' +
          IfThen(UserRetorno.ListUser[I].notification, 'Sim', 'Não') + '; createAt: ' + DateTimeToStr(UserRetorno.ListUser[I].createAt) + '; updatedAt: ' +
          DateTimeToStr(UserRetorno.ListUser[I].updatedAt) + '; deletedAt: ' + DateTimeToStr(UserRetorno.ListUser[I].deletedAt));

        Memo.Lines.Add('BtnModificarUserClick - Autorização XML. Quant: ' + IntToStr(Length(UserRetorno.ListUser[I].autXML)) + '; CPF/CNPJ: ' +
          ArrayListToStr(UserRetorno.ListUser[I].autXML));

        Memo.Lines.Add('BtnModificarUserClick - Emitente. CNPJCPF: ' + UserRetorno.ListUser[I].emit.CNPJCPF + '; xNome: ' + UserRetorno.ListUser[I].emit.xNome + '; xFant: ' +
          UserRetorno.ListUser[I].emit.xFant + '; IE :' + UserRetorno.ListUser[I].emit.IE + '; IEST: ' + UserRetorno.ListUser[I].emit.IEST + '; IM: ' +
          UserRetorno.ListUser[I].emit.IM + '; CNAE: ' + UserRetorno.ListUser[I].emit.CNAE + '; CRT: ' + CRTToStr(UserRetorno.ListUser[I].emit.CRT) + '; xLgr: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xLgr + '; nro: ' + UserRetorno.ListUser[I].emit.enderEmit.nro + '; xCpl: ' + UserRetorno.ListUser[I].emit.enderEmit.xCpl +
          '; xBairro: ' + UserRetorno.ListUser[I].emit.enderEmit.xBairro + '; cMun: ' + UserRetorno.ListUser[I].emit.enderEmit.cMun.ToString + '; xMun: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xMun + '; UF: ' + UserRetorno.ListUser[I].emit.enderEmit.UF + '; CEP: ' + UserRetorno.ListUser[I].emit.enderEmit.CEP +
          '; cPais: ' + UserRetorno.ListUser[I].emit.enderEmit.cPais.ToString + '; xPais: ' + UserRetorno.ListUser[I].emit.enderEmit.xPais + '; fone: ' +
          UserRetorno.ListUser[I].emit.enderEmit.fone);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnModificarUserClick - Erro "DadosJahDFe.UserModify": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDeletarUserClick(Sender: TObject);
var
  vUserIdList: TArray<String>;
  UserRetorno: TResponseUser;
  I: Integer;
begin
  Memo.Lines.Add('BtnDeletarUserClick - Requisição. Inativar User');
  try
    SetLength(vUserIdList, 1);
    vUserIdList[0] := '52b4779d-d719-42c9-b17b-f3913cbd4db3';

    UserRetorno := DadosJahDFe.UserDelete(vUserIdList);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDeletarUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDeletarUserClick - Página Atual: ' + UserRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + UserRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + UserRetorno.Pages.totalItens.ToString);
      for I := 0 to High(UserRetorno.ListUser) do
      begin
        Memo.Lines.Add('BtnDeletarUserClick - ' + (I + 1).ToString + '/' + IntToStr(Length(UserRetorno.ListUser)) + ' - idUser: ' +
          UserRetorno.ListUser[I].idUser + '; idExternal: ' + UserRetorno.ListUser[I].idExternal + '; name: ' + UserRetorno.ListUser[I].name +
          '; Email: ' + UserRetorno.ListUser[I].Email + '; CNPJ: ' + UserRetorno.ListUser[I].CNPJ + '; timezone: ' + TimeZoneToStr(UserRetorno.ListUser[I].timezone) +
          '; expirationCertificate: ' + DateToStr(UserRetorno.ListUser[I].expirationCertificate) + '; notification: ' +
          IfThen(UserRetorno.ListUser[I].notification, 'Sim', 'Não') + '; createAt: ' + DateTimeToStr(UserRetorno.ListUser[I].createAt) + '; updatedAt: ' +
          DateTimeToStr(UserRetorno.ListUser[I].updatedAt) + '; deletedAt: ' + DateTimeToStr(UserRetorno.ListUser[I].deletedAt));

        Memo.Lines.Add('BtnDeletarUserClick - Autorização XML. Quant: ' + IntToStr(Length(UserRetorno.ListUser[I].autXML)) + '; CPF/CNPJ: ' +
          ArrayListToStr(UserRetorno.ListUser[I].autXML));

        Memo.Lines.Add('BtnDeletarUserClick - Emitente. CNPJCPF: ' + UserRetorno.ListUser[I].emit.CNPJCPF + '; xNome: ' + UserRetorno.ListUser[I].emit.xNome + '; xFant: ' +
          UserRetorno.ListUser[I].emit.xFant + '; IE :' + UserRetorno.ListUser[I].emit.IE + '; IEST: ' + UserRetorno.ListUser[I].emit.IEST + '; IM: ' +
          UserRetorno.ListUser[I].emit.IM + '; CNAE: ' + UserRetorno.ListUser[I].emit.CNAE + '; CRT: ' + CRTToStr(UserRetorno.ListUser[I].emit.CRT) + '; xLgr: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xLgr + '; nro: ' + UserRetorno.ListUser[I].emit.enderEmit.nro + '; xCpl: ' + UserRetorno.ListUser[I].emit.enderEmit.xCpl +
          '; xBairro: ' + UserRetorno.ListUser[I].emit.enderEmit.xBairro + '; cMun: ' + UserRetorno.ListUser[I].emit.enderEmit.cMun.ToString + '; xMun: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xMun + '; UF: ' + UserRetorno.ListUser[I].emit.enderEmit.UF + '; CEP: ' + UserRetorno.ListUser[I].emit.enderEmit.CEP +
          '; cPais: ' + UserRetorno.ListUser[I].emit.enderEmit.cPais.ToString + '; xPais: ' + UserRetorno.ListUser[I].emit.enderEmit.xPais + '; fone: ' +
          UserRetorno.ListUser[I].emit.enderEmit.fone);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDeletarUserClick - Erro "DadosJahDFe.UserDelete": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnRestaurarUserClick(Sender: TObject);
var
  vUserIdList: TArray<String>;
  UserRetorno: TResponseUser;
  I: Integer;
begin
  Memo.Lines.Add('BtnRestaurarUserClick - Requisição. Restaurar User');
  try
    SetLength(vUserIdList, 1);
    vUserIdList[0] := '52b4779d-d719-42c9-b17b-f3913cbd4db3';

    UserRetorno := DadosJahDFe.UserRestore(vUserIdList);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnRestaurarUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnRestaurarUserClick - Página Atual: ' + UserRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + UserRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + UserRetorno.Pages.totalItens.ToString);
      for I := 0 to High(UserRetorno.ListUser) do
      begin
        Memo.Lines.Add('BtnRestaurarUserClick - ' + (I + 1).ToString + '/' + IntToStr(Length(UserRetorno.ListUser)) + ' - idUser: ' +
          UserRetorno.ListUser[I].idUser + '; idExternal: ' + UserRetorno.ListUser[I].idExternal + '; name: ' + UserRetorno.ListUser[I].name +
          '; Email: ' + UserRetorno.ListUser[I].Email + '; CNPJ: ' + UserRetorno.ListUser[I].CNPJ + '; timezone: ' + TimeZoneToStr(UserRetorno.ListUser[I].timezone) +
          '; expirationCertificate: ' + DateToStr(UserRetorno.ListUser[I].expirationCertificate) + '; notification: ' +
          IfThen(UserRetorno.ListUser[I].notification, 'Sim', 'Não') + '; createAt: ' + DateTimeToStr(UserRetorno.ListUser[I].createAt) + '; updatedAt: ' +
          DateTimeToStr(UserRetorno.ListUser[I].updatedAt) + '; deletedAt: ' + DateTimeToStr(UserRetorno.ListUser[I].deletedAt));

        Memo.Lines.Add('BtnRestaurarUserClick - Autorização XML. Quant: ' + IntToStr(Length(UserRetorno.ListUser[I].autXML)) + '; CPF/CNPJ: ' +
          ArrayListToStr(UserRetorno.ListUser[I].autXML));

        Memo.Lines.Add('BtnRestaurarUserClick - Emitente. CNPJCPF: ' + UserRetorno.ListUser[I].emit.CNPJCPF + '; xNome: ' + UserRetorno.ListUser[I].emit.xNome + '; xFant: ' +
          UserRetorno.ListUser[I].emit.xFant + '; IE :' + UserRetorno.ListUser[I].emit.IE + '; IEST: ' + UserRetorno.ListUser[I].emit.IEST + '; IM: ' +
          UserRetorno.ListUser[I].emit.IM + '; CNAE: ' + UserRetorno.ListUser[I].emit.CNAE + '; CRT: ' + CRTToStr(UserRetorno.ListUser[I].emit.CRT) + '; xLgr: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xLgr + '; nro: ' + UserRetorno.ListUser[I].emit.enderEmit.nro + '; xCpl: ' + UserRetorno.ListUser[I].emit.enderEmit.xCpl +
          '; xBairro: ' + UserRetorno.ListUser[I].emit.enderEmit.xBairro + '; cMun: ' + UserRetorno.ListUser[I].emit.enderEmit.cMun.ToString + '; xMun: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xMun + '; UF: ' + UserRetorno.ListUser[I].emit.enderEmit.UF + '; CEP: ' + UserRetorno.ListUser[I].emit.enderEmit.CEP +
          '; cPais: ' + UserRetorno.ListUser[I].emit.enderEmit.cPais.ToString + '; xPais: ' + UserRetorno.ListUser[I].emit.enderEmit.xPais + '; fone: ' +
          UserRetorno.ListUser[I].emit.enderEmit.fone);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnRestaurarUserClick - Erro "DadosJahDFe.UserRestore": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnListarUserClick(Sender: TObject);
var
  UserRetorno: TResponseUser;
  I: Integer;
begin
  Memo.Lines.Add('BtnListarUserClick - Requisição. Listar User');
  try
    UserRetorno := DadosJahDFe.UserList(10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnListarUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnListarUserClick - Página Atual: ' + UserRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + UserRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + UserRetorno.Pages.totalItens.ToString);
      for I := 0 to High(UserRetorno.ListUser) do
      begin
        Memo.Lines.Add('BtnListarUserClick - ' + (I + 1).ToString + '/' + IntToStr(Length(UserRetorno.ListUser)) + ' - idUser: ' +
          UserRetorno.ListUser[I].idUser + '; idExternal: ' + UserRetorno.ListUser[I].idExternal + '; name: ' + UserRetorno.ListUser[I].name +
          '; Email: ' + UserRetorno.ListUser[I].Email + '; CNPJ: ' + UserRetorno.ListUser[I].CNPJ + '; timezone: ' + TimeZoneToStr(UserRetorno.ListUser[I].timezone) +
          '; expirationCertificate: ' + DateToStr(UserRetorno.ListUser[I].expirationCertificate) + '; notification: ' +
          IfThen(UserRetorno.ListUser[I].notification, 'Sim', 'Não') + '; createAt: ' + DateTimeToStr(UserRetorno.ListUser[I].createAt) + '; updatedAt: ' +
          DateTimeToStr(UserRetorno.ListUser[I].updatedAt) + '; deletedAt: ' + DateTimeToStr(UserRetorno.ListUser[I].deletedAt));

        Memo.Lines.Add('BtnListarUserClick - Autorização XML. Quant: ' + IntToStr(Length(UserRetorno.ListUser[I].autXML)) + '; CPF/CNPJ: ' +
          ArrayListToStr(UserRetorno.ListUser[I].autXML));

        Memo.Lines.Add('BtnListarUserClick - Emitente. CNPJCPF: ' + UserRetorno.ListUser[I].emit.CNPJCPF + '; xNome: ' + UserRetorno.ListUser[I].emit.xNome + '; xFant: ' +
          UserRetorno.ListUser[I].emit.xFant + '; IE :' + UserRetorno.ListUser[I].emit.IE + '; IEST: ' + UserRetorno.ListUser[I].emit.IEST + '; IM: ' +
          UserRetorno.ListUser[I].emit.IM + '; CNAE: ' + UserRetorno.ListUser[I].emit.CNAE + '; CRT: ' + CRTToStr(UserRetorno.ListUser[I].emit.CRT) + '; xLgr: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xLgr + '; nro: ' + UserRetorno.ListUser[I].emit.enderEmit.nro + '; xCpl: ' + UserRetorno.ListUser[I].emit.enderEmit.xCpl +
          '; xBairro: ' + UserRetorno.ListUser[I].emit.enderEmit.xBairro + '; cMun: ' + UserRetorno.ListUser[I].emit.enderEmit.cMun.ToString + '; xMun: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xMun + '; UF: ' + UserRetorno.ListUser[I].emit.enderEmit.UF + '; CEP: ' + UserRetorno.ListUser[I].emit.enderEmit.CEP +
          '; cPais: ' + UserRetorno.ListUser[I].emit.enderEmit.cPais.ToString + '; xPais: ' + UserRetorno.ListUser[I].emit.enderEmit.xPais + '; fone: ' +
          UserRetorno.ListUser[I].emit.enderEmit.fone);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnListarUserClick - Erro "DadosJahDFe.UserList": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnBuscarUserClick(Sender: TObject);
var
  vUserIdList: TArray<String>;
  UserRetorno: TResponseUser;
  I: Integer;
begin
  Memo.Lines.Add('BtnBuscarUserClick - Requisição. Buscar User');
  try
    SetLength(vUserIdList, 1);
    vUserIdList[0] := '52b4779d-d719-42c9-b17b-f3913cbd4db3';

    UserRetorno := DadosJahDFe.GetUser(vUserIdList);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnBuscarUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnBuscarUserClick - Página Atual: ' + UserRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + UserRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + UserRetorno.Pages.totalItens.ToString);
      for I := 0 to High(UserRetorno.ListUser) do
      begin
        Memo.Lines.Add('BtnBuscarUserClick - ' + (I + 1).ToString + '/' + IntToStr(Length(UserRetorno.ListUser)) + ' - idUser: ' +
          UserRetorno.ListUser[I].idUser + '; idExternal: ' + UserRetorno.ListUser[I].idExternal + '; name: ' + UserRetorno.ListUser[I].name +
          '; Email: ' + UserRetorno.ListUser[I].Email + '; CNPJ: ' + UserRetorno.ListUser[I].CNPJ + '; timezone: ' + TimeZoneToStr(UserRetorno.ListUser[I].timezone) +
          '; expirationCertificate: ' + DateToStr(UserRetorno.ListUser[I].expirationCertificate) + '; notification: ' +
          IfThen(UserRetorno.ListUser[I].notification, 'Sim', 'Não') + '; createAt: ' + DateTimeToStr(UserRetorno.ListUser[I].createAt) + '; updatedAt: ' +
          DateTimeToStr(UserRetorno.ListUser[I].updatedAt) + '; deletedAt: ' + DateTimeToStr(UserRetorno.ListUser[I].deletedAt));

        Memo.Lines.Add('BtnBuscarUserClick - Autorização XML. Quant: ' + IntToStr(Length(UserRetorno.ListUser[I].autXML)) + '; CPF/CNPJ: ' +
          ArrayListToStr(UserRetorno.ListUser[I].autXML));

        Memo.Lines.Add('BtnBuscarUserClick - Emitente. CNPJCPF: ' + UserRetorno.ListUser[I].emit.CNPJCPF + '; xNome: ' + UserRetorno.ListUser[I].emit.xNome + '; xFant: ' +
          UserRetorno.ListUser[I].emit.xFant + '; IE :' + UserRetorno.ListUser[I].emit.IE + '; IEST: ' + UserRetorno.ListUser[I].emit.IEST + '; IM: ' +
          UserRetorno.ListUser[I].emit.IM + '; CNAE: ' + UserRetorno.ListUser[I].emit.CNAE + '; CRT: ' + CRTToStr(UserRetorno.ListUser[I].emit.CRT) + '; xLgr: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xLgr + '; nro: ' + UserRetorno.ListUser[I].emit.enderEmit.nro + '; xCpl: ' + UserRetorno.ListUser[I].emit.enderEmit.xCpl +
          '; xBairro: ' + UserRetorno.ListUser[I].emit.enderEmit.xBairro + '; cMun: ' + UserRetorno.ListUser[I].emit.enderEmit.cMun.ToString + '; xMun: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xMun + '; UF: ' + UserRetorno.ListUser[I].emit.enderEmit.UF + '; CEP: ' + UserRetorno.ListUser[I].emit.enderEmit.CEP +
          '; cPais: ' + UserRetorno.ListUser[I].emit.enderEmit.cPais.ToString + '; xPais: ' + UserRetorno.ListUser[I].emit.enderEmit.xPais + '; fone: ' +
          UserRetorno.ListUser[I].emit.enderEmit.fone);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnBuscarUserClick - Erro "DadosJahDFe.GetUser": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnListarNotificacoesUsuarioClick(Sender: TObject);
var
  NotificationRetorno: TResponseNotification;
  I: Integer;
begin
  Memo.Lines.Add('BtnListarNotificacoesUsuarioClick - Requisição. Listar Notificações do Usuário');
  try
    NotificationRetorno := DadosJahDFe.NotificationList(10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnListarNotificacoesUsuarioClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnListarNotificacoesUsuarioClick - Página Atual: ' + NotificationRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' +
        NotificationRetorno.Pages.totalPages.ToString + '; Quant. Itens: ' + NotificationRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NotificationRetorno.ListNotification) do
      begin
        Memo.Lines.Add('BtnListarNotificacoesUsuarioClick - ' + (I + 1).ToString + '/' + IntToStr(Length(NotificationRetorno.ListNotification)) + ' - Email: ' +
          NotificationRetorno.ListNotification[I].Email + '; TypeNotification: ' + NotificationToStr(NotificationRetorno.ListNotification[I].TypeNotification));
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnListarNotificacoesUsuarioClick - Erro "DadosJahDFe.NotificationList": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnAddNotificacaoUsuarioClick(Sender: TObject);
var
  NotificationRetorno: TResponseNotification;
  ListNotification: TListNotification;
  I: Integer;
begin
  SetLength(ListNotification, 3);
  ListNotification[0].Email := 'patrick@ctec.com.br';
  ListNotification[0].TypeNotification := ttnStatusServico;
  ListNotification[1].Email := 'patrick@ctec.com.br';
  ListNotification[1].TypeNotification := ttnNFe;
  ListNotification[2].Email := 'patrick@ctec.com.br';
  ListNotification[2].TypeNotification := ttnAll;

  Memo.Lines.Add('BtnAddNotificacaoUsuarioClick - Requisição. Adicionar Notificações do Usuário');
  try
    NotificationRetorno := DadosJahDFe.NotificationAdd(ListNotification);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnAddNotificacaoUsuarioClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnAddNotificacaoUsuarioClick - Página Atual: ' + NotificationRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' +
        NotificationRetorno.Pages.totalPages.ToString + '; Quant. Itens: ' + NotificationRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NotificationRetorno.ListNotification) do
      begin
        Memo.Lines.Add('BtnAddNotificacaoUsuarioClick - ' + (I + 1).ToString + '/' + IntToStr(Length(NotificationRetorno.ListNotification)) + ' - Email: ' +
          NotificationRetorno.ListNotification[I].Email + '; TypeNotification: ' + NotificationToStr(NotificationRetorno.ListNotification[I].TypeNotification));
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnAddNotificacaoUsuarioClick - Erro "DadosJahDFe.NotificationAdd": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnAdicionarUserClick(Sender: TObject);
var
  UserRetorno: TResponseUser;
  I: Integer;
  nfce : TNFCeUser;
begin
  Memo.Lines.Add('BtnAdicionarUserClick - Requisição. Adicionar User');
  try
    nfce.CSC := '4f39884b8b38defdf084eeb51d999929';
    nfce.IdCSC := '1';
    nfce.versaoQRCode := vqc2;

    UserRetorno := DadosJahDFe.UserAdd('name', 'email@email.com', 'idExternal', 'cnpj', False, tzLess0100, nfce);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnAdicionarUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnAdicionarUserClick - Página Atual: ' + UserRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + UserRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + UserRetorno.Pages.totalItens.ToString);
      for I := 0 to High(UserRetorno.ListUser) do
      begin
        Memo.Lines.Add('BtnAdicionarUserClick - ' + (I + 1).ToString + '/' + IntToStr(Length(UserRetorno.ListUser)) + ' - idUser: ' +
          UserRetorno.ListUser[I].idUser + '; idExternal: ' + UserRetorno.ListUser[I].idExternal + '; name: ' + UserRetorno.ListUser[I].name +
          '; Email: ' + UserRetorno.ListUser[I].Email + '; CNPJ: ' + UserRetorno.ListUser[I].CNPJ + '; timezone: ' + TimeZoneToStr(UserRetorno.ListUser[I].timezone) +
          '; expirationCertificate: ' + DateToStr(UserRetorno.ListUser[I].expirationCertificate) + '; notification: ' +
          IfThen(UserRetorno.ListUser[I].notification, 'Sim', 'Não') + '; createAt: ' + DateTimeToStr(UserRetorno.ListUser[I].createAt) + '; updatedAt: ' +
          DateTimeToStr(UserRetorno.ListUser[I].updatedAt) + '; deletedAt: ' + DateTimeToStr(UserRetorno.ListUser[I].deletedAt));

        Memo.Lines.Add('BtnAdicionarUserClick - Autorização XML. Quant: ' + IntToStr(Length(UserRetorno.ListUser[I].autXML)) + '; CPF/CNPJ: ' +
          ArrayListToStr(UserRetorno.ListUser[I].autXML));

        Memo.Lines.Add('BtnAdicionarUserClick - Emitente. CNPJCPF: ' + UserRetorno.ListUser[I].emit.CNPJCPF + '; xNome: ' + UserRetorno.ListUser[I].emit.xNome + '; xFant: ' +
          UserRetorno.ListUser[I].emit.xFant + '; IE :' + UserRetorno.ListUser[I].emit.IE + '; IEST: ' + UserRetorno.ListUser[I].emit.IEST + '; IM: ' +
          UserRetorno.ListUser[I].emit.IM + '; CNAE: ' + UserRetorno.ListUser[I].emit.CNAE + '; CRT: ' + CRTToStr(UserRetorno.ListUser[I].emit.CRT) + '; xLgr: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xLgr + '; nro: ' + UserRetorno.ListUser[I].emit.enderEmit.nro + '; xCpl: ' + UserRetorno.ListUser[I].emit.enderEmit.xCpl +
          '; xBairro: ' + UserRetorno.ListUser[I].emit.enderEmit.xBairro + '; cMun: ' + UserRetorno.ListUser[I].emit.enderEmit.cMun.ToString + '; xMun: ' +
          UserRetorno.ListUser[I].emit.enderEmit.xMun + '; UF: ' + UserRetorno.ListUser[I].emit.enderEmit.UF + '; CEP: ' + UserRetorno.ListUser[I].emit.enderEmit.CEP +
          '; cPais: ' + UserRetorno.ListUser[I].emit.enderEmit.cPais.ToString + '; xPais: ' + UserRetorno.ListUser[I].emit.enderEmit.xPais + '; fone: ' +
          UserRetorno.ListUser[I].emit.enderEmit.fone);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnAdicionarUserClick - Erro "DadosJahDFe.UserAdd": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeEmisaoAssincrono1Click(Sender: TObject);
var
  idBatch: String;
  nfes: TListNFeNFCe;
begin
  SetLength(nfes, 2);
  nfes[0] := ExemploEmissaoNFe2;
  nfes[1] := ExemploEmissaoNFe2;

  Memo.Lines.Add('BtnNFeEmisaoAssincrono1Click - Requisição. Emissão de NFe em modo assincrono.');
  try
    idBatch := DadosJahDFe.NFeEmissionAsync(nfes);
    Memo.Lines.Add('BtnNFeEmisaoAssincrono1Click - Retorno. idBatch: ' + idBatch);
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeEmisaoAssincrono1Click - Erro "DadosJahDFe.NFeEmissionAsync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeEmisaoSincronoClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFeEmisaoSincronoClick - Requisição. Emissão de NFe em modo sincrono.');
  try
    NFeRetorno := DadosJahDFe.NFeEmissionSync(ExemploEmissaoNFe2);
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFeEmisaoSincronoClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFeEmisaoSincronoClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnNFeEmisaoSincronoClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnNFeEmisaoSincronoClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnNFeEmisaoSincronoClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeEmisaoSincronoClick - Erro "DadosJahDFe.NFeEmissionSync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDanfceChavedfeClick(Sender: TObject);
var
  retorno: TResponseConsultDANFeDANFCe;
  I: Integer;

  function TipoImpressaoNFCe: TTipoImpressaoNFCe;
  begin
    if CmbDanfceTipoImpressao.ItemIndex = 1 then
      Result := ttiNFCeA4
    else
      Result := ttiCupom;
  end;

begin
  Memo.Lines.Add('BtnDanfceChavedfeClick - Requisição. Consulta DANFCe NFCe pela chave dfe');
  try
    retorno := DadosJahDFe.NFCeGetDANFCeChaveDFe(EdtDanfceXml.Text, taHomologacao, TipoImpressaoNFCe);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDanfceChavedfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDanfceChavedfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListDANFeDANFCe) do
      begin
        Memo.Lines.Add('BtnDanfceChavedfeClick - Retorno. idDfe: ' + retorno.ListDANFeDANFCe[I].idDfe + '; serie: ' + retorno.ListDANFeDANFCe[I].serie.ToString +
          '; nNF: ' + retorno.ListDANFeDANFCe[I].nNF.ToString + '; chDfe: ' + retorno.ListDANFeDANFCe[I].chDfe + '; idExternal: ' + retorno.ListDANFeDANFCe[I].idExternal +
          '; tpAmb: ' + AmbToDescStr(retorno.ListDANFeDANFCe[I].tpAmb));
        Memo.Lines.Add('BtnDanfceChavedfeClick - Retorno. PDF Link: ' + retorno.ListDANFeDANFCe[I].pdfLink);
        if retorno.ListDANFeDANFCe[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListDANFeDANFCe[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListDANFeDANFCe[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDanfceChavedfeClick - Erro "DadosJahDFe.NFCeGetDANFCeChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDanfceIdDfeClick(Sender: TObject);
var
  retorno: TResponseConsultDANFeDANFCe;
  I: Integer;

  function TipoImpressaoNFCe: TTipoImpressaoNFCe;
  begin
    if CmbDanfceTipoImpressao.ItemIndex = 1 then
      Result := ttiNFCeA4
    else
      Result := ttiCupom;
  end;

begin
  Memo.Lines.Add('BtnDanfceIdDfeClick - Requisição. Consulta DANFCe NFCe pelo iddfe');
  try
    retorno := DadosJahDFe.NFCeGetDANFCeIdDfe(EdtDanfceIdDfe.Text, TipoImpressaoNFCe);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDanfceIdDfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDanfceIdDfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListDANFeDANFCe) do
      begin
        Memo.Lines.Add('BtnDanfceIdDfeClick - Retorno. idDfe: ' + retorno.ListDANFeDANFCe[I].idDfe + '; serie: ' + retorno.ListDANFeDANFCe[I].serie.ToString +
          '; nNF: ' + retorno.ListDANFeDANFCe[I].nNF.ToString + '; chDfe: ' + retorno.ListDANFeDANFCe[I].chDfe + '; idExternal: ' + retorno.ListDANFeDANFCe[I].idExternal +
          '; tpAmb: ' + AmbToDescStr(retorno.ListDANFeDANFCe[I].tpAmb));
        Memo.Lines.Add('BtnDanfceIdDfeClick - Retorno. PDF Link: ' + retorno.ListDANFeDANFCe[I].pdfLink);
        if retorno.ListDANFeDANFCe[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListDANFeDANFCe[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListDANFeDANFCe[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDanfceIdDfeClick - Erro "DadosJahDFe.NFCeGetDANFCeIdDfe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDanfceIdexternalClick(Sender: TObject);
var
  retorno: TResponseConsultDANFeDANFCe;
  I: Integer;

  function TipoImpressaoNFCe: TTipoImpressaoNFCe;
  begin
    if CmbDanfceTipoImpressao.ItemIndex = 1 then
      Result := ttiNFCeA4
    else
      Result := ttiCupom;
  end;

begin
  Memo.Lines.Add('BtnDanfceIdexternalClick - Requisição. Consulta DANFCe NFCe pelo idexternal');
  try
    retorno := DadosJahDFe.NFCeGetDANFCeIdExternal(EdtDanfceIdExternal.Text, TipoImpressaoNFCe);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDanfceIdexternalClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDanfceIdexternalClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListDANFeDANFCe) do
      begin
        Memo.Lines.Add('BtnDanfceIdexternalClick - Retorno. idDfe: ' + retorno.ListDANFeDANFCe[I].idDfe + '; serie: ' + retorno.ListDANFeDANFCe[I].serie.ToString +
          '; nNF: ' + retorno.ListDANFeDANFCe[I].nNF.ToString + '; chDfe: ' + retorno.ListDANFeDANFCe[I].chDfe + '; idExternal: ' + retorno.ListDANFeDANFCe[I].idExternal +
          '; tpAmb: ' + AmbToDescStr(retorno.ListDANFeDANFCe[I].tpAmb));
        Memo.Lines.Add('BtnDanfceIdexternalClick - Retorno. PDF Link: ' + retorno.ListDANFeDANFCe[I].pdfLink);
        if retorno.ListDANFeDANFCe[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListDANFeDANFCe[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListDANFeDANFCe[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDanfceIdexternalClick - Erro "DadosJahDFe.NFCeGetDANFCeIdExternal": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDanfceNumeroClick(Sender: TObject);
var
  retorno: TResponseConsultDANFeDANFCe;
  I: Integer;

  function TipoImpressaoNFCe: TTipoImpressaoNFCe;
  begin
    if CmbDanfceTipoImpressao.ItemIndex = 1 then
      Result := ttiNFCeA4
    else
      Result := ttiCupom;
  end;

begin
  Memo.Lines.Add('BtnDanfceNumeroClick - Requisição. Consulta DANFCe NFCe pelo numero');
  try
    retorno := DadosJahDFe.NFCeGetDANFCeNF(StrToIntDef(EdtDanfceNumero.Text, 0), StrToIntDef(EdtDanfceSerie.Text, 0), taHomologacao, TipoImpressaoNFCe);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDanfceNumeroClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDanfceNumeroClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListDANFeDANFCe) do
      begin
        Memo.Lines.Add('BtnDanfceNumeroClick - Retorno. idDfe: ' + retorno.ListDANFeDANFCe[I].idDfe + '; serie: ' + retorno.ListDANFeDANFCe[I].serie.ToString +
          '; nNF: ' + retorno.ListDANFeDANFCe[I].nNF.ToString + '; chDfe: ' + retorno.ListDANFeDANFCe[I].chDfe + '; idExternal: ' + retorno.ListDANFeDANFCe[I].idExternal +
          '; tpAmb: ' + AmbToDescStr(retorno.ListDANFeDANFCe[I].tpAmb));
        Memo.Lines.Add('BtnDanfceNumeroClick - Retorno. PDF Link: ' + retorno.ListDANFeDANFCe[I].pdfLink);
        if retorno.ListDANFeDANFCe[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListDANFeDANFCe[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListDANFeDANFCe[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDanfceNumeroClick - Erro "DadosJahDFe.NFCeGetDANFCeNF": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDanfceXMLClick(Sender: TObject);
var
  retorno: TResponseConsultDANFeDANFCe;
  I: Integer;

  function TipoImpressaoNFCe: TTipoImpressaoNFCe;
  begin
    if CmbDanfceTipoImpressao.ItemIndex = 1 then
      Result := ttiNFCeA4
    else
      Result := ttiCupom;
  end;

begin
  Memo.Lines.Add('BtnDanfceXMLClick - Requisição. Consulta DANFCe NFCe pelo XML');
  try
    retorno := DadosJahDFe.NFCeGetDANFCeXML(EdtDanfceXml.Text, TipoImpressaoNFCe);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDanfceXMLClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDanfceXMLClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListDANFeDANFCe) do
      begin
        Memo.Lines.Add('BtnDanfceXMLClick - Retorno. idDfe: ' + retorno.ListDANFeDANFCe[I].idDfe + '; serie: ' + retorno.ListDANFeDANFCe[I].serie.ToString +
          '; nNF: ' + retorno.ListDANFeDANFCe[I].nNF.ToString + '; chDfe: ' + retorno.ListDANFeDANFCe[I].chDfe + '; idExternal: ' + retorno.ListDANFeDANFCe[I].idExternal +
          '; tpAmb: ' + AmbToDescStr(retorno.ListDANFeDANFCe[I].tpAmb));
        Memo.Lines.Add('BtnDanfceXMLClick - Retorno. PDF Link: ' + retorno.ListDANFeDANFCe[I].pdfLink);
        if retorno.ListDANFeDANFCe[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListDANFeDANFCe[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListDANFeDANFCe[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDanfceXMLClick - Erro "DadosJahDFe.NFCeGetDANFCeXML": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDanfeChavedfeClick(Sender: TObject);
var
  retorno: TResponseConsultDANFeDANFCe;
  I: Integer;

  function TipoImpressaoNFe: TTipoImpressaoNFe;
  begin
    if CmbDanfeTipoImpressao.ItemIndex = 1 then
      Result := ttiPaisagem
    else if CmbDanfeTipoImpressao.ItemIndex = 2 then
      Result := ttiSimplificado
    else
      Result := ttiRetrato;
  end;

begin
  Memo.Lines.Add('BtnDanfeChavedfeClick - Requisição. Consulta DANFe NFe pela chave dfe');
  try
    retorno := DadosJahDFe.NFeGetDANFeChaveDFe(EdtDanfeChaveDfe.Text, taHomologacao, TipoImpressaoNFe);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDanfeChavedfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDanfeChavedfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListDANFeDANFCe) do
      begin
        Memo.Lines.Add('BtnDanfeChavedfeClick - Retorno. idDfe: ' + retorno.ListDANFeDANFCe[I].idDfe + '; serie: ' + retorno.ListDANFeDANFCe[I].serie.ToString +
          '; nNF: ' + retorno.ListDANFeDANFCe[I].nNF.ToString + '; chDfe: ' + retorno.ListDANFeDANFCe[I].chDfe + '; idExternal: ' + retorno.ListDANFeDANFCe[I].idExternal +
          '; tpAmb: ' + AmbToDescStr(retorno.ListDANFeDANFCe[I].tpAmb));
        Memo.Lines.Add('BtnDanfeChavedfeClick - Retorno. PDF Link: ' + retorno.ListDANFeDANFCe[I].pdfLink);
        if retorno.ListDANFeDANFCe[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListDANFeDANFCe[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListDANFeDANFCe[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDanfeChavedfeClick - Erro "DadosJahDFe.NFeGetDANFeChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDanfeIdDfeClick(Sender: TObject);
var
  retorno: TResponseConsultDANFeDANFCe;
  I: Integer;

  function TipoImpressaoNFe: TTipoImpressaoNFe;
  begin
    if CmbDanfeTipoImpressao.ItemIndex = 1 then
      Result := ttiPaisagem
    else if CmbDanfeTipoImpressao.ItemIndex = 2 then
      Result := ttiSimplificado
    else
      Result := ttiRetrato;
  end;

begin
  Memo.Lines.Add('BtnDanfeIdDfeClick - Requisição. Consulta DANFe NFe pelo iddfe');
  try
    retorno := DadosJahDFe.NFeGetDANFeIdDfe(EdtDanfeIdDfe.Text, TipoImpressaoNFe);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDanfeIdDfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDanfeIdDfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListDANFeDANFCe) do
      begin
        Memo.Lines.Add('BtnDanfeIdDfeClick - Retorno. idDfe: ' + retorno.ListDANFeDANFCe[I].idDfe + '; serie: ' + retorno.ListDANFeDANFCe[I].serie.ToString +
          '; nNF: ' + retorno.ListDANFeDANFCe[I].nNF.ToString + '; chDfe: ' + retorno.ListDANFeDANFCe[I].chDfe + '; idExternal: ' + retorno.ListDANFeDANFCe[I].idExternal +
          '; tpAmb: ' + AmbToDescStr(retorno.ListDANFeDANFCe[I].tpAmb));
        Memo.Lines.Add('BtnDanfeIdDfeClick - Retorno. PDF Link: ' + retorno.ListDANFeDANFCe[I].pdfLink);
        if retorno.ListDANFeDANFCe[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListDANFeDANFCe[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListDANFeDANFCe[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDanfeIdDfeClick - Erro "DadosJahDFe.NFeGetDANFeIdDfe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDanfeIdexternalClick(Sender: TObject);
var
  retorno: TResponseConsultDANFeDANFCe;
  I: Integer;

  function TipoImpressaoNFe: TTipoImpressaoNFe;
  begin
    if CmbDanfeTipoImpressao.ItemIndex = 1 then
      Result := ttiPaisagem
    else if CmbDanfeTipoImpressao.ItemIndex = 2 then
      Result := ttiSimplificado
    else
      Result := ttiRetrato;
  end;

begin
  Memo.Lines.Add('BtnDanfeIdexternalClick - Requisição. Consulta DANFe NFe pelo idexternal');
  try
    retorno := DadosJahDFe.NFeGetDANFeIdExternal(EdtDanfeIdExternal.Text, TipoImpressaoNFe);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDanfeIdexternalClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDanfeIdexternalClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListDANFeDANFCe) do
      begin
        Memo.Lines.Add('BtnDanfeIdexternalClick - Retorno. idDfe: ' + retorno.ListDANFeDANFCe[I].idDfe + '; serie: ' + retorno.ListDANFeDANFCe[I].serie.ToString +
          '; nNF: ' + retorno.ListDANFeDANFCe[I].nNF.ToString + '; chDfe: ' + retorno.ListDANFeDANFCe[I].chDfe + '; idExternal: ' + retorno.ListDANFeDANFCe[I].idExternal +
          '; tpAmb: ' + AmbToDescStr(retorno.ListDANFeDANFCe[I].tpAmb));
        Memo.Lines.Add('BtnDanfeIdexternalClick - Retorno. PDF Link: ' + retorno.ListDANFeDANFCe[I].pdfLink);
        if retorno.ListDANFeDANFCe[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListDANFeDANFCe[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListDANFeDANFCe[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDanfeIdexternalClick - Erro "DadosJahDFe.NFeGetDANFeIdExternal": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDanfeNumeroClick(Sender: TObject);
var
  retorno: TResponseConsultDANFeDANFCe;
  I: Integer;

  function TipoImpressaoNFe: TTipoImpressaoNFe;
  begin
    if CmbDanfeTipoImpressao.ItemIndex = 1 then
      Result := ttiPaisagem
    else if CmbDanfeTipoImpressao.ItemIndex = 2 then
      Result := ttiSimplificado
    else
      Result := ttiRetrato;
  end;

begin
  Memo.Lines.Add('BtnDanfeNumeroClick - Requisição. Consulta DANFe NFe pelo numero');
  try
    retorno := DadosJahDFe.NFeGetDANFeNF(StrToIntDef(EdtDanfeNumero.Text, 0), StrToIntDef(EdtDanfeSerie.Text, 0), taHomologacao, TipoImpressaoNFe);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDanfeNumeroClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDanfeNumeroClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListDANFeDANFCe) do
      begin
        Memo.Lines.Add('BtnDanfeNumeroClick - Retorno. idDfe: ' + retorno.ListDANFeDANFCe[I].idDfe + '; serie: ' + retorno.ListDANFeDANFCe[I].serie.ToString +
          '; nNF: ' + retorno.ListDANFeDANFCe[I].nNF.ToString + '; chDfe: ' + retorno.ListDANFeDANFCe[I].chDfe + '; idExternal: ' + retorno.ListDANFeDANFCe[I].idExternal +
          '; tpAmb: ' + AmbToDescStr(retorno.ListDANFeDANFCe[I].tpAmb));
        Memo.Lines.Add('BtnDanfeNumeroClick - Retorno. PDF Link: ' + retorno.ListDANFeDANFCe[I].pdfLink);
        if retorno.ListDANFeDANFCe[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListDANFeDANFCe[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListDANFeDANFCe[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDanfeNumeroClick - Erro "DadosJahDFe.NFeGetDANFeNF": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnDanfeXMLClick(Sender: TObject);
var
  retorno: TResponseConsultDANFeDANFCe;
  I: Integer;

  function TipoImpressaoNFe: TTipoImpressaoNFe;
  begin
    if CmbDanfeTipoImpressao.ItemIndex = 1 then
      Result := ttiPaisagem
    else if CmbDanfeTipoImpressao.ItemIndex = 2 then
      Result := ttiSimplificado
    else
      Result := ttiRetrato;
  end;

begin
  Memo.Lines.Add('BtnDanfeXMLClick - Requisição. Consulta DANFe NFe pelo XML');
  try
    retorno := DadosJahDFe.NFeGetDANFeXML(EdtDanfeXml.Text, TipoImpressaoNFe);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnDanfeXMLClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnDanfeXMLClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListDANFeDANFCe) do
      begin
        Memo.Lines.Add('BtnDanfeXMLClick - Retorno. idDfe: ' + retorno.ListDANFeDANFCe[I].idDfe + '; serie: ' + retorno.ListDANFeDANFCe[I].serie.ToString +
          '; nNF: ' + retorno.ListDANFeDANFCe[I].nNF.ToString + '; chDfe: ' + retorno.ListDANFeDANFCe[I].chDfe + '; idExternal: ' + retorno.ListDANFeDANFCe[I].idExternal +
          '; tpAmb: ' + AmbToDescStr(retorno.ListDANFeDANFCe[I].tpAmb));
        Memo.Lines.Add('BtnDanfeXMLClick - Retorno. PDF Link: ' + retorno.ListDANFeDANFCe[I].pdfLink);
        if retorno.ListDANFeDANFCe[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListDANFeDANFCe[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListDANFeDANFCe[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnDanfeXMLClick - Erro "DadosJahDFe.NFeGetDANFeXML": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeImpEventoCanChaveDFeClick(Sender: TObject);
var
  retorno: TResponseEventCancelPrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFeImpEventoCanChaveDFeClick - Requisição. Consulta Impressão Evento Cancelamento NFe pela chave dfe');
  try
    retorno := DadosJahDFe.NFeGetEventCancelPrintChaveDFe(EdtNFeImpEventoChaveDfe.Text, taHomologacao);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFeImpEventoCanChaveDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFeImpEventoCanChaveDFeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFeImpEventoCanChaveDFeClick -Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; chDfe: ' +
          retorno.ListEvent[I].chDfe + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFeImpEventoCanChaveDFeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeImpEventoCanChaveDFeClick - Erro "DadosJahDFe.NFeGetEventCancelPrintChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeImpEventoCanIdCanClick(Sender: TObject);
var
  retorno: TResponseEventCancelPrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFeImpEventoCanIdCanClick - Requisição. Consulta Impressão Evento Cancelamento NFe pelo IdCan');
  try
    retorno := DadosJahDFe.NFeGetEventCancelPrintIdCan(EdtNFeImpEventoIdCan.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFeImpEventoCanIdCanClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFeImpEventoCanIdCanClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFeImpEventoCanIdCanClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; chDfe: ' +
          retorno.ListEvent[I].chDfe + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFeImpEventoCanIdCanClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeImpEventoCanIdCanClick - Erro "DadosJahDFe.NFeGetEventCancelPrintIdCan": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeImpEventoCanIdDfeClick(Sender: TObject);
var
  retorno: TResponseEventCancelPrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFeImpEventoCanIdDfeClick - Requisição. Consulta Impressão Evento Cancelamento NFe pelo IdDfe');
  try
    retorno := DadosJahDFe.NFeGetEventCancelPrintIdDfe(EdtNFeImpEventoIdDfe.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFeImpEventoCanIdDfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFeImpEventoCanIdDfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFeImpEventoCanIdDfeClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; chDfe: ' +
          retorno.ListEvent[I].chDfe + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFeImpEventoCanIdDfeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeImpEventoCanIdDfeClick - Erro "DadosJahDFe.NFeGetEventCancelPrintIdDfe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeImpEventoCorChaveDfeClick(Sender: TObject);
var
  retorno: TResponseEventCorrectionPrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFeImpEventoCorChaveDfeClick - Requisição. Consulta Impressão Evento Carta de Correção NFe pela chave dfe');
  try
    retorno := DadosJahDFe.NFeGetEventCorrectionPrintChaveDFe(EdtNFeImpEventoChaveDfe.Text, taHomologacao);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFeImpEventoCorChaveDfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFeImpEventoCorChaveDfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFeImpEventoCorChaveDfeClick - Retorno. idCce: ' + retorno.ListEvent[I].idCce + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; chDfe: ' +
          retorno.ListEvent[I].chDfe + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFeImpEventoCorChaveDfeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeImpEventoCorChaveDfeClick - Erro "DadosJahDFe.NFeGetEventCorrectionPrintChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeImpEventoCorIdCCeClick(Sender: TObject);
var
  retorno: TResponseEventCorrectionPrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFeImpEventoCorIdCCeClick - Requisição. Consulta Impressão Evento Carta de Correção NFe pelo idcce');
  try
    retorno := DadosJahDFe.NFeGetEventCorrectionPrintIdCce(EdtNFeImpEventoIdCCe.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFeImpEventoCorIdCCeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFeImpEventoCorIdCCeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFeImpEventoCorIdCCeClick - Retorno. idCce: ' + retorno.ListEvent[I].idCce + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; chDfe: ' +
          retorno.ListEvent[I].chDfe + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFeImpEventoCorIdCCeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeImpEventoCorIdCCeClick - Erro "DadosJahDFe.NFeGetEventCorrectionPrintIdCce": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeImpEventoCorIdDFEClick(Sender: TObject);
var
  retorno: TResponseEventCorrectionPrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFeImpEventoCorIdDFEClick - Requisição. Consulta Impressão Evento Carta de Correção NFe pelo iddfe');
  try
    retorno := DadosJahDFe.NFeGetEventCorrectionPrintIdDfe(EdtNFeImpEventoIdDfe.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFeImpEventoCorIdDFEClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFeImpEventoCorIdDFEClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFeImpEventoCorIdDFEClick - Retorno. idCce: ' + retorno.ListEvent[I].idCce + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; chDfe: ' +
          retorno.ListEvent[I].chDfe + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFeImpEventoCorIdDFEClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeImpEventoCorIdDFEClick - Erro "DadosJahDFe.NFeGetEventCorrectionPrintIdDfe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeImpEventoInuIdInuClick(Sender: TObject);
var
  retorno: TResponseEventDisenablePrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFeImpEventoInuIdInuClick - Requisição. Consulta Impressão Evento Inutilização NFe pelo idinu');
  try
    retorno := DadosJahDFe.NFeGetEventDisenablePrintIdInu(EdtNFeImpEventoIdInu.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFeImpEventoInuIdInuClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFeImpEventoInuIdInuClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFeImpEventoInuIdInuClick - Retorno. idInu: ' + retorno.ListEvent[I].idInu + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFeImpEventoInuIdInuClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].idInu + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeImpEventoInuIdInuClick - Erro "DadosJahDFe.NFeGetEventDisenablePrintIdInu": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnAbrirPastaSistemaClick(Sender: TObject);
begin
  Memo.Lines.Add('BtnAbrirPastaSistemaClick - Abrindo pasta do sistema: ' + ExtractFileDir(Application.ExeName));
  ShellExecute(Application.Handle, 'open', PChar(ExtractFileDir(Application.ExeName)), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmPrincipal.BtnCadAutXMLClick(Sender: TObject);
var
  autXML, retorno: TListAutXML;
begin
  SetLength(autXML, 3);
  autXML[0] := '02598982000190';
  autXML[1] := '08412248627';
  // autXML[2] := '23.587.735/0001-69';
  autXML[2] := '23587735000169';

  Memo.Lines.Add('BtnCadAutXMLClick - Requisição. Cadastrar Autorização XML. Quant: ' + IntToStr(Length(autXML)) + '; CPF/CNPJ: ' + ArrayListToStr(autXML));
  try
    retorno := DadosJahDFe.AutXMLAdd(autXML);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnCadAutXMLClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnCadAutXMLClick - Autorização XML. Quant: ' + IntToStr(Length(retorno)) + '; CPF/CNPJ: ' + ArrayListToStr(retorno));
  except
    on E: Exception do
      Memo.Lines.Add('BtnCadAutXMLClick - Erro "DadosJahDFe.AutXMLAdd": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnCadEmitClick(Sender: TObject);
var
  emit, emitRetorno: TEmit;
begin
  emit.CNPJCPF := '02598982000190';
  emit.xNome := 'CTEC SERVICE LTDA';
  emit.xFant := 'CTEC SERVICE';
  emit.enderEmit.xLgr := 'RUA BELO HORIZONTE';
  emit.enderEmit.nro := '803';
  emit.enderEmit.xBairro := 'Centro';
  emit.enderEmit.cMun := 3127701;
  emit.enderEmit.xMun := 'GOVERNADOR VALADARES';
  emit.enderEmit.UF := 'MG';
  emit.enderEmit.CEP := '35010050';
  emit.enderEmit.cPais := 1058;
  emit.enderEmit.xPais := 'BRASIL';
  emit.enderEmit.fone := '3332719900';
  emit.IE := '0010694080020';
  emit.IEST := '';
  emit.CRT := crtSimplesNacional;
  emit.IM := '525881';
  emit.CNAE := '4751201';

  Memo.Lines.Add('BtnCadEmitClick - Requisição. Cadastrar Emitente: ' + emit.xNome + '; CNPJ: ' + emit.CNPJCPF);
  try
    emitRetorno := DadosJahDFe.EmitAdd(emit);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnCadEmitClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnCadEmitClick - Emitente. CNPJCPF: ' + emitRetorno.CNPJCPF + '; xNome: ' + emitRetorno.xNome + '; xFant: ' + emitRetorno.xFant + '; IE :' +
        emitRetorno.IE + '; IEST: ' + emitRetorno.IEST + '; IM: ' + emitRetorno.IM + '; CNAE: ' + emitRetorno.CNAE + '; CRT: ' + CRTToStr(emitRetorno.CRT) +
        '; xLgr: ' + emitRetorno.enderEmit.xLgr + '; nro: ' + emitRetorno.enderEmit.nro + '; xCpl: ' + emitRetorno.enderEmit.xCpl + '; xBairro: ' +
        emitRetorno.enderEmit.xBairro + '; cMun: ' + emitRetorno.enderEmit.cMun.ToString + '; xMun: ' + emitRetorno.enderEmit.xMun + '; UF: ' + emitRetorno.enderEmit.UF +
        '; CEP: ' + emitRetorno.enderEmit.CEP + '; cPais: ' + emitRetorno.enderEmit.cPais.ToString + '; xPais: ' + emitRetorno.enderEmit.xPais + '; fone: ' +
        emitRetorno.enderEmit.fone);
  except
    on E: Exception do
      Memo.Lines.Add('BtnCadEmitClick - Erro "DadosJahDFe.EmitAdd": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnCancelamentoNFCeAssincrono1Click(Sender: TObject);
var
  idBatch: String;
  events: TListEventCancel;
begin
  SetLength(events, 1);
  events[0] := ExemploCancelamentoNFCe1;

  Memo.Lines.Add('BtnCancelamentoNFCeAssincrono1Click - Requisição. Cancelamento NFCe modo assincrono.');
  try
    idBatch := DadosJahDFe.NFCeCancelAsync(events, taHomologacao, DadosJahDFe.timezone);
    Memo.Lines.Add('BtnCancelamentoNFCeAssincrono1Click - Retorno. idBatch: ' + idBatch);
  except
    on E: Exception do
      Memo.Lines.Add('BtnCancelamentoNFCeAssincrono1Click - Erro "DadosJahDFe.NFCeCancelAsync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnCancelamentoNFCeSincronoClick(Sender: TObject);
var
  retorno: TResponseConsultCancelNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnCancelamentoNFCeSincronoClick - Requisição. Cancelamento NFCe modo sincrono.');
  try
    retorno := DadosJahDFe.NFCeCancelSync(ExemploCancelamentoNFCe1, taHomologacao, DadosJahDFe.timezone);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnCancelamentoNFCeSincronoClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnCancelamentoNFCeSincronoClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnCancelamentoNFCeSincronoClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; idBatch: ' +
          retorno.ListEvent[I].idBatch + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' + DateToStr(retorno.ListEvent[I].dhRegEvento) + '; nProtCan: ' + retorno.ListEvent[I].nProtCan +
          '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; digVal: ' +
          retorno.ListEvent[I].digVal + '; emailDest: ' + retorno.ListEvent[I].emailDest + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; XMotivo: ' +
          retorno.ListEvent[I].XMotivo + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnCancelamentoNFCeSincronoClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnCancelamentoNFCeSincronoClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnCancelamentoNFCeSincronoClick - Erro "DadosJahDFe.NFCeCancelSync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnCancelamentoNFeAssincrono1Click(Sender: TObject);
var
  idBatch: String;
  events: TListEventCancel;
begin
  SetLength(events, 1);
  events[0] := ExemploCancelamentoNFe1;

  Memo.Lines.Add('BtnCancelamentoNFeAssincrono1Click - Requisição. Cancelamento NFe modo assincrono.');
  try
    idBatch := DadosJahDFe.NFeCancelAsync(events, taHomologacao, DadosJahDFe.timezone);
    Memo.Lines.Add('BtnCancelamentoNFeAssincrono1Click - Retorno. idBatch: ' + idBatch);
  except
    on E: Exception do
      Memo.Lines.Add('BtnCancelamentoNFeAssincrono1Click - Erro "DadosJahDFe.NFeCancelAsync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnCancelamentoNFeSincronoClick(Sender: TObject);
var
  retorno: TResponseConsultCancelNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnCancelamentoNFeSincronoClick - Requisição. Cancelamento NFe modo sincrono.');
  try
    retorno := DadosJahDFe.NFeCancelSync(ExemploCancelamentoNFe1, taHomologacao, DadosJahDFe.timezone);
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnCancelamentoNFeSincronoClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnCancelamentoNFeSincronoClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnCancelamentoNFeSincronoClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; idBatch: ' +
          retorno.ListEvent[I].idBatch + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' + DateToStr(retorno.ListEvent[I].dhRegEvento) + '; nProtCan: ' + retorno.ListEvent[I].nProtCan +
          '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; digVal: ' +
          retorno.ListEvent[I].digVal + '; emailDest: ' + retorno.ListEvent[I].emailDest + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; XMotivo: ' +
          retorno.ListEvent[I].XMotivo + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnCancelamentoNFeSincronoClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnCancelamentoNFeSincronoClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnCancelamentoNFeSincronoClick - Erro "DadosJahDFe.NFeCancelSync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnCartaCorrecaoNFeAssincrono1Click(Sender: TObject);
var
  idBatch: String;
  events: TListEventCorrection;
begin
  SetLength(events, 1);
  events[0] := ExemploCorrecaoNFe1;

  Memo.Lines.Add('BtnCartaCorrecaoNFeAssincrono1Click - Requisição. Carta de Correção NFe modo assincrono.');
  try
    idBatch := DadosJahDFe.NFeCorrectionAsync(events, taHomologacao, DadosJahDFe.timezone);
    Memo.Lines.Add('BtnCartaCorrecaoNFeAssincrono1Click - Retorno. idBatch: ' + idBatch);
  except
    on E: Exception do
      Memo.Lines.Add('BtnCartaCorrecaoNFeAssincrono1Click - Erro "DadosJahDFe.NFeCorrectionAsync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnCartaCorrecaoNFeSincronoClick(Sender: TObject);
var
  retorno: TResponseConsultCorrectionNFe;
  I: Integer;
begin
  Memo.Lines.Add('BtnCartaCorrecaoNFeSincronoClick - Requisição. Carta de Correção NFe modo sincrono.');
  try
    retorno := DadosJahDFe.NFeCorrectionSync(ExemploCorrecaoNFe1, taHomologacao, DadosJahDFe.timezone);
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeCorChaveDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnCartaCorrecaoNFeSincronoClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnCartaCorrecaoNFeSincronoClick - Retorno. idCce: ' + retorno.ListEvent[I].idCce + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; idDfe: ' +
          retorno.ListEvent[I].idDfe + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; xCorrecao: ' + retorno.ListEvent[I].xCorrecao + '; digVal: ' + retorno.ListEvent[I].digVal +
          '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; cStat: ' + retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' +
          DateToStr(retorno.ListEvent[I].dhRegEvento) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; xMotivo: ' + retorno.ListEvent[I].XMotivo +
          '; nProtCce: ' + retorno.ListEvent[I].nProtCce + '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString +
          '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnCartaCorrecaoNFeSincronoClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnCartaCorrecaoNFeSincronoClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnCartaCorrecaoNFeSincronoClick - Erro "DadosJahDFe.NFeCorrectionSync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultarNFCeChaveDFeClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultarNFCeChaveDFeClick - Requisição. Consulta NFCe pela Chave DFe');
  try
    NFeRetorno := DadosJahDFe.NFCeGetNFCeChaveDFe(EdtConsultarNFCeChaveDFe.Text, taHomologacao, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultarNFCeChaveDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultarNFCeChaveDFeClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnConsultarNFCeChaveDFeClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnConsultarNFCeChaveDFeClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnConsultarNFCeChaveDFeClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFCeChaveDFeClick - Erro "DadosJahDFe.NFCeGetNFCeChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultarNFCeIdBatchClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultarNFCeIdBatchClick - Requisição. Consulta NFCe pelo IdBatch');
  try
    NFeRetorno := DadosJahDFe.NFCeGetNFCeIdBatch(EdtConsultarNFCeIdBatch.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultarNFCeIdBatchClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultarNFCeIdBatchClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnConsultarNFCeIdBatchClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnConsultarNFCeIdBatchClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnConsultarNFCeIdBatchClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFCeIdBatchClick - Erro "DadosJahDFe.NFCeGetNFCeIdBatch": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultarNFCeIdDFeClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultarNFCeIdDFeClick - Requisição. Consulta NFCe pelo iddfe');
  try
    NFeRetorno := DadosJahDFe.NFCeGetNFCeIdDFe(EdtConsultarNFCeIdDFe.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultarNFCeIdDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultarNFCeIdDFeClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnConsultarNFCeIdDFeClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnConsultarNFCeIdDFeClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnConsultarNFCeIdDFeClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFCeIdDFeClick - Erro "DadosJahDFe.NFCeGetNFCeIdDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultarNFCeIdExternalClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultarNFCeIdExternalClick - Requisição. Consulta NFCe pelo idexternal');
  try
    NFeRetorno := DadosJahDFe.NFCeGetNFCeIdExternal(EdtConsultarNFCeIdExternal.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultarNFCeIdExternalClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultarNFCeIdExternalClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnConsultarNFCeIdExternalClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnConsultarNFCeIdExternalClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnConsultarNFCeIdExternalClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFCeIdExternalClick - Erro "DadosJahDFe.NFCeGetNFCeIdExternal": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultarNFCeNumeroClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultarNFCeNumeroClick - Requisição. Consulta NFCe pelo Número');
  try
    NFeRetorno := DadosJahDFe.NFCeGetNFCeNF(StrToIntDef(EdtConsultarNFCeNumero.Text, 0), StrToIntDef(EdtConsultarNFCeSerie.Text, 0), taHomologacao, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultarNFCeNumeroClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultarNFCeNumeroClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnConsultarNFCeNumeroClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnConsultarNFCeNumeroClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnConsultarNFCeNumeroClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFCeNumeroClick - Erro "DadosJahDFe.NFCeGetNFCeNF": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultarNFeChaveDFeClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultarNFeChaveDFeClick - Requisição. Consulta NFe pela Chave DFe');
  try
    NFeRetorno := DadosJahDFe.NFeGetNFeChaveDFe(EdtConsultarNFeChaveDFe.Text, taHomologacao, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultarNFeChaveDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultarNFeChaveDFeClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnConsultarNFeChaveDFeClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnConsultarNFeChaveDFeClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnConsultarNFeChaveDFeClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFeChaveDFeClick - Erro "DadosJahDFe.NFeGetNFeChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultarNFeIdBatchClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultarNFeIdBatchClick - Requisição. Consulta NFe pelo IdBatch');
  try
    NFeRetorno := DadosJahDFe.NFeGetNFeIdBatch(EdtConsultarNFeIdBatch.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultarNFeIdBatchClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultarNFeIdBatchClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnConsultarNFeIdBatchClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnConsultarNFeIdBatchClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnConsultarNFeIdBatchClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFeIdBatchClick - Erro "DadosJahDFe.NFeGetNFeIdBatch": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultarNFeIdDFeClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultarNFeIdDFeClick - Requisição. Consulta NFe pelo Iddfe');
  try
    NFeRetorno := DadosJahDFe.NFeGetNFeIdDFe(EdtConsultarNFeIdDFe.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultarNFeIdDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultarNFeIdDFeClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnConsultarNFeIdDFeClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnConsultarNFeIdDFeClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnConsultarNFeIdDFeClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFeIdDFeClick - Erro "DadosJahDFe.NFeGetNFeIdDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultarNFeIdExternalClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultarNFeIdExternalClick - Requisição. Consulta NFe pelo IdExternal');
  try
    NFeRetorno := DadosJahDFe.NFeGetNFeIdExternal(EdtConsultarNFeIdExternal.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultarNFeIdExternalClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultarNFeIdExternalClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnConsultarNFeIdExternalClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnConsultarNFeIdExternalClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnConsultarNFeIdExternalClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFeIdExternalClick - Erro "DadosJahDFe.NFeGetNFeIdExternal": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultarNFeNumeroClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultarNFeNumeroClick - Requisição. Consulta NFe pelo Número');
  try
    NFeRetorno := DadosJahDFe.NFeGetNFeNF(StrToIntDef(EdtConsultarNFeNumero.Text, 0), StrToIntDef(EdtConsultarNFeSerie.Text, 0), taHomologacao, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultarNFeNumeroClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultarNFeNumeroClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnConsultarNFeNumeroClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnConsultarNFeNumeroClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnConsultarNFeNumeroClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFeNumeroClick - Erro "DadosJahDFe.NFeGetNFeNF": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFCeCanChaveDFeClick(Sender: TObject);
var
  retorno: TResponseConsultCancelNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFCeCanChaveDFeClick - Requisição. Consulta Evento Cancelamento NFCe pela chave dfe');
  try
    retorno := DadosJahDFe.NFCeGetEventCancelChaveDFe(EdtConEventosNFCechavedfe.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFCeCanChaveDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFCeCanChaveDFeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFCeCanChaveDFeClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; idBatch: ' +
          retorno.ListEvent[I].idBatch + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' + DateToStr(retorno.ListEvent[I].dhRegEvento) + '; nProtCan: ' + retorno.ListEvent[I].nProtCan +
          '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; digVal: ' +
          retorno.ListEvent[I].digVal + '; emailDest: ' + retorno.ListEvent[I].emailDest + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; XMotivo: ' +
          retorno.ListEvent[I].XMotivo + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFCeCanChaveDFeClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFCeCanChaveDFeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFCeCanChaveDFeClick - Erro "DadosJahDFe.NFCeGetEventCancelChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFCeCanIdBatchClick(Sender: TObject);
var
  retorno: TResponseConsultCancelNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFCeCanIdBatchClick - Requisição. Consulta Evento Cancelamento NFCe pelo IdBatch');
  try
    retorno := DadosJahDFe.NFCeGetEventCancelIdBatch(EdtConEventosNFCeIdBatch.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFCeCanIdBatchClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFCeCanIdBatchClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFCeCanIdBatchClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; idBatch: ' +
          retorno.ListEvent[I].idBatch + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' + DateToStr(retorno.ListEvent[I].dhRegEvento) + '; nProtCan: ' + retorno.ListEvent[I].nProtCan +
          '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; digVal: ' +
          retorno.ListEvent[I].digVal + '; emailDest: ' + retorno.ListEvent[I].emailDest + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; XMotivo: ' +
          retorno.ListEvent[I].XMotivo + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFCeCanIdBatchClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFCeCanIdBatchClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFCeCanIdBatchClick - Erro "DadosJahDFe.NFCeGetEventCancelIdBatch": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFCeCanIdCanClick(Sender: TObject);
var
  retorno: TResponseConsultCancelNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFCeCanIdCanClick - Requisição. Consulta Evento Cancelamento NFCe pelo IdCan');
  try
    retorno := DadosJahDFe.NFCeGetEventCancelIdCan(EdtConEventosNFCeIdCan.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFCeCanIdCanClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFCeCanIdCanClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFCeCanIdCanClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; idBatch: ' +
          retorno.ListEvent[I].idBatch + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' + DateToStr(retorno.ListEvent[I].dhRegEvento) + '; nProtCan: ' + retorno.ListEvent[I].nProtCan +
          '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; digVal: ' +
          retorno.ListEvent[I].digVal + '; emailDest: ' + retorno.ListEvent[I].emailDest + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; XMotivo: ' +
          retorno.ListEvent[I].XMotivo + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFCeCanIdCanClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFCeCanIdCanClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFCeCanIdCanClick - Erro "DadosJahDFe.NFCeGetEventCancelIdCan": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFCeCanIdDFeClick(Sender: TObject);
var
  retorno: TResponseConsultCancelNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFCeCanIdDFeClick - Requisição. Consulta Evento Cancelamento NFCe pelo iddfe');
  try
    retorno := DadosJahDFe.NFCeGetEventCancelIdDfe(EdtConEventosNFCeIddfe.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFCeCanIdDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFCeCanIdDFeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFCeCanIdDFeClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; idBatch: ' +
          retorno.ListEvent[I].idBatch + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' + DateToStr(retorno.ListEvent[I].dhRegEvento) + '; nProtCan: ' + retorno.ListEvent[I].nProtCan +
          '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; digVal: ' +
          retorno.ListEvent[I].digVal + '; emailDest: ' + retorno.ListEvent[I].emailDest + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; XMotivo: ' +
          retorno.ListEvent[I].XMotivo + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFCeCanIdDFeClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFCeCanIdDFeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFCeCanIdDFeClick - Erro "DadosJahDFe.NFCeGetEventCancelIdDfe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFCeInuIdBatchClick(Sender: TObject);
var
  retorno: TResponseConsultDisenableNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFCeInuIdBatchClick - Requisição. Consulta Evento Inutilização NFCe pelo idbatch');
  try
    retorno := DadosJahDFe.NFCeGetEventDisenableIdBatch(EdtConEventosNFCeIdBatch.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFCeInuIdBatchClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFCeInuIdBatchClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFCeInuIdBatchClick - Retorno. idInu: ' + retorno.ListEvent[I].idInu + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; ano: ' +
          retorno.ListEvent[I].ano.ToString + '; serie: ' + retorno.ListEvent[I].serie.ToString + '; nNFIni: ' + retorno.ListEvent[I].nNFIni.ToString + '; nNFFin: ' +
          retorno.ListEvent[I].nNFFin.ToString + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; DhRecbto: ' + DateToStr(retorno.ListEvent[I].DhRecbto) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) +
          '; XMotivo: ' + retorno.ListEvent[I].XMotivo + '; nProtInu: ' + retorno.ListEvent[I].nProtInu + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFCeInuIdBatchClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFCeInuIdBatchClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFCeInuIdBatchClick - Erro "DadosJahDFe.NFCeGetEventDisenableIdBatch": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFCeInuIdInuClick(Sender: TObject);
var
  retorno: TResponseConsultDisenableNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFCeInuIdInuClick - Requisição. Consulta Evento Inutilização NFCe idinu');
  try
    retorno := DadosJahDFe.NFCeGetEventDisenableIdInu(EdtConEventosNFCeIdinu.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFCeInuIdInuClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFCeInuIdInuClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFCeInuIdInuClick - Retorno. idInu: ' + retorno.ListEvent[I].idInu + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; ano: ' +
          retorno.ListEvent[I].ano.ToString + '; serie: ' + retorno.ListEvent[I].serie.ToString + '; nNFIni: ' + retorno.ListEvent[I].nNFIni.ToString + '; nNFFin: ' +
          retorno.ListEvent[I].nNFFin.ToString + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; DhRecbto: ' + DateToStr(retorno.ListEvent[I].DhRecbto) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) +
          '; XMotivo: ' + retorno.ListEvent[I].XMotivo + '; nProtInu: ' + retorno.ListEvent[I].nProtInu + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFCeInuIdInuClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFCeInuIdInuClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFCeInuIdInuClick - Erro "DadosJahDFe.NFCeGetEventDisenableIdInu": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFeCanChaveDFeClick(Sender: TObject);
var
  retorno: TResponseConsultCancelNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFeCanChaveDFeClick - Requisição. Consulta Evento Cancelamento NFe pela chave dfe');
  try
    retorno := DadosJahDFe.NFeGetEventCancelChaveDFe(EdtConEventosNFechavedfe.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeCanChaveDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFeCanChaveDFeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFeCanChaveDFeClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; idBatch: ' +
          retorno.ListEvent[I].idBatch + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' + DateToStr(retorno.ListEvent[I].dhRegEvento) + '; nProtCan: ' + retorno.ListEvent[I].nProtCan +
          '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; digVal: ' +
          retorno.ListEvent[I].digVal + '; emailDest: ' + retorno.ListEvent[I].emailDest + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; XMotivo: ' +
          retorno.ListEvent[I].XMotivo + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFeCanChaveDFeClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFeCanChaveDFeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFeCanChaveDFeClick - Erro "DadosJahDFe.NFeGetEventCancelChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFeCanIdBatchClick(Sender: TObject);
var
  retorno: TResponseConsultCancelNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFeCanIdBatchClick - Requisição. Consulta Evento Cancelamento NFe pelo IdBatch');
  try
    retorno := DadosJahDFe.NFeGetEventCancelIdBatch(EdtConEventosNFeIdBatch.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeCanIdBatchClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFeCanIdBatchClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFeCanIdBatchClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; idBatch: ' +
          retorno.ListEvent[I].idBatch + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' + DateToStr(retorno.ListEvent[I].dhRegEvento) + '; nProtCan: ' + retorno.ListEvent[I].nProtCan +
          '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; digVal: ' +
          retorno.ListEvent[I].digVal + '; emailDest: ' + retorno.ListEvent[I].emailDest + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; XMotivo: ' +
          retorno.ListEvent[I].XMotivo + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFeCanIdBatchClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFeCanIdBatchClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFeCanIdBatchClick - Erro "DadosJahDFe.NFeGetEventCancelIdBatch": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFeCanIdCanClick(Sender: TObject);
var
  retorno: TResponseConsultCancelNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFeCanIdCanClick - Requisição. Consulta Evento Cancelamento NFe pelo IdCan');
  try
    retorno := DadosJahDFe.NFeGetEventCancelIdCan(EdtConEventosNFeIdCan.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeCanIdCanClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFeCanIdCanClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFeCanIdCanClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; idBatch: ' +
          retorno.ListEvent[I].idBatch + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' + DateToStr(retorno.ListEvent[I].dhRegEvento) + '; nProtCan: ' + retorno.ListEvent[I].nProtCan +
          '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; digVal: ' +
          retorno.ListEvent[I].digVal + '; emailDest: ' + retorno.ListEvent[I].emailDest + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; XMotivo: ' +
          retorno.ListEvent[I].XMotivo + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFeCanIdCanClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFeCanIdCanClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFeCanIdCanClick - Erro "DadosJahDFe.NFeGetEventCancelIdCan": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFeCanIdDFeClick(Sender: TObject);
var
  retorno: TResponseConsultCancelNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFeCanIdDFeClick - Requisição. Consulta Evento Cancelamento NFe pelo Iddfe');
  try
    retorno := DadosJahDFe.NFeGetEventCancelIdDfe(EdtConEventosNFeIddfe.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeCanIdDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFeCanIdDFeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFeCanIdDFeClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; idBatch: ' +
          retorno.ListEvent[I].idBatch + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' + DateToStr(retorno.ListEvent[I].dhRegEvento) + '; nProtCan: ' + retorno.ListEvent[I].nProtCan +
          '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; digVal: ' +
          retorno.ListEvent[I].digVal + '; emailDest: ' + retorno.ListEvent[I].emailDest + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; XMotivo: ' +
          retorno.ListEvent[I].XMotivo + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFeCanIdDFeClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFeCanIdDFeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFeCanIdDFeClick - Erro "DadosJahDFe.NFeGetEventCancelIdDfe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFeCorChaveDFeClick(Sender: TObject);
var
  retorno: TResponseConsultCorrectionNFe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFeCorChaveDFeClick - Requisição. Consulta Evento Carta Correção NFe pela chave dfe');
  try
    retorno := DadosJahDFe.NFeGetEventCorrectionChaveDFe(EdtConEventosNFechavedfe.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeCorChaveDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFeCorChaveDFeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFeCorChaveDFeClick - Retorno. idCce: ' + retorno.ListEvent[I].idCce + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; idDfe: ' +
          retorno.ListEvent[I].idDfe + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; xCorrecao: ' + retorno.ListEvent[I].xCorrecao + '; digVal: ' + retorno.ListEvent[I].digVal +
          '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; cStat: ' + retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' +
          DateToStr(retorno.ListEvent[I].dhRegEvento) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; xMotivo: ' + retorno.ListEvent[I].XMotivo +
          '; nProtCce: ' + retorno.ListEvent[I].nProtCce + '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString +
          '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFeCorChaveDFeClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFeCorChaveDFeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFeCorChaveDFeClick - Erro "DadosJahDFe.NFeGetEventCorrectionChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFeCorIdBatchClick(Sender: TObject);
var
  retorno: TResponseConsultCorrectionNFe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFeCorIdBatchClick - Requisição. Consulta Evento Carta Correção NFe pelo IdBatch');
  try
    retorno := DadosJahDFe.NFeGetEventCorrectionIdBatch(EdtConEventosNFeIdBatch.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeCorIdBatchClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFeCorIdBatchClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFeCorIdBatchClick - Retorno. idCce: ' + retorno.ListEvent[I].idCce + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; idDfe: ' +
          retorno.ListEvent[I].idDfe + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; xCorrecao: ' + retorno.ListEvent[I].xCorrecao + '; digVal: ' + retorno.ListEvent[I].digVal +
          '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; cStat: ' + retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' +
          DateToStr(retorno.ListEvent[I].dhRegEvento) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; xMotivo: ' + retorno.ListEvent[I].XMotivo +
          '; nProtCce: ' + retorno.ListEvent[I].nProtCce + '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString +
          '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFeCorIdBatchClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFeCorIdBatchClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFeCorIdBatchClick - Erro "DadosJahDFe.NFeGetEventCorrectionIdBatch": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFeCorIdCCeClick(Sender: TObject);
var
  retorno: TResponseConsultCorrectionNFe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFeCorIdCCeClick - Requisição. Consulta Evento Carta Correção NFe pelo Idcce');
  try
    retorno := DadosJahDFe.NFeGetEventCorrectionIdCce(EdtConEventosNFeIdcce.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeCorIdCCeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFeCorIdCCeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFeCorIdCCeClick - Retorno. idCce: ' + retorno.ListEvent[I].idCce + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; idDfe: ' +
          retorno.ListEvent[I].idDfe + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; xCorrecao: ' + retorno.ListEvent[I].xCorrecao + '; digVal: ' + retorno.ListEvent[I].digVal +
          '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; cStat: ' + retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' +
          DateToStr(retorno.ListEvent[I].dhRegEvento) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; xMotivo: ' + retorno.ListEvent[I].XMotivo +
          '; nProtCce: ' + retorno.ListEvent[I].nProtCce + '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString +
          '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFeCorIdCCeClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFeCorIdCCeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFeCorIdCCeClick - Erro "DadosJahDFe.NFeGetEventCorrectionIdCce": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFeCorIdDfeClick(Sender: TObject);
var
  retorno: TResponseConsultCorrectionNFe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFeCorIdDfeClick - Requisição. Consulta Evento Carta Correção NFe pelo Iddfe');
  try
    retorno := DadosJahDFe.NFeGetEventCorrectionidDfe(EdtConEventosNFeIddfe.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeCorIdDfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFeCorIdDfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFeCorIdDfeClick - Retorno. idCce: ' + retorno.ListEvent[I].idCce + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; idDfe: ' +
          retorno.ListEvent[I].idDfe + '; chDfe: ' + retorno.ListEvent[I].chDfe + '; xCorrecao: ' + retorno.ListEvent[I].xCorrecao + '; digVal: ' + retorno.ListEvent[I].digVal +
          '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; cStat: ' + retorno.ListEvent[I].CStat.ToString + '; dhRegEvento: ' +
          DateToStr(retorno.ListEvent[I].dhRegEvento) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) + '; xMotivo: ' + retorno.ListEvent[I].XMotivo +
          '; nProtCce: ' + retorno.ListEvent[I].nProtCce + '; CNPJDest: ' + retorno.ListEvent[I].CNPJDest + '; cOrgao: ' + retorno.ListEvent[I].cOrgao.ToString +
          '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFeCorIdDfeClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFeCorIdDfeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFeCorIdDfeClick - Erro "DadosJahDFe.NFeGetEventCorrectionidDfe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFeInuIdBatchClick(Sender: TObject);
var
  retorno: TResponseConsultDisenableNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFeInuIdBatchClick - Requisição. Consulta Evento Inutilização NFe pelo IdBatch');
  try
    retorno := DadosJahDFe.NFeGetEventDisenableIdBatch(EdtConEventosNFeIdBatch.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeInuIdBatchClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFeInuIdBatchClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFeInuIdBatchClick - Retorno. idInu: ' + retorno.ListEvent[I].idInu + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; ano: ' +
          retorno.ListEvent[I].ano.ToString + '; serie: ' + retorno.ListEvent[I].serie.ToString + '; nNFIni: ' + retorno.ListEvent[I].nNFIni.ToString + '; nNFFin: ' +
          retorno.ListEvent[I].nNFFin.ToString + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; DhRecbto: ' + DateToStr(retorno.ListEvent[I].DhRecbto) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) +
          '; XMotivo: ' + retorno.ListEvent[I].XMotivo + '; nProtInu: ' + retorno.ListEvent[I].nProtInu + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFeInuIdBatchClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFeInuIdBatchClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFeInuIdBatchClick - Erro "DadosJahDFe.NFeGetEventDisenableIdBatch": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnConsultNFeInuIdInuClick(Sender: TObject);
var
  retorno: TResponseConsultDisenableNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnConsultNFeInuIdInuClick - Requisição. Consulta Evento Inutilização NFe pelo IdInu');
  try
    retorno := DadosJahDFe.NFeGetEventDisenableIdInu(EdtConEventosNFeIdinu.Text, 10, 1);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnConsultNFeInuIdInuClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnConsultNFeInuIdInuClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnConsultNFeInuIdInuClick - Retorno. idInu: ' + retorno.ListEvent[I].idInu + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; ano: ' +
          retorno.ListEvent[I].ano.ToString + '; serie: ' + retorno.ListEvent[I].serie.ToString + '; nNFIni: ' + retorno.ListEvent[I].nNFIni.ToString + '; nNFFin: ' +
          retorno.ListEvent[I].nNFFin.ToString + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; DhRecbto: ' + DateToStr(retorno.ListEvent[I].DhRecbto) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) +
          '; XMotivo: ' + retorno.ListEvent[I].XMotivo + '; nProtInu: ' + retorno.ListEvent[I].nProtInu + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnConsultNFeInuIdInuClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnConsultNFeInuIdInuClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultNFeInuIdInuClick - Erro "DadosJahDFe.NFeGetEventDisenableIdInu": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnEnviarCertificadoClick(Sender: TObject);
var
  certRetorno: TCertificate;
  certArquivo: TCertificateFile;
begin
  certArquivo.FileName := EdtCertificado.Text;
  certArquivo.Password := EdtSenhaCertificado.Text;
  Memo.Lines.Add('BtnEnviarCertificadoClick - Requisição. Enviar Certificado: ' + certArquivo.FileName + '; Senha: ' + certArquivo.Password);
  try
    certRetorno := DadosJahDFe.CertificateAdd(certArquivo);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnEnviarCertificadoClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnEnviarCertificadoClick - Número Série: ' + certRetorno.NumeroSerie + '; Razão Social: ' + certRetorno.RazaoSocial + '; CNPJ: ' + certRetorno.CNPJ +
        '; Validade: ' + DateToStr(certRetorno.Validade) + '; Certificadora: ' + certRetorno.Certificadora);
  except
    on E: Exception do
      Memo.Lines.Add('BtnEnviarCertificadoClick - Erro "DadosJahDFe.CertificateAdd": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnEsqueciSenhaSystemClick(Sender: TObject);
var
  vAuth: TAuth;
  retorno: String;
begin
  vAuth._Type := tuSystem;
  vAuth.Email := EdtEmailSystem.Text;
  vAuth.Password := '';
  EdtResetTokenSystem.Text := '';

  Memo.Lines.Add('BtnEsqueciSenhaSystemClick - Requisição Esqueceu a Senha System. Email: ' + vAuth.Email);
  try
    retorno := DadosJahDFe.forget(vAuth);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnEsqueciSenhaSystemClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnEsqueciSenhaSystemClick - Reset Token: ' + retorno.Trim);
      EdtResetTokenSystem.Text := retorno.Trim;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnEsqueciSenhaSystemClick - Erro "DadosJahDFe.forget": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnEsqueciSenhaUserClick(Sender: TObject);
var
  vAuth: TAuth;
  retorno: String;
begin
  vAuth._Type := tuUser;
  vAuth.Email := EdtEmailUser.Text;
  vAuth.Password := '';
  EdtResetTokenUser.Text := '';

  Memo.Lines.Add('BtnEsqueciSenhaUserClick - Requisição Esqueceu a Senha User. Email: ' + vAuth.Email);
  try
    retorno := DadosJahDFe.forget(vAuth);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnEsqueciSenhaUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnEsqueciSenhaUserClick - Reset Token: ' + retorno.Trim);;
      EdtResetTokenUser.Text := retorno.Trim;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnEsqueciSenhaUserClick - Erro "DadosJahDFe.forget": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnExcluirNotificacaoUsuarioClick(Sender: TObject);
var
  NotificationRetorno: TResponseNotification;
  ListNotification: TListNotification;
  I: Integer;
begin
  SetLength(ListNotification, 1);
  ListNotification[0].Email := 'patrick@ctec.com.br';
  ListNotification[0].TypeNotification := ttnStatusServico;

  Memo.Lines.Add('BtnExcluirNotificacaoUsuarioClick - Requisição. Deletar Notificações do Usuário');
  try
    NotificationRetorno := DadosJahDFe.NotificationDelete(ListNotification);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnExcluirNotificacaoUsuarioClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnExcluirNotificacaoUsuarioClick - Página Atual: ' + NotificationRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' +
        NotificationRetorno.Pages.totalPages.ToString + '; Quant. Itens: ' + NotificationRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NotificationRetorno.ListNotification) do
      begin
        Memo.Lines.Add('BtnExcluirNotificacaoUsuarioClick - ' + (I + 1).ToString + '/' + IntToStr(Length(NotificationRetorno.ListNotification)) + ' - Email: ' +
          NotificationRetorno.ListNotification[I].Email + '; TypeNotification: ' + NotificationToStr(NotificationRetorno.ListNotification[I].TypeNotification));
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnExcluirNotificacaoUsuarioClick - Erro "DadosJahDFe.NotificationDelete": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnExibirSenhaCertificadoClick(Sender: TObject);
begin
  if EdtSenhaCertificado.PasswordChar = '*' then
    EdtSenhaCertificado.PasswordChar := #0
  else
    EdtSenhaCertificado.PasswordChar := '*';
end;

procedure TFrmPrincipal.BtnExibirSenhaSystemClick(Sender: TObject);
begin
  if EdtSenhaSystem.PasswordChar = '*' then
    EdtSenhaSystem.PasswordChar := #0
  else
    EdtSenhaSystem.PasswordChar := '*';
end;

procedure TFrmPrincipal.BtnExibirSenhaUserClick(Sender: TObject);
begin
  if EdtSenhaUser.PasswordChar = '*' then
    EdtSenhaUser.PasswordChar := #0
  else
    EdtSenhaUser.PasswordChar := '*';
end;

procedure TFrmPrincipal.BtnIniciliazarClasse1Click(Sender: TObject);
var
  vFormatSettings: TFormatSettings;
begin
  DadosJahDFe := TDadosJahDFe.Create;
  DadosJahDFe.VersionAPI := v1;
  DadosJahDFe.TimeOut := 60;
  DadosJahDFe.GenerateLog := True;
  DadosJahDFe.GenerateLogRequestContent := True;
  DadosJahDFe.GenerateLogResponseContent := True;
  DadosJahDFe.LogPath := ExtractFileDir(Application.ExeName) + '\Logs';
  DadosJahDFe.SaveJSONRequest := True;
  DadosJahDFe.SaveJSONResponse := True;
  DadosJahDFe.SaveJSONPath := ExtractFileDir(Application.ExeName) + '\JSON';
  DadosJahDFe.SaveXML := True;
  DadosJahDFe.PathXMLSortByDate := True;
  DadosJahDFe.PathXMLNFe := ExtractFileDir(Application.ExeName) + '\XML\NFe';
  DadosJahDFe.PathXMLNFeCorrection := ExtractFileDir(Application.ExeName) + '\XML\NFe\Correction';
  DadosJahDFe.PathXMLNFeDisenable := ExtractFileDir(Application.ExeName) + '\XML\NFe\Disenable';
  DadosJahDFe.PathXMLNFeCancel := ExtractFileDir(Application.ExeName) + '\XML\NFe\Cancel';
  DadosJahDFe.PathXMLNFCe := ExtractFileDir(Application.ExeName) + '\XML\NFCe';
  DadosJahDFe.PathXMLNFCeDisenable := ExtractFileDir(Application.ExeName) + '\XML\NFCe\Disenable';
  DadosJahDFe.PathXMLNFCeCancel := ExtractFileDir(Application.ExeName) + '\XML\NFCe\Cancel';
  DadosJahDFe.SavePDF := True;
  DadosJahDFe.PathPDFSortByDate := True;
  DadosJahDFe.PathPDFNFe := ExtractFileDir(Application.ExeName) + '\PDF\NFe';
  DadosJahDFe.PathPDFNFeCorrection := ExtractFileDir(Application.ExeName) + '\PDF\NFe\Correction';
  DadosJahDFe.PathPDFNFeDisenable := ExtractFileDir(Application.ExeName) + '\PDF\NFe\Disenable';
  DadosJahDFe.PathPDFNFeCancel := ExtractFileDir(Application.ExeName) + '\PDF\NFe\Cancel';
  DadosJahDFe.PathPDFNFCe := ExtractFileDir(Application.ExeName) + '\PDF\NFCe';
  DadosJahDFe.PathPDFNFCeDisenable := ExtractFileDir(Application.ExeName) + '\PDF\NFCe\Disenable';
  DadosJahDFe.PathPDFNFCeCancel := ExtractFileDir(Application.ExeName) + '\PDF\NFCe\Cancel';
  DadosJahDFe.timezone := tzLess0300;
  vFormatSettings.DateSeparator := '-';
  vFormatSettings.TimeSeparator := ':';
  vFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  vFormatSettings.LongTimeFormat := 'hh:nn:ss';
  vFormatSettings.DecimalSeparator := '.';
  DadosJahDFe.FormatSettings := vFormatSettings;

  Self.Caption := FCaption + ' - Classe Instanciada.';
  Memo.Lines.Add('BtnIniciliazarClasse1Click - Classe Instanciada.');
  BtnIniciliazarClasse1.Enabled := False;
end;

procedure TFrmPrincipal.BtnIniciliazarClasse2Click(Sender: TObject);
var
  vFormatSettings: TFormatSettings;
begin
  vFormatSettings.DateSeparator := '-';
  vFormatSettings.TimeSeparator := ':';
  vFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  vFormatSettings.LongTimeFormat := 'hh:nn:ss';
  vFormatSettings.DecimalSeparator := '.';
  DadosJahDFe := TDadosJahDFe.Create(v1, 60, True, True, True, ExtractFileDir(Application.ExeName) + '\Logs', True, True, ExtractFileDir(Application.ExeName) + '\JSON',
    True, True, ExtractFileDir(Application.ExeName) + '\XML\NFe', ExtractFileDir(Application.ExeName) + '\XML\NFe\Correction',
    ExtractFileDir(Application.ExeName) + '\XML\NFe\Disenable', ExtractFileDir(Application.ExeName) + '\XML\NFe\Cancel', ExtractFileDir(Application.ExeName) + '\XML\NFCe',
    ExtractFileDir(Application.ExeName) + '\XML\NFCe\Disenable', ExtractFileDir(Application.ExeName) + '\XML\NFCe\Cancel',
    True, True, ExtractFileDir(Application.ExeName) + '\PDF\NFe', ExtractFileDir(Application.ExeName) + '\PDF\NFe\Correction',
    ExtractFileDir(Application.ExeName) + '\PDF\NFe\Disenable', ExtractFileDir(Application.ExeName) + '\PDF\NFe\Cancel', ExtractFileDir(Application.ExeName) + '\PDF\NFCe',
    ExtractFileDir(Application.ExeName) + '\PDF\NFCe\Disenable', ExtractFileDir(Application.ExeName) + '\PDF\NFCe\Cancel', tzLess0300, vFormatSettings);

  Self.Caption := FCaption + ' - Classe Instanciada.';
  Memo.Lines.Add('BtnIniciliazarClasse2Click - Classe Instanciada.');
  BtnIniciliazarClasse2.Enabled := False;
end;

procedure TFrmPrincipal.BtnInutilizacaoNumeracaoNFCeAssincrono1Click(Sender: TObject);
var
  idBatch: String;
  events: TListEventDisenable;
begin
  SetLength(events, 1);
  events[0] := ExemploInutilizacaoNFCe1;

  Memo.Lines.Add('BtnInutilizacaoNumeracaoNFCeAssincrono1Click - Requisição. Inutilização NFCe modo assincrono.');
  try
    idBatch := DadosJahDFe.NFCeDisenableAsync(events, taHomologacao);
    Memo.Lines.Add('BtnInutilizacaoNumeracaoNFCeAssincrono1Click - Retorno. idBatch: ' + idBatch);
  except
    on E: Exception do
      Memo.Lines.Add('BtnInutilizacaoNumeracaoNFCeAssincrono1Click - Erro "DadosJahDFe.NFCeDisenableAsync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnInutilizacaoNumeracaoNFCeSincronoClick(Sender: TObject);
var
  retorno: TResponseConsultDisenableNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnInutilizacaoNumeracaoNFCeSincronoClick - Requisição. Inutilização NFCe modo sincrono.');
  try
    retorno := DadosJahDFe.NFCeDisenableSync(ExemploInutilizacaoNFCe1, taHomologacao);
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnInutilizacaoNumeracaoNFCeSincronoClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnInutilizacaoNumeracaoNFCeSincronoClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnInutilizacaoNumeracaoNFCeSincronoClick - Retorno. idInu: ' + retorno.ListEvent[I].idInu + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; ano: ' +
          retorno.ListEvent[I].ano.ToString + '; serie: ' + retorno.ListEvent[I].serie.ToString + '; nNFIni: ' + retorno.ListEvent[I].nNFIni.ToString + '; nNFFin: ' +
          retorno.ListEvent[I].nNFFin.ToString + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; DhRecbto: ' + DateToStr(retorno.ListEvent[I].DhRecbto) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) +
          '; XMotivo: ' + retorno.ListEvent[I].XMotivo + '; nProtInu: ' + retorno.ListEvent[I].nProtInu + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnInutilizacaoNumeracaoNFCeSincronoClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnInutilizacaoNumeracaoNFCeSincronoClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnInutilizacaoNumeracaoNFCeSincronoClick - Erro "DadosJahDFe.NFCeDisenableSync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnInutilizacaoNumeracaoNFeAssincrono1Click(Sender: TObject);
var
  idBatch: String;
  events: TListEventDisenable;
begin
  SetLength(events, 1);
  events[0] := ExemploInutilizacaoNFe1;

  Memo.Lines.Add('BtnInutilizacaoNumeracaoNFeAssincrono1Click - Requisição. Inutilização NFe modo assincrono.');
  try
    idBatch := DadosJahDFe.NFeDisenableAsync(events, taHomologacao);
    Memo.Lines.Add('BtnInutilizacaoNumeracaoNFeAssincrono1Click - Retorno. idBatch: ' + idBatch);
  except
    on E: Exception do
      Memo.Lines.Add('BtnInutilizacaoNumeracaoNFeAssincrono1Click - Erro "DadosJahDFe.NFeDisenableAsync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnInutilizacaoNumeracaoNFeSincronoClick(Sender: TObject);
var
  retorno: TResponseConsultDisenableNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnInutilizacaoNumeracaoNFeSincronoClick - Requisição. Inutilização NFe modo sincrono.');
  try
    retorno := DadosJahDFe.NFeDisenableSync(ExemploInutilizacaoNFe1, taHomologacao);
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnInutilizacaoNumeracaoNFeSincronoClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnInutilizacaoNumeracaoNFeSincronoClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnInutilizacaoNumeracaoNFeSincronoClick - Retorno. idInu: ' + retorno.ListEvent[I].idInu + '; idBatch: ' + retorno.ListEvent[I].idBatch + '; ano: ' +
          retorno.ListEvent[I].ano.ToString + '; serie: ' + retorno.ListEvent[I].serie.ToString + '; nNFIni: ' + retorno.ListEvent[I].nNFIni.ToString + '; nNFFin: ' +
          retorno.ListEvent[I].nNFFin.ToString + '; xJust: ' + retorno.ListEvent[I].xJust + '; dhEnv: ' + DateToStr(retorno.ListEvent[I].dhEnv) + '; CStat: ' +
          retorno.ListEvent[I].CStat.ToString + '; DhRecbto: ' + DateToStr(retorno.ListEvent[I].DhRecbto) + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb) +
          '; XMotivo: ' + retorno.ListEvent[I].XMotivo + '; nProtInu: ' + retorno.ListEvent[I].nProtInu + '; situation: ' + SituationAPIToStr(retorno.ListEvent[I].situation));
        Memo.Lines.Add('BtnInutilizacaoNumeracaoNFeSincronoClick - Retorno. XML Link: ' + retorno.ListEvent[I].xmlLink);
        Memo.Lines.Add('BtnInutilizacaoNumeracaoNFeSincronoClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnInutilizacaoNumeracaoNFeSincronoClick - Erro "DadosJahDFe.NFeDisenableSync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnLimparLogsClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja limpar os logs?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
    Exit;

  Memo.Lines.Clear;
end;

procedure TFrmPrincipal.BtnBuscarAutXMLClick(Sender: TObject);
var
  retorno: TListAutXML;
begin
  Memo.Lines.Add('BtnBuscarAutXMLClick - Requisição. Buscar Autorização XML');
  try
    retorno := DadosJahDFe.GetAutXML;

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnBuscarAutXMLClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnBuscarAutXMLClick - Autorização XML. Quant: ' + IntToStr(Length(retorno)) + '; CPF/CNPJ: ' + ArrayListToStr(retorno));
  except
    on E: Exception do
      Memo.Lines.Add('BtnBuscarAutXMLClick - Erro "DadosJahDFe.GetAutXML": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnBuscarCertificadoClick(Sender: TObject);
var
  certRetorno: TCertificate;
begin
  Memo.Lines.Add('BtnBuscarCertificadoClick - Requisição. Buscar Certificado');
  try
    certRetorno := DadosJahDFe.GetCertificate;

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnBuscarCertificadoClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnBuscarCertificadoClick - Número Série: ' + certRetorno.NumeroSerie + '; Razão Social: ' + certRetorno.RazaoSocial + '; CNPJ: ' + certRetorno.CNPJ +
        '; Validade: ' + DateToStr(certRetorno.Validade) + '; Certificadora: ' + certRetorno.Certificadora);
  except
    on E: Exception do
      Memo.Lines.Add('BtnBuscarCertificadoClick - Erro "DadosJahDFe.GetCertificate": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnBuscarEmitClick(Sender: TObject);
var
  emitRetorno: TEmit;
begin
  Memo.Lines.Add('BtnBuscarEmitClick - Requisição. Buscar Emitente');
  try
    emitRetorno := DadosJahDFe.GetEmit;

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnBuscarEmitClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnBuscarEmitClick - Emitente. CNPJCPF: ' + emitRetorno.CNPJCPF + '; xNome: ' + emitRetorno.xNome + '; xFant: ' + emitRetorno.xFant + '; IE :' +
        emitRetorno.IE + '; IEST: ' + emitRetorno.IEST + '; IM: ' + emitRetorno.IM + '; CNAE: ' + emitRetorno.CNAE + '; CRT: ' + CRTToStr(emitRetorno.CRT) +
        '; xLgr: ' + emitRetorno.enderEmit.xLgr + '; nro: ' + emitRetorno.enderEmit.nro + '; xCpl: ' + emitRetorno.enderEmit.xCpl + '; xBairro: ' +
        emitRetorno.enderEmit.xBairro + '; cMun: ' + emitRetorno.enderEmit.cMun.ToString + '; xMun: ' + emitRetorno.enderEmit.xMun + '; UF: ' + emitRetorno.enderEmit.UF +
        '; CEP: ' + emitRetorno.enderEmit.CEP + '; cPais: ' + emitRetorno.enderEmit.cPais.ToString + '; xPais: ' + emitRetorno.enderEmit.xPais + '; fone: ' +
        emitRetorno.enderEmit.fone);
  except
    on E: Exception do
      Memo.Lines.Add('BtnBuscarEmitClick - Erro "DadosJahDFe.GetEmit": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnLoginSystemClick(Sender: TObject);
var
  vAuth: TAuth;
  retorno: TAccessToken;
begin
  vAuth._Type := tuSystem;
  vAuth.Email := EdtEmailSystem.Text;
  vAuth.Password := EdtSenhaSystem.Text;

  Memo.Lines.Add('BtnLoginSystemClick - Requisição Login System. Usuário: ' + vAuth.Email + '; Senha: ' + vAuth.Password);
  try
    retorno := DadosJahDFe.login(vAuth);

    EdtTokenSystem.Text := retorno.accessToken.Trim;
    EdtExpiracaoSystem.Text := DateTimeToStr(retorno.expiresAt);
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnLoginSystemClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnLoginSystemClick - Token: ' + retorno.accessToken + '; Data de Expiração: ' + DateTimeToStr(retorno.expiresAt));
  except
    on E: Exception do
      Memo.Lines.Add('BtnLoginSystemClick - Erro "DadosJahDFe.login": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnLoginUserClick(Sender: TObject);
var
  vAuth: TAuth;
  retorno: TAccessToken;
begin
  vAuth._Type := tuUser;
  vAuth.Email := EdtEmailUser.Text;
  vAuth.Password := EdtSenhaUser.Text;

  Memo.Lines.Add('BtnLoginUserClick - Requisição Login User. Usuário: ' + vAuth.Email + '; Senha: ' + vAuth.Password);
  try
    retorno := DadosJahDFe.login(vAuth);

    EdtTokenUser.Text := retorno.accessToken.Trim;
    EdtExpiracaoUser.Text := DateTimeToStr(retorno.expiresAt);
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 0, 200, 201]) then
      Memo.Lines.Add('BtnLoginUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnLoginUserClick - Token: ' + retorno.accessToken + '; Data de Expiração: ' + DateTimeToStr(retorno.expiresAt));
  except
    on E: Exception do
      Memo.Lines.Add('BtnLoginUserClick - Erro "DadosJahDFe.login": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFCeEmisaoAssincrono1Click(Sender: TObject);
var
  idBatch: String;
  nfces: TListNFeNFCe;
begin
  SetLength(nfces, 1);
  nfces[0] := ExemploEmissaoNFCe1;

  Memo.Lines.Add('BtnNFCeEmisaoAssincrono1Click - Requisição. Emissão de NFCe em modo assincrono.');
  try
    idBatch := DadosJahDFe.NFCeEmissionAsync(nfces);
    Memo.Lines.Add('BtnNFCeEmisaoAssincrono1Click - Retorno. idBatch: ' + idBatch);
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFCeEmisaoAssincrono1Click - Erro "DadosJahDFe.NFCeEmissionAsync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFCeEmisaoSincronoClick(Sender: TObject);
var
  NFeRetorno: TResponseConsultNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFCeEmisaoSincronoClick - Requisição. Emissão de NFCe em modo sincrono.');
  try
    NFeRetorno := DadosJahDFe.NFCeEmissionSync(ExemploEmissaoNFCe1);
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFCeEmisaoSincronoClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFCeEmisaoSincronoClick - Página Atual: ' + NFeRetorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + NFeRetorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + NFeRetorno.Pages.totalItens.ToString);
      for I := 0 to High(NFeRetorno.ListNFeNFCe) do
      begin
        Memo.Lines.Add('BtnNFCeEmisaoSincronoClick - Retorno. chDfe: ' + NFeRetorno.ListNFeNFCe[I].chDfe + '; CStat: ' + NFeRetorno.ListNFeNFCe[I].CStat.ToString +
          '; dhEmi: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].dhEmi) + '; DhRecbto: ' + DateToStr(NFeRetorno.ListNFeNFCe[I].DhRecbto) + '; digVal: ' +
          NFeRetorno.ListNFeNFCe[I].digVal + '; idBatch: ' + NFeRetorno.ListNFeNFCe[I].idBatch + '; idDfe: ' + NFeRetorno.ListNFeNFCe[I].idDfe + '; idExternal: ' +
          NFeRetorno.ListNFeNFCe[I].idExternal + '; nNF: ' + NFeRetorno.ListNFeNFCe[I].nNF.ToString + '; vNF: ' + FormatFloat(',0.00', NFeRetorno.ListNFeNFCe[I].vNF) +
          '; nProt: ' + NFeRetorno.ListNFeNFCe[I].nProt + '; nRec: ' + NFeRetorno.ListNFeNFCe[I].nRec + '; serie: ' + NFeRetorno.ListNFeNFCe[I].serie.ToString +
          '; situationDfe: ' + SituationDFeAPIToStr(NFeRetorno.ListNFeNFCe[I].situationDfe) + '; situation: ' + SituationAPIToStr(NFeRetorno.ListNFeNFCe[I].situation) +
          '; tpAmb: ' + AmbToDescStr(NFeRetorno.ListNFeNFCe[I].tpAmb) + '; XMotivo: ' + NFeRetorno.ListNFeNFCe[I].XMotivo);
        Memo.Lines.Add('BtnNFCeEmisaoSincronoClick - Retorno. XML Link: ' + NFeRetorno.ListNFeNFCe[I].xmlLink);
        Memo.Lines.Add('BtnNFCeEmisaoSincronoClick - Retorno. PDF Link: ' + NFeRetorno.ListNFeNFCe[I].pdfLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFCeEmisaoSincronoClick - Erro "DadosJahDFe.NFCeEmissionSync": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFCeImpEventoCanChaveDFeClick(Sender: TObject);
var
  retorno: TResponseEventCancelPrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFCeImpEventoCanChaveDFeClick - Requisição. Consulta Impressão Evento Cancelamento NFCe pela chave dfe');
  try
    retorno := DadosJahDFe.NFCeGetEventCancelPrintChaveDFe(EdtNFCeImpEventoChaveDfe.Text, taHomologacao);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFCeImpEventoCanChaveDFeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFCeImpEventoCanChaveDFeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFCeImpEventoCanChaveDFeClick -Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; chDfe: ' +
          retorno.ListEvent[I].chDfe + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFCeImpEventoCanChaveDFeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFCeImpEventoCanChaveDFeClick - Erro "DadosJahDFe.NFCeGetEventCancelPrintChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFCeImpEventoCanIdCanClick(Sender: TObject);
var
  retorno: TResponseEventCancelPrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFCeImpEventoCanIdCanClick - Requisição. Consulta Impressão Evento Cancelamento NFCe pelo IdCan');
  try
    retorno := DadosJahDFe.NFCeGetEventCancelPrintIdCan(EdtNFCeImpEventoIdCan.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFCeImpEventoCanIdCanClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFCeImpEventoCanIdCanClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFCeImpEventoCanIdCanClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; chDfe: ' +
          retorno.ListEvent[I].chDfe + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFCeImpEventoCanIdCanClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFCeImpEventoCanIdCanClick - Erro "DadosJahDFe.NFCeGetEventCancelPrintIdCan": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFCeImpEventoCanIdDfeClick(Sender: TObject);
var
  retorno: TResponseEventCancelPrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFCeImpEventoCanIdDfeClick - Requisição. Consulta Impressão Evento Cancelamento NFCe pelo IdDfe');
  try
    retorno := DadosJahDFe.NFCeGetEventCancelPrintIdDfe(EdtNFCeImpEventoIdDfe.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFCeImpEventoCanIdDfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFCeImpEventoCanIdDfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFCeImpEventoCanIdDfeClick - Retorno. idCan: ' + retorno.ListEvent[I].idCan + '; idDfe: ' + retorno.ListEvent[I].idDfe + '; chDfe: ' +
          retorno.ListEvent[I].chDfe + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFCeImpEventoCanIdDfeClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].chDfe + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFCeImpEventoCanIdDfeClick - Erro "DadosJahDFe.NFCeGetEventCancelPrintIdDfe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFCeImpEventoInuIdInuClick(Sender: TObject);
var
  retorno: TResponseEventDisenablePrint;
  I: Integer;
begin
  Memo.Lines.Add('BtnNFCeImpEventoInuIdInuClick - Requisição. Consulta Impressão Evento Inutilização NFCe pelo idinu');
  try
    retorno := DadosJahDFe.NFCeGetEventDisenablePrintIdInu(EdtNFCeImpEventoIdInu.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnNFCeImpEventoInuIdInuClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnNFCeImpEventoInuIdInuClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListEvent) do
      begin
        Memo.Lines.Add('BtnNFCeImpEventoInuIdInuClick - Retorno. idInu: ' + retorno.ListEvent[I].idInu + '; tpAmb: ' + AmbToDescStr(retorno.ListEvent[I].tpAmb));
        Memo.Lines.Add('BtnNFCeImpEventoInuIdInuClick - Retorno. PDF Link: ' + retorno.ListEvent[I].pdfLink);
        if retorno.ListEvent[I].pdfBase64.Trim <> '' then
        begin
          ForceDirectories(ExtractFileDir(Application.ExeName) + '\PDF\');
          Base64ToFile(retorno.ListEvent[I].pdfBase64, ExtractFileDir(Application.ExeName) + '\PDF\' + retorno.ListEvent[I].idInu + '.pdf');
        end;
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFCeImpEventoInuIdInuClick - Erro "DadosJahDFe.NFCeGetEventDisenablePrintIdInu": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFCeStatusServiceHomologMGClick(Sender: TObject);
var
  statusRetorno: TStatusService;
begin
  Memo.Lines.Add('BtnNFCeStatusServiceHomologMGClick - Requisição. Status Serviço - NFCe - MG - Homologação');
  try
    statusRetorno := DadosJahDFe.NFCeServiceStatus('MG', taHomologacao);

    Memo.Lines.Add('BtnNFCeStatusServiceHomologMGClick - CStat: ' + statusRetorno.CStat.ToString + '; Msg: ' + statusRetorno.Msg + '; XMotivo: ' +
      statusRetorno.XMotivo + '; CUF: ' + statusRetorno.CUF.ToString + '; DhRecbto: ' + DateTimeToStr(statusRetorno.DhRecbto) + '; DhRetorno: ' +
      DateTimeToStr(statusRetorno.DhRetorno) + '; TMed: ' + statusRetorno.TMed.ToString + '; VerAplic: ' + statusRetorno.VerAplic + '; Versao: ' +
      statusRetorno.Versao + '; XObs: ' + statusRetorno.XObs + '; tpAmb: ' + AmbToDescStr(statusRetorno.tpAmb) + '; responseTime: ' + statusRetorno.responseTime.ToString);
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFCeStatusServiceHomologMGClick - Erro "DadosJahDFe.NFCeServiceStatus": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFCeStatusServiceProdMGClick(Sender: TObject);
var
  statusRetorno: TStatusService;
begin
  Memo.Lines.Add('BtnNFCeStatusServiceProdMGClick - Requisição. Status Serviço - NFCe - MG - Produção');
  try
    statusRetorno := DadosJahDFe.NFCeServiceStatus('MG', taProducao);

    Memo.Lines.Add('BtnNFCeStatusServiceProdMGClick - CStat: ' + statusRetorno.CStat.ToString + '; Msg: ' + statusRetorno.Msg + '; XMotivo: ' +
      statusRetorno.XMotivo + '; CUF: ' + statusRetorno.CUF.ToString + '; DhRecbto: ' + DateTimeToStr(statusRetorno.DhRecbto) + '; DhRetorno: ' +
      DateTimeToStr(statusRetorno.DhRetorno) + '; TMed: ' + statusRetorno.TMed.ToString + '; VerAplic: ' + statusRetorno.VerAplic + '; Versao: ' +
      statusRetorno.Versao + '; XObs: ' + statusRetorno.XObs + '; tpAmb: ' + AmbToDescStr(statusRetorno.tpAmb) + '; responseTime: ' + statusRetorno.responseTime.ToString);
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFCeStatusServiceProdMGClick - Erro "DadosJahDFe.NFCeServiceStatus": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeStatusServiceHomologMGClick(Sender: TObject);
var
  statusRetorno: TStatusService;
begin
  Memo.Lines.Add('BtnNFeStatusServiceHomologMGClick - Requisição. Status Serviço - NFe - MG - Homologação');
  try
    statusRetorno := DadosJahDFe.NFeServiceStatus('MG', taHomologacao);

    Memo.Lines.Add('BtnNFeStatusServiceHomologMGClick - CStat: ' + statusRetorno.CStat.ToString + '; Msg: ' + statusRetorno.Msg + '; XMotivo: ' +
      statusRetorno.XMotivo + '; CUF: ' + statusRetorno.CUF.ToString + '; DhRecbto: ' + DateTimeToStr(statusRetorno.DhRecbto) + '; DhRetorno: ' +
      DateTimeToStr(statusRetorno.DhRetorno) + '; TMed: ' + statusRetorno.TMed.ToString + '; VerAplic: ' + statusRetorno.VerAplic + '; Versao: ' +
      statusRetorno.Versao + '; XObs: ' + statusRetorno.XObs + '; tpAmb: ' + AmbToDescStr(statusRetorno.tpAmb) + '; responseTime: ' + statusRetorno.responseTime.ToString);
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeStatusServiceHomologMGClick - Erro "DadosJahDFe.NFeServiceStatus": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnNFeStatusServiceProdMGClick(Sender: TObject);
var
  statusRetorno: TStatusService;
begin
  Memo.Lines.Add('BtnNFeStatusServiceProdMGClick - Requisição. Status Serviço - NFe - MG - Produção');
  try
    statusRetorno := DadosJahDFe.NFeServiceStatus('MG', taProducao);

    Memo.Lines.Add('BtnNFeStatusServiceProdMGClick - CStat: ' + statusRetorno.CStat.ToString + '; Msg: ' + statusRetorno.Msg + '; XMotivo: ' +
      statusRetorno.XMotivo + '; CUF: ' + statusRetorno.CUF.ToString + '; DhRecbto: ' + DateTimeToStr(statusRetorno.DhRecbto) + '; DhRetorno: ' +
      DateTimeToStr(statusRetorno.DhRetorno) + '; TMed: ' + statusRetorno.TMed.ToString + '; VerAplic: ' + statusRetorno.VerAplic + '; Versao: ' +
      statusRetorno.Versao + '; XObs: ' + statusRetorno.XObs + '; tpAmb: ' + AmbToDescStr(statusRetorno.tpAmb) + '; responseTime: ' + statusRetorno.responseTime.ToString);
  except
    on E: Exception do
      Memo.Lines.Add('BtnNFeStatusServiceProdMGClick - Erro "DadosJahDFe.NFeServiceStatus": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnRestaurarSenhaSystemClick(Sender: TObject);
var
  retorno: TAccessToken;
begin
  Memo.Lines.Add('BtnRestaurarSenhaSystemClick - Requisição Restaurar Senha System.');
  try
    retorno := DadosJahDFe.Reset(EdtSenhaSystem.Text, EdtResetTokenSystem.Text, tuSystem);

    EdtTokenSystem.Text := retorno.accessToken.Trim;
    EdtExpiracaoSystem.Text := DateTimeToStr(retorno.expiresAt);
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnRestaurarSenhaSystemClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnRestaurarSenhaSystemClick - Token: ' + retorno.accessToken + '; Data de Expiração: ' + DateTimeToStr(retorno.expiresAt));
  except
    on E: Exception do
      Memo.Lines.Add('BtnRestaurarSenhaSystemClick - Erro "DadosJahDFe.Reset": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnRestaurarSenhaUserClick(Sender: TObject);
var
  retorno: TAccessToken;
begin
  Memo.Lines.Add('BtnRestaurarSenhaUserClick - Requisição Restaurar Senha User.');
  try
    retorno := DadosJahDFe.Reset(EdtSenhaUser.Text, EdtResetTokenUser.Text, tuUser);

    EdtTokenUser.Text := retorno.accessToken.Trim;
    EdtExpiracaoUser.Text := DateTimeToStr(retorno.expiresAt);
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnRestaurarSenhaUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnRestaurarSenhaUserClick - Token: ' + retorno.accessToken + '; Data de Expiração: ' + DateTimeToStr(retorno.expiresAt));
  except
    on E: Exception do
      Memo.Lines.Add('BtnRestaurarSenhaUserClick - Erro "DadosJahDFe.Reset": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnSairSystemClick(Sender: TObject);
var
  vAuth: TAuth;
  retorno: String;
begin
  vAuth._Type := tuSystem;
  vAuth.Email := EdtEmailSystem.Text;
  vAuth.Password := EdtSenhaSystem.Text;

  Memo.Lines.Add('BtnSairSystemClick - Requisição Logout System. Usuário: ' + vAuth.Email + '; Senha: ' + vAuth.Password);
  try
    retorno := DadosJahDFe.logout(vAuth);

    EdtTokenSystem.Text := '';
    EdtExpiracaoSystem.Text := '';
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnSairSystemClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnSairSystemClick - Mensagem: ' + retorno.Trim);
  except
    on E: Exception do
      Memo.Lines.Add('BtnSairSystemClick - Erro "DadosJahDFe.logout": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnSairUserClick(Sender: TObject);
var
  vAuth: TAuth;
  retorno: String;
begin
  vAuth._Type := tuUser;
  vAuth.Email := EdtEmailUser.Text;
  vAuth.Password := EdtSenhaUser.Text;

  Memo.Lines.Add('BtnSairUserClick - Requisição Logout User. Usuário: ' + vAuth.Email + '; Senha: ' + vAuth.Password);
  try
    retorno := DadosJahDFe.logout(vAuth);

    EdtTokenUser.Text := '';
    EdtExpiracaoUser.Text := '';
    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnSairUserClick - ' + DadosJahDFe.ErrorRequestStr)
    else
      Memo.Lines.Add('BtnSairUserClick - Mensagem: ' + retorno.Trim);
  except
    on E: Exception do
      Memo.Lines.Add('BtnSairUserClick - Erro "DadosJahDFe.logout": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnXmlNFCechavedfeClick(Sender: TObject);
var
  retorno: TResponseConsultXMLNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnXmlNFCechavedfeClick - Requisição. Consulta XML NFCe pela chave dfe');
  try
    retorno := DadosJahDFe.NFCeGetXMLChaveDFe(EdtXmlNFCechavedfe.Text, taHomologacao);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnXmlNFCechavedfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnXmlNFCechavedfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListXML) do
      begin
        Memo.Lines.Add('BtnXmlNFCechavedfeClick - Retorno. idDfe: ' + retorno.ListXML[I].idDfe + '; serie: ' + retorno.ListXML[I].serie.ToString + '; chDfe: ' +
          retorno.ListXML[I].chDfe + '; dhEmi: ' + DateToStr(retorno.ListXML[I].dhEmi) + '; idExternal: ' + retorno.ListXML[I].idExternal + '; tpAmb: ' +
          AmbToDescStr(retorno.ListXML[I].tpAmb) + '; nNF: ' + retorno.ListXML[I].nNF.ToString);
        Memo.Lines.Add('BtnXmlNFCechavedfeClick - Retorno. XML Link: ' + retorno.ListXML[I].xmlLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnXmlNFCechavedfeClick - Erro "DadosJahDFe.NFCeGetXMLChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnXmlNFCeIddfeClick(Sender: TObject);
var
  retorno: TResponseConsultXMLNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnXmlNFCeIddfeClick - Requisição. Consulta XML NFCe pelo iddfe');
  try
    retorno := DadosJahDFe.NFCeGetXMLIdDfe(EdtXmlNFCeIddfe.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnXmlNFCeIddfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnXmlNFCeIddfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListXML) do
      begin
        Memo.Lines.Add('BtnXmlNFCeIddfeClick - Retorno. idDfe: ' + retorno.ListXML[I].idDfe + '; serie: ' + retorno.ListXML[I].serie.ToString + '; chDfe: ' +
          retorno.ListXML[I].chDfe + '; dhEmi: ' + DateToStr(retorno.ListXML[I].dhEmi) + '; idExternal: ' + retorno.ListXML[I].idExternal + '; tpAmb: ' +
          AmbToDescStr(retorno.ListXML[I].tpAmb) + '; nNF: ' + retorno.ListXML[I].nNF.ToString);
        Memo.Lines.Add('BtnXmlNFCeIddfeClick - Retorno. XML Link: ' + retorno.ListXML[I].xmlLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnXmlNFCeIddfeClick - Erro "DadosJahDFe.NFCeGetXMLIdDfe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnXmlNFCeIdExternalClick(Sender: TObject);
var
  retorno: TResponseConsultXMLNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnXmlNFCeIdExternalClick - Requisição. Consulta XML NFCe pelo idexternal');
  try
    retorno := DadosJahDFe.NFCeGetXMLIdExternal(EdtXmlNFCeIdExternal.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnXmlNFCeIdExternalClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnXmlNFCeIdExternalClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListXML) do
      begin
        Memo.Lines.Add('BtnXmlNFCeIdExternalClick - Retorno. idDfe: ' + retorno.ListXML[I].idDfe + '; serie: ' + retorno.ListXML[I].serie.ToString + '; chDfe: ' +
          retorno.ListXML[I].chDfe + '; dhEmi: ' + DateToStr(retorno.ListXML[I].dhEmi) + '; idExternal: ' + retorno.ListXML[I].idExternal + '; tpAmb: ' +
          AmbToDescStr(retorno.ListXML[I].tpAmb) + '; nNF: ' + retorno.ListXML[I].nNF.ToString);
        Memo.Lines.Add('BtnXmlNFCeIdExternalClick - Retorno. XML Link: ' + retorno.ListXML[I].xmlLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnXmlNFCeIdExternalClick - Erro "DadosJahDFe.NFCeGetXMLIdExternal": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnXmlNFCeNumeroClick(Sender: TObject);
var
  retorno: TResponseConsultXMLNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnXmlNFCeNumeroClick - Requisição. Consulta XML NFCe pelo número');
  try
    retorno := DadosJahDFe.NFCeGetXMLNF(StrToIntDef(EdtXmlNFCeNumero.Text, 0), StrToIntDef(EdtXmlNFCeserie.Text, 0), taHomologacao);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnXmlNFCeNumeroClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnXmlNFCeNumeroClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListXML) do
      begin
        Memo.Lines.Add('BtnXmlNFCeNumeroClick - Retorno. idDfe: ' + retorno.ListXML[I].idDfe + '; serie: ' + retorno.ListXML[I].serie.ToString + '; chDfe: ' +
          retorno.ListXML[I].chDfe + '; dhEmi: ' + DateToStr(retorno.ListXML[I].dhEmi) + '; idExternal: ' + retorno.ListXML[I].idExternal + '; tpAmb: ' +
          AmbToDescStr(retorno.ListXML[I].tpAmb) + '; nNF: ' + retorno.ListXML[I].nNF.ToString);
        Memo.Lines.Add('BtnXmlNFCeNumeroClick - Retorno. XML Link: ' + retorno.ListXML[I].xmlLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnXmlNFCeNumeroClick - Erro "DadosJahDFe.NFCeGetXMLNF": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnXmlNFechavedfeClick(Sender: TObject);
var
  retorno: TResponseConsultXMLNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnXmlNFechavedfeClick - Requisição. Consulta XML NFe pela chave dfe');
  try
    retorno := DadosJahDFe.NFeGetXMLChaveDFe(EdtXmlNFechavedfe.Text, taHomologacao);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnXmlNFechavedfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnXmlNFechavedfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListXML) do
      begin
        Memo.Lines.Add('BtnXmlNFechavedfeClick - Retorno. idDfe: ' + retorno.ListXML[I].idDfe + '; serie: ' + retorno.ListXML[I].serie.ToString + '; chDfe: ' +
          retorno.ListXML[I].chDfe + '; dhEmi: ' + DateToStr(retorno.ListXML[I].dhEmi) + '; idExternal: ' + retorno.ListXML[I].idExternal + '; tpAmb: ' +
          AmbToDescStr(retorno.ListXML[I].tpAmb) + '; nNF: ' + retorno.ListXML[I].nNF.ToString);
        Memo.Lines.Add('BtnXmlNFechavedfeClick - Retorno. XML Link: ' + retorno.ListXML[I].xmlLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnConsultarNFeIdBatchClick - Erro "DadosJahDFe.NFeGetXMLChaveDFe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnXmlNFeIddfeClick(Sender: TObject);
var
  retorno: TResponseConsultXMLNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnXmlNFeIddfeClick - Requisição. Consulta XML NFe pelo iddfe');
  try
    retorno := DadosJahDFe.NFeGetXMLIdDfe(EdtXmlNFeIddfe.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnXmlNFeIddfeClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnXmlNFeIddfeClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListXML) do
      begin
        Memo.Lines.Add('BtnXmlNFeIddfeClick - Retorno. idDfe: ' + retorno.ListXML[I].idDfe + '; serie: ' + retorno.ListXML[I].serie.ToString + '; chDfe: ' +
          retorno.ListXML[I].chDfe + '; dhEmi: ' + DateToStr(retorno.ListXML[I].dhEmi) + '; idExternal: ' + retorno.ListXML[I].idExternal + '; tpAmb: ' +
          AmbToDescStr(retorno.ListXML[I].tpAmb) + '; nNF: ' + retorno.ListXML[I].nNF.ToString);
        Memo.Lines.Add('BtnXmlNFeIddfeClick - Retorno. XML Link: ' + retorno.ListXML[I].xmlLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnXmlNFeIddfeClick - Erro "DadosJahDFe.NFeGetXMLIdDfe": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnXmlNFeIdExternalClick(Sender: TObject);
var
  retorno: TResponseConsultXMLNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnXmlNFeIdExternalClick - Requisição. Consulta XML NFe pelo IdExternal');
  try
    retorno := DadosJahDFe.NFeGetXMLIdExternal(EdtXmlNFeIdExternal.Text);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnXmlNFeIdExternalClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnXmlNFeIdExternalClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListXML) do
      begin
        Memo.Lines.Add('BtnXmlNFeIdExternalClick - Retorno. idDfe: ' + retorno.ListXML[I].idDfe + '; serie: ' + retorno.ListXML[I].serie.ToString + '; chDfe: ' +
          retorno.ListXML[I].chDfe + '; dhEmi: ' + DateToStr(retorno.ListXML[I].dhEmi) + '; idExternal: ' + retorno.ListXML[I].idExternal + '; tpAmb: ' +
          AmbToDescStr(retorno.ListXML[I].tpAmb) + '; nNF: ' + retorno.ListXML[I].nNF.ToString);
        Memo.Lines.Add('BtnXmlNFeIdExternalClick - Retorno. XML Link: ' + retorno.ListXML[I].xmlLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnXmlNFeIdExternalClick - Erro "DadosJahDFe.NFeGetXMLIdExternal": ' + E.Message);
  end;
end;

procedure TFrmPrincipal.BtnXmlNFeNumeroClick(Sender: TObject);
var
  retorno: TResponseConsultXMLNFeNFCe;
  I: Integer;
begin
  Memo.Lines.Add('BtnXmlNFeNumeroClick - Requisição. Consulta XML NFe pelo número');
  try
    retorno := DadosJahDFe.NFeGetXMLNF(StrToIntDef(EdtXmlNFeNumero.Text, 0), StrToIntDef(EdtXmlNFeserie.Text, 0), taHomologacao);

    if not(DadosJahDFe.ErrorRequest.statusCode in [0, 200, 201]) then
      Memo.Lines.Add('BtnXmlNFeNumeroClick - ' + DadosJahDFe.ErrorRequestStr)
    else
    begin
      Memo.Lines.Add('BtnXmlNFeNumeroClick - Página Atual: ' + retorno.Pages.currentPage.ToString + '; Quant. Páginas: ' + retorno.Pages.totalPages.ToString +
        '; Quant. Itens: ' + retorno.Pages.totalItens.ToString);
      for I := 0 to High(retorno.ListXML) do
      begin
        Memo.Lines.Add('BtnXmlNFeNumeroClick - Retorno. idDfe: ' + retorno.ListXML[I].idDfe + '; serie: ' + retorno.ListXML[I].serie.ToString + '; chDfe: ' +
          retorno.ListXML[I].chDfe + '; dhEmi: ' + DateToStr(retorno.ListXML[I].dhEmi) + '; idExternal: ' + retorno.ListXML[I].idExternal + '; tpAmb: ' +
          AmbToDescStr(retorno.ListXML[I].tpAmb) + '; nNF: ' + retorno.ListXML[I].nNF.ToString);
        Memo.Lines.Add('BtnXmlNFeNumeroClick - Retorno. XML Link: ' + retorno.ListXML[I].xmlLink);
      end;
    end;
  except
    on E: Exception do
      Memo.Lines.Add('BtnXmlNFeNumeroClick - Erro "DadosJahDFe.NFeGetXMLNF": ' + E.Message);
  end;
end;

function TFrmPrincipal.ExemploCancelamentoNFe1: TEventCancel;
begin
  Result.CUF := UFToCodigo('MG');
  Result.chDfe := EdtEventosNFeChaveDFe.Text;
  Result.idDfe := EdtEventosNFeIdDfe.Text;
  Result.idExternal := EdtEventosNFeIdExternal.Text;
  Result.dhEvento := Now;
  Result.nProt := EdtEventosNFeProtocolo.Text;
  Result.xJust := EdtEventosNFeJustCorrecao.Text;
end;

function TFrmPrincipal.ExemploCancelamentoNFCe1: TEventCancel;
begin
  Result.CUF := UFToCodigo('MG');
  Result.chDfe := EdtEventosNFCeChaveDFe.Text;
  Result.idDfe := EdtEventosNFCeIdDfe.Text;
  Result.idExternal := EdtEventosNFCeIdExternal.Text;
  Result.dhEvento := Now;
  Result.nProt := EdtEventosNFCeProtocolo.Text;
  Result.xJust := EdtEventosNFCeJustCorrecao.Text;
end;

function TFrmPrincipal.ExemploInutilizacaoNFe1: TEventDisenable;
begin
  Result.xJust := EdtEventosNFeJustCorrecao.Text;
  Result.ano := 2025;
  Result.serie := 4;
  Result.nNFIni := StrToIntDef(EdtEventosNFeNumeroIni.Text, 0);
  Result.nNFFin := StrToIntDef(EdtEventosNFeNumeroFim.Text, 0);
end;

function TFrmPrincipal.ExemploInutilizacaoNFCe1: TEventDisenable;
begin
  Result.xJust := EdtEventosNFCeJustCorrecao.Text;
  Result.ano := 2025;
  Result.serie := 4;
  Result.nNFIni := StrToIntDef(EdtEventosNFCeNumeroIni.Text, 0);
  Result.nNFFin := StrToIntDef(EdtEventosNFCeNumeroFim.Text, 0);
end;

function TFrmPrincipal.ExemploCorrecaoNFe1: TEventCorrection;
begin
  Result.CUF := UFToCodigo('MG');
  Result.chDfe := EdtEventosNFeChaveDFe.Text;
  Result.idDfe := EdtEventosNFeIdDfe.Text;
  Result.idExternal := EdtEventosNFeIdExternal.Text;
  Result.dhEvento := Now;
  Result.xCorrecao := EdtEventosNFeJustCorrecao.Text;
end;

function TFrmPrincipal.ExemploEmissaoNFCe1: TNFeNFCe;
var
  NumAleatorio: Integer;
begin
  NumAleatorio := Random(100000);
  Result.idExternal := IfThen(Trim(EdtNfceEmissaoIdExternal.Text) = '', NumAleatorio.ToString, EdtNfceEmissaoIdExternal.Text);
  Result.Versao := v4;

  Result.ide := ExemploTIde3; //
  Result.autXML := ExemploTListAutXML2; //
  Result.emit := ExemploTEmit2; //
  Result.dest := ExemploTDest2; //
  Result.det := ExemploTListDet2; //
  Result.total := ExemploTTotal2; //
  Result.Transp := ExemploTTransp2; //
  Result.infAdic := ExemploTInfAdic2; //
  Result.pag := ExemplotPag2; //
  Result.infRespTec := ExemploTInfRespTec2; //
end;

function TFrmPrincipal.ExemploTIde3: TIde;
begin
  Result.CUF := UFToCodigo('MG'); // Código de Minas Gerais
  Result.cNF := 1001; //
  Result.natOp := 'Venda de produtos eletrônicos';
  Result.serie := 4;
  Result.nNF := StrToIntDef(EdtNfceEmissaoNumeroNota.Text, 0);
  Result.dhEmi := Now;
  Result.dhSaiEnt := Now; // Saída no dia seguinte
  Result.tpNF := tnfSaida;
  Result.idDest := tdInterna;
  Result.cMunFG := 3127701; // Código IBGE de Governador Valadares
  Result.tmImp := tiPaisagem;
  Result.tmEmis := teNormal;
  Result.tpAmb := taHomologacao; // HOMOLOGAÇÃO
  Result.finNFe := tfNormal;
  Result.indFinal := tifConsumidorFinal;
  Result.indPres := tipPresencial;
  Result.indIntermed := tiOperacaoSemIntermediador;
  Result.procEmi := tpeAplicativoContribuinte;
  Result.verProc := '1.0.0';
end;

function TFrmPrincipal.ExemploEmissaoNFe1: TNFeNFCe;
begin
  Result.idExternal := '';
  Result.Versao := v4;

  Result.ide := ExemploTIde1;
  Result.autXML := ExemploTListAutXML1;
  Result.emit := ExemploTEmit1;
  Result.infIntermed := ExemploTInfIntermed1;
  Result.dest := ExemploTDest1;
  Result.det := ExemploTListDet1;
  Result.total := ExemploTTotal1;
  Result.retirada := ExemploTRetirada1; //
  Result.entrega := ExemploTEntrega1; //
  Result.Transp := ExemploTTransp1;
  Result.infAdic := ExemploTInfAdic1;
  Result.cobr := ExemploTcobr1;
  Result.pag := ExemplotPag1;
  Result.exporta := ExemploTExporta1;
  Result.compra := ExemploTCompra1; //
  Result.cana := ExemploTCana1; //
  Result.agropecuario := ExemploTAgropecuario1; //
  Result.infRespTec := ExemploTInfRespTec1;
end;

function TFrmPrincipal.ExemploEmissaoNFe2: TNFeNFCe;
var
  NumAleatorio: Integer;
begin
  NumAleatorio := Random(100000);
  Result.idExternal := IfThen(Trim(EdtNfeEmissaoIdExternal.Text) = '', NumAleatorio.ToString, EdtNfeEmissaoIdExternal.Text);
  Result.Versao := v4;

  Result.ide := ExemploTIde2; //
  Result.autXML := ExemploTListAutXML2; //
  Result.emit := ExemploTEmit2; //
  Result.dest := ExemploTDest2; //
  Result.det := ExemploTListDet2; //
  Result.total := ExemploTTotal2; //
  Result.Transp := ExemploTTransp2; //
  Result.infAdic := ExemploTInfAdic2; //
  Result.pag := ExemplotPag2; //
  Result.infRespTec := ExemploTInfRespTec2; //
end;

function TFrmPrincipal.ExemploTInfRespTec1: TInfRespTec;
begin
  Result.CNPJ := '12345678000199';
  Result.xContato := 'João Silva';
  Result.Email := 'joao.silva@empresa.com.br';
  Result.fone := '11987654321';
  Result.idCSRT := 'CSRT98765';
  Result.hashCSRT := 'A1B2C3D4E5F67890';
end;

function TFrmPrincipal.ExemploTInfRespTec2: TInfRespTec;
begin
  Result.CNPJ := '02598982000190';
  Result.xContato := 'Valter Patrick Silva Ferreira';
  Result.Email := 'ctec@ctec.com.br';
  Result.fone := '3332719900';
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  FCaption := Self.Caption;
  PageControl.TabIndex := 0;

  EdtEmailSystem.Text := 'contato@sistema3.com.br';
  EdtSenhaSystem.Text := 'SenhaSistema3@2024';

  EdtEmailUser.Text := 'admin@sistema3.com.br';
  EdtSenhaUser.Text := 'AdminS3@2024';

  EdtCertificado.Text := 'D:\Dev\Binarios\DadosJahDFe\Certificados\Cert_CTEC_123456.pfx';
  EdtSenhaCertificado.Text := '123456';
end;

end.

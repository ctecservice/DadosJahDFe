unit uDadosJahDFe;

interface

uses System.Classes, System.SysUtils, System.JSON, System.Generics.Collections, REST.Client, REST.Types, System.NetEncoding,
  uDadosJahDFeTypes, Math, StrUtils;

type
  TDadosJahDFe = class
  private
    FVersionAPI: TVersionAPI;
    FAuth: TAuth;
    FSystem: TSystem;
    FUser: TUser;
    FToken: TAccessToken;
    FTimeOut: Integer;
    FTimeZone: TTimeZone;
    FGenerateLog: Boolean;
    FGenerateLogRequestContent: Boolean;
    FGenerateLogResponseContent: Boolean;
    FLogPath: string;
    FSaveJSONRequest: Boolean;
    FSaveJSONResponse: Boolean;
    FSaveJSONPath: string;
    FSaveXML: Boolean;
    FPathXMLSortByDate: Boolean;
    FPathXMLNFe: string;
    FPathXMLNFeCorrection: string;
    FPathXMLNFeDisenable: string;
    FPathXMLNFeCancel: string;
    FPathXMLNFCe: string;
    FPathXMLNFCeDisenable: string;
    FPathXMLNFCeCancel: string;
    FSavePDF: Boolean;
    FPathPDFSortByDate: Boolean;
    FPathPDFNFe: string;
    FPathPDFNFeCorrection: string;
    FPathPDFNFeDisenable: string;
    FPathPDFNFeCancel: string;
    FPathPDFNFCe: string;
    FPathPDFNFCeDisenable: string;
    FPathPDFNFCeCancel: string;
    FErrorRequest: TError;
    FLastResponseAPI: TResponseAPI;
    FFormatSettings: TFormatSettings;

    procedure Log(Text: String);
    procedure SaveJSON(JSON, Route: String; ReqResp: TRequestResponseAPI);
    procedure SaveXMLFile(XML: String; FileType: TSaveXMLPDFFile; FileName: String; FileDate: TDate);
    procedure SaveXMLFilesNFeNFCe(List: TListResponseEmissionNFeNFCe; FileType: TSaveXMLPDFFile);
    procedure SaveXMLFilesXMLNFeNFCe(List: TListResponseXMLNFeNFCe; FileType: TSaveXMLPDFFile);
    procedure SaveXMLFilesCancelNFeNFCe(List: TListResponseCancelNFeNFCe; FileType: TSaveXMLPDFFile);
    procedure SaveXMLFilesDisenableNFeNFCe(List: TListResponseDisenableNFeNFCe; FileType: TSaveXMLPDFFile);
    procedure SaveXMLFilesCorrectionNFe(List: TListResponseCorrectionNFe);
    procedure SavePDFFile(PDFBase64: String; FileType: TSaveXMLPDFFile; FileName: String; FileDate: TDate);
    procedure SavePDFFilesNFeNFCe(List: TListResponseEmissionNFeNFCe; FileType: TSaveXMLPDFFile);
    procedure SavePDFFilesCancelNFeNFCe(List: TListResponseCancelNFeNFCe; FileType: TSaveXMLPDFFile);
    procedure SavePDFFilesDisenableNFeNFCe(List: TListResponseDisenableNFeNFCe; FileType: TSaveXMLPDFFile);
    procedure SavePDFFilesCorrectionNFe(List: TListResponseCorrectionNFe);
    procedure SavePDFFilesCancelPrintNFeNFCe(List: TListEventCancelPrint; FileType: TSaveXMLPDFFile);
    procedure SavePDFFilesDisenablePrintNFeNFCe(List: TListEventDisenablePrint; FileType: TSaveXMLPDFFile);
    procedure SavePDFFilesCorrectionPrintNFe(List: TListEventCorrectionPrint);
    procedure InitializeRest(vRestClient: TRESTClient; vRestRequest: TRESTRequest; vRoute: String; vMethodRequest: TRESTRequestMethod);
    procedure AddAuthorization(vRestRequest: TRESTRequest);
    procedure AddParams(vRestRequest: TRESTRequest; vParams: TRESTRequestParameterList);
    function FillResponseAPI(vStatusCode: Integer; vRestRequest: TRESTRequest): TResponseAPI;
    function Post(Route: String; BodyJson: TJsonObject): TResponseAPI; overload;
    function Post(Route: String; BodyArray: TJSONArray): TResponseAPI; overload;
    function Patch(Route: String; BodyJson: TJsonObject): TResponseAPI; overload;
    function Patch(Route: String; BodyArray: TJSONArray): TResponseAPI; overload;
    function Delete(Route: String; BodyArray: TJSONArray): TResponseAPI;
    function Get(Route: String; Params: TRESTRequestParameterList): TResponseAPI; overload;
    function Get(Route: String; Params: TRESTRequestParameterList; BodyJson: TJsonObject): TResponseAPI; overload;
    function Get(Route: String; Params: TRESTRequestParameterList; BodyArray: TJSONArray): TResponseAPI; overload;
    procedure ClearRequestError;
    procedure ClearResponseAPI;
    function GetTimeOut: Integer;
    function GetLibraryVersion: String;
  public
    property LibraryVersion: String read GetLibraryVersion;
    constructor Create; overload;
    constructor Create(AVersionAPI: TVersionAPI; ATimeOut: Integer; AGenerateLog, AGenerateLogRequestContent, AGenerateLogResponseContent: Boolean; ALogPath: String;
      ASaveJSONRequest, ASaveJSONResponse: Boolean; ASaveJSONPath: String; ASaveXML, APathXMLSortByDate: Boolean; APathXMLNFe, APathXMLNFeCorrection, APathXMLNFeDisenable,
      APathXMLNFeCancel, APathXMLNFCe, APathXMLNFCeDisenable, APathXMLNFCeCancel: string; ASavePDF, APathPDFSortByDate: Boolean; APathPDFNFe, APathPDFNFeCorrection,
      APathPDFNFeDisenable, APathPDFNFeCancel, APathPDFNFCe, APathPDFNFCeDisenable, APathPDFNFCeCancel: string; ATimeZone: TTimeZone; AFormatSettings: TFormatSettings); overload;
    property VersionAPI: TVersionAPI read FVersionAPI write FVersionAPI;
    property Auth: TAuth read FAuth write FAuth;
    property System: TSystem read FSystem write FSystem;
    property User: TUser read FUser write FUser;
    property Token: TAccessToken read FToken write FToken;
    property TimeOut: Integer read FTimeOut write FTimeOut;
    property TimeZone: TTimeZone read FTimeZone write FTimeZone;
    property GenerateLog: Boolean read FGenerateLog write FGenerateLog;
    property GenerateLogRequestContent: Boolean read FGenerateLogRequestContent write FGenerateLogRequestContent;
    property GenerateLogResponseContent: Boolean read FGenerateLogResponseContent write FGenerateLogResponseContent;
    property LogPath: string read FLogPath write FLogPath;
    property SaveJSONRequest: Boolean read FSaveJSONRequest write FSaveJSONRequest;
    property SaveJSONResponse: Boolean read FSaveJSONResponse write FSaveJSONResponse;
    property SaveJSONPath: string read FSaveJSONPath write FSaveJSONPath;
    property SaveXML: Boolean read FSaveXML write FSaveXML;
    property PathXMLSortByDate: Boolean read FPathXMLSortByDate write FPathXMLSortByDate;
    property PathXMLNFe: string read FPathXMLNFe write FPathXMLNFe;
    property PathXMLNFeCorrection: string read FPathXMLNFeCorrection write FPathXMLNFeCorrection;
    property PathXMLNFeDisenable: string read FPathXMLNFeDisenable write FPathXMLNFeDisenable;
    property PathXMLNFeCancel: string read FPathXMLNFeCancel write FPathXMLNFeCancel;
    property PathXMLNFCe: string read FPathXMLNFCe write FPathXMLNFCe;
    property PathXMLNFCeDisenable: string read FPathXMLNFCeDisenable write FPathXMLNFCeDisenable;
    property PathXMLNFCeCancel: string read FPathXMLNFCeCancel write FPathXMLNFCeCancel;
    property SavePDF: Boolean read FSavePDF write FSavePDF;
    property PathPDFSortByDate: Boolean read FPathPDFSortByDate write FPathPDFSortByDate;
    property PathPDFNFe: string read FPathPDFNFe write FPathPDFNFe;
    property PathPDFNFeCorrection: string read FPathPDFNFeCorrection write FPathPDFNFeCorrection;
    property PathPDFNFeDisenable: string read FPathPDFNFeDisenable write FPathPDFNFeDisenable;
    property PathPDFNFeCancel: string read FPathPDFNFeCancel write FPathPDFNFeCancel;
    property PathPDFNFCe: string read FPathPDFNFCe write FPathPDFNFCe;
    property PathPDFNFCeDisenable: string read FPathPDFNFCeDisenable write FPathPDFNFCeDisenable;
    property PathPDFNFCeCancel: string read FPathPDFNFCeCancel write FPathPDFNFCeCancel;
    property ErrorRequest: TError read FErrorRequest;
    property LastResponseAPI: TResponseAPI read FLastResponseAPI;
    property FormatSettings: TFormatSettings read FFormatSettings write FFormatSettings;
    function ErrorRequestStr: String;
    function StatusCodeOK(statuscode: Integer): Boolean;
    function cStatNotaEmitida(cStat: Integer): Boolean;

    // Autenticação //
    function login(vAuth: TAuth): TAccessToken; //
    function forget(vAuth: TAuth): String; //
    function Reset(password, resetToken: String; typeUser: TTypeUser): TAccessToken; //
    function logout(vAuth: TAuth): String; //

    // Cadastro System //
    function SystemModify(nameCompany, password: String): TResponseSystem; //
    function SystemModifyUser(vListUserModifySystem: TListUserModifySystem): TResponseUser; //
    function SystemMyAccount: TResponseSystem; //
    function SystemRespTecCSRT(listRespTec: TListRespTecCSRT) : TResponseRespTecCSRT;

    // Cadastro Usuário //
    function UserModify(name, email: String; notification: Boolean; nfce: TNFCeUser): TResponseUser; //
    function UserDelete(ListIdUser: TArray<String>): TResponseUser; //
    function UserRestore(ListIdUser: TArray<String>): TResponseUser; //
    function UserList(pageSize, page: Integer): TResponseUser; //
    function UserAdd(name, email, idExternal, cnpj: String; notification: Boolean; TimeZone: TTimeZone; nfce: TNFCeUser): TResponseUser; //
    function GetUser(ListIdUser: TArray<String>): TResponseUser; //
    function UserMyAccount: TResponseUser; //

    // Cadastro Usuário Notificações //
    function NotificationList(pageSize, page: Integer): TResponseNotification; //
    function NotificationAdd(listNotification: TListNotification): TResponseNotification; //
    function NotificationDelete(listNotification: TListNotification): TResponseNotification; //

    // Certificado //
    function CertificateAdd(certificate: TCertificateFile): TCertificate; //
    function GetCertificate: TCertificate; //

    // Cadastro de Emitente //
    function EmitAdd(emit: TEmit): TEmit; //
    function GetEmit: TEmit; //

    // Cadastro de Autorização de Acesso ao XML //
    function AutXMLAdd(autXML: TListAutXML): TListAutXML; //
    function GetAutXML: TListAutXML; //

    // NFe //
    function NFeEmissionAsync(nfes: TListNFeNFCe): String;
    function NFeEmissionSync(nfe: TNFeNFCe): TResponseConsultNFeNFCe;

    // NFe Eventos //
    function NFeCancelAsync(events: TListEventCancel; const vTpAmb: TAmb; const vTimeZone: TTimeZone): String;
    function NFeCancelSync(event: TEventCancel; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TResponseConsultCancelNFeNFCe;
    function NFeDisenableAsync(events: TListEventDisenable; const vTpAmb: TAmb): String;
    function NFeDisenableSync(event: TEventDisenable; const vTpAmb: TAmb): TResponseConsultDisenableNFeNFCe;
    function NFeCorrectionAsync(events: TListEventCorrection; const vTpAmb: TAmb; const vTimeZone: TTimeZone): String;
    function NFeCorrectionSync(event: TEventCorrection; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TResponseConsultCorrectionNFe;

    // NFe Eventos Consulta Cancelamento //
    function NFeGetEventCancelIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
    function NFeGetEventCancelIdCan(idCan: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
    function NFeGetEventCancelIdDfe(idDfe: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
    function NFeGetEventCancelChaveDFe(ChaveDFe: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;

    // NFe Eventos Consulta Inutilização //
    function NFeGetEventDisenableIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultDisenableNFeNFCe;
    function NFeGetEventDisenableIdInu(idInu: String; pageSize, page: Integer): TResponseConsultDisenableNFeNFCe;

    // NFe Eventos Consulta Carta de Correção //
    function NFeGetEventCorrectionIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultCorrectionNFe;
    function NFeGetEventCorrectionIdCce(idCce: String; pageSize, page: Integer): TResponseConsultCorrectionNFe;
    function NFeGetEventCorrectionidDfe(idDfe: String; pageSize, page: Integer): TResponseConsultCorrectionNFe;
    function NFeGetEventCorrectionChaveDFe(ChaveDFe: String; pageSize, page: Integer): TResponseConsultCorrectionNFe;

    // NFe Consulta XML //
    function NFeGetXMLChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseConsultXMLNFeNFCe;
    function NFeGetXMLNF(nNF, serie: Integer; tpAmb: TAmb): TResponseConsultXMLNFeNFCe;
    function NFeGetXMLIdDFe(idDfe: String): TResponseConsultXMLNFeNFCe;
    function NFeGetXMLIdExternal(idExternal: String): TResponseConsultXMLNFeNFCe;

    // NFe Consulta DANFe //
    function NFeGetDANFeChaveDFe(ChaveDFe: String; tpAmb: TAmb; TipoImpressao: TTipoImpressaoNFe): TResponseConsultDANFeDANFCe;
    function NFeGetDANFeNF(nNF, serie: Integer; tpAmb: TAmb; TipoImpressao: TTipoImpressaoNFe): TResponseConsultDANFeDANFCe;
    function NFeGetDANFeIdDFe(idDfe: String; TipoImpressao: TTipoImpressaoNFe): TResponseConsultDANFeDANFCe;
    function NFeGetDANFeIdExternal(idExternal: String; TipoImpressao: TTipoImpressaoNFe): TResponseConsultDANFeDANFCe;
    function NFeGetDANFeXML(XML: String; TipoImpressao: TTipoImpressaoNFe): TResponseConsultDANFeDANFCe;
    function NFeGetDANFeNFe(nfes: TListNFeNFCe): TResponseDanfPDF;

    // NFe Consulta NFe //
    function NFeGetNFeIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
    function NFeGetNFeChaveDFe(ChaveDFe: String; tpAmb: TAmb; pageSize, page: Integer): TResponseConsultNFeNFCe;
    function NFeGetNFeNF(nNF, serie: Integer; tpAmb: TAmb; pageSize, page: Integer): TResponseConsultNFeNFCe;
    function NFeGetNFeIdDFe(idDfe: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
    function NFeGetNFeIdExternal(idExternal: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
    function NFeGetNFeSefazChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseConsultSefazNFeNFCe;

    // NFe Eventos Impressão Cancelamento //
    function NFeGetEventCancelPrintIdCan(idCan: String): TResponseEventCancelPrint;
    function NFeGetEventCancelPrintIdDfe(idDfe: String): TResponseEventCancelPrint;
    function NFeGetEventCancelPrintChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseEventCancelPrint;

    // NFe Eventos Impressão Inutilização //
    function NFeGetEventDisenablePrintIdInu(idInu: String): TResponseEventDisenablePrint;

    // NFe Eventos Impressão Carta de Correção //
    function NFeGetEventCorrectionPrintIdCce(idCce: String): TResponseEventCorrectionPrint;
    function NFeGetEventCorrectionPrintIdDfe(idDfe: String): TResponseEventCorrectionPrint;
    function NFeGetEventCorrectionPrintChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseEventCorrectionPrint;

    // NFe Consulta Status Serviço //
    function NFeServiceStatus(UF: String; tpAmb: TAmb): TStatusService;

    // NFCe //
    function NFCeEmissionAsync(nfces: TListNFeNFCe): String;
    function NFCeEmissionSync(nfce: TNFeNFCe): TResponseConsultNFeNFCe;

    // NFCe Eventos //
    function NFCeCancelAsync(events: TListEventCancel; const vTpAmb: TAmb; const vTimeZone: TTimeZone): String;
    function NFCeCancelSync(event: TEventCancel; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TResponseConsultCancelNFeNFCe;
    function NFCeDisenableAsync(events: TListEventDisenable; const vTpAmb: TAmb): String;
    function NFCeDisenableSync(event: TEventDisenable; const vTpAmb: TAmb): TResponseConsultDisenableNFeNFCe;

    // NFCe Eventos Consulta Cancelamento //
    function NFCeGetEventCancelIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
    function NFCeGetEventCancelIdCan(idCan: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
    function NFCeGetEventCancelidDfe(idDfe: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
    function NFCeGetEventCancelChaveDFe(ChaveDFe: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;

    // NFCe Eventos Consulta Inutilização //
    function NFCeGetEventDisenableIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultDisenableNFeNFCe;
    function NFCeGetEventDisenableIdInu(idInu: String; pageSize, page: Integer): TResponseConsultDisenableNFeNFCe;

    // NFCe Consulta XML //
    function NFCeGetXMLChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseConsultXMLNFeNFCe;
    function NFCeGetXMLNF(nNF, serie: Integer; tpAmb: TAmb): TResponseConsultXMLNFeNFCe;
    function NFCeGetXMLIdDFe(idDfe: String): TResponseConsultXMLNFeNFCe;
    function NFCeGetXMLIdExternal(idExternal: String): TResponseConsultXMLNFeNFCe;

    // NFCe Consulta DANFe //
    function NFCeGetDANFCeChaveDFe(ChaveDFe: String; tpAmb: TAmb; TipoImpressao: TTipoImpressaoNFCe): TResponseConsultDANFeDANFCe;
    function NFCeGetDANFCeNF(nNF, serie: Integer; tpAmb: TAmb; TipoImpressao: TTipoImpressaoNFCe): TResponseConsultDANFeDANFCe;
    function NFCeGetDANFCeIdDFe(idDfe: String; TipoImpressao: TTipoImpressaoNFCe): TResponseConsultDANFeDANFCe;
    function NFCeGetDANFCeIdExternal(idExternal: String; TipoImpressao: TTipoImpressaoNFCe): TResponseConsultDANFeDANFCe;
    function NFCeGetDANFCeXML(XML: String; TipoImpressao: TTipoImpressaoNFCe): TResponseConsultDANFeDANFCe;
    function NFCeGetDANFCeNFCe(nfes: TListNFeNFCe): TResponseDanfPDF;

    // NFCe Consulta NFCe //
    function NFCeGetNFCeIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
    function NFCeGetNFCeChaveDFe(ChaveDFe: String; tpAmb: TAmb; pageSize, page: Integer): TResponseConsultNFeNFCe;
    function NFCeGetNFCeNF(nNF, serie: Integer; tpAmb: TAmb; pageSize, page: Integer): TResponseConsultNFeNFCe;
    function NFCeGetNFCeIdDFe(idDfe: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
    function NFCeGetNFCeIdExternal(idExternal: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
    function NFCeGetNFCeSefazChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseConsultSefazNFeNFCe;

    // NFCe Eventos Impressão Cancelamento //
    function NFCeGetEventCancelPrintIdCan(idCan: String): TResponseEventCancelPrint;
    function NFCeGetEventCancelPrintIdDfe(idDfe: String): TResponseEventCancelPrint;
    function NFCeGetEventCancelPrintChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseEventCancelPrint;

    // NFCe Eventos Impressão Inutilização //
    function NFCeGetEventDisenablePrintIdInu(idInu: String): TResponseEventDisenablePrint;

    // NFCe Consulta Status Serviço //
    function NFCeServiceStatus(UF: String; tpAmb: TAmb): TStatusService;
  end;

implementation

{ TDadosJahDFe }

uses uDadosJahDFeConsts, uDadosJahDFeConversion, uDadosJahDFeJson;

function TDadosJahDFe.CertificateAdd(certificate: TCertificateFile): TCertificate;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearCertificate;

  if (certificate.FileName.Trim = '') or (certificate.password.Trim = '') then
  begin
    Log('#TDadosJahDFe.CertificateAdd# Caminho do Arquivo do Certificado ou Password não preenchidos.');
    Exit;
  end;

  if (certificate.FileName.Trim <> '') and not FileExists(certificate.FileName) then
  begin
    Log('#TDadosJahDFe.CertificateAdd# Arquivo do Certificado não existe.');
    Exit;
  end;

  if (certificate.FileName.Trim <> '') and (UpperCase(ExtractFileExt(certificate.FileName)) <> '.PFX') then
  begin
    Log('#TDadosJahDFe.CertificateAdd# Extensão inválida, é esperado um arquivo com a extensão ".pfx".');
    Exit;
  end;

  certificate.Extension := ExtractFileExt(certificate.FileName);
  try
    JBody := JsonCertificate(certificate);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.CertificateAdd# ' + E.Message);
      raise Exception.Create(STR_CERTIFICATE_ADD_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.CertificateAdd# ' + STR_CERTIFICATE_ADD);
    resp := Post(RouteToStr(rtCertificate, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToCertificate(resp.Content)
    else
      Log('#TDadosJahDFe.CertificateAdd# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.CertificateAdd# ' + STR_CERTIFICATE_ADD_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.CertificateAdd# ' + STR_CERTIFICATE_ADD_ERRO + ' ' + E.Message);
      raise Exception(STR_CERTIFICATE_ADD_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.GetCertificate: TCertificate;
var
  resp: TResponseAPI;
begin
  Result := ClearCertificate;

  try
    Log('#TDadosJahDFe.GetCertificate# ' + STR_CERTIFICATE_GET);
    resp := Get(RouteToStr(rtCertificate, FVersionAPI), nil);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToCertificate(resp.Content)
    else
      Log('#TDadosJahDFe.GetCertificate# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.GetCertificate# ' + STR_CERTIFICATE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.GetCertificate# ' + STR_CERTIFICATE_GET_ERRO + ' ' + E.Message);
      raise Exception(STR_CERTIFICATE_GET_ERRO + ' ' + E.Message);
    end;
  end;
end;

constructor TDadosJahDFe.Create(AVersionAPI: TVersionAPI; ATimeOut: Integer; AGenerateLog, AGenerateLogRequestContent, AGenerateLogResponseContent: Boolean; ALogPath: String;
  ASaveJSONRequest, ASaveJSONResponse: Boolean; ASaveJSONPath: String; ASaveXML, APathXMLSortByDate: Boolean; APathXMLNFe, APathXMLNFeCorrection, APathXMLNFeDisenable,
  APathXMLNFeCancel, APathXMLNFCe, APathXMLNFCeDisenable, APathXMLNFCeCancel: string; ASavePDF, APathPDFSortByDate: Boolean; APathPDFNFe, APathPDFNFeCorrection,
  APathPDFNFeDisenable, APathPDFNFeCancel, APathPDFNFCe, APathPDFNFCeDisenable, APathPDFNFCeCancel: string; ATimeZone: TTimeZone; AFormatSettings: TFormatSettings);
begin
  inherited Create;

  FVersionAPI := AVersionAPI;
  FTimeOut := ATimeOut;
  FGenerateLog := AGenerateLog;
  FGenerateLogRequestContent := AGenerateLogRequestContent;
  FGenerateLogResponseContent := AGenerateLogResponseContent;
  FLogPath := ALogPath;
  FSaveJSONRequest := ASaveJSONRequest;
  FSaveJSONResponse := ASaveJSONResponse;
  FSaveJSONPath := ASaveJSONPath;
  FSaveXML := ASaveXML;
  FPathXMLSortByDate := APathXMLSortByDate;
  FPathXMLNFe := APathXMLNFe;
  FPathXMLNFeCorrection := APathXMLNFeCorrection;
  FPathXMLNFeDisenable := APathXMLNFeDisenable;
  FPathXMLNFeCancel := APathXMLNFeCancel;
  FPathXMLNFCe := APathXMLNFCe;
  FPathXMLNFCeDisenable := APathXMLNFCeDisenable;
  FPathXMLNFCeCancel := APathXMLNFCeCancel;
  FSavePDF := ASavePDF;
  FPathPDFSortByDate := APathPDFSortByDate;
  FPathPDFNFe := APathPDFNFe;
  FPathPDFNFeCorrection := APathPDFNFeCorrection;
  FPathPDFNFeDisenable := APathPDFNFeDisenable;
  FPathPDFNFeCancel := APathPDFNFeCancel;
  FPathPDFNFCe := APathPDFNFCe;
  FPathPDFNFCeDisenable := APathPDFNFCeDisenable;
  FPathPDFNFCeCancel := APathPDFNFCeCancel;
  FTimeZone := ATimeZone;
  FFormatSettings := AFormatSettings;
end;

constructor TDadosJahDFe.Create;
begin
  inherited Create;

  FVersionAPI := v1;
  FTimeOut := 60; // 60 segundos padrão. O mínimo é de 10 segundos e o máximo é de 120 segundos.
  FGenerateLog := False;
  FGenerateLogRequestContent := False;
  FGenerateLogResponseContent := False;
  FLogPath := '';
  FTimeZone := tzLess0300; // Padrão Brasilia
  FFormatSettings.DateSeparator := '-';
  FFormatSettings.TimeSeparator := ':';
  FFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  FFormatSettings.LongTimeFormat := 'hh:nn:ss';
  FFormatSettings.DecimalSeparator := '.';
end;

function TDadosJahDFe.forget(vAuth: TAuth): String;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := '';
  if (vAuth.email.Trim = '') then
  begin
    Log('#TDadosJahDFe.forget# Email não preenchido.');
    Exit;
  end;

  try
    JBody := JsonAuthForget(vAuth.email.Trim);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.forget# ' + E.Message);
      raise Exception.Create(STR_FORGET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.forget# ' + IfThen(vAuth._Type = tuSystem, STR_FORGET_SYSTEM, STR_FORGET_USER));
    if vAuth._Type = tuSystem then
      resp := Post(RouteToStr(rtAuthSystemForget, FVersionAPI), JBody)
    else
      resp := Post(RouteToStr(rtAuthUserForget, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToForget(resp.Content)
    else
      Log('#TDadosJahDFe.forget# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.forget# ' + STR_FORGET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' + resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.forget# ' + STR_FORGET_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_FORGET_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.Reset(password, resetToken: String; typeUser: TTypeUser): TAccessToken;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearAccessToken;
  if (password.Trim = '') or (resetToken.Trim = '') then
  begin
    Log('#TDadosJahDFe.Reset# Email ou Password não preenchidos.');
    Exit;
  end;

  try
    JBody := JsonAuthReset(password, resetToken);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.Reset# ' + E.Message);
      raise Exception.Create(STR_RESET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.Reset# ' + IfThen(typeUser = tuSystem, STR_RESET_SYSTEM, STR_RESET_USER));
    if typeUser = tuSystem then
      resp := Post(RouteToStr(rtAuthSystemReset, FVersionAPI), JBody)
    else
      resp := Post(RouteToStr(rtAuthUserReset, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToReset(resp.Content)
    else
      Log('#TDadosJahDFe.Reset# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));

    FToken.accessToken := Result.accessToken;
    FToken.expiresAt := Result.expiresAt;
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.Reset# ' + STR_RESET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' + resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.Reset# ' + STR_RESET_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_RESET_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.logout(vAuth: TAuth): String;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := '';
  if (vAuth.email.Trim = '') or (vAuth.password.Trim = '') then
  begin
    Log('#TDadosJahDFe.logout# Email ou Password não preenchidos.');
    Exit;
  end;

  try
    JBody := JsonAuthLogin(vAuth);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.logout# ' + E.Message);
      raise Exception.Create(STR_LOGOUT_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.logout# ' + IfThen(vAuth._Type = tuSystem, STR_LOGOUT_SYSTEM, STR_LOGOUT_USER));
    if vAuth._Type = tuSystem then
      resp := Post(RouteToStr(rtAuthSystemLogout, FVersionAPI), JBody)
    else
      resp := Post(RouteToStr(rtAuthUserLogout, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToLogout(resp.Content)
    else
      Log('#TDadosJahDFe.logout# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));

  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.logout# ' + STR_LOGOUT_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' + resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.logout# ' + STR_LOGOUT_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_LOGOUT_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.Get(Route: String; Params: TRESTRequestParameterList): TResponseAPI;
var
  RestClient: TRESTClient;
  RestRequest: TRESTRequest;
begin
  RestClient := TRESTClient.Create(URLBASE);
  RestRequest := TRESTRequest.Create(nil);
  InitializeRest(RestClient, RestRequest, Route, rmGET);
  ClearResponseAPI;
  ClearRequestError;
  AddParams(RestRequest, Params);

  if FGenerateLogRequestContent then
    Log('#TDadosJahDFe.Get# Route: ' + Route);
  try
    try
      RestRequest.Execute;
    except
      on E: Exception do
        Log('#TDadosJahDFe.Get# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' +
          RestRequest.Response.StatusText + '. Mensagem' + E.Message);
    end;
  finally
    if FGenerateLogResponseContent then
      Log('#TDadosJahDFe.Get# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' + RestRequest.Response.StatusText +
        '; Content: ' + RestRequest.Response.Content);
    Result := FillResponseAPI(RestRequest.Response.statuscode, RestRequest);
    RestClient.Free;
    RestRequest.Free;
    if FSaveJSONResponse then
      SaveJSON(Result.Content, Route, tResponse);
  end;
end;

function TDadosJahDFe.Get(Route: String; Params: TRESTRequestParameterList; BodyJson: TJsonObject): TResponseAPI;
var
  RestClient: TRESTClient;
  RestRequest: TRESTRequest;
begin
  RestClient := TRESTClient.Create(URLBASE);
  RestRequest := TRESTRequest.Create(nil);
  InitializeRest(RestClient, RestRequest, Route, rmGET);
  ClearResponseAPI;
  ClearRequestError;
  AddParams(RestRequest, Params);

  if Assigned(BodyJson) then
  begin
    RestRequest.AddBody(BodyJson);
    if FSaveJSONRequest then
      SaveJSON(BodyJson.ToString, Route, tRequest);
  end;
  if FGenerateLogRequestContent then
    Log('#TDadosJahDFe.Get# Route: ' + Route + '; Body: ' + IfThen(Assigned(BodyJson), BodyJson.ToString, ''));
  try
    try
      RestRequest.Execute;
    except
      on E: Exception do
        Log('#TDadosJahDFe.Get# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' +
          RestRequest.Response.StatusText + '. Mensagem' + E.Message);
    end;
  finally
    if FGenerateLogResponseContent then
      Log('#TDadosJahDFe.Get# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' + RestRequest.Response.StatusText +
        '; Content: ' + RestRequest.Response.Content);
    Result := FillResponseAPI(RestRequest.Response.statuscode, RestRequest);
    RestClient.Free;
    RestRequest.Free;
    if FSaveJSONResponse then
      SaveJSON(Result.Content, Route, tResponse);
  end;
end;

function TDadosJahDFe.Get(Route: String; Params: TRESTRequestParameterList; BodyArray: TJSONArray): TResponseAPI;
var
  RestClient: TRESTClient;
  RestRequest: TRESTRequest;
begin
  RestClient := TRESTClient.Create(URLBASE);
  RestRequest := TRESTRequest.Create(nil);
  InitializeRest(RestClient, RestRequest, Route, rmGET);
  ClearResponseAPI;
  ClearRequestError;
  AddParams(RestRequest, Params);

  if Assigned(BodyArray) then
  begin
    RestRequest.AddBody(BodyArray);
    if FSaveJSONRequest then
      SaveJSON(BodyArray.ToString, Route, tRequest);
  end;
  if FGenerateLogRequestContent then
    Log('#TDadosJahDFe.Get# Route: ' + Route + '; Body: ' + IfThen(Assigned(BodyArray), BodyArray.ToString, ''));
  try
    try
      RestRequest.Execute;
    except
      on E: Exception do
        Log('#TDadosJahDFe.Get# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' +
          RestRequest.Response.StatusText + '. Mensagem' + E.Message);
    end;
  finally
    if FGenerateLogResponseContent then
      Log('#TDadosJahDFe.Get# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' + RestRequest.Response.StatusText +
        '; Content: ' + RestRequest.Response.Content);
    Result := FillResponseAPI(RestRequest.Response.statuscode, RestRequest);
    RestClient.Free;
    RestRequest.Free;
    if FSaveJSONResponse then
      SaveJSON(Result.Content, Route, tResponse);
  end;
end;

procedure TDadosJahDFe.ClearRequestError;
begin
  FErrorRequest := ClearError;
end;

procedure TDadosJahDFe.ClearResponseAPI;
begin
  FLastResponseAPI := ClearResponse;
end;

procedure TDadosJahDFe.Log(Text: String);
var
  F: TextFile;
  FileName: String;
begin
  if not FGenerateLog or (FLogPath.Trim = '') then
    Exit;

  try
    if not ForceDirectories(FLogPath + '\' + FormatDateTime('yyyy', Date) + '\' + FormatDateTime('MM', Date)) then
      Exit;

    FileName := FLogPath + '\' + FormatDateTime('yyyy', Date) + '\' + FormatDateTime('MM', Date) + '\' + FormatDateTime('dd', Date) + '.log';
    AssignFile(F, FileName);
    if FileExists(FileName) then
      Append(F)
    else
      Rewrite(F);
    Writeln(F, FormatDateTime('dd/MM/yyyy hh:mm:ss.zzz', Now) + ' => ' + Text);
    Flush(F);
    CloseFile(F);
  except
  end;
end;

procedure TDadosJahDFe.SaveJSON(JSON, Route: String; ReqResp: TRequestResponseAPI);
var
  Str: TStringList;

  function RoutLoginReset: Boolean;
  begin
    Result := ((Pos('/login', Route) > 0) or (Pos('/reset', Route) > 0)) and (ReqResp = tRequest);
  end;

begin
  if (FSaveJSONPath.Trim = '') or (JSON.Trim = '') or RoutLoginReset then
    Exit;

  Str := TStringList.Create;
  try
    try
      if not ForceDirectories(FSaveJSONPath + '\' + FormatDateTime('yyyy', Date) + '\' + FormatDateTime('MM', Date) + '\' + FormatDateTime('DD', Date)) then
        Exit;

      Str.Add(JSON);
      Str.SaveToFile(FSaveJSONPath + '\' + FormatDateTime('yyyy', Date) + '\' + FormatDateTime('MM', Date) + '\' + FormatDateTime('DD', Date) + '\' +
        IfThen(ReqResp = tResponse, 'Response', 'Request') + '_' + IfThen(Route.Trim = '', '', ReplaceStr(Route.Trim, '/', '-') + '_') + FormatDateTime('yymmddhhnnsszzz', Now) + '.json');
    except
      on E: Exception do
        Log('#TDadosJahDFe.SaveJSON# Erro ao gravar o Json. Route: ' + Route + '; ReqResp: ' + IfThen(ReqResp = tResponse, 'Response', 'Request') + '. ' + E.Message.Trim);
    end;
  finally
    Str.Free;
  end;
end;

procedure TDadosJahDFe.SaveXMLFile(XML: String; FileType: TSaveXMLPDFFile; FileName: String; FileDate: TDate);
var
  Str: TStringList;
  FPath: String;

  function GeneratePath: String;
  begin
    Result := '';
    if FileType = tsxfNFe then
      Result := FPathXMLNFe.Trim
    else if FileType = tsxfNFeCorrection then
      Result := FPathXMLNFeCorrection.Trim
    else if FileType = tsxfNFeDisenable then
      Result := FPathXMLNFeDisenable.Trim
    else if FileType = tsxfNFeCancel then
      Result := FPathXMLNFeCancel.Trim
    else if FileType = tsxfNFCe then
      Result := FPathXMLNFCe.Trim
    else if FileType = tsxfNFCeDisenable then
      Result := FPathXMLNFCeDisenable.Trim
    else if FileType = tsxfNFCeCancel then
      Result := FPathXMLNFCeCancel.Trim;

    Result := Result + '\' + IfThen(FPathXMLSortByDate, FormatDateTime('yyyy', FileDate) + '\' + FormatDateTime('MM', FileDate) + '\' + FormatDateTime('DD', FileDate), '');
  end;

begin
  if (((FileType = tsxfNFe) and (FPathXMLNFe.Trim = '')) or ((FileType = tsxfNFeCorrection) and (FPathXMLNFeCorrection.Trim = '')) or
    ((FileType = tsxfNFeDisenable) and (FPathXMLNFeDisenable.Trim = '')) or ((FileType = tsxfNFeCancel) and (FPathXMLNFeCancel.Trim = '')) or
    ((FileType = tsxfNFCe) and (FPathXMLNFCe.Trim = '')) or ((FileType = tsxfNFCeDisenable) and (FPathXMLNFCeDisenable.Trim = '')) or
    ((FileType = tsxfNFCeCancel) and (FPathXMLNFCeCancel.Trim = ''))) or (FileName.Trim = '') or (XML.Trim = '') then
    Exit;

  FPath := GeneratePath;
  Str := TStringList.Create;
  try
    try
      if not ForceDirectories(FPath) then
        Exit;
      Str.Add(XML);
      Str.SaveToFile(FPath + '\' + ReplaceStr(FileName, '.xml', '') + '.xml');
    except
      on E: Exception do
        Log('#TDadosJahDFe.SaveXMLFile# Erro ao gravar o XML. FileName: ' + FileName + '; FileType: ' + SaveXMLPDFFileToStr(FileType) + '; FileDate: ' +
          FormatDateTime('dd/mm/yyyy', FileDate) + '. ' + E.Message.Trim);
    end;
  finally
    Str.Free;
  end;
end;

procedure TDadosJahDFe.SaveXMLFilesNFeNFCe(List: TListResponseEmissionNFeNFCe; FileType: TSaveXMLPDFFile);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SaveXMLFile(List[I].XML, FileType, List[I].chDfe, List[I].dhEmi);
end;

procedure TDadosJahDFe.SaveXMLFilesXMLNFeNFCe(List: TListResponseXMLNFeNFCe; FileType: TSaveXMLPDFFile);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SaveXMLFile(List[I].XML, FileType, List[I].chDfe, List[I].dhEmi);
end;

procedure TDadosJahDFe.SaveXMLFilesCancelNFeNFCe(List: TListResponseCancelNFeNFCe; FileType: TSaveXMLPDFFile);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SaveXMLFile(List[I].XML, FileType, List[I].chDfe, List[I].dhEnv);
end;

procedure TDadosJahDFe.SaveXMLFilesDisenableNFeNFCe(List: TListResponseDisenableNFeNFCe; FileType: TSaveXMLPDFFile);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SaveXMLFile(List[I].XML, FileType, List[I].idInu, List[I].dhEnv);
end;

procedure TDadosJahDFe.SaveXMLFilesCorrectionNFe(List: TListResponseCorrectionNFe);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SaveXMLFile(List[I].XML, tsxfNFeCorrection, List[I].chDfe, List[I].dhEnv);
end;

procedure TDadosJahDFe.SavePDFFile(PDFBase64: String; FileType: TSaveXMLPDFFile; FileName: String; FileDate: TDate);
var
  FPath: String;

  function GeneratePath: String;
  begin
    Result := '';
    if FileType = tsxfNFe then
      Result := FPathPDFNFe.Trim
    else if FileType = tsxfNFeCorrection then
      Result := FPathPDFNFeCorrection.Trim
    else if FileType = tsxfNFeDisenable then
      Result := FPathPDFNFeDisenable.Trim
    else if FileType = tsxfNFeCancel then
      Result := FPathPDFNFeCancel.Trim
    else if FileType = tsxfNFCe then
      Result := FPathPDFNFCe.Trim
    else if FileType = tsxfNFCeDisenable then
      Result := FPathPDFNFCeDisenable.Trim
    else if FileType = tsxfNFCeCancel then
      Result := FPathPDFNFCeCancel.Trim;

    Result := Result + '\' + IfThen(FPathPDFSortByDate, FormatDateTime('yyyy', FileDate) + '\' + FormatDateTime('MM', FileDate) + '\' + FormatDateTime('DD', FileDate), '');
  end;

begin
  if (((FileType = tsxfNFe) and (FPathPDFNFe.Trim = '')) or ((FileType = tsxfNFeCorrection) and (FPathPDFNFeCorrection.Trim = '')) or
    ((FileType = tsxfNFeDisenable) and (FPathPDFNFeDisenable.Trim = '')) or ((FileType = tsxfNFeCancel) and (FPathPDFNFeCancel.Trim = '')) or
    ((FileType = tsxfNFCe) and (FPathPDFNFCe.Trim = '')) or ((FileType = tsxfNFCeDisenable) and (FPathPDFNFCeDisenable.Trim = '')) or
    ((FileType = tsxfNFCeCancel) and (FPathPDFNFCeCancel.Trim = ''))) or (FileName.Trim = '') or (PDFBase64.Trim = '') then
    Exit;

  FPath := GeneratePath;
  try
    if not ForceDirectories(FPath) then
      Exit;

    FileName := FPath + '\' + ReplaceStr(FileName, '.pdf', '') + '.pdf';
    if not Base64ToFile(PDFBase64, FileName.Trim) then
      Log('#TDadosJahDFe.SavePDFFile# Erro ao gravar o PDF. FileName: ' + FileName + '; FileType: ' + SaveXMLPDFFileToStr(FileType) + '; FileDate: ' +
        FormatDateTime('dd/mm/yyyy', FileDate));
  except
    on E: Exception do
      Log('#TDadosJahDFe.SavePDFFile# Erro ao gravar o PDF. FileName: ' + FileName + '; FileType: ' + SaveXMLPDFFileToStr(FileType) + '; FileDate: ' +
        FormatDateTime('dd/mm/yyyy', FileDate) + '. ' + E.Message);
  end;
end;

procedure TDadosJahDFe.SavePDFFilesNFeNFCe(List: TListResponseEmissionNFeNFCe; FileType: TSaveXMLPDFFile);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SavePDFFile(List[I].PDFBase64, FileType, List[I].chDfe, List[I].dhEmi);
end;

procedure TDadosJahDFe.SavePDFFilesCancelNFeNFCe(List: TListResponseCancelNFeNFCe; FileType: TSaveXMLPDFFile);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SavePDFFile(List[I].PDFBase64, FileType, List[I].chDfe, List[I].dhEnv);
end;

procedure TDadosJahDFe.SavePDFFilesDisenableNFeNFCe(List: TListResponseDisenableNFeNFCe; FileType: TSaveXMLPDFFile);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SavePDFFile(List[I].PDFBase64, FileType, List[I].idInu, List[I].dhEnv);
end;

procedure TDadosJahDFe.SavePDFFilesCorrectionNFe(List: TListResponseCorrectionNFe);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SavePDFFile(List[I].PDFBase64, tsxfNFeCorrection, List[I].chDfe, List[I].dhEnv);
end;

procedure TDadosJahDFe.SavePDFFilesCancelPrintNFeNFCe(List: TListEventCancelPrint; FileType: TSaveXMLPDFFile);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SavePDFFile(List[I].PDFBase64, FileType, List[I].chDfe, List[I].dhEnv);
end;

procedure TDadosJahDFe.SavePDFFilesDisenablePrintNFeNFCe(List: TListEventDisenablePrint; FileType: TSaveXMLPDFFile);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SavePDFFile(List[I].PDFBase64, FileType, List[I].idInu, List[I].dhEnv);
end;

procedure TDadosJahDFe.SavePDFFilesCorrectionPrintNFe(List: TListEventCorrectionPrint);
var
  I: Integer;
begin
  for I := 0 to High(List) do
    SavePDFFile(List[I].PDFBase64, tsxfNFeCorrection, List[I].chDfe, List[I].dhEnv);
end;

function TDadosJahDFe.login(vAuth: TAuth): TAccessToken;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearAccessToken;
  if (vAuth.email.Trim = '') or (vAuth.password.Trim = '') then
  begin
    Log('#TDadosJahDFe.login# Email ou Password não preenchidos.');
    Exit;
  end;

  try
    JBody := JsonAuthLogin(vAuth);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.login# ' + E.Message);
      raise Exception.Create(STR_LOGIN_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.login# ' + IfThen(vAuth._Type = tuSystem, STR_LOGIN_SYSTEM, STR_LOGIN_USER));
    if vAuth._Type = tuSystem then
      resp := Post(RouteToStr(rtAuthSystemLogin, FVersionAPI), JBody)
    else
      resp := Post(RouteToStr(rtAuthUserLogin, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToAccessToken(resp.Content)
    else
      Log('#TDadosJahDFe.login# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));

    FToken.accessToken := Result.accessToken;
    FToken.expiresAt := Result.expiresAt;
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.login# ' + STR_LOGIN_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.login# ' + STR_LOGIN_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_LOGIN_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFCeCancelAsync(events: TListEventCancel; const vTpAmb: TAmb; const vTimeZone: TTimeZone): String;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := '';

  if (Length(events) = 0) then
  begin
    Log('#TDadosJahDFe.NFCeCancelAsync# Não há eventos de cancelamentos preenchidos.');
    Exit;
  end;

  try
    JBody := JsonCancelNFeNFCe(events, True, vTpAmb, vTimeZone);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeCancelAsync# ' + E.Message);
      raise Exception.Create(STR_NFCE_CANCEL_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFCeCancelAsync# ' + STR_NFCE_CANCEL_ASSYNC);
    resp := Post(RouteToStr(rtNFCeCancel, FVersionAPI), JBody);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToIdBatch(resp.Content)
    else
      Log('#TDadosJahDFe.NFCeCancelAsync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFCeCancelAsync# ' + STR_NFCE_CANCEL_ASSYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFCeCancelAsync# ' + STR_NFCE_CANCEL_ASSYNC_ERRO + ' ' + E.Message);
      raise Exception(STR_NFCE_CANCEL_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFCeCancelSync(event: TEventCancel; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TResponseConsultCancelNFeNFCe;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  try
    JBody := JsonCancelNFeNFCe(event, False, vTpAmb, vTimeZone);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeCancelSync# ' + E.Message);
      raise Exception.Create(STR_NFCE_CANCEL_SYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFCeCancelSync# ' + STR_NFCE_CANCEL_SYNC);
    resp := Post(RouteToStr(rtNFCeCancel, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
    begin
      Result := ParseJSONToResponseConsultCancelNFeNFCe(resp.Content);
      if FSaveXML then // Sincrono, apenas uma nota por vez
        SaveXMLFile(Result.ListEvent[0].XML, tsxfNFCeCancel, Result.ListEvent[0].chDfe, Result.ListEvent[0].dhEnv);
      if FSavePDF then // Sincrono, apenas uma nota por vez
        SavePDFFile(Result.ListEvent[0].PDFBase64, tsxfNFCeCancel, Result.ListEvent[0].chDfe, Result.ListEvent[0].dhEnv);
    end
    else
      Log('#TDadosJahDFe.NFCeCancelSync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFCeCancelSync# ' + STR_NFCE_CANCEL_SYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFCeCancelSync# ' + STR_NFCE_CANCEL_SYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFCE_CANCEL_SYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFCeDisenableAsync(events: TListEventDisenable; const vTpAmb: TAmb): String;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := '';

  if (Length(events) = 0) then
  begin
    Log('#TDadosJahDFe.NFCeDisenableAsync# Não há eventos de inutilização preenchidas.');
    Exit;
  end;

  try
    JBody := JsonDisenableNFeNFCe(events, True, vTpAmb);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeDisenableAsync# ' + E.Message);
      raise Exception.Create(STR_NFCE_DISENABLE_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFCeDisenableAsync# ' + STR_NFCE_DISENABLE_ASSYNC);
    resp := Post(RouteToStr(rtNFCeDisenable, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToIdBatch(resp.Content)
    else
      Log('#TDadosJahDFe.NFCeDisenableAsync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFCeDisenableAsync# ' + STR_NFCE_DISENABLE_ASSYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFCeDisenableAsync# ' + STR_NFCE_DISENABLE_ASSYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFCE_DISENABLE_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFCeDisenableSync(event: TEventDisenable; const vTpAmb: TAmb): TResponseConsultDisenableNFeNFCe;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultDisenableNFeNFCe;

  try
    JBody := JsonDisenableNFeNFCe(event, False, vTpAmb);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeDisenableSync# ' + E.Message);
      raise Exception.Create(STR_NFCE_DISENABLE_SYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFCeDisenableSync# ' + STR_NFCE_DISENABLE_SYNC);
    resp := Post(RouteToStr(rtNFCeDisenable, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
    begin
      Result := ParseJSONToResponseConsultDisenableNFeNFCe(resp.Content);
      if FSaveXML then
        SaveXMLFile(Result.ListEvent[0].XML, tsxfNFCeDisenable, Result.ListEvent[0].idInu, Result.ListEvent[0].dhEnv);
      if FSavePDF then
        SavePDFFile(Result.ListEvent[0].PDFBase64, tsxfNFCeDisenable, Result.ListEvent[0].idInu, Result.ListEvent[0].dhEnv);
    end
    else
      Log('#TDadosJahDFe.NFCeDisenableSync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFCeDisenableSync# ' + STR_NFCE_DISENABLE_SYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFCeDisenableSync# ' + STR_NFCE_DISENABLE_SYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFCE_DISENABLE_SYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFCeEmissionAsync(nfces: TListNFeNFCe): String;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := '';

  if (Length(nfces) = 0) then
  begin
    Log('#TDadosJahDFe.NFCeEmissionAsync# Não há notas preenchidas.');
    Exit;
  end;

  try
    JBody := JsonNFCeEmission(nfces, True, TimeZone, FormatSettings);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeEmissionAsync# ' + E.Message);
      raise Exception.Create(STR_NFCE_EMISSION_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFCeEmissionAsync# ' + STR_NFCE_EMISSION_ASSYNC);
    resp := Post(RouteToStr(rtNFCe, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToIdBatch(resp.Content)
    else
      Log('#TDadosJahDFe.NFCeEmissionAsync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFCeEmissionAsync# ' + STR_NFCE_EMISSION_ASSYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFCeEmissionAsync# ' + STR_NFCE_EMISSION_ASSYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFCE_EMISSION_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFCeEmissionSync(nfce: TNFeNFCe): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  try
    JBody := JsonNFCeEmission(nfce, False, TimeZone, FormatSettings);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeEmissionSync# ' + E.Message);
      raise Exception.Create(STR_NFCE_EMISSION_SYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFeEmissionSync# ' + STR_NFCE_EMISSION_SYNC);
    resp := Post(RouteToStr(rtNFCe, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
    begin
      Result := ParseJSONToResponseEmissionNFCe(resp.Content);
      if FSaveXML and cStatNotaEmitida(Result.ListNFeNFCe[0].cStat) then // Sincrono, apenas uma nota por vez
        SaveXMLFile(Result.ListNFeNFCe[0].XML, tsxfNFCe, Result.ListNFeNFCe[0].chDfe, Result.ListNFeNFCe[0].dhEmi);
      if FSavePDF and cStatNotaEmitida(Result.ListNFeNFCe[0].cStat) then // Sincrono, apenas uma nota por vez
        SavePDFFile(Result.ListNFeNFCe[0].PDFBase64, tsxfNFCe, Result.ListNFeNFCe[0].chDfe, Result.ListNFeNFCe[0].dhEmi);
    end
    else
      Log('#TDadosJahDFe.NFeEmissionSync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFeEmissionSync# ' + STR_NFCE_EMISSION_SYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFeEmissionSync# ' + STR_NFCE_EMISSION_SYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFCE_EMISSION_SYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFCeGetDANFCeChaveDFe(ChaveDFe: String; tpAmb: TAmb; TipoImpressao: TTipoImpressaoNFCe): TResponseConsultDANFeDANFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpDanfCe', TipoImpressaoNFCeToStr(TipoImpressao), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetDANFCeChaveDFe# ' + STR_NFCE_DANFCE_GET);
      resp := Get(RouteToStr(rtNFCeDANFCe, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultDANFCe(resp.Content)
      else
        Log('#TDadosJahDFe.NFCeGetDANFCeChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetDANFCeChaveDFe# ' + STR_NFCE_DANFCE_GET_ERRO + '  StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetDANFCeChaveDFe# ' + STR_NFCE_DANFCE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_DANFCE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetDANFCeIdDFe(idDfe: String; TipoImpressao: TTipoImpressaoNFCe): TResponseConsultDANFeDANFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpDanfCe', TipoImpressaoNFCeToStr(TipoImpressao), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetDANFCeIdDFe# ' + STR_NFCE_DANFCE_GET);
      resp := Get(RouteToStr(rtNFCeDANFCe, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultDANFCe(resp.Content)
      else
        Log('#TDadosJahDFe.NFCeGetDANFCeIdDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetDANFCeIdDFe# ' + STR_NFCE_DANFCE_GET_ERRO + '  StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetDANFCeIdDFe# ' + STR_NFCE_DANFCE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_DANFCE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetDANFCeIdExternal(idExternal: String; TipoImpressao: TTipoImpressaoNFCe): TResponseConsultDANFeDANFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idExternal', idExternal, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpDanfCe', TipoImpressaoNFCeToStr(TipoImpressao), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetDANFCeIdExternal# ' + STR_NFCE_DANFCE_GET);
      resp := Get(RouteToStr(rtNFCeDANFCe, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultDANFCe(resp.Content)
      else
        Log('#TDadosJahDFe.NFCeGetDANFCeIdExternal# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetDANFCeIdExternal# ' + STR_NFCE_DANFCE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetDANFCeIdExternal# ' + STR_NFCE_DANFCE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_DANFCE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetDANFCeNF(nNF, serie: Integer; tpAmb: TAmb; TipoImpressao: TTipoImpressaoNFCe): TResponseConsultDANFeDANFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('nNF', nNF.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('serie', serie.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpDanfCe', TipoImpressaoNFCeToStr(TipoImpressao), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetDANFCeNF# ' + STR_NFCE_DANFCE_GET);
      resp := Get(RouteToStr(rtNFCeDANFCe, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultDANFCe(resp.Content)
      else
        Log('#TDadosJahDFe.NFCeGetDANFCeNF# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetDANFCeNF# ' + STR_NFCE_DANFCE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetDANFCeNF# ' + STR_NFCE_DANFCE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_DANFCE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetDANFCeXML(XML: String; TipoImpressao: TTipoImpressaoNFCe): TResponseConsultDANFeDANFCe;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  if (XML.Trim = '') then
  begin
    Log('#TDadosJahDFe.NFCeGetDANFCeXML# O XML não está preenchido.');
    Exit;
  end;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonXML(XML);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetDANFCeXML# ' + E.Message);
      raise Exception.Create('Erro ao tentar baixar o DANFCe. ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('tpDanfCe', TipoImpressaoNFCeToStr(TipoImpressao), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetDANFCeXML# ' + STR_NFCE_DANFCE_GET);
      resp := Get(RouteToStr(rtNFCeDANFCe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultDANFCe(resp.Content)
      else
        Log('#TDadosJahDFe.NFCeGetDANFCeXML# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetDANFCeXML# ' + STR_NFCE_DANFCE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetDANFCeXML# ' + STR_NFCE_DANFCE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_DANFCE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetDANFCeNFCe(nfes: TListNFeNFCe): TResponseDanfPDF;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseDanfPDF;

  if (Length(nfes) = 0) then
  begin
    Log('#TDadosJahDFe.NFCeGetDANFCeNFCe# Não há notas preenchidas.');
    Exit;
  end;

  try
    JBody := JsonNFeEmission(nfes, False, TimeZone, FormatSettings);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetDANFCeNFCe# ' + E.Message);
      raise Exception.Create(STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try;
    Log('#TDadosJahDFe.NFCeGetDANFCeNFCe# ' + STR_NFE_DANFE_GET);
    resp := Get(RouteToStr(rtNFCeDANFCe, FVersionAPI), nil, JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseDanfePDF(resp.Content)
    else
      Log('#TDadosJahDFe.NFCeGetDANFCeNFCe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFCeGetDANFCeNFCe# ' + STR_NFE_DANFE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFCeGetDANFCeNFCe# ' + STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
      raise Exception(STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFCeGetEventCancelChaveDFe(ChaveDFe: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetEventCancelChaveDFe# ' + E.Message);
      raise Exception.Create(STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetEventCancelChaveDFe# ' + STR_NFCE_EVENT_CANCEL_GET);
      resp := Get(RouteToStr(rtNFCeCancel, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCancelNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCancelNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
        if FSavePDF then
          SavePDFFilesCancelNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
      end
      else
        Log('#TDadosJahDFe.NFCeGetEventCancelChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetEventCancelChaveDFe# ' + STR_NFCE_EVENT_CANCEL_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetEventCancelChaveDFe# ' + STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetEventCancelIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetEventCancelIdBatch# ' + E.Message);
      raise Exception.Create(STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idBatch', idBatch, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetEventCancelIdBatch# ' + STR_NFCE_EVENT_CANCEL_GET);
      resp := Get(RouteToStr(rtNFCeCancel, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCancelNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCancelNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
        if FSavePDF then
          SavePDFFilesCancelNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
      end
      else
        Log('#TDadosJahDFe.NFCeGetEventCancelIdBatch# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetEventCancelIdBatch# ' + STR_NFCE_EVENT_CANCEL_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetEventCancelIdBatch# ' + STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetEventCancelIdCan(idCan: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetEventCancelIdCan# ' + E.Message);
      raise Exception.Create(STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idCan', idCan, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetEventCancelIdCan# ' + STR_NFCE_EVENT_CANCEL_GET);
      resp := Get(RouteToStr(rtNFCeCancel, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCancelNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCancelNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
        if FSavePDF then
          SavePDFFilesCancelNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
      end
      else
        Log('#TDadosJahDFe.NFCeGetEventCancelIdCan# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetEventCancelIdCan# ' + STR_NFCE_EVENT_CANCEL_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetEventCancelIdCan# ' + STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetEventCancelidDfe(idDfe: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetEventCancelidDfe# ' + E.Message);
      raise Exception.Create(STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetEventCancelidDfe# ' + STR_NFCE_EVENT_CANCEL_GET);
      resp := Get(RouteToStr(rtNFCeCancel, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCancelNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCancelNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
        if FSavePDF then
          SavePDFFilesCancelNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
      end
      else
        Log('#TDadosJahDFe.NFCeGetEventCancelidDfe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetEventCancelidDfe# ' + STR_NFCE_EVENT_CANCEL_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetEventCancelidDfe# ' + STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetEventCancelPrintChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseEventCancelPrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventCancelPrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetEventCancelPrintChaveDFe# ' + STR_NFCE_EVENT_CANCEL_PRINT_GET);
      resp := Get(RouteToStr(rtNFCeCancelPrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventCancelPrint(resp.Content);
        if FSavePDF then
          SavePDFFilesCancelPrintNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
      end
      else
        Log('#TDadosJahDFe.NFCeGetEventCancelPrintChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetEventCancelPrintChaveDFe# ' + STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetEventCancelPrintChaveDFe# ' + STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetEventCancelPrintIdCan(idCan: String): TResponseEventCancelPrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventCancelPrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idCan', idCan, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetEventCancelPrintIdCan# ' + STR_NFCE_EVENT_CANCEL_PRINT_GET);
      resp := Get(RouteToStr(rtNFCeCancelPrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventCancelPrint(resp.Content);
        if FSavePDF then
          SavePDFFilesCancelPrintNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
      end
      else
        Log('#TDadosJahDFe.NFCeGetEventCancelPrintIdCan# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetEventCancelPrintIdCan# ' + STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetEventCancelPrintIdCan# ' + STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetEventCancelPrintIdDfe(idDfe: String): TResponseEventCancelPrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventCancelPrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetEventCancelPrintIdDfe# ' + STR_NFCE_EVENT_CANCEL_PRINT_GET);
      resp := Get(RouteToStr(rtNFCeCancelPrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventCancelPrint(resp.Content);
        if FSavePDF then
          SavePDFFilesCancelPrintNFeNFCe(Result.ListEvent, tsxfNFCeCancel);
      end
      else
        Log('#TDadosJahDFe.NFCeGetEventCancelPrintIdDfe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetEventCancelPrintIdDfe# ' + STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetEventCancelPrintIdDfe# ' + STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetEventDisenableIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultDisenableNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultDisenableNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetEventDisenableIdBatch# ' + E.Message);
      raise Exception.Create(STR_NFCE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idBatch', idBatch, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetEventDisenableIdBatch# ' + STR_NFCE_EVENT_DISENABLE_GET);
      resp := Get(RouteToStr(rtNFCeDisenable, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultDisenableNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesDisenableNFeNFCe(Result.ListEvent, tsxfNFCeDisenable);
        if FSavePDF then
          SavePDFFilesDisenableNFeNFCe(Result.ListEvent, tsxfNFCeDisenable);
      end
      else
        Log('#TDadosJahDFe.NFCeGetEventDisenableIdBatch# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetEventDisenableIdBatch# ' + STR_NFCE_EVENT_DISENABLE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetEventDisenableIdBatch# ' + STR_NFCE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetEventDisenableIdInu(idInu: String; pageSize, page: Integer): TResponseConsultDisenableNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultDisenableNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetEventDisenableIdInu# ' + E.Message);
      raise Exception.Create(STR_NFCE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idInu', idInu, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetEventDisenableIdInu# ' + STR_NFCE_EVENT_DISENABLE_GET);
      resp := Get(RouteToStr(rtNFCeDisenable, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultDisenableNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesDisenableNFeNFCe(Result.ListEvent, tsxfNFCeDisenable);
        if FSavePDF then
          SavePDFFilesDisenableNFeNFCe(Result.ListEvent, tsxfNFCeDisenable);
      end
      else
        Log('#TDadosJahDFe.NFCeGetEventDisenableIdInu# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetEventDisenableIdInu# ' + STR_NFCE_EVENT_DISENABLE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetEventDisenableIdInu# ' + STR_NFCE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetEventDisenablePrintIdInu(idInu: String): TResponseEventDisenablePrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventDisenablePrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idInu', idInu, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetEventDisenablePrintIdInu# ' + STR_NFCE_EVENT_DISENABLE_PRINT_GET);
      resp := Get(RouteToStr(rtNFCeDisenablePrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventDisenablePrint(resp.Content);
        if FSavePDF then
          SavePDFFilesDisenablePrintNFeNFCe(Result.ListEvent, tsxfNFCeDisenable);
      end
      else
        Log('#TDadosJahDFe.NFCeGetEventDisenablePrintIdInu# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetEventDisenablePrintIdInu# ' + STR_NFCE_EVENT_DISENABLE_PRINT_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetEventDisenablePrintIdInu# ' + STR_NFCE_EVENT_DISENABLE_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_EVENT_DISENABLE_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetNFCeChaveDFe(ChaveDFe: String; tpAmb: TAmb; pageSize, page: Integer): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetNFCeChaveDFe# ' + E.Message);
      raise Exception.Create(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetNFCeChaveDFe# ' + STR_NFCE_GET_NFCE);
      resp := Get(RouteToStr(rtNFCe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFCe);
        if FSavePDF then
          SavePDFFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFCe);
      end
      else
        Log('#TDadosJahDFe.NFCeGetNFCeChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetNFCeChaveDFe# ' + STR_NFCE_GET_NFCE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetNFCeChaveDFe# ' + STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetNFCeIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetNFCeIdBatch# ' + E.Message);
      raise Exception.Create(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idBatch', idBatch, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetNFCeIdBatch# ' + STR_NFCE_GET_NFCE);
      resp := Get(RouteToStr(rtNFCe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFCe);
        if FSavePDF then
          SavePDFFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFCe);
      end
      else
        Log('#TDadosJahDFe.NFCeGetNFCeIdBatch# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetNFCeIdBatch# ' + STR_NFCE_GET_NFCE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetNFCeIdBatch# ' + STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetNFCeIdDFe(idDfe: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetNFCeIdDFe# ' + E.Message);
      raise Exception.Create(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetNFCeIdDFe# ' + STR_NFCE_GET_NFCE);
      resp := Get(RouteToStr(rtNFCe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFCe);
        if FSavePDF then
          SavePDFFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFCe);
      end
      else
        Log('#TDadosJahDFe.NFCeGetNFCeIdDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetNFCeIdDFe# ' + STR_NFCE_GET_NFCE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetNFCeIdDFe# ' + STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetNFCeSefazChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseConsultSefazNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultSefazNFeNFCe;
  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetNFCeSefazChaveDFe# ' + STR_NFE_GET_NFE);
      resp := Get(RouteToStr(rtNFCeSefaz, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultSefazNFe(resp.Content)
      else
        Log('#TDadosJahDFe.NFCeGetNFCeSefazChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetNFCeSefazChaveDFe# ' + STR_NFCE_GET_NFCE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' + resp.Content +
            '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetNFCeSefazChaveDFe# ' + STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetNFCeIdExternal(idExternal: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetNFCeIdExternal# ' + E.Message);
      raise Exception.Create(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idExternal', idExternal, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetNFCeIdExternal# ' + STR_NFCE_GET_NFCE);
      resp := Get(RouteToStr(rtNFCe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFCe);
        if FSavePDF then
          SavePDFFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFCe);
      end
      else
        Log('#TDadosJahDFe.NFCeGetNFCeIdExternal# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetNFCeIdExternal# ' + STR_NFCE_GET_NFCE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetNFCeIdExternal# ' + STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetNFCeNF(nNF, serie: Integer; tpAmb: TAmb; pageSize, page: Integer): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFCeGetNFCeNF# ' + E.Message);
      raise Exception.Create(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('nNF', nNF.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('serie', serie.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetNFCeNF# ' + STR_NFCE_GET_NFCE);
      resp := Get(RouteToStr(rtNFCe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFCe);
        if FSavePDF then
          SavePDFFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFCe);
      end
      else
        Log('#TDadosJahDFe.NFCeGetNFCeNF# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetNFCeNF# ' + STR_NFCE_GET_NFCE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetNFCeNF# ' + STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_GET_NFCE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetXMLChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseConsultXMLNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultXMLNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetXMLChaveDFe# ' + STR_NFCE_XML_GET);
      resp := Get(RouteToStr(rtNFCeXML, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultXMLNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesXMLNFeNFCe(Result.ListXML, tsxfNFCe);
      end
      else
        Log('#TDadosJahDFe.NFCeGetXMLChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetXMLChaveDFe# ' + STR_NFCE_XML_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetXMLChaveDFe# ' + STR_NFCE_XML_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_XML_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetXMLIdDFe(idDfe: String): TResponseConsultXMLNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultXMLNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetXMLIdDFe# ' + STR_NFCE_XML_GET);
      resp := Get(RouteToStr(rtNFCeXML, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultXMLNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesXMLNFeNFCe(Result.ListXML, tsxfNFCe);
      end
      else
        Log('#TDadosJahDFe.NFCeGetXMLIdDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetXMLIdDFe# ' + STR_NFCE_XML_GET_ERRO + '  StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetXMLIdDFe# ' + STR_NFCE_XML_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_XML_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetXMLIdExternal(idExternal: String): TResponseConsultXMLNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultXMLNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idExternal', idExternal, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetXMLIdExternal# ' + STR_NFCE_XML_GET);
      resp := Get(RouteToStr(rtNFCeXML, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultXMLNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesXMLNFeNFCe(Result.ListXML, tsxfNFCe);
      end
      else
        Log('#TDadosJahDFe.NFCeGetXMLIdExternal# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetXMLIdExternal# ' + STR_NFCE_XML_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetXMLIdExternal# ' + STR_NFCE_XML_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_XML_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeGetXMLNF(nNF, serie: Integer; tpAmb: TAmb): TResponseConsultXMLNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultXMLNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('nNF', nNF.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('serie', serie.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeGetXMLNF# ' + STR_NFCE_XML_GET);
      resp := Get(RouteToStr(rtNFCeXML, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultXMLNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesXMLNFeNFCe(Result.ListXML, tsxfNFCe);
      end
      else
        Log('#TDadosJahDFe.NFCeGetXMLNF# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeGetXMLNF# ' + STR_NFCE_XML_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeGetXMLNF# ' + STR_NFCE_XML_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_XML_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFCeServiceStatus(UF: String; tpAmb: TAmb): TStatusService;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearStatusService;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('UF', UF, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFCeServiceStatus# ' + STR_NFCE_SERVICE_STATUS);
      resp := Get(RouteToStr(rtNFCeServiceStatus, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToStatusService(resp.Content)
      else
        Log('#TDadosJahDFe.NFCeServiceStatus# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFCeServiceStatus# ' + STR_NFCE_SERVICE_STATUS_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFCeServiceStatus# ' + STR_NFCE_SERVICE_STATUS_ERRO + ' ' + E.Message);
        raise Exception(STR_NFCE_SERVICE_STATUS_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeCancelAsync(events: TListEventCancel; const vTpAmb: TAmb; const vTimeZone: TTimeZone): String;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := '';

  if (Length(events) = 0) then
  begin
    Log('#TDadosJahDFe.NFeCancelAsync# Não há eventos de cancelamentos preenchidas.');
    Exit;
  end;

  try
    JBody := JsonCancelNFeNFCe(events, True, vTpAmb, vTimeZone);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeCancelAsync# ' + E.Message);
      raise Exception.Create(STR_NFE_CANCEL_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFeCancelAsync# ' + STR_NFE_CANCEL_ASSYNC);
    resp := Post(RouteToStr(rtNFeCancel, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToIdBatch(resp.Content)
    else
      Log('#TDadosJahDFe.NFeCancelAsync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFeCancelAsync# ' + STR_NFE_CANCEL_ASSYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFeCancelAsync# ' + STR_NFE_CANCEL_ASSYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFE_CANCEL_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFeCancelSync(event: TEventCancel; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TResponseConsultCancelNFeNFCe;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  try
    JBody := JsonCancelNFeNFCe(event, False, vTpAmb, vTimeZone);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeCancelSync# ' + E.Message);
      raise Exception.Create(STR_NFE_CANCEL_SYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFeCancelSync# ' + STR_NFE_CANCEL_SYNC);
    resp := Post(RouteToStr(rtNFeCancel, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
    begin
      Result := ParseJSONToResponseConsultCancelNFeNFCe(resp.Content);
      if FSaveXML then // Sincrono, apenas uma nota por vez
        SaveXMLFile(Result.ListEvent[0].XML, tsxfNFeCancel, Result.ListEvent[0].chDfe, Result.ListEvent[0].dhEnv);
      if FSavePDF then // Sincrono, apenas uma nota por vez
        SavePDFFile(Result.ListEvent[0].PDFBase64, tsxfNFeCancel, Result.ListEvent[0].chDfe, Result.ListEvent[0].dhEnv);
    end
    else
      Log('#TDadosJahDFe.NFeCancelSync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFeCancelSync# ' + STR_NFE_CANCEL_SYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFeCancelSync# ' + STR_NFE_CANCEL_SYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFE_CANCEL_SYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFeCorrectionAsync(events: TListEventCorrection; const vTpAmb: TAmb; const vTimeZone: TTimeZone): String;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := '';

  if (Length(events) = 0) then
  begin
    Log('#TDadosJahDFe.NFeCorrectionAsync# Não há eventos de cancelamentos preenchidas.');
    Exit;
  end;

  try
    JBody := JsonCorrectionNFe(events, True, vTpAmb, vTimeZone);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeCorrectionAsync# ' + E.Message);
      raise Exception.Create(STR_NFE_CORRECTION_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFeCorrectionAsync# ' + STR_NFE_CORRECTION_ASSYNC);
    resp := Post(RouteToStr(rtNFeCorrection, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToIdBatch(resp.Content)
    else
      Log('#TDadosJahDFe.NFeCorrectionAsync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFeCorrectionAsync# ' + STR_NFE_CORRECTION_ASSYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFeCorrectionAsync# ' + STR_NFE_CORRECTION_ASSYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFE_CORRECTION_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFeCorrectionSync(event: TEventCorrection; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TResponseConsultCorrectionNFe;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCorrectionNFe;

  try
    JBody := JsonCorrectionNFe(event, False, vTpAmb, vTimeZone);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeCorrectionSync# ' + E.Message);
      raise Exception.Create(STR_NFE_CORRECTION_SYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFeCorrectionSync# ' + STR_NFE_CORRECTION_SYNC);
    resp := Post(RouteToStr(rtNFeCorrection, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
    begin
      Result := ParseJSONToResponseConsultCorrectionNFe(resp.Content);
      if FSaveXML then
        SaveXMLFile(Result.ListEvent[0].XML, tsxfNFeCorrection, Result.ListEvent[0].chDfe, Result.ListEvent[0].dhEnv);
      if FSavePDF then
        SavePDFFile(Result.ListEvent[0].PDFBase64, tsxfNFeCorrection, Result.ListEvent[0].chDfe, Result.ListEvent[0].dhEnv);
    end
    else
      Log('#TDadosJahDFe.NFeCorrectionSync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFeCorrectionSync# ' + STR_NFE_CORRECTION_SYNC_ERRO + ' statuscode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFeCorrectionSync# ' + STR_NFE_CORRECTION_SYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFE_CORRECTION_SYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFeDisenableAsync(events: TListEventDisenable; const vTpAmb: TAmb): String;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := '';

  if (Length(events) = 0) then
  begin
    Log('#TDadosJahDFe.NFeDisenableAsync# Não há eventos de inutilização preenchidas.');
    Exit;
  end;

  try
    JBody := JsonDisenableNFeNFCe(events, True, vTpAmb);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeDisenableAsync# ' + E.Message);
      raise Exception.Create(STR_NFE_DISENABLE_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFeDisenableAsync# ' + STR_NFE_DISENABLE_ASSYNC);
    resp := Post(RouteToStr(rtNFeDisenable, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToIdBatch(resp.Content)
    else
      Log('#TDadosJahDFe.NFeDisenableAsync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFeDisenableAsync# ' + STR_NFE_DISENABLE_ASSYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFeDisenableAsync# ' + STR_NFE_DISENABLE_ASSYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFE_DISENABLE_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFeDisenableSync(event: TEventDisenable; const vTpAmb: TAmb): TResponseConsultDisenableNFeNFCe;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultDisenableNFeNFCe;

  try
    JBody := JsonDisenableNFeNFCe(event, False, vTpAmb);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeDisenableSync# ' + E.Message);
      raise Exception.Create(STR_NFE_DISENABLE_SYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFeDisenableSync# ' + STR_NFE_DISENABLE_SYNC);
    resp := Post(RouteToStr(rtNFeDisenable, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
    begin
      Result := ParseJSONToResponseConsultDisenableNFeNFCe(resp.Content);
      if FSaveXML then
        SaveXMLFile(Result.ListEvent[0].XML, tsxfNFeDisenable, Result.ListEvent[0].idInu, Result.ListEvent[0].dhEnv);
      if FSavePDF then
        SavePDFFile(Result.ListEvent[0].PDFBase64, tsxfNFeDisenable, Result.ListEvent[0].idInu, Result.ListEvent[0].dhEnv);
    end
    else
      Log('#TDadosJahDFe.NFeDisenableSync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFeDisenableSync# ' + STR_NFE_DISENABLE_SYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFeDisenableSync# ' + STR_NFE_DISENABLE_SYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFE_DISENABLE_SYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFeEmissionAsync(nfes: TListNFeNFCe): String;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := '';

  if (Length(nfes) = 0) then
  begin
    Log('#TDadosJahDFe.NFeEmissionAsync# Não há notas preenchidas.');
    Exit;
  end;

  try
    JBody := JsonNFeEmission(nfes, True, TimeZone, FormatSettings);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeEmissionAsync# ' + E.Message);
      raise Exception.Create(STR_NFE_EMISSION_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFeEmissionAsync# ' + STR_NFE_EMISSION_ASSYNC);
    resp := Post(RouteToStr(rtNFe, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToIdBatch(resp.Content)
    else
      Log('#TDadosJahDFe.NFeEmissionAsync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFeEmissionAsync# ' + STR_NFE_EMISSION_ASSYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFeEmissionAsync# ' + STR_NFE_EMISSION_ASSYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFE_EMISSION_ASSYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFeEmissionSync(nfe: TNFeNFCe): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  try
    JBody := JsonNFeEmission(nfe, False, TimeZone, FormatSettings);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeEmissionSync# ' + E.Message);
      raise Exception.Create(STR_NFE_EMISSION_SYNC_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NFeEmissionSync# ' + STR_NFE_EMISSION_SYNC);
    resp := Post(RouteToStr(rtNFe, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
    begin
      Result := ParseJSONToResponseEmissionNFe(resp.Content);
      if FSaveXML and cStatNotaEmitida(Result.ListNFeNFCe[0].cStat) then // Sincrono, apenas uma nota por vez
        SaveXMLFile(Result.ListNFeNFCe[0].XML, tsxfNFe, Result.ListNFeNFCe[0].chDfe, Result.ListNFeNFCe[0].dhEmi);
      if FSavePDF and cStatNotaEmitida(Result.ListNFeNFCe[0].cStat) then // Sincrono, apenas uma nota por vez
        SavePDFFile(Result.ListNFeNFCe[0].PDFBase64, tsxfNFe, Result.ListNFeNFCe[0].chDfe, Result.ListNFeNFCe[0].dhEmi);
    end
    else
      Log('#TDadosJahDFe.NFeEmissionSync# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFeEmissionSync# ' + STR_NFE_EMISSION_SYNC_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFeEmissionSync# ' + STR_NFE_EMISSION_SYNC_ERRO + ' ' + E.Message);

      raise Exception(STR_NFE_EMISSION_SYNC_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFeGetDANFeChaveDFe(ChaveDFe: String; tpAmb: TAmb; TipoImpressao: TTipoImpressaoNFe): TResponseConsultDANFeDANFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpDanfe', TipoImpressaoNFeToStr(TipoImpressao), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetDANFeChaveDFe# ' + STR_NFE_DANFE_GET);
      resp := Get(RouteToStr(rtNFeDANFe, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultDANFe(resp.Content)
      else
        Log('#TDadosJahDFe.NFeGetDANFeChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetDANFeChaveDFe# ' + STR_NFE_DANFE_GET_ERRO + '  StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetDANFeChaveDFe# ' + STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetDANFeIdDFe(idDfe: String; TipoImpressao: TTipoImpressaoNFe): TResponseConsultDANFeDANFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpDanfe', TipoImpressaoNFeToStr(TipoImpressao), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetDANFeIdDFe# ' + STR_NFE_DANFE_GET);
      resp := Get(RouteToStr(rtNFeDANFe, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultDANFe(resp.Content)
      else
        Log('#TDadosJahDFe.NFeGetDANFeIdDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetDANFeIdDFe# ' + STR_NFE_DANFE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetDANFeIdDFe# ' + STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetDANFeIdExternal(idExternal: String; TipoImpressao: TTipoImpressaoNFe): TResponseConsultDANFeDANFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idExternal', idExternal, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpDanfe', TipoImpressaoNFeToStr(TipoImpressao), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetDANFeIdExternal# ' + STR_NFE_DANFE_GET);
      resp := Get(RouteToStr(rtNFeDANFe, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultDANFe(resp.Content)
      else
        Log('#TDadosJahDFe.NFeGetDANFeIdExternal# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetDANFeIdExternal# ' + STR_NFE_DANFE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetDANFeIdExternal# ' + STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetDANFeNF(nNF, serie: Integer; tpAmb: TAmb; TipoImpressao: TTipoImpressaoNFe): TResponseConsultDANFeDANFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('nNF', nNF.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('serie', serie.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpDanfe', TipoImpressaoNFeToStr(TipoImpressao), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetDANFeNF# ' + STR_NFE_DANFE_GET);
      resp := Get(RouteToStr(rtNFeDANFe, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultDANFe(resp.Content)
      else
        Log('#TDadosJahDFe.NFeGetDANFeNF# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetDANFeNF# ' + STR_NFE_DANFE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetDANFeNF# ' + STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetDANFeXML(XML: String; TipoImpressao: TTipoImpressaoNFe): TResponseConsultDANFeDANFCe;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  if (XML.Trim = '') then
  begin
    Log('#TDadosJahDFe.NFeGetDANFeXML# O XML não está preenchido.');
    Exit;
  end;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonXML(XML);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetDANFeXML# ' + E.Message);
      raise Exception.Create(STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try;
      Params.AddItem('tpDanfe', TipoImpressaoNFeToStr(TipoImpressao), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetDANFeXML# ' + STR_NFE_DANFE_GET);
      resp := Get(RouteToStr(rtNFeDANFe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultDANFe(resp.Content)
      else
        Log('#TDadosJahDFe.NFeGetDANFeXML# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetDANFeXML# ' + STR_NFE_DANFE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetDANFeXML# ' + STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetDANFeNFe(nfes: TListNFeNFCe): TResponseDanfPDF;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseDanfPDF;

  if (Length(nfes) = 0) then
  begin
    Log('#TDadosJahDFe.NFeGetDANFeNFe# Não há notas preenchidas.');
    Exit;
  end;

  try
    JBody := JsonNFeEmission(nfes, False, TimeZone, FormatSettings);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetDANFeNFe# ' + E.Message);
      raise Exception.Create(STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try;
    Log('#TDadosJahDFe.NFeGetDANFeNFe# ' + STR_NFE_DANFE_GET);
    resp := Get(RouteToStr(rtNFeDANFe, FVersionAPI), nil, JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseDanfePDF(resp.Content)
    else
      Log('#TDadosJahDFe.NFeGetDANFeNFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NFeGetDANFeNFe# ' + STR_NFE_DANFE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NFeGetDANFeNFe# ' + STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
      raise Exception(STR_NFE_DANFE_GET_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NFeGetEventCancelChaveDFe(ChaveDFe: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetEventCancelChaveDFe# ' + E.Message);
      raise Exception.Create(STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCancelChaveDFe# ' + STR_NFE_EVENT_CANCEL_GET);
      resp := Get(RouteToStr(rtNFeCancel, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCancelNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCancelNFeNFCe(Result.ListEvent, tsxfNFeCancel);
        if FSavePDF then
          SavePDFFilesCancelNFeNFCe(Result.ListEvent, tsxfNFeCancel);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCancelChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCancelChaveDFe# ' + STR_NFE_EVENT_CANCEL_GET_ERRO + '. StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCancelChaveDFe# ' + STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCancelIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetEventCancelIdBatch# ' + E.Message);
      raise Exception.Create(STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idBatch', idBatch, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCancelIdBatch# ' + STR_NFE_EVENT_CANCEL_GET);
      resp := Get(RouteToStr(rtNFeCancel, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCancelNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCancelNFeNFCe(Result.ListEvent, tsxfNFeCancel);
        if FSavePDF then
          SavePDFFilesCancelNFeNFCe(Result.ListEvent, tsxfNFeCancel);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCancelIdBatch# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCancelIdBatch# ' + STR_NFE_EVENT_CANCEL_GET_ERRO + '. StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCancelIdBatch# ' + STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCancelIdCan(idCan: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetEventCancelIdCan# ' + E.Message);
      raise Exception.Create(STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idCan', idCan, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCancelIdCan# ' + STR_NFE_EVENT_CANCEL_GET);
      resp := Get(RouteToStr(rtNFeCancel, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCancelNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCancelNFeNFCe(Result.ListEvent, tsxfNFeCancel);
        if FSavePDF then
          SavePDFFilesCancelNFeNFCe(Result.ListEvent, tsxfNFeCancel);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCancelIdCan# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCancelIdCan# ' + STR_NFE_EVENT_CANCEL_GET_ERRO + '  StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCancelIdCan# ' + STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCancelIdDfe(idDfe: String; pageSize, page: Integer): TResponseConsultCancelNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetEventCancelIdDfe# ' + E.Message);
      raise Exception.Create(STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCancelIdDfe# ' + STR_NFE_EVENT_CANCEL_GET);
      resp := Get(RouteToStr(rtNFeCancel, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCancelNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCancelNFeNFCe(Result.ListEvent, tsxfNFeCancel);
        if FSavePDF then
          SavePDFFilesCancelNFeNFCe(Result.ListEvent, tsxfNFeCancel);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCancelIdDfe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCancelIdDfe# ' + STR_NFE_EVENT_CANCEL_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCancelIdDfe# ' + STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CANCEL_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCancelPrintChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseEventCancelPrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventCancelPrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCancelPrintChaveDFe# ' + STR_NFE_EVENT_CANCEL_PRINT_GET);
      resp := Get(RouteToStr(rtNFeCancelPrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventCancelPrint(resp.Content);
        if FSavePDF then
          SavePDFFilesCancelPrintNFeNFCe(Result.ListEvent, tsxfNFeCancel);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCancelPrintChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCancelPrintChaveDFe# ' + STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO + '  StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCancelPrintChaveDFe# ' + STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCancelPrintIdCan(idCan: String): TResponseEventCancelPrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventCancelPrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idCan', idCan, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCancelPrintIdCan# ' + STR_NFE_EVENT_CANCEL_PRINT_GET);
      resp := Get(RouteToStr(rtNFeCancelPrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventCancelPrint(resp.Content);
        if FSavePDF then
          SavePDFFilesCancelPrintNFeNFCe(Result.ListEvent, tsxfNFeCancel);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCancelPrintIdCan# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCancelPrintIdCan# ' + STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO + '. StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCancelPrintIdCan# ' + STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCancelPrintIdDfe(idDfe: String): TResponseEventCancelPrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventCancelPrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCancelPrintIdDfe# ' + STR_NFE_EVENT_CANCEL_PRINT_GET);
      resp := Get(RouteToStr(rtNFeCancelPrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventCancelPrint(resp.Content);
        if FSavePDF then
          SavePDFFilesCancelPrintNFeNFCe(Result.ListEvent, tsxfNFeCancel);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCancelPrintIdDfe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCancelPrintIdDfe# ' + STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCancelPrintIdDfe# ' + STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCorrectionChaveDFe(ChaveDFe: String; pageSize, page: Integer): TResponseConsultCorrectionNFe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCorrectionNFe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetEventCorrectionChaveDFe# ' + E.Message);
      raise Exception.Create(STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCorrectionChaveDFe# ' + STR_NFE_EVENT_CORRECTION_GET);
      resp := Get(RouteToStr(rtNFeCorrection, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCorrectionNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCorrectionNFe(Result.ListEvent);
        if FSavePDF then
          SavePDFFilesCorrectionNFe(Result.ListEvent);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCorrectionChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCorrectionChaveDFe# ' + STR_NFE_EVENT_CORRECTION_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCorrectionChaveDFe# ' + STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCorrectionIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultCorrectionNFe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCorrectionNFe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetEventCorrectionIdBatch# ' + E.Message);
      raise Exception.Create(STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idBatch', idBatch, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCorrectionIdBatch# ' + STR_NFE_EVENT_CORRECTION_GET);
      resp := Get(RouteToStr(rtNFeCorrection, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCorrectionNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCorrectionNFe(Result.ListEvent);
        if FSavePDF then
          SavePDFFilesCorrectionNFe(Result.ListEvent);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCorrectionIdBatch# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCorrectionIdBatch#  ' + STR_NFE_EVENT_CORRECTION_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCorrectionIdBatch# ' + STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCorrectionIdCce(idCce: String; pageSize, page: Integer): TResponseConsultCorrectionNFe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCorrectionNFe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetEventCorrectionIdCce# ' + E.Message);
      raise Exception.Create(STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idCce', idCce, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCorrectionIdCce# ' + STR_NFE_EVENT_CORRECTION_GET);
      resp := Get(RouteToStr(rtNFeCorrection, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCorrectionNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCorrectionNFe(Result.ListEvent);
        if FSavePDF then
          SavePDFFilesCorrectionNFe(Result.ListEvent);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCorrectionIdCce# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCorrectionIdCce# ' + STR_NFE_EVENT_CORRECTION_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCorrectionIdCce# ' + STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCorrectionidDfe(idDfe: String; pageSize, page: Integer): TResponseConsultCorrectionNFe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultCorrectionNFe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetEventCorrectionidDfe# ' + E.Message);
      raise Exception.Create(STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCorrectionidDfe# ' + STR_NFE_EVENT_CORRECTION_GET);
      resp := Get(RouteToStr(rtNFeCorrection, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultCorrectionNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesCorrectionNFe(Result.ListEvent);
        if FSavePDF then
          SavePDFFilesCorrectionNFe(Result.ListEvent);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCorrectionidDfe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCorrectionidDfe# ' + STR_NFE_EVENT_CORRECTION_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCorrectionidDfe# ' + STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CORRECTION_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCorrectionPrintChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseEventCorrectionPrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventCorrectionPrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCorrectionPrintChaveDFe# ' + STR_NFE_EVENT_CORRECTION_PRINT_GET);
      resp := Get(RouteToStr(rtNFeCorrectionPrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventCorrectionPrint(resp.Content);
        if FSavePDF then
          SavePDFFilesCorrectionPrintNFe(Result.ListEvent);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCorrectionPrintChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCorrectionPrintChaveDFe# ' + STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCorrectionPrintChaveDFe# ' + STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCorrectionPrintIdCce(idCce: String): TResponseEventCorrectionPrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventCorrectionPrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idCce', idCce, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCorrectionPrintIdCce# ' + STR_NFE_EVENT_CORRECTION_PRINT_GET);
      resp := Get(RouteToStr(rtNFeCorrectionPrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventCorrectionPrint(resp.Content);
        if FSavePDF then
          SavePDFFilesCorrectionPrintNFe(Result.ListEvent);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCorrectionPrintIdCce# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCorrectionPrintIdCce# ' + STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString +
            '; Content: ' + resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCorrectionPrintIdCce# ' + STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventCorrectionPrintIdDfe(idDfe: String): TResponseEventCorrectionPrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventCorrectionPrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventCorrectionPrintIdDfe# ' + STR_NFE_EVENT_CORRECTION_PRINT_GET);
      resp := Get(RouteToStr(rtNFeCorrectionPrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventCorrectionPrint(resp.Content);
        if FSavePDF then
          SavePDFFilesCorrectionPrintNFe(Result.ListEvent);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventCorrectionPrintIdDfe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventCorrectionPrintIdDfe# ' + STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventCorrectionPrintIdDfe# ' + STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventDisenableIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultDisenableNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultDisenableNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetEventDisenableIdBatch# ' + E.Message);
      raise Exception.Create(STR_NFE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idBatch', idBatch, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventDisenableIdBatch# ' + STR_NFE_EVENT_DISENABLE_GET);
      resp := Get(RouteToStr(rtNFeDisenable, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultDisenableNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesDisenableNFeNFCe(Result.ListEvent, tsxfNFeDisenable);
        if FSavePDF then
          SavePDFFilesDisenableNFeNFCe(Result.ListEvent, tsxfNFeDisenable);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventDisenableIdBatch# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventDisenableIdBatch# ' + STR_NFE_EVENT_DISENABLE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventDisenableIdBatch# ' + STR_NFE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventDisenableIdInu(idInu: String; pageSize, page: Integer): TResponseConsultDisenableNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultDisenableNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetEventDisenableIdInu# ' + E.Message);
      raise Exception.Create(STR_NFE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idInu', idInu, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventDisenableIdInu# ' + STR_NFE_EVENT_DISENABLE_GET);
      resp := Get(RouteToStr(rtNFeDisenable, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultDisenableNFeNFCe(resp.Content);
        if FSaveXML then
          SaveXMLFilesDisenableNFeNFCe(Result.ListEvent, tsxfNFeDisenable);
        if FSavePDF then
          SavePDFFilesDisenableNFeNFCe(Result.ListEvent, tsxfNFeDisenable);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventDisenableIdInu# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventDisenableIdInu# ' + STR_NFE_EVENT_DISENABLE_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventDisenableIdInu# ' + STR_NFE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_DISENABLE_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetEventDisenablePrintIdInu(idInu: String): TResponseEventDisenablePrint;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseEventDisenablePrint;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idInu', idInu, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetEventDisenablePrintIdInu# ' + STR_NFE_EVENT_DISENABLE_PRINT_GET);
      resp := Get(RouteToStr(rtNFeDisenablePrint, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseEventDisenablePrint(resp.Content);
        if FSavePDF then
          SavePDFFilesDisenablePrintNFeNFCe(Result.ListEvent, tsxfNFeDisenable);
      end
      else
        Log('#TDadosJahDFe.NFeGetEventDisenablePrintIdInu# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error +
          '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetEventDisenablePrintIdInu# ' + STR_NFE_EVENT_DISENABLE_PRINT_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetEventDisenablePrintIdInu# ' + STR_NFE_EVENT_DISENABLE_PRINT_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_EVENT_DISENABLE_PRINT_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetNFeChaveDFe(ChaveDFe: String; tpAmb: TAmb; pageSize, page: Integer): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetNFeChaveDFe# ' + E.Message);
      raise Exception.Create(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetNFeChaveDFe# ' + STR_NFE_GET_NFE);
      resp := Get(RouteToStr(rtNFe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFe);
        if FSavePDF then
          SavePDFFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFe);
      end
      else
        Log('#TDadosJahDFe.NFeGetNFeChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetNFeChaveDFe# ' + STR_NFE_GET_NFE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' + resp.Content + '; Mensagem Erro: ' +
            E.Message)
        else
          Log('#TDadosJahDFe.NFeGetNFeChaveDFe# ' + STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetNFeIdBatch(idBatch: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetNFeIdBatch# ' + E.Message);
      raise Exception.Create(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idBatch', idBatch, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetNFeIdBatch# ' + STR_NFE_GET_NFE);
      resp := Get(RouteToStr(rtNFe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFe);
        if FSavePDF then
          SavePDFFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFe);
      end
      else
        Log('#TDadosJahDFe.NFeGetNFeIdBatch# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetNFeIdBatch# ' + STR_NFE_GET_NFE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetNFeIdBatch# ' + STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetNFeIdDFe(idDfe: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetNFeIdDFe# ' + E.Message);
      raise Exception.Create(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetNFeIdDFe# ' + STR_NFE_GET_NFE);
      resp := Get(RouteToStr(rtNFe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFe);
        if FSavePDF then
          SavePDFFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFe);
      end
      else
        Log('#TDadosJahDFe.NFeGetNFeIdDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetNFeIdDFe# ' + STR_NFE_GET_NFE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetNFeIdDFe# ' + STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetNFeIdExternal(idExternal: String; pageSize, page: Integer): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetNFeIdExternal# ' + E.Message);
      raise Exception.Create(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('idExternal', idExternal, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetNFeIdExternal# ' + STR_NFE_GET_NFE);
      resp := Get(RouteToStr(rtNFe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFe);
        if FSavePDF then
          SavePDFFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFe);
      end
      else
        Log('#TDadosJahDFe.NFeGetNFeIdExternal# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetNFeIdExternal# ' + STR_NFE_GET_NFE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetNFeIdExternal# ' + STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetNFeSefazChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseConsultSefazNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultSefazNFeNFCe;
  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetNFeSefazChaveDFe# ' + STR_NFE_GET_NFE);
      resp := Get(RouteToStr(rtNFeSefaz, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseConsultSefazNFe(resp.Content)
      else
        Log('#TDadosJahDFe.NFeGetNFeSefazChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetNFeSefazChaveDFe# ' + STR_NFE_GET_NFE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' + resp.Content + '; Mensagem Erro: ' +
            E.Message)
        else
          Log('#TDadosJahDFe.NFeGetNFeSefazChaveDFe# ' + STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetNFeNF(nNF, serie: Integer; tpAmb: TAmb; pageSize, page: Integer): TResponseConsultNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
  JBody: TJsonObject;
begin
  Result := ClearResponseConsultNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NFeGetNFeNF# ' + E.Message);
      raise Exception.Create(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Params.AddItem('nNF', nNF.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('serie', serie.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetNFeNF# ' + STR_NFE_GET_NFE);
      resp := Get(RouteToStr(rtNFe, FVersionAPI), Params, JBody);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFe);
        if FSavePDF then
          SavePDFFilesNFeNFCe(Result.ListNFeNFCe, tsxfNFe);
      end
      else
        Log('#TDadosJahDFe.NFeGetNFeNF# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetNFeNF# ' + STR_NFE_GET_NFE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetNFeNF# ' + STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_GET_NFE_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetXMLChaveDFe(ChaveDFe: String; tpAmb: TAmb): TResponseConsultXMLNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultXMLNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('chDfe', ChaveDFe, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetXMLChaveDFe# ' + STR_NFE_XML_GET);
      resp := Get(RouteToStr(rtNFeXML, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultXMLNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesXMLNFeNFCe(Result.ListXML, tsxfNFe);
      end
      else
        Log('#TDadosJahDFe.NFeGetXMLChaveDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetXMLChaveDFe# ' + STR_NFE_XML_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetXMLChaveDFe# ' + STR_NFE_XML_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_XML_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetXMLIdDFe(idDfe: String): TResponseConsultXMLNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultXMLNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idDfe', idDfe, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetXMLIdDFe# ' + STR_NFE_XML_GET);
      resp := Get(RouteToStr(rtNFeXML, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultXMLNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesXMLNFeNFCe(Result.ListXML, tsxfNFe);
      end
      else
        Log('#TDadosJahDFe.NFeGetXMLIdDFe# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetXMLIdDFe# ' + STR_NFE_XML_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetXMLIdDFe# ' + STR_NFE_XML_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_XML_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetXMLIdExternal(idExternal: String): TResponseConsultXMLNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultXMLNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('idExternal', idExternal, pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetXMLIdExternal# ' + STR_NFE_XML_GET);
      resp := Get(RouteToStr(rtNFeXML, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultXMLNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesXMLNFeNFCe(Result.ListXML, tsxfNFe);
      end
      else
        Log('#TDadosJahDFe.NFeGetXMLIdExternal# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetXMLIdExternal# ' + STR_NFE_XML_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetXMLIdExternal# ' + STR_NFE_XML_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_XML_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NFeGetXMLNF(nNF, serie: Integer; tpAmb: TAmb): TResponseConsultXMLNFeNFCe;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseConsultXMLNFeNFCe;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('nNF', nNF.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('serie', serie.ToString, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeGetXMLNF# ' + STR_NFE_XML_GET);
      resp := Get(RouteToStr(rtNFeXML, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
      begin
        Result := ParseJSONToResponseConsultXMLNFe(resp.Content);
        if FSaveXML then
          SaveXMLFilesXMLNFeNFCe(Result.ListXML, tsxfNFe);
      end
      else
        Log('#TDadosJahDFe.NFeGetXMLNF# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeGetXMLNF# ' + STR_NFE_XML_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeGetXMLNF# ' + STR_NFE_XML_GET_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_XML_GET_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.AutXMLAdd(autXML: TListAutXML): TListAutXML;
var
  resp: TResponseAPI;
  JBody: TJsonObject;

  function ValidaCPFCNPJ: Boolean;
  var
    I: Integer;
  begin
    Result := True;
    for I := 0 to High(autXML) do
    begin
      if autXML[I].Trim = '' then
      begin
        Result := False;
        Break;
      end;
    end;
  end;

begin
  SetLength(Result, 0);

  if (Length(autXML) = 0) then
  begin
    Log('#TDadosJahDFe.AutXMLAdd# Não há CPF/CNPJ preenchidos');
    Exit;
  end;

  if not ValidaCPFCNPJ then
  begin
    Log('#TDadosJahDFe.AutXMLAdd# Um ou mais CPF/CNPJ está preenchido de forma inválida.');
    Exit;
  end;

  try
    JBody := JsonAutXML(autXML);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.AutXMLAdd# ' + E.Message);
      raise Exception.Create(STR_AUT_XML_ADD_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.AutXMLAdd# ' + STR_AUT_XML_ADD);
    resp := Post(RouteToStr(rtAutXML, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToAutXML(resp.Content)
    else
      Log('#TDadosJahDFe.AutXMLAdd# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.AutXMLAdd# ' + STR_AUT_XML_ADD_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.AutXMLAdd# ' + STR_AUT_XML_ADD_ERRO + ' ' + E.Message);
      raise Exception(STR_AUT_XML_ADD_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.GetAutXML: TListAutXML;
var
  resp: TResponseAPI;
begin
  SetLength(Result, 0);

  try
    Log('#TDadosJahDFe.GetAutXML# ' + STR_AUT_XML_GET);
    resp := Get(RouteToStr(rtAutXML, FVersionAPI), nil);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToAutXML(resp.Content)
    else
      Log('#TDadosJahDFe.GetAutXML# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.GetAutXML# ' + STR_AUT_XML_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.GetAutXML# ' + STR_AUT_XML_GET_ERRO + ' ' + E.Message);
      raise Exception(STR_AUT_XML_GET_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.EmitAdd(emit: TEmit): TEmit;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearEmit;

  if (emit.CNPJCPF.Trim = '') or (emit.xNome.Trim = '') or (emit.IE.Trim = '') or (emit.enderEmit.xLgr.Trim = '') or (emit.enderEmit.nro.Trim = '') or
    (emit.enderEmit.xBairro.Trim = '') or (emit.enderEmit.cMun = 0) or (emit.enderEmit.UF.Trim = '') or (emit.enderEmit.CEP.Trim = '') or
    (emit.enderEmit.cPais = 0) then
  begin
    Log('#TDadosJahDFe.EmitAdd# Algum dos dados obrigatórios não foram preenchidos: CNPJCPF, xNome, IE, enderEmit.xLgr, enderEmit.nro, enderEmit.xBairro, ' +
      'enderEmit.cMun, enderEmit.UF, enderEmit.CEP, enderEmit.cPais.');
    Exit;
  end;

  try
    JBody := JsonEmit(emit);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.EmitAdd# ' + E.Message);
      raise Exception.Create(STR_EMIT_ADD_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.EmitAdd# ' + STR_EMIT_ADD);
    resp := Post(RouteToStr(rtEmitente, FVersionAPI), JBody);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToEmit(resp.Content)
    else
      Log('#TDadosJahDFe.EmitAdd# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.EmitAdd# ' + STR_EMIT_ADD_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.EmitAdd# ' + STR_EMIT_ADD_ERRO + ' ' + E.Message);
      raise Exception(STR_EMIT_ADD_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.ErrorRequestStr: String;
begin
  Result := 'Erro na Requisição. StatusCode: ' + ErrorRequest.statuscode.ToString + '; Erro: ' + ErrorRequest.Error + '; Mensagem: ' + ArrayListToStr(ErrorRequest.messageList);
end;

function TDadosJahDFe.GetEmit: TEmit;
var
  resp: TResponseAPI;
begin
  Result := ClearEmit;

  try
    Log('#TDadosJahDFe.GetEmit# ' + STR_EMIT_GET);
    resp := Get(RouteToStr(rtEmitente, FVersionAPI), nil);

    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToEmit(resp.Content)
    else
      Log('#TDadosJahDFe.GetEmit# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' + ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.GetEmit# ' + STR_EMIT_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.GetEmit# ' + STR_EMIT_GET_ERRO + ' ' + E.Message);
      raise Exception(STR_EMIT_GET_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.GetLibraryVersion: String;
begin
  Result := '1.0.0';
end;

function TDadosJahDFe.GetTimeOut: Integer;
begin
  if FTimeOut < 10 then
  begin
    Log('#TDadosJahDFe.GetTimeOut# Timeout menor que 10 segundos configurado, será alterado para o para o mínimo de 10 segundos. O padrão é 60 segundos.');
    FTimeOut := 10;
  end;
  if FTimeOut > 120 then
  begin
    Log('#TDadosJahDFe.GetTimeOut# Timeout maior que 120 segundos configurado, será alterado para o para o máximo de 120 segundos. O padrão é 60 segundos.');
    FTimeOut := 120;
  end;
  Result := FTimeOut * 1000;
end;

function TDadosJahDFe.NFeServiceStatus(UF: String;
  tpAmb:
  TAmb): TStatusService;
var
  resp: TResponseAPI;
  Params: TRESTRequestParameterList;
begin
  Result := ClearStatusService;

  Params := TRESTRequestParameterList.Create(nil);
  try
    try
      Params.AddItem('UF', UF, pkGETorPOST, [poDoNotEncode]);
      Params.AddItem('tpAmb', AmbToStr(tpAmb), pkGETorPOST, [poDoNotEncode]);
      Log('#TDadosJahDFe.NFeServiceStatus# ' + STR_NFE_SERVICE_STATUS);
      resp := Get(RouteToStr(rtNFeServiceStatus, FVersionAPI), Params);

      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToStatusService(resp.Content)
      else
        Log('#TDadosJahDFe.NFeServiceStatus# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NFeServiceStatus# ' + STR_NFE_SERVICE_STATUS_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NFeServiceStatus# ' + STR_NFE_SERVICE_STATUS_ERRO + ' ' + E.Message);
        raise Exception(STR_NFE_SERVICE_STATUS_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.NotificationAdd(listNotification: TListNotification): TResponseNotification;
var
  resp: TResponseAPI;
  JBodyArray: TJSONArray;
begin
  Result := ClearResponseNotification;
  try
    JBodyArray := JsonUserNotification(listNotification);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NotificationAdd# ' + E.Message);
      raise Exception.Create(STR_NOTIFICATION_ADD + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NotificationAdd# ' + STR_NOTIFICATION_ADD);
    resp := Post(RouteToStr(rtUserNotification, FVersionAPI), JBodyArray);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseNotification(resp.Content)
    else
      Log('#TDadosJahDFe.NotificationAdd# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NotificationAdd# ' + STR_NOTIFICATION_ADD + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NotificationAdd# ' + STR_NOTIFICATION_ADD + ' ' + E.Message);
      raise Exception.Create(STR_NOTIFICATION_ADD + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NotificationDelete(listNotification: TListNotification): TResponseNotification;
var
  resp: TResponseAPI;
  JBodyArray: TJSONArray;
begin
  Result := ClearResponseNotification;
  try
    JBodyArray := JsonUserNotification(listNotification);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NotificationDelete# ' + E.Message);
      raise Exception.Create(STR_NOTIFICATION_DELETE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.NotificationDelete# ' + STR_NOTIFICATION_DELETE);
    resp := Delete(RouteToStr(rtUserNotification, FVersionAPI), JBodyArray);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseNotification(resp.Content)
    else
      Log('#TDadosJahDFe.NotificationDelete# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.NotificationDelete# ' + STR_NOTIFICATION_DELETE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.NotificationDelete# ' + STR_NOTIFICATION_DELETE_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_NOTIFICATION_DELETE_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.NotificationList(pageSize, page: Integer): TResponseNotification;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseNotification;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.NotificationList# ' + E.Message);
      raise Exception.Create(STR_NOTIFICATION_LIST_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Log('#TDadosJahDFe.NotificationList# ' + STR_NOTIFICATION_LIST);
      resp := Get(RouteToStr(rtUserNotification, FVersionAPI), Params, JBody);
      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseNotification(resp.Content)
      else
        Log('#TDadosJahDFe.NotificationList# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.NotificationList# ' + STR_NOTIFICATION_LIST_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.NotificationList# ' + STR_NOTIFICATION_LIST_ERRO + ' ' + E.Message);
        raise Exception.Create(STR_NOTIFICATION_LIST_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

procedure TDadosJahDFe.InitializeRest(vRestClient: TRESTClient;
  vRestRequest:
  TRESTRequest;
  vRoute:
  String;
  vMethodRequest:
  TRESTRequestMethod);
begin
  vRestRequest.Client := vRestClient;
  vRestRequest.Method := vMethodRequest;
  vRestClient.BaseURL := URLBASE;
  vRestClient.Accept := vRestRequest.Accept;
  vRestClient.AcceptCharset := vRestRequest.AcceptCharset;
  vRestClient.RaiseExceptionOn500 := False;
  vRestRequest.Resource := vRoute;
  vRestRequest.TimeOut := GetTimeOut;
end;

procedure TDadosJahDFe.AddAuthorization(vRestRequest: TRESTRequest);
begin
  if FToken.accessToken.Trim <> '' then
    vRestRequest.Params.AddItem('Authorization', 'Bearer ' + FToken.accessToken.Trim, pkHTTPHEADER, [poDoNotEncode]);
end;

procedure TDadosJahDFe.AddParams(vRestRequest: TRESTRequest;
  vParams:
  TRESTRequestParameterList);
begin
  if Assigned(vParams) then
    vRestRequest.Params := vParams;

  if FToken.accessToken.Trim <> '' then
  begin
    if not Assigned(vRestRequest.Params.ParameterByName('Authorization')) then
      vRestRequest.Params.AddItem('Authorization', 'Bearer ' + FToken.accessToken.Trim, pkHTTPHEADER, [poDoNotEncode]);
  end;
end;

function TDadosJahDFe.FillResponseAPI(vStatusCode: Integer; vRestRequest: TRESTRequest): TResponseAPI;
begin
  Result.statuscode := vRestRequest.Response.statuscode;
  Result.StatusText := vRestRequest.Response.StatusText;
  Result.Content := vRestRequest.Response.Content;

  FLastResponseAPI.statuscode := vRestRequest.Response.statuscode;
  FLastResponseAPI.StatusText := vRestRequest.Response.StatusText;
  FLastResponseAPI.Content := vRestRequest.Response.Content;

  if not StatusCodeOK(vStatusCode) then
  begin
    Result.Error := ParseJSONToError(vRestRequest.Response.Content);
    FErrorRequest := Result.Error;
    FLastResponseAPI.Error := Result.Error;
  end;
end;

function TDadosJahDFe.Post(Route: String;
  BodyJson:
  TJsonObject): TResponseAPI;
var
  RestClient: TRESTClient;
  RestRequest: TRESTRequest;
begin
  RestClient := TRESTClient.Create(URLBASE);
  RestRequest := TRESTRequest.Create(nil);
  InitializeRest(RestClient, RestRequest, Route, rmPOST);
  ClearResponseAPI;
  ClearRequestError;
  AddAuthorization(RestRequest);
  if Assigned(BodyJson) then
  begin
    RestRequest.AddBody(BodyJson);
    if FSaveJSONRequest then
      SaveJSON(BodyJson.ToString, Route, tRequest);
  end;
  if FGenerateLogRequestContent then
    Log('#TDadosJahDFe.Post# Route: ' + Route + '; Body: ' + IfThen(Assigned(BodyJson), BodyJson.ToString, ''));
  try
    try
      RestRequest.Execute;
    except
      on E: Exception do
        Log('#TDadosJahDFe.Post# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' +
          RestRequest.Response.StatusText + '. Mensagem' + E.Message);
    end;
  finally
    if FGenerateLogResponseContent then
      Log('#TDadosJahDFe.Post# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' + RestRequest.Response.StatusText +
        '; Content: ' + RestRequest.Response.Content);
    Result := FillResponseAPI(RestRequest.Response.statuscode, RestRequest);
    RestClient.Free;
    RestRequest.Free;
    if FSaveJSONResponse then
      SaveJSON(Result.Content, Route, tResponse);
  end;
end;

function TDadosJahDFe.Post(Route: String; BodyArray: TJSONArray): TResponseAPI;
var
  RestClient: TRESTClient;
  RestRequest: TRESTRequest;
begin
  RestClient := TRESTClient.Create(URLBASE);
  RestRequest := TRESTRequest.Create(nil);
  InitializeRest(RestClient, RestRequest, Route, rmPOST);
  ClearResponseAPI;
  ClearRequestError;
  AddAuthorization(RestRequest);
  if Assigned(BodyArray) then
  begin
    RestRequest.AddBody(BodyArray);
    if FSaveJSONRequest then
      SaveJSON(BodyArray.ToString, Route, tRequest);
  end;
  if FGenerateLogRequestContent then
    Log('#TDadosJahDFe.Post# Route: ' + Route + '; Body: ' + IfThen(Assigned(BodyArray), BodyArray.ToString, ''));
  try
    try
      RestRequest.Execute;
    except
      on E: Exception do
        Log('#TDadosJahDFe.Post# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' +
          RestRequest.Response.StatusText + '. Mensagem' + E.Message);
    end;
  finally
    if FGenerateLogResponseContent then
      Log('#TDadosJahDFe.Post# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' + RestRequest.Response.StatusText +
        '; Content: ' + RestRequest.Response.Content);
    Result := FillResponseAPI(RestRequest.Response.statuscode, RestRequest);
    RestClient.Free;
    RestRequest.Free;
    if FSaveJSONResponse then
      SaveJSON(Result.Content, Route, tResponse);
  end;
end;

function TDadosJahDFe.Patch(Route: String;
  BodyJson:
  TJsonObject): TResponseAPI;
var
  RestClient: TRESTClient;
  RestRequest: TRESTRequest;
begin
  RestClient := TRESTClient.Create(URLBASE);
  RestRequest := TRESTRequest.Create(nil);
  InitializeRest(RestClient, RestRequest, Route, rmPATCH);
  ClearResponseAPI;
  ClearRequestError;
  AddAuthorization(RestRequest);
  if Assigned(BodyJson) then
  begin
    RestRequest.AddBody(BodyJson);
    if FSaveJSONRequest then
      SaveJSON(BodyJson.ToString, Route, tRequest);
  end;
  if FGenerateLogRequestContent then
    Log('#TDadosJahDFe.Patch# Route: ' + Route + '; Body: ' + IfThen(Assigned(BodyJson), BodyJson.ToString, ''));
  try
    try
      RestRequest.Execute;
    except
      on E: Exception do
        Log('#TDadosJahDFe.Patch# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' +
          RestRequest.Response.StatusText + '. Mensagem' + E.Message);
    end;
  finally
    if FGenerateLogResponseContent then
      Log('#TDadosJahDFe.Patch# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' + RestRequest.Response.StatusText +
        '; Content: ' + RestRequest.Response.Content);
    Result := FillResponseAPI(RestRequest.Response.statuscode, RestRequest);
    RestClient.Free;
    RestRequest.Free;
    if FSaveJSONResponse then
      SaveJSON(Result.Content, Route, tResponse);
  end;
end;

function TDadosJahDFe.Patch(Route: String;
  BodyArray:
  TJSONArray): TResponseAPI;
var
  RestClient: TRESTClient;
  RestRequest: TRESTRequest;
begin
  RestClient := TRESTClient.Create(URLBASE);
  RestRequest := TRESTRequest.Create(nil);
  InitializeRest(RestClient, RestRequest, Route, rmPATCH);
  ClearResponseAPI;
  ClearRequestError;
  AddAuthorization(RestRequest);
  if Assigned(BodyArray) then
  begin
    RestRequest.AddBody(BodyArray);
    if FSaveJSONRequest then
      SaveJSON(BodyArray.ToString, Route, tRequest);
  end;
  if FGenerateLogRequestContent then
    Log('#TDadosJahDFe.Patch# Route: ' + Route + '; Body: ' + IfThen(Assigned(BodyArray), BodyArray.ToString, ''));
  try
    try
      RestRequest.Execute;
    except
      on E: Exception do
        Log('#TDadosJahDFe.Patch# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' +
          RestRequest.Response.StatusText + '. Mensagem' + E.Message);
    end;
  finally
    if FGenerateLogResponseContent then
      Log('#TDadosJahDFe.Patch# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' + RestRequest.Response.StatusText +
        '; Content: ' + RestRequest.Response.Content);
    Result := FillResponseAPI(RestRequest.Response.statuscode, RestRequest);
    RestClient.Free;
    RestRequest.Free;
    if FSaveJSONResponse then
      SaveJSON(Result.Content, Route, tResponse);
  end;
end;

function TDadosJahDFe.Delete(Route: String;
  BodyArray:
  TJSONArray): TResponseAPI;
var
  RestClient: TRESTClient;
  RestRequest: TRESTRequest;
begin
  RestClient := TRESTClient.Create(URLBASE);
  RestRequest := TRESTRequest.Create(nil);
  InitializeRest(RestClient, RestRequest, Route, rmDELETE);
  ClearResponseAPI;
  ClearRequestError;
  AddAuthorization(RestRequest);
  if Assigned(BodyArray) then
  begin
    RestRequest.AddBody(BodyArray);
    if FSaveJSONRequest then
      SaveJSON(BodyArray.ToString, Route, tRequest);
  end;
  if FGenerateLogRequestContent then
    Log('#TDadosJahDFe.Delete# Route: ' + Route + '; Body: ' + IfThen(Assigned(BodyArray), BodyArray.ToString, ''));
  try
    try
      RestRequest.Execute;
    except
      on E: Exception do
        Log('#TDadosJahDFe.Delete# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' +
          RestRequest.Response.StatusText + '. Mensagem' + E.Message);
    end;
  finally
    if FGenerateLogResponseContent then
      Log('#TDadosJahDFe.Delete# Route: ' + Route + '; StatusCode: ' + RestRequest.Response.statuscode.ToString + '; StatusText: ' + RestRequest.Response.StatusText +
        '; Content: ' + RestRequest.Response.Content);
    Result := FillResponseAPI(RestRequest.Response.statuscode, RestRequest);
    RestClient.Free;
    RestRequest.Free;
    if FSaveJSONResponse then
      SaveJSON(Result.Content, Route, tResponse);
  end;
end;

function TDadosJahDFe.StatusCodeOK(statuscode: Integer): Boolean;
begin
  Result := statuscode in [200, 201];
end;

function TDadosJahDFe.cStatNotaEmitida(cStat: Integer): Boolean;
begin
  Result := cStat in [100];
end;

function TDadosJahDFe.SystemModify(nameCompany, password: String): TResponseSystem;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseSystem;
  if (nameCompany.Trim = '') and (password.Trim = '') then
  begin
    Log('#TDadosJahDFe.SystemModify# nameCompany ou password não preenchidos.');
    Exit;
  end;

  if (nameCompany.Trim = '') then
  begin
    Log('#TDadosJahDFe.SystemModify# nameCompany não preenchido.');
    Exit;
  end;

  try
    JBody := JsonSystemModify(nameCompany, password);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.SystemModify# ' + E.Message);
      raise Exception.Create(STR_SYSTEM_MODIFY_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.SystemModify# ' + STR_SYSTEM_MODIFY);
    resp := Patch(RouteToStr(rtSystem, FVersionAPI), JBody);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseSystem(resp.Content)
    else
      Log('#TDadosJahDFe.SystemModify# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.SystemModify# ' + STR_SYSTEM_MODIFY_ERRO + '  StatusCode: ' + resp.statuscode.ToString + '; Content: ' + resp.Content + '; Mensagem Erro: ' +
          E.Message)
      else
        Log('#TDadosJahDFe.SystemModify# ' + STR_SYSTEM_MODIFY_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_SYSTEM_MODIFY_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.SystemModifyUser(vListUserModifySystem: TListUserModifySystem): TResponseUser;
var
  resp: TResponseAPI;
  JBodyArray: TJSONArray;
begin
  Result := ClearResponseUser;

  if (Length(vListUserModifySystem) = 0) then
  begin
    Log('#TDadosJahDFe.SystemModifyUser# Usuários não preenchidos.');
    Exit;
  end;

  try
    JBodyArray := JsonSystemUserModify(vListUserModifySystem);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.SystemModifyUser# ' + E.Message);
      raise Exception.Create(STR_USER_MODIFY_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.SystemModifyUser# ' + STR_USER_MODIFY);
    resp := Patch(RouteToStr(rtUser, FVersionAPI), JBodyArray);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseUser(resp.Content)
    else
      Log('#TDadosJahDFe.SystemModifyUser# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.SystemModifyUser# ' + STR_USER_MODIFY_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.SystemModifyUser# ' + STR_USER_MODIFY_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_USER_MODIFY_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.SystemMyAccount: TResponseSystem;
var
  resp: TResponseAPI;
begin
  Result := ClearResponseSystem;

  try
    Log('#TDadosJahDFe.SystemMyAccount# ' + STR_SYSTEM_MY_ACCOUNT);
    resp := Get(RouteToStr(rtSystem, FVersionAPI), nil);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseSystem(resp.Content)
    else
      Log('#TDadosJahDFe.SystemMyAccount# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.SystemMyAccount# ' + STR_SYSTEM_MY_ACCOUNT_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.SystemMyAccount# ' + STR_SYSTEM_MY_ACCOUNT_ERRO + ' ' + E.Message);
      raise Exception(STR_SYSTEM_MY_ACCOUNT_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.SystemRespTecCSRT(listRespTec: TListRespTecCSRT) : TResponseRespTecCSRT;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseRespTecCSRT;
  try
    JBody := JsonRespTecCSRT(listRespTec);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.SystemRespTecCSRT# ' + E.Message);
      raise Exception.Create(STR_SYSTEM_RESPTECCSRT_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.SystemRespTecCSRT# ' + STR_SYSTEM_RESPTECCSRT);
    resp := Post(RouteToStr(rtSystemRespTecCSRT, FVersionAPI), JBody);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseRespTecCSRT(resp.Content)
    else
      Log('#TDadosJahDFe.SystemRespTecCSRT# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.SystemRespTecCSRT# ' + STR_SYSTEM_RESPTECCSRT_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.SystemRespTecCSRT# ' + STR_SYSTEM_RESPTECCSRT_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_SYSTEM_RESPTECCSRT_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.UserAdd(name, email, idExternal, cnpj: String; notification: Boolean; TimeZone: TTimeZone; nfce: TNFCeUser): TResponseUser;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseUser;
  try
    JBody := JsonUserAdd(name, email, idExternal, cnpj, notification, TimeZone, nfce);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.UserAdd# ' + E.Message);
      raise Exception.Create(STR_USER_ADD_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.UserAdd# ' + STR_USER_ADD);
    resp := Post(RouteToStr(rtUser, FVersionAPI), JBody);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseUser(resp.Content)
    else
      Log('#TDadosJahDFe.UserAdd# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.UserAdd# ' + STR_USER_ADD_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.UserAdd# ' + STR_USER_ADD_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_USER_ADD_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.UserDelete(ListIdUser: TArray<String>): TResponseUser;
var
  resp: TResponseAPI;
  JBodyArray: TJSONArray;
begin
  Result := ClearResponseUser;

  if (Length(ListIdUser) = 0) then
  begin
    Log('#TDadosJahDFe.UserDelete# lista de usuários não preenchida.');
    Exit;
  end;

  try
    JBodyArray := JsonArrayIdUser(ListIdUser);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.UserDelete# ' + E.Message);
      raise Exception.Create(STR_USER_DELETE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.UserDelete# ' + STR_USER_DELETE);
    resp := Delete(RouteToStr(rtUser, FVersionAPI), JBodyArray);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseUser(resp.Content)
    else
      Log('#TDadosJahDFe.UserDelete# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.UserDelete# ' + STR_USER_DELETE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.UserDelete# ' + STR_USER_DELETE_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_USER_DELETE_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.UserList(pageSize, page: Integer): TResponseUser;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
  Params: TRESTRequestParameterList;
begin
  Result := ClearResponseUser;

  Params := TRESTRequestParameterList.Create(nil);
  try
    JBody := JsonPagination(pageSize, page);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.UserList# ' + E.Message);
      raise Exception.Create(STR_USER_LIST_ERRO + ' ' + E.Message);
    end;
  end;

  try
    try
      Log('#TDadosJahDFe.UserList# ' + STR_USER_LIST);
      resp := Get(RouteToStr(rtUserList, FVersionAPI), Params, JBody);
      if StatusCodeOK(resp.statuscode) then
        Result := ParseJSONToResponseUser(resp.Content)
      else
        Log('#TDadosJahDFe.UserList# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
          ArrayListToStr(resp.Error.messageList));
    except
      on E: Exception do
      begin
        if (resp.Content.Trim <> '') then
          Log('#TDadosJahDFe.UserList# ' + STR_USER_LIST_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
            resp.Content + '; Mensagem Erro: ' + E.Message)
        else
          Log('#TDadosJahDFe.UserList# ' + STR_USER_LIST_ERRO + ' ' + E.Message);
        raise Exception.Create(STR_USER_LIST_ERRO + ' ' + E.Message);
      end;
    end;
  finally
    Params.Free;
  end;
end;

function TDadosJahDFe.UserModify(name, email: String; notification: Boolean; nfce: TNFCeUser): TResponseUser;
var
  resp: TResponseAPI;
  JBody: TJsonObject;
begin
  Result := ClearResponseUser;
  try
    JBody := JsonUserModify(name, email, notification, nfce);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.UserModify# ' + E.Message);
      raise Exception.Create(STR_USER_MODIFY_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.UserModify# ' + STR_USER_MODIFY);
    resp := Patch(RouteToStr(rtUser, FVersionAPI), JBody);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseUser(resp.Content)
    else
      Log('#TDadosJahDFe.UserModify# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.UserModify# ' + STR_USER_MODIFY_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.UserModify# ' + STR_USER_MODIFY_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_USER_MODIFY_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.UserRestore(ListIdUser: TArray<String>): TResponseUser;
var
  resp: TResponseAPI;
  JBodyArray: TJSONArray;
begin
  Result := ClearResponseUser;

  if (Length(ListIdUser) = 0) then
  begin
    Log('#TDadosJahDFe.UserRestore# lista de usuários não preenchida.');
    Exit;
  end;

  try
    JBodyArray := JsonArrayIdUser(ListIdUser);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.UserRestore# ' + E.Message);
      raise Exception.Create(STR_USER_RESTORE_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.UserRestore# ' + STR_USER_RESTORE);
    resp := Delete(RouteToStr(rtUserRestore, FVersionAPI), JBodyArray);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseUser(resp.Content)
    else
      Log('#TDadosJahDFe.UserRestore# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.UserRestore# ' + STR_USER_RESTORE_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.UserRestore# ' + STR_USER_RESTORE_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_USER_RESTORE_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.GetUser(ListIdUser: TArray<String>): TResponseUser;
var
  resp: TResponseAPI;
  JBodyArray: TJSONArray;
begin
  Result := ClearResponseUser;

  if (Length(ListIdUser) = 0) then
  begin
    Log('#TDadosJahDFe.GetUser# nameCompany ou password não preenchidos.');
    Exit;
  end;

  try
    JBodyArray := JsonArrayIdUser(ListIdUser);
  except
    on E: Exception do
    begin
      Log('#TDadosJahDFe.GetUser# ' + E.Message);
      raise Exception.Create(STR_USER_GET_ERRO + ' ' + E.Message);
    end;
  end;

  try
    Log('#TDadosJahDFe.GetUser# ' + STR_USER_GET);
    resp := Get(RouteToStr(rtUser, FVersionAPI), nil, JBodyArray);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseUser(resp.Content)
    else
      Log('#TDadosJahDFe.GetUser# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.GetUser# ' + STR_USER_GET_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.GetUser# ' + STR_USER_GET_ERRO + ' ' + E.Message);
      raise Exception.Create(STR_USER_GET_ERRO + ' ' + E.Message);
    end;
  end;
end;

function TDadosJahDFe.UserMyAccount: TResponseUser;
var
  resp: TResponseAPI;
begin
  Result := ClearResponseUser;

  try
    Log('#TDadosJahDFe.UserMyAccount# ' + STR_USER_MY_ACCOUNT);
    resp := Get(RouteToStr(rtUser, FVersionAPI), nil);
    if StatusCodeOK(resp.statuscode) then
      Result := ParseJSONToResponseUser(resp.Content)
    else
      Log('#TDadosJahDFe.UserMyAccount# Erro na Requisição. StatusCode: ' + resp.Error.statuscode.ToString + '; Erro: ' + resp.Error.Error + '; Mensagem: ' +
        ArrayListToStr(resp.Error.messageList));
  except
    on E: Exception do
    begin
      if (resp.Content.Trim <> '') then
        Log('#TDadosJahDFe.UserMyAccount# ' + STR_USER_MY_ACCOUNT_ERRO + ' StatusCode: ' + resp.statuscode.ToString + '; Content: ' +
          resp.Content + '; Mensagem Erro: ' + E.Message)
      else
        Log('#TDadosJahDFe.UserMyAccount# ' + STR_USER_MY_ACCOUNT_ERRO + ' ' + E.Message);
      raise Exception(STR_USER_MY_ACCOUNT_ERRO + ' ' + E.Message);
    end;
  end;
end;

end.

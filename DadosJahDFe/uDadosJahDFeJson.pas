unit uDadosJahDFeJson;

interface

uses
  System.Classes, System.SysUtils, DateUtils, StrUtils, System.JSON, System.Generics.Collections, uDadosJahDFeTypes, uDadosJahDFeConversion;

function JsonStrToInt(vObj: TJsonObject; vCampo: String): Integer;
function JsonStrToFloat(vObj: TJsonObject; vCampo: String): Double;
function JsonStrToDateTime(vObj: TJsonObject; vCampo: String): TDateTime;

function ParseJSONToError(const AJSON: string): TError;
function ParseJSONToAccessToken(const AJSON: string): TAccessToken;
function ParseJSONToLogout(const AJSON: string): String;
function ParseJSONToForget(const AJSON: string): String;
function ParseJSONToReset(const AJSON: string): TAccessToken;
function ParseJSONToCertificate(const AJSON: string): TCertificate;
function ParseJSONToEmit(const AJSON: string): TEmit;
function ParseJSONToAutXML(const AJSON: string): TListAutXML;
function ParseJSONToStatusService(const AJSON: string): TStatusService;
function ParseJSONToIdBatch(const AJSON: string): String;
function ParseJSONToConsultSefazNFeNFCe(const AJSON: string): TConsultSefazNFeNFCe;
function ParseJSONToResponseConsultSefazNFe(const AJSON: string): TResponseConsultSefazNFeNFCe;
function ParseJSONToResponseConsultSefazNFCe(const AJSON: string): TResponseConsultSefazNFeNFCe;
function ParseJSONToResponseEmissionNFe(const AJSON: string): TResponseConsultNFeNFCe;
function ParseJSONToResponseEmissionNFCe(const AJSON: string): TResponseConsultNFeNFCe;
function ParseJSONToResponseConsultXMLNFe(const AJSON: string): TResponseConsultXMLNFeNFCe;
function ParseJSONToResponseConsultXMLNFCe(const AJSON: string): TResponseConsultXMLNFeNFCe;
function ParseJSONToResponseXMLNFeNFCe(const AJSON: string): TResponseXMLNFeNFCe;
function ParseJSONToResponseConsultNFe(const AJSON: string): TResponseConsultNFeNFCe;
function ParseJSONToResponseConsultNFCe(const AJSON: string): TResponseConsultNFeNFCe;
function ParseJSONToResponseNFeNFCe(const AJSON: string): TResponseEmissionNFeNFCe;
function ParseJSONToResponseConsultDANFe(const AJSON: string): TResponseConsultDANFeDANFCe;
function ParseJSONToResponseConsultDANFCe(const AJSON: string): TResponseConsultDANFeDANFCe;
function ParseJSONToResponseDANFeDANFCe(const AJSON: string): TResponseDANFeDANFCe;
function ParseJSONToResponseConsultCancelNFeNFCe(const AJSON: string): TResponseConsultCancelNFeNFCe;
function ParseJSONToResponseObjCancelNFeNFCe(const AJSON: string): TResponseCancelNFeNFCe;
function ParseJSONToResponseConsultDisenableNFeNFCe(const AJSON: string): TResponseConsultDisenableNFeNFCe;
function ParseJSONToResponseObjDisenableNFeNFCe(const AJSON: string): TResponseDisenableNFeNFCe;
function ParseJSONToResponseConsultCorrectionNFe(const AJSON: string): TResponseConsultCorrectionNFe;
function ParseJSONToResponseObjCorrectionNFe(const AJSON: string): TResponseCorrectionNFe;
function ParseJSONToResponseSystem(const AJSON: string): TResponseSystem;
function ParseJSONToResponseObjSystem(const AJSON: string): TSystem;
function ParseJSONToResponseUser(const AJSON: string): TResponseUser;
function ParseJSONToResponseObjUser(const AJSON: string): TUser;
function ParseJSONToResponseObjUserEmit(const AJSON: string): TEmit;
function ParseJSONToResponseObjUserAutXML(const AJSON: string): TListAutXML;
function ParseJSONToResponseNotification(const AJSON: string): TResponseNotification;
function ParseJSONToResponseObjNotification(const AJSON: string): TNotification;
function ParseJSONToResponseEventCancelPrint(const AJSON: string): TResponseEventCancelPrint;
function ParseJSONToResponseObjEventCancelPrint(const AJSON: string): TEventCancelPrint;
function ParseJSONToResponseEventDisenablePrint(const AJSON: string): TResponseEventDisenablePrint;
function ParseJSONToResponseObjEventDisenablePrint(const AJSON: string): TEventDisenablePrint;
function ParseJSONToResponseEventCorrectionPrint(const AJSON: string): TResponseEventCorrectionPrint;
function ParseJSONToResponseObjEventCorrectionPrint(const AJSON: string): TEventCorrectionPrint;
function ParseJSONToResponseDanfePDF(const AJSON: string): TResponseDanfPDF;
function ParseJSONToResponseDanfcePDF(const AJSON: string): TResponseDanfPDF;
function ParseJSONToResponseObjDanfPDF(const AJSON: string): TDanfPDF;
function ParseJSONToResponseRespTecCSRT(const AJSON: string): TResponseRespTecCSRT;
function ParseJSONToResponseObjRespTecCSRT(const AJSON: string): TRespTecCSRT;

function JsonAuthLogin(const vAuth: TAuth): TJsonObject;
function JsonAuthForget(const email: String): TJsonObject;
function JsonAuthReset(const password, resetToken: String): TJsonObject;
function JsonSystemModify(const nameCompany, password: String): TJsonObject;
function JsonUserAdd(const name, email, idExternal, cnpj: String; const notification: Boolean; const timezone: TTimeZone; const nfce: TNFCeUser): TJsonObject;
function JsonUserModify(const name, email: String; const notification: Boolean; const nfce: TNFCeUser): TJsonObject;
function JsonRespTecCSRT(const listRespTecCSRT: TListRespTecCSRT): TJsonObject;
function JsonArrayIdUser(const ListIdUser: TArray<String>): TJSONArray;
function JsonUserNotification(const vListNotification: TListNotification): TJSONArray;
function JsonSystemUserModify(const vListUserModifySystem: TListUserModifySystem): TJSONArray;
function JsonCertificate(const vCertificateFile: TCertificateFile): TJsonObject;
function JsonEmit(const vEmit: TEmit): TJsonObject;
function JsonAutXML(const vListAutXML: TListAutXML): TJsonObject;
function JsonNFeEmission(const nfe: TNFeNFCe; const async: Boolean; const vTimeZone: TTimeZone; vFormatSettings: TFormatSettings): TJsonObject; overload;
function JsonNFeEmission(const ListNFe: TListNFeNFCe; const async: Boolean; const vTimeZone: TTimeZone; vFormatSettings: TFormatSettings): TJsonObject; overload;
function JsonNFCeEmission(const nfce: TNFeNFCe; const async: Boolean; const vTimeZone: TTimeZone; vFormatSettings: TFormatSettings): TJsonObject; overload;
function JsonNFCeEmission(const ListNFCe: TListNFeNFCe; const async: Boolean; const vTimeZone: TTimeZone; vFormatSettings: TFormatSettings): TJsonObject; overload;
function JsonInfNFeNFCe(const vNFeNFCe: TNFeNFCe; const vModeloDFe: TModeloDFe; const vTimeZone: TTimeZone; vFormatSettings: TFormatSettings): TJsonObject;
function JsonInfProt(const vInfProt: TInfProt; const vTimeZone: TTimeZone): TJsonObject;
function JsonInfNFeNFCeAgropecuario(const vAgropecuario: TAgropecuario): TJsonObject;
function JsonInfNFeNFCeAutXML(const vAutXML: TListAutXML): TJSONArray;
function JsonInfNFeNFCeCana(const vCana: TCana; vFormatSettings: TFormatSettings): TJsonObject;
function JsonInfNFeNFCeCobr(const vCobr: TCobr; vFormatSettings: TFormatSettings): TJsonObject;
function JsonInfNFeNFCeCompra(const vCompra: TCompra): TJsonObject;
function JsonInfNFeNFCeDest(const vDest: TDest; const vModeloDFe: TModeloDFe): TJsonObject;
function JsonInfNFeNFCeDet(const vListDet: TListDet; vFormatSettings: TFormatSettings): TJSONArray;
function JsonInfNFeNFCeEmit(const vEmit: TEmit): TJsonObject;
function JsonInfNFeNFCeEntrega(const vEntrega: TEntrega): TJsonObject;
function JsonInfNFeNFCeExporta(const vExporta: TExporta): TJsonObject;
function JsonInfNFeNFCeIde(const vIde: TIde; const vModeloDFe: TModeloDFe; const vTimeZone: TTimeZone): TJsonObject;
function JsonInfNFeNFCeInfAdic(const vInfAdic: TInfAdic): TJsonObject;
function JsonInfNFeNFCeInfIntermed(const vInfIntermed: TInfIntermed): TJsonObject;
function JsonInfNFeNFCeInfRespTec(const vInfRespTec: TInfRespTec): TJsonObject;
function JsonInfNFeNFCePag(const vPag: TPag; vFormatSettings: TFormatSettings): TJsonObject;
function JsonInfNFeNFCeRetirada(const vRetirada: TRetirada): TJsonObject;
function JsonInfNFeNFCeTotal(const vTotal: TTotal; vFormatSettings: TFormatSettings): TJsonObject;
function JsonInfNFeNFCeTransp(const vTransp: TTransp; vFormatSettings: TFormatSettings): TJsonObject;
function JsonCancelNFeNFCe(const vListEventCancel: TListEventCancel; const vAsync: Boolean; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TJsonObject; overload;
function JsonCancelNFeNFCe(const vEventCancel: TEventCancel; const vAsync: Boolean; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TJsonObject; overload;
function JsonDisenableNFeNFCe(const vListEventDisenable: TListEventDisenable; const vAsync: Boolean; const vTpAmb: TAmb): TJsonObject; overload;
function JsonDisenableNFeNFCe(const vEventDisenable: TEventDisenable; const vAsync: Boolean; const vTpAmb: TAmb): TJsonObject; overload;
function JsonCorrectionNFe(const vListEventCorrection: TListEventCorrection; const vAsync: Boolean; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TJsonObject; overload;
function JsonCorrectionNFe(const vEventCorrection: TEventCorrection; const vAsync: Boolean; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TJsonObject; overload;
function JsonPagination(const vPageSize, vPage: Integer): TJsonObject;
function JsonXML(const vXML: String): TJsonObject;

implementation

uses uDadosJahDFe, uDadosJahDFeConsts;

function ParseJSONToError(const AJSON: string): TError;
var
  JSONObject: TJsonObject;
  JSONArray: TJSONArray;
  I: Integer;
begin
  Result := ClearError;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    if JSONObject.TryGetValue<Integer>('statusCode', Result.statusCode) then
    begin
      JSONObject.TryGetValue<string>('error', Result.error);
      if JSONObject.TryGetValue<TJSONArray>('message', JSONArray) then
      begin
        SetLength(Result.messageList, JSONArray.Count);
        for I := 0 to JSONArray.Count - 1 do
          Result.messageList[I] := JSONArray.Items[I].Value;
      end;
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToAccessToken(const AJSON: string): TAccessToken;
var
  JSONObject, JObjData: TJsonObject;
begin
  Result := ClearAccessToken;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<string>('accessToken', Result.accessToken) then
          Result.expiresAt := JsonStrToDateTime(JObjData, 'expiresAt');
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToAccessToken# Erro ao tentar converter json para o tipo TAccessToken. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToReset(const AJSON: string): TAccessToken;
var
  JSONObject, JObjData: TJsonObject;
begin
  Result := ClearAccessToken;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<string>('accessToken', Result.accessToken) then
          Result.expiresAt := JsonStrToDateTime(JObjData, 'expiresAt');
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToReset# Erro ao tentar converter json para o tipo TAccessToken. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToLogout(const AJSON: string): String;
var
  JSONObject, JObjData: TJsonObject;
begin
  Result := '';

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
        JObjData.TryGetValue<string>('message', Result);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToLogout# Erro ao tentar converter json para o tipo String. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToForget(const AJSON: string): String;
var
  JSONObject, JObjData: TJsonObject;
begin
  Result := '';

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
        JObjData.TryGetValue<string>('resetToken', Result);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToForget# Erro ao tentar converter json para o tipo String. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToCertificate(const AJSON: string): TCertificate;
var
  JSONObject, JObjData: TJsonObject;
begin
  Result := ClearCertificate;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        JObjData.TryGetValue<String>('numeroSerie', Result.NumeroSerie);
        JObjData.TryGetValue<String>('razaoSocial', Result.RazaoSocial);
        JObjData.TryGetValue<String>('cnpj', Result.cnpj);
        Result.Validade := JsonStrToDateTime(JObjData, 'validade');
        JObjData.TryGetValue<String>('certificadora', Result.Certificadora);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToCertificate# Erro ao tentar converter json para o tipo TCertificate. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToEmit(const AJSON: string): TEmit;
var
  JSONObject, JObjData, JObjEmit, JObjEnderEmit: TJsonObject;
  vCRT: String;
begin
  Result := ClearEmit;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJsonObject>('emit', JObjEmit) then
        begin
          JObjEmit.TryGetValue<String>('CNPJCPF', Result.CNPJCPF);
          JObjEmit.TryGetValue<String>('xNome', Result.xNome);
          JObjEmit.TryGetValue<String>('xFant', Result.xFant);
          JObjEmit.TryGetValue<String>('IE', Result.IE);
          JObjEmit.TryGetValue<String>('IEST', Result.IEST);
          JObjEmit.TryGetValue<String>('IM', Result.IM);
          JObjEmit.TryGetValue<String>('CNAE', Result.CNAE);
          JObjEmit.TryGetValue<String>('CRT', vCRT);
          Result.CRT := StrToCRT(vCRT);
          if JObjEmit.TryGetValue<TJsonObject>('enderEmit', JObjEnderEmit) then
          begin
            JObjEnderEmit.TryGetValue<String>('xLgr', Result.enderEmit.xLgr);
            JObjEnderEmit.TryGetValue<String>('nro', Result.enderEmit.nro);
            JObjEnderEmit.TryGetValue<String>('xCpl', Result.enderEmit.xCpl);
            JObjEnderEmit.TryGetValue<String>('xBairro', Result.enderEmit.xBairro);
            JObjEnderEmit.TryGetValue<String>('xMun', Result.enderEmit.xMun);
            JObjEnderEmit.TryGetValue<String>('UF', Result.enderEmit.UF);
            JObjEnderEmit.TryGetValue<String>('CEP', Result.enderEmit.CEP);
            JObjEnderEmit.TryGetValue<String>('xPais', Result.enderEmit.xPais);
            JObjEnderEmit.TryGetValue<String>('fone', Result.enderEmit.fone);
            Result.enderEmit.cMun := JsonStrToInt(JObjEnderEmit, 'cMun');
            Result.enderEmit.cPais := JsonStrToInt(JObjEnderEmit, 'cPais');
          end;
        end;
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToEmit# Erro ao tentar converter json para o tipo TEmit. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToAutXML(const AJSON: string): TListAutXML;
var
  JSONObject, JObjData: TJsonObject;
  JArrayAutXml: TJSONArray;
  JValue: TJSONValue;
  Indice: Integer;
begin
  SetLength(Result, 0);

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('autXML', JArrayAutXml) then
        begin
          SetLength(Result, JArrayAutXml.Count);
          Indice := 0;

          for JValue in JArrayAutXml do
          begin
            if JValue is TJsonObject then
              TJsonObject(JValue).TryGetValue<String>('CNPJCPF', Result[Indice]);

            Inc(Indice);
          end;
        end;
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToAutXML# Erro ao tentar converter json para o tipo TListAutXML. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToStatusService(const AJSON: string): TStatusService;
var
  JSONObject, JObjData, JObjStatus: TJsonObject;
  strAmb: String;
begin
  Result := ClearStatusService;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJsonObject>('status', JObjStatus) then
        begin
          JObjStatus.TryGetValue<String>('Msg', Result.Msg);
          JObjStatus.TryGetValue<String>('verAplic', Result.VerAplic);
          JObjStatus.TryGetValue<String>('versao', Result.Versao);
          JObjStatus.TryGetValue<String>('xMotivo', Result.XMotivo);
          JObjStatus.TryGetValue<String>('xObs', Result.XObs);
          Result.CStat := JsonStrToInt(JObjStatus, 'cStat');
          Result.cUF := JsonStrToInt(JObjStatus, 'cUF');
          Result.TMed := JsonStrToInt(JObjStatus, 'TMed');
          Result.responseTime := JsonStrToInt(JObjStatus, 'responseTime');

          JObjStatus.TryGetValue<String>('tpAmb', strAmb);
          Result.tpAmb := StrToAmb(strAmb);
          Result.DhRecbto := JsonStrToDateTime(JObjStatus, 'dhRecbto');
          Result.DhRetorno := JsonStrToDateTime(JObjStatus, 'dhRecbto');
        end;
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToStatusService# Erro ao tentar converter json para o tipo TStatusService. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToIdBatch(const AJSON: string): String;
var
  JSONObject, JObjData: TJsonObject;
begin
  Result := '';

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
        JObjData.TryGetValue<String>('idBatch', Result);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToIdBatch# Erro ao tentar converter json para o tipo idBatch. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToConsultSefazNFeNFCe(const AJSON: string): TConsultSefazNFeNFCe;
var
  JSONObject: TJsonObject;
  strAmb: String;
begin
  Result := ClearConsultSefazNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      Result.CStat := JsonStrToInt(JSONObject, 'cStat');
      Result.cUF := JsonStrToInt(JSONObject, 'cUF');
      JSONObject.TryGetValue<String>('chDfe', Result.chDfe);
      Result.DhRecbto := JsonStrToDateTime(JSONObject, 'dhRecbto');
      JSONObject.TryGetValue<String>('digVal', Result.digVal);
      JSONObject.TryGetValue<String>('Msg', Result.Msg);
      Result.TMed := JsonStrToInt(JSONObject, 'TMed');
      JSONObject.TryGetValue<String>('verAplic', Result.VerAplic);
      JSONObject.TryGetValue<String>('versao', Result.Versao);
      JSONObject.TryGetValue<String>('xMotivo', Result.XMotivo);
      Result.cMsg := JsonStrToInt(JSONObject, 'cMsg');
      JSONObject.TryGetValue<String>('xMsg', Result.xMsg);

      JSONObject.TryGetValue<String>('tpAmb', strAmb);
      Result.tpAmb := StrToAmb(strAmb);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToConsultSefazNFeNFCe# Erro ao tentar converter json para o tipo TConsultSefazNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultSefazNFe(const AJSON: string): TResponseConsultSefazNFeNFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNFe: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultSefazNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFe', JArrayNFe) then
        begin
          SetLength(Result.ListNFeNFCe, JArrayNFe.Count);
          for I := 0 to JArrayNFe.Count - 1 do
            Result.ListNFeNFCe[I] := ParseJSONToConsultSefazNFeNFCe(JArrayNFe.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultSefazNFe# Erro ao tentar converter json para TResponseConsultSefazNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultSefazNFCe(const AJSON: string): TResponseConsultSefazNFeNFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNFe: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultSefazNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFCe', JArrayNFe) then
        begin
          SetLength(Result.ListNFeNFCe, JArrayNFe.Count);
          for I := 0 to JArrayNFe.Count - 1 do
            Result.ListNFeNFCe[I] := ParseJSONToConsultSefazNFeNFCe(JArrayNFe.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultSefazNFCe# Erro ao tentar converter json para TResponseConsultSefazNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseEmissionNFe(const AJSON: string): TResponseConsultNFeNFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNFe: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFe', JArrayNFe) then
        begin
          SetLength(Result.ListNFeNFCe, JArrayNFe.Count);
          for I := 0 to JArrayNFe.Count - 1 do
            Result.ListNFeNFCe[I] := ParseJSONToResponseNFeNFCe(JArrayNFe.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseEmissionNFe# Erro ao tentar converter json para TResponseConsultNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseEmissionNFCe(const AJSON: string): TResponseConsultNFeNFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNFCe: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFCe', JArrayNFCe) then
        begin
          SetLength(Result.ListNFeNFCe, JArrayNFCe.Count);
          for I := 0 to JArrayNFCe.Count - 1 do
            Result.ListNFeNFCe[I] := ParseJSONToResponseNFeNFCe(JArrayNFCe.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseEmissionNFCe# Erro ao tentar converter json para TResponseConsultNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultXMLNFe(const AJSON: string): TResponseConsultXMLNFeNFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNFe: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultXMLNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFe', JArrayNFe) then
        begin
          SetLength(Result.ListXML, JArrayNFe.Count);
          for I := 0 to JArrayNFe.Count - 1 do
            Result.ListXML[I] := ParseJSONToResponseXMLNFeNFCe(JArrayNFe.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultXMLNFe# Erro ao tentar converter json para TResponseConsultXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultXMLNFCe(const AJSON: string): TResponseConsultXMLNFeNFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNFCe: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultXMLNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFCe', JArrayNFCe) then
        begin
          SetLength(Result.ListXML, JArrayNFCe.Count);
          for I := 0 to JArrayNFCe.Count - 1 do
            Result.ListXML[I] := ParseJSONToResponseXMLNFeNFCe(JArrayNFCe.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultXMLNFCe# Erro ao tentar converter json para TResponseConsultXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseXMLNFeNFCe(const AJSON: string): TResponseXMLNFeNFCe;
var
  JSONObject: TJsonObject;
  strAmb: String;
begin
  Result := ClearResponseXMLNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('idDfe', Result.idDfe);
      JSONObject.TryGetValue<String>('chDfe', Result.chDfe);
      JSONObject.TryGetValue<String>('idExternal', Result.idExternal);
      JSONObject.TryGetValue<String>('xml', Result.xml);
      JSONObject.TryGetValue<String>('xmlLink', Result.xmlLink);
      Result.serie := JsonStrToInt(JSONObject, 'serie');
      Result.nNF := JsonStrToInt(JSONObject, 'nNF');

      JSONObject.TryGetValue<String>('tpAmb', strAmb);
      Result.tpAmb := StrToAmb(strAmb);
      Result.dhEmi := JsonStrToDateTime(JSONObject, 'dhEmi');
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseXMLNFeNFCe# Erro ao tentar converter json para o tipo TResponseXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseDANFeDANFCe(const AJSON: string): TResponseDANFeDANFCe;
var
  JSONObject: TJsonObject;
  strAmb: String;
begin
  Result := ClearResponseDANFeDANFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('idDfe', Result.idDfe);
      JSONObject.TryGetValue<String>('chDfe', Result.chDfe);
      JSONObject.TryGetValue<String>('idExternal', Result.idExternal);
      JSONObject.TryGetValue<String>('pdf', Result.pdfBase64);
      JSONObject.TryGetValue<String>('pdfLink', Result.pdfLink);
      JSONObject.TryGetValue<String>('tpAmb', strAmb);
      Result.tpAmb := StrToAmb(strAmb);
      Result.serie := JsonStrToInt(JSONObject, 'serie');
      Result.nNF := JsonStrToInt(JSONObject, 'nNF');
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseXMLNFeNFCe# Erro ao tentar converter json para o tipo TResponseDANFeDANFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultCancelNFeNFCe(const AJSON: string): TResponseConsultCancelNFeNFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayEvent: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultCancelNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('events', JArrayEvent) then
        begin
          SetLength(Result.ListEvent, JArrayEvent.Count);
          for I := 0 to JArrayEvent.Count - 1 do
            Result.ListEvent[I] := ParseJSONToResponseObjCancelNFeNFCe(JArrayEvent.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultCancelNFeNFCe# Erro ao tentar converter json para TResponseConsultCancelNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjCancelNFeNFCe(const AJSON: string): TResponseCancelNFeNFCe;
var
  JSONObject: TJsonObject;
  strAmb, strSituation: String;
begin
  Result := ClearResponseCancelNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('idCan', Result.idCan);
      JSONObject.TryGetValue<String>('idDfe', Result.idDfe);
      JSONObject.TryGetValue<String>('idBatch', Result.idBatch);
      JSONObject.TryGetValue<String>('xJust', Result.xJust);
      JSONObject.TryGetValue<String>('xMotivo', Result.XMotivo);
      JSONObject.TryGetValue<String>('nProtCan', Result.nProtCan);
      JSONObject.TryGetValue<String>('CNPJDest', Result.CNPJDest);
      JSONObject.TryGetValue<String>('chDfe', Result.chDfe);
      JSONObject.TryGetValue<String>('digVal', Result.digVal);
      JSONObject.TryGetValue<String>('xml', Result.xml);
      JSONObject.TryGetValue<String>('xmlLink', Result.xmlLink);
      JSONObject.TryGetValue<String>('pdf', Result.pdfBase64);
      JSONObject.TryGetValue<String>('pdfLink', Result.pdfLink);
      Result.CStat := JsonStrToInt(JSONObject, 'cStat');
      Result.cOrgao := JsonStrToInt(JSONObject, 'cOrgao');

      JSONObject.TryGetValue<String>('situation', strSituation);
      Result.situation := StrToSituationAPI(strSituation);

      JSONObject.TryGetValue<String>('tpAmb', strAmb);
      Result.tpAmb := StrToAmb(strAmb);

      Result.dhEnv := JsonStrToDateTime(JSONObject, 'dhEnv');
      Result.dhRegEvento := JsonStrToDateTime(JSONObject, 'dhRegEvento');
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseObjCancelNFeNFCe# Erro ao tentar converter json para o tipo TResponseCancelNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultDisenableNFeNFCe(const AJSON: string): TResponseConsultDisenableNFeNFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayEvent: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultDisenableNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('events', JArrayEvent) then
        begin
          SetLength(Result.ListEvent, JArrayEvent.Count);
          for I := 0 to JArrayEvent.Count - 1 do
            Result.ListEvent[I] := ParseJSONToResponseObjDisenableNFeNFCe(JArrayEvent.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultCancelNFeNFCe# Erro ao tentar converter json para TResponseConsultCancelNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjDisenableNFeNFCe(const AJSON: string): TResponseDisenableNFeNFCe;
var
  JSONObject: TJsonObject;
  strAmb, strSituation: String;
begin
  Result := ClearResponseDisenableNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('idInu', Result.idInu);
      JSONObject.TryGetValue<String>('idBatch', Result.idBatch);
      JSONObject.TryGetValue<String>('xJust', Result.xJust);
      JSONObject.TryGetValue<String>('xMotivo', Result.XMotivo);
      JSONObject.TryGetValue<String>('nProtInu', Result.nProtInu);
      JSONObject.TryGetValue<String>('xml', Result.xml);
      JSONObject.TryGetValue<String>('xmlLink', Result.xmlLink);
      JSONObject.TryGetValue<String>('pdf', Result.pdfBase64);
      JSONObject.TryGetValue<String>('pdfLink', Result.pdfLink);
      Result.ano := JsonStrToInt(JSONObject, 'ano');
      Result.serie := JsonStrToInt(JSONObject, 'serie');
      Result.nNFIni := JsonStrToInt(JSONObject, 'nNFIni');
      Result.nNFFin := JsonStrToInt(JSONObject, 'nNFFin');
      Result.CStat := JsonStrToInt(JSONObject, 'cStat');

      JSONObject.TryGetValue<String>('situation', strSituation);
      Result.situation := StrToSituationAPI(strSituation);

      JSONObject.TryGetValue<String>('tpAmb', strAmb);
      Result.tpAmb := StrToAmb(strAmb);

      Result.dhEnv := JsonStrToDateTime(JSONObject, 'dhEnv');
      Result.DhRecbto := JsonStrToDateTime(JSONObject, 'dhRecbto');
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseObjDisenableNFeNFCe# Erro ao tentar converter json para o tipo TResponseDisenableNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultCorrectionNFe(const AJSON: string): TResponseConsultCorrectionNFe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayEvent: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultCorrectionNFe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('events', JArrayEvent) then
        begin
          SetLength(Result.ListEvent, JArrayEvent.Count);
          for I := 0 to JArrayEvent.Count - 1 do
            Result.ListEvent[I] := ParseJSONToResponseObjCorrectionNFe(JArrayEvent.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultCancelNFeNFCe# Erro ao tentar converter json para TResponseConsultCancelNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjCorrectionNFe(const AJSON: string): TResponseCorrectionNFe;
var
  JSONObject: TJsonObject;
  strAmb, strSituation: String;
begin
  Result := ClearResponseCorrectionNFe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('idCce', Result.idCce);
      JSONObject.TryGetValue<String>('idBatch', Result.idBatch);
      JSONObject.TryGetValue<String>('idDfe', Result.idDfe);
      JSONObject.TryGetValue<String>('chDfe', Result.chDfe);
      JSONObject.TryGetValue<String>('xCorrecao', Result.xCorrecao);
      JSONObject.TryGetValue<String>('digVal', Result.digVal);
      JSONObject.TryGetValue<String>('xMotivo', Result.XMotivo);
      JSONObject.TryGetValue<String>('nProtCce', Result.nProtCce);
      JSONObject.TryGetValue<String>('CNPJDest', Result.CNPJDest);
      JSONObject.TryGetValue<String>('xml', Result.xml);
      JSONObject.TryGetValue<String>('xmlLink', Result.xmlLink);
      JSONObject.TryGetValue<String>('pdf', Result.pdfBase64);
      JSONObject.TryGetValue<String>('pdfLink', Result.pdfLink);
      Result.nSeqEvento := JsonStrToInt(JSONObject, 'nSeqEvento');
      Result.CStat := JsonStrToInt(JSONObject, 'cStat');
      Result.cOrgao := JsonStrToInt(JSONObject, 'cOrgao');

      JSONObject.TryGetValue<String>('situation', strSituation);
      Result.situation := StrToSituationAPI(strSituation);

      JSONObject.TryGetValue<String>('tpAmb', strAmb);
      Result.tpAmb := StrToAmb(strAmb);

      Result.dhEnv := JsonStrToDateTime(JSONObject, 'dhEnv');
      Result.dhRegEvento := JsonStrToDateTime(JSONObject, 'dhRegEvento');
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseObjCorrectionNFe# Erro ao tentar converter json para o tipo TResponseCorrectionNFe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseSystem(const AJSON: string): TResponseSystem;
var
  JSONObject, JObjData: TJsonObject;
  JArraySystem: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseSystem;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('system', JArraySystem) then
        begin
          SetLength(Result.ListSystem, JArraySystem.Count);
          for I := 0 to JArraySystem.Count - 1 do
            Result.ListSystem[I] := ParseJSONToResponseObjSystem(JArraySystem.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultXMLNFe# Erro ao tentar converter json para TResponseConsultXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjSystem(const AJSON: string): TSystem;
var
  JSONObject: TJsonObject;
  strTimeZone, strcreateAt, strupdatedAt, strdeletedAt: String;
begin
  Result := ClearSystem;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('idSystem', Result.idSystem);
      JSONObject.TryGetValue<String>('nameCompany', Result.nameCompany);
      JSONObject.TryGetValue<String>('nameSystem', Result.nameSystem);
      JSONObject.TryGetValue<String>('email', Result.email);
      JSONObject.TryGetValue<String>('cnpj', Result.cnpj);

      JSONObject.TryGetValue<String>('createAt', strcreateAt);
      Result.createAt := StrToDateTimeDJ(strcreateAt);

      JSONObject.TryGetValue<String>('updatedAt', strupdatedAt);
      Result.updatedAt := StrToDateTimeDJ(strupdatedAt);

      JSONObject.TryGetValue<String>('deletedAt', strdeletedAt);
      Result.deletedAt := StrToDateTimeDJ(strdeletedAt);

      JSONObject.TryGetValue<String>('timezone', strTimeZone);
      Result.timezone := StrToTimeZone(strTimeZone);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseObjSystem# Erro ao tentar converter json para o tipo TSystem. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseUser(const AJSON: string): TResponseUser;
var
  JSONObject, JObjData: TJsonObject;
  JArrayUser: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseUser;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('user', JArrayUser) then
        begin
          SetLength(Result.ListUser, JArrayUser.Count);
          for I := 0 to JArrayUser.Count - 1 do
            Result.ListUser[I] := ParseJSONToResponseObjUser(JArrayUser.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultXMLNFe# Erro ao tentar converter json para TResponseConsultXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjUser(const AJSON: string): TUser;
var
  JSONObject, JObjEmit: TJsonObject;
  JArrayAutXml: TJSONArray;
  strTimeZone, strcreateAt, strupdatedAt, strdeletedAt, strVersaoQRCode: String;
begin
  Result := ClearUser;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('idUser', Result.idUser);
      JSONObject.TryGetValue<String>('idExternal', Result.idExternal);
      JSONObject.TryGetValue<String>('name', Result.name);
      JSONObject.TryGetValue<String>('email', Result.email);
      JSONObject.TryGetValue<String>('cnpj', Result.cnpj);

      JSONObject.TryGetValue<String>('nfceCSC', Result.nfce.CSC);
      JSONObject.TryGetValue<String>('nfceIdCSC', Result.nfce.IdCSC);
      JSONObject.TryGetValue<String>('nfceVersaoQRCode', strVersaoQRCode);
      Result.nfce.versaoQRCode := StrToVersaoQrCodeNFCe(strVersaoQRCode);

      JSONObject.TryGetValue<Boolean>('notification', Result.notification);
      JSONObject.TryGetValue<TDate>('expirationCertificate', Result.expirationCertificate);

      JSONObject.TryGetValue<String>('createAt', strcreateAt);
      Result.createAt := StrToDateTimeDJ(strcreateAt);

      JSONObject.TryGetValue<String>('updatedAt', strupdatedAt);
      Result.updatedAt := StrToDateTimeDJ(strupdatedAt);

      JSONObject.TryGetValue<String>('deletedAt', strdeletedAt);
      Result.deletedAt := StrToDateTimeDJ(strdeletedAt);

      if JSONObject.TryGetValue<TJsonObject>('emit', JObjEmit) then
        Result.emit := ParseJSONToResponseObjUserEmit(JObjEmit.ToJSON);

      if JSONObject.TryGetValue<TJSONArray>('autxml', JArrayAutXml) then
        Result.autxml := ParseJSONToResponseObjUserAutXML(JArrayAutXml.ToJSON);

      JSONObject.TryGetValue<String>('timezone', strTimeZone);
      Result.timezone := StrToTimeZone(strTimeZone);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseObjSystem# Erro ao tentar converter json para o tipo TSystem. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjUserEmit(const AJSON: string): TEmit;
var
  JSONObject, JObjEnderEmit: TJsonObject;
  vCRT: String;
begin
  Result := ClearEmit;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('CNPJCPF', Result.CNPJCPF);
      JSONObject.TryGetValue<String>('xNome', Result.xNome);
      JSONObject.TryGetValue<String>('xFant', Result.xFant);
      JSONObject.TryGetValue<String>('IE', Result.IE);
      JSONObject.TryGetValue<String>('IEST', Result.IEST);
      JSONObject.TryGetValue<String>('IM', Result.IM);
      JSONObject.TryGetValue<String>('CNAE', Result.CNAE);
      JSONObject.TryGetValue<String>('CRT', vCRT);
      Result.CRT := StrToCRT(vCRT);
      if JSONObject.TryGetValue<TJsonObject>('enderEmit', JObjEnderEmit) then
      begin
        JObjEnderEmit.TryGetValue<String>('xLgr', Result.enderEmit.xLgr);
        JObjEnderEmit.TryGetValue<String>('nro', Result.enderEmit.nro);
        JObjEnderEmit.TryGetValue<String>('xCpl', Result.enderEmit.xCpl);
        JObjEnderEmit.TryGetValue<String>('xBairro', Result.enderEmit.xBairro);
        JObjEnderEmit.TryGetValue<String>('xMun', Result.enderEmit.xMun);
        JObjEnderEmit.TryGetValue<String>('UF', Result.enderEmit.UF);
        JObjEnderEmit.TryGetValue<String>('CEP', Result.enderEmit.CEP);
        JObjEnderEmit.TryGetValue<String>('xPais', Result.enderEmit.xPais);
        JObjEnderEmit.TryGetValue<String>('fone', Result.enderEmit.fone);

        Result.enderEmit.cMun := JsonStrToInt(JObjEnderEmit, 'cMun');
        Result.enderEmit.cPais := JsonStrToInt(JObjEnderEmit, 'cPais');
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToEmit# Erro ao tentar converter json para o tipo TEmit. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjUserAutXML(const AJSON: string): TListAutXML;
var
  JArrayAutXml: TJSONArray;
  JValue: TJSONValue;
  Indice: Integer;
begin
  SetLength(Result, 0);

  JArrayAutXml := TJsonObject.ParseJSONValue(AJSON) as TJSONArray;
  try
    try
      SetLength(Result, JArrayAutXml.Count);
      Indice := 0;

      for JValue in JArrayAutXml do
      begin
        if JValue is TJsonObject then
          TJsonObject(JValue).TryGetValue<String>('CNPJCPF', Result[Indice]);

        Inc(Indice);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToAutXML# Erro ao tentar converter json para o tipo TListAutXML. ' + E.Message);
    end;
  finally
    JArrayAutXml.Free;
  end;
end;

function ParseJSONToResponseEventCancelPrint(const AJSON: string): TResponseEventCancelPrint;
var
  JSONObject, JObjData: TJsonObject;
  JArrayEvent: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseEventCancelPrint;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('events', JArrayEvent) then
        begin
          SetLength(Result.ListEvent, JArrayEvent.Count);
          for I := 0 to JArrayEvent.Count - 1 do
            Result.ListEvent[I] := ParseJSONToResponseObjEventCancelPrint(JArrayEvent.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultCancelNFeNFCe# Erro ao tentar converter json para TResponseConsultCancelNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjEventCancelPrint(const AJSON: string): TEventCancelPrint;
var
  JSONObject: TJsonObject;
  strAmb: String;
begin
  Result := ClearEventCancelPrint;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('idCan', Result.idCan);
      JSONObject.TryGetValue<String>('idDfe', Result.idDfe);
      JSONObject.TryGetValue<String>('chDfe', Result.chDfe);
      JSONObject.TryGetValue<String>('pdf', Result.pdfBase64);
      JSONObject.TryGetValue<String>('pdfLink', Result.pdfLink);
      JSONObject.TryGetValue<String>('tpAmb', strAmb);
      Result.dhEnv := JsonStrToDateTime(JSONObject, 'dhEnv');
      Result.tpAmb := StrToAmb(strAmb);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseXMLNFeNFCe# Erro ao tentar converter json para o tipo TResponseXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseEventCorrectionPrint(const AJSON: string): TResponseEventCorrectionPrint;
var
  JSONObject, JObjData: TJsonObject;
  JArrayEvent: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseEventCorrectionPrint;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('events', JArrayEvent) then
        begin
          SetLength(Result.ListEvent, JArrayEvent.Count);
          for I := 0 to JArrayEvent.Count - 1 do
            Result.ListEvent[I] := ParseJSONToResponseObjEventCorrectionPrint(JArrayEvent.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultCancelNFeNFCe# Erro ao tentar converter json para TResponseConsultCancelNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjEventCorrectionPrint(const AJSON: string): TEventCorrectionPrint;
var
  JSONObject: TJsonObject;
  strAmb: String;
begin
  Result := ClearEventCorrectionPrint;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('idCCe', Result.idCce);
      JSONObject.TryGetValue<String>('idDfe', Result.idDfe);
      JSONObject.TryGetValue<String>('chDfe', Result.chDfe);
      JSONObject.TryGetValue<String>('pdf', Result.pdfBase64);
      JSONObject.TryGetValue<String>('pdfLink', Result.pdfLink);
      JSONObject.TryGetValue<String>('tpAmb', strAmb);
      Result.dhEnv := JsonStrToDateTime(JSONObject, 'dhEnv');
      Result.tpAmb := StrToAmb(strAmb);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseXMLNFeNFCe# Erro ao tentar converter json para o tipo TResponseXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseDanfePDF(const AJSON: string): TResponseDanfPDF;
var
  JSONObject, JObjData: TJsonObject;
  JArrayEvent: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseDanfPDF;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFe', JArrayEvent) then
        begin
          SetLength(Result.ListDanfPDF, JArrayEvent.Count);
          for I := 0 to JArrayEvent.Count - 1 do
            Result.ListDanfPDF[I] := ParseJSONToResponseObjDanfPDF(JArrayEvent.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToListDanfePDF# Erro ao tentar converter json para TResponseDanfPDF. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseDanfcePDF(const AJSON: string): TResponseDanfPDF;
var
  JSONObject, JObjData: TJsonObject;
  JArrayEvent: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseDanfPDF;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFCe', JArrayEvent) then
        begin
          SetLength(Result.ListDanfPDF, JArrayEvent.Count);
          for I := 0 to JArrayEvent.Count - 1 do
            Result.ListDanfPDF[I] := ParseJSONToResponseObjDanfPDF(JArrayEvent.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToListDanfePDF# Erro ao tentar converter json para TResponseDanfPDF. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjDanfPDF(const AJSON: string): TDanfPDF;
var
  JSONObject: TJsonObject;
begin
  Result := ClearDanfPDF;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('pdf', Result.pdfBase64);
      JSONObject.TryGetValue<String>('pdfLink', Result.pdfLink);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseObjDanfePDF# Erro ao tentar converter json para o tipo TDanfPDF. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseRespTecCSRT(const AJSON: string): TResponseRespTecCSRT;
var
  JSONObject, JObjData: TJsonObject;
  JArrayResp: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseRespTecCSRT;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('RespTecCSRT', JArrayResp) then
        begin
          SetLength(Result.ListRespTecCSRT, JArrayResp.Count);
          for I := 0 to JArrayResp.Count - 1 do
            Result.ListRespTecCSRT[I] := ParseJSONToResponseObjRespTecCSRT(JArrayResp.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseRespTecCSRT# Erro ao tentar converter json para TResponseRespTecCSRT. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjRespTecCSRT(const AJSON: string): TRespTecCSRT;
var
  JSONObject: TJsonObject;
begin
  Result := ClearRespTecCSRT;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<Integer>('cUF', Result.cUF);
      JSONObject.TryGetValue<Integer>('idCSRT', Result.idCSRT);
      JSONObject.TryGetValue<String>('CSRT', Result.CSRT);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseObjRespTecCSRT# Erro ao tentar converter json para o tipo TRespTecCSRT. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseEventDisenablePrint(const AJSON: string): TResponseEventDisenablePrint;
var
  JSONObject, JObjData: TJsonObject;
  JArrayEvent: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseEventDisenablePrint;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('events', JArrayEvent) then
        begin
          SetLength(Result.ListEvent, JArrayEvent.Count);
          for I := 0 to JArrayEvent.Count - 1 do
            Result.ListEvent[I] := ParseJSONToResponseObjEventDisenablePrint(JArrayEvent.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultCancelNFeNFCe# Erro ao tentar converter json para TResponseConsultCancelNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjEventDisenablePrint(const AJSON: string): TEventDisenablePrint;
var
  JSONObject: TJsonObject;
  strAmb: String;
begin
  Result := ClearEventDisenablePrint;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('idInu', Result.idInu);
      JSONObject.TryGetValue<String>('pdf', Result.pdfBase64);
      JSONObject.TryGetValue<String>('pdfLink', Result.pdfLink);
      JSONObject.TryGetValue<String>('tpAmb', strAmb);
      Result.dhEnv := JsonStrToDateTime(JSONObject, 'dhEnv');
      Result.tpAmb := StrToAmb(strAmb);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseXMLNFeNFCe# Erro ao tentar converter json para o tipo TResponseXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseNotification(const AJSON: string): TResponseNotification;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNotification: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseNotification;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('notification', JArrayNotification) then
        begin
          SetLength(Result.ListNotification, JArrayNotification.Count);
          for I := 0 to JArrayNotification.Count - 1 do
            Result.ListNotification[I] := ParseJSONToResponseObjNotification(JArrayNotification.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultXMLNFe# Erro ao tentar converter json para TResponseConsultXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseObjNotification(const AJSON: string): TNotification;
var
  JSONObject: TJsonObject;
  strTypeNotification: String;
begin
  Result := ClearNotification;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('email', Result.email);

      JSONObject.TryGetValue<String>('type', strTypeNotification);
      Result.TypeNotification := StrToNotification(strTypeNotification);
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseObjSystem# Erro ao tentar converter json para o tipo TSystem. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultDANFe(const AJSON: string): TResponseConsultDANFeDANFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNFe: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFe', JArrayNFe) then
        begin
          SetLength(Result.ListDANFeDANFCe, JArrayNFe.Count);
          for I := 0 to JArrayNFe.Count - 1 do
            Result.ListDANFeDANFCe[I] := ParseJSONToResponseDANFeDANFCe(JArrayNFe.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultXMLNFe# Erro ao tentar converter json para TResponseConsultXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultDANFCe(const AJSON: string): TResponseConsultDANFeDANFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNFCe: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultDANFeDANFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFCe', JArrayNFCe) then
        begin
          SetLength(Result.ListDANFeDANFCe, JArrayNFCe.Count);
          for I := 0 to JArrayNFCe.Count - 1 do
            Result.ListDANFeDANFCe[I] := ParseJSONToResponseDANFeDANFCe(JArrayNFCe.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseConsultXMLNFe# Erro ao tentar converter json para TResponseConsultXMLNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultNFe(const AJSON: string): TResponseConsultNFeNFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNFe: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFe', JArrayNFe) then
        begin
          SetLength(Result.ListNFeNFCe, JArrayNFe.Count);
          for I := 0 to JArrayNFe.Count - 1 do
            Result.ListNFeNFCe[I] := ParseJSONToResponseNFeNFCe(JArrayNFe.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseDANFeDANFCe# Erro ao tentar converter json para TResponseDANFeDANFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseConsultNFCe(const AJSON: string): TResponseConsultNFeNFCe;
var
  JSONObject, JObjData: TJsonObject;
  JArrayNFCe: TJSONArray;
  I: Integer;
begin
  Result := ClearResponseConsultNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      if JSONObject.TryGetValue<TJsonObject>('data', JObjData) then
      begin
        if JObjData.TryGetValue<TJSONArray>('NFCe', JArrayNFCe) then
        begin
          SetLength(Result.ListNFeNFCe, JArrayNFCe.Count);
          for I := 0 to JArrayNFCe.Count - 1 do
            Result.ListNFeNFCe[I] := ParseJSONToResponseNFeNFCe(JArrayNFCe.Items[I].ToString);
        end;
        JObjData.TryGetValue<Integer>('currentPage', Result.Pages.currentPage);
        JObjData.TryGetValue<Integer>('totalPages', Result.Pages.totalPages);
        JObjData.TryGetValue<Integer>('totalItens', Result.Pages.totalItens);
      end;
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseDANFeDANFCe# Erro ao tentar converter json para TResponseDANFeDANFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function ParseJSONToResponseNFeNFCe(const AJSON: string): TResponseEmissionNFeNFCe;
var
  JSONObject: TJsonObject;
  strAmb, strSituationDfe, strSituation: String;
begin
  Result := ClearResponseEmissionNFeNFCe;

  JSONObject := TJsonObject.ParseJSONValue(AJSON) as TJsonObject;
  try
    try
      JSONObject.TryGetValue<String>('chDfe', Result.chDfe);
      JSONObject.TryGetValue<String>('digVal', Result.digVal);
      JSONObject.TryGetValue<String>('idBatch', Result.idBatch);
      JSONObject.TryGetValue<String>('idDfe', Result.idDfe);
      JSONObject.TryGetValue<String>('idExternal', Result.idExternal);
      JSONObject.TryGetValue<String>('nProt', Result.nProt);
      JSONObject.TryGetValue<String>('nRec', Result.nRec);
      JSONObject.TryGetValue<String>('xMotivo', Result.XMotivo);
      JSONObject.TryGetValue<String>('pdf', Result.pdfBase64);
      JSONObject.TryGetValue<String>('pdfLink', Result.pdfLink);
      JSONObject.TryGetValue<String>('xml', Result.xml);
      JSONObject.TryGetValue<String>('xmlLink', Result.xmlLink);
      Result.CStat := JsonStrToInt(JSONObject, 'cStat');
      Result.nNF := JsonStrToInt(JSONObject, 'nNF');
      Result.serie := JsonStrToInt(JSONObject, 'serie');
      Result.vNF := JsonStrToFloat(JSONObject, 'vNF');

      JSONObject.TryGetValue<String>('situationDfe', strSituationDfe);
      Result.situationDfe := StrToSituationDFeAPI(strSituationDfe);

      JSONObject.TryGetValue<String>('situation', strSituation);
      Result.situation := StrToSituationAPI(strSituation);

      JSONObject.TryGetValue<String>('tpAmb', strAmb);
      Result.tpAmb := StrToAmb(strAmb);

      Result.dhEmi := JsonStrToDateTime(JSONObject, 'dhEmi');
      Result.DhRecbto := JsonStrToDateTime(JSONObject, 'dhRecbto');
    except
      on E: Exception do
        raise Exception.Create('#ParseJSONToResponseNFeNFCe# Erro ao tentar converter json para o tipo TResponseEmissionNFeNFCe. ' + E.Message);
    end;
  finally
    JSONObject.Free;
  end;
end;

function JsonAuthLogin(const vAuth: TAuth): TJsonObject;
begin
  Result := TJsonObject.Create;
  try
    Result.AddPair('email', vAuth.email.Trim);
    Result.AddPair('password', vAuth.password.Trim);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonAuthLogin# Erro ao tentar criar json do tipo TAuth. ' + E.Message);
    end;
  end;
end;

function JsonAuthForget(const email: String): TJsonObject;
begin
  Result := TJsonObject.Create;
  try
    Result.AddPair('email', email.Trim);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonAuthForget# Erro ao tentar criar json "Forget". ' + E.Message);
    end;
  end;
end;

function JsonAuthReset(const password, resetToken: String): TJsonObject;
begin
  Result := TJsonObject.Create;
  try
    Result.AddPair('password', password.Trim);
    Result.AddPair('resetToken', resetToken.Trim);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonAuthReset# Erro ao tentar criar json "Reset". ' + E.Message);
    end;
  end;
end;

function JsonSystemModify(const nameCompany, password: String): TJsonObject;
begin
  Result := TJsonObject.Create;
  try
    if nameCompany.Trim <> '' then
      Result.AddPair('nameCompany', nameCompany.Trim);
    if password.Trim <> '' then
      Result.AddPair('email', password.Trim);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonSystemModify# Erro ao tentar criar json "SystemModify". ' + E.Message);
    end;
  end;
end;

function JsonUserAdd(const name, email, idExternal, cnpj: String; const notification: Boolean; const timezone: TTimeZone; const nfce: TNFCeUser): TJsonObject;
begin
  Result := TJsonObject.Create;
  try
    if name.Trim <> '' then
      Result.AddPair('name', name.Trim);
    if email.Trim <> '' then
      Result.AddPair('email', email.Trim);
    if idExternal.Trim <> '' then
      Result.AddPair('idExternal', idExternal.Trim);
    if cnpj.Trim <> '' then
      Result.AddPair('cnpj', cnpj.Trim);
    Result.AddPair('timezone', TJSONString.Create(TimeZoneToStr(timezone)));
    Result.AddPair('notification', TJSONBool.Create(notification));
    if nfce.CSC.Trim <> '' then
      Result.AddPair('nfceCSC', nfce.CSC.Trim);
    if nfce.IdCSC.Trim <> '' then
      Result.AddPair('nfceIdCSC', nfce.IdCSC.Trim);
    Result.AddPair('nfceVersaoQRCode', VersaoQrCodeNFCeToStr(nfce.versaoQRCode));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonUserModify# Erro ao tentar criar json "UserModify". ' + E.Message);
    end;
  end;
end;

function JsonUserModify(const name, email: String; const notification: Boolean; const nfce: TNFCeUser): TJsonObject;
begin
  Result := TJsonObject.Create;
  try
    if name.Trim <> '' then
      Result.AddPair('name', name.Trim);
    if email.Trim <> '' then
      Result.AddPair('email', email.Trim);
    Result.AddPair('notification', TJSONBool.Create(notification));
    if nfce.CSC.Trim <> '' then
      Result.AddPair('nfceCSC', nfce.CSC.Trim);
    if nfce.IdCSC.Trim <> '' then
      Result.AddPair('nfceIdCSC', nfce.IdCSC.Trim);
    Result.AddPair('nfceVersaoQRCode', VersaoQrCodeNFCeToStr(nfce.versaoQRCode));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonUserModify# Erro ao tentar criar json "UserModify". ' + E.Message);
    end;
  end;
end;

function JsonRespTecCSRT(const listRespTecCSRT: TListRespTecCSRT): TJsonObject;
var
  JSONArray: TJSONArray;
  jsonObj: TJsonObject;
  I: Integer;
begin
  Result := nil;
  if Length(listRespTecCSRT) = 0 then
    Exit;

  Result := TJsonObject.Create;
  JSONArray := TJSONArray.Create;
  try
    for I := 0 to High(listRespTecCSRT) do
    begin
      if listRespTecCSRT[I].cUF > 0 then
      begin
        jsonObj := TJsonObject.Create;

        jsonObj.AddPair('cUF', TJSONString.Create(IntToStr(listRespTecCSRT[I].cUF)));
        jsonObj.AddPair('idCSRT', TJSONString.Create(IntToStr(listRespTecCSRT[I].idCSRT)));
        jsonObj.AddPair('CSRT', listRespTecCSRT[I].CSRT);
        JSONArray.AddElement(jsonObj);
      end;
      Result.AddPair('autXML', JSONArray);
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonRespTecCSRT# Erro ao tentar criar json "TListRespTecCSRT". ' + E.Message);
    end;
  end;
end;

function JsonArrayIdUser(const ListIdUser: TArray<String>): TJSONArray;
var
  JObjUser: TJsonObject;
  I: Integer;
begin
  Result := TJSONArray.Create;
  try
    if (High(ListIdUser) = 0) then
      Exit;

    for I := 0 to High(ListIdUser) do
    begin
      if ListIdUser[I].Trim <> '' then
      begin
        JObjUser := TJsonObject.Create;

        JObjUser.AddPair('idUser', ListIdUser[I].Trim);
        Result.Add(JObjUser);
      end;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonUserModify# Erro ao tentar criar json "UserModify". ' + E.Message);
    end;
  end;
end;

function JsonSystemUserModify(const vListUserModifySystem: TListUserModifySystem): TJSONArray;
var
  JObjUser: TJsonObject;
  I: Integer;
begin
  Result := TJSONArray.Create;
  try
    if (High(vListUserModifySystem) = 0) then
      Exit;

    for I := 0 to High(vListUserModifySystem) do
    begin
      if vListUserModifySystem[I].idUser.Trim <> '' then
      begin
        JObjUser := TJsonObject.Create;

        if vListUserModifySystem[I].idUser.Trim <> '' then
          JObjUser.AddPair('idUser', vListUserModifySystem[I].idUser.Trim);
        if vListUserModifySystem[I].name.Trim <> '' then
          JObjUser.AddPair('name', vListUserModifySystem[I].name.Trim);
        if vListUserModifySystem[I].email.Trim <> '' then
          JObjUser.AddPair('email', vListUserModifySystem[I].email.Trim);
        if vListUserModifySystem[I].password.Trim <> '' then
          JObjUser.AddPair('password', vListUserModifySystem[I].password.Trim);

        if vListUserModifySystem[I].nfce.CSC.Trim <> '' then
          JObjUser.AddPair('nfceCSC', vListUserModifySystem[I].nfce.CSC.Trim);
        if vListUserModifySystem[I].nfce.IdCSC.Trim <> '' then
          JObjUser.AddPair('nfceIdCSC', vListUserModifySystem[I].nfce.IdCSC.Trim);
        JObjUser.AddPair('nfceVersaoQRCode', VersaoQrCodeNFCeToStr(vListUserModifySystem[I].nfce.versaoQRCode));

        Result.Add(JObjUser);
      end;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonUserModify# Erro ao tentar criar json "UserModify". ' + E.Message);
    end;
  end;
end;

function JsonCertificate(const vCertificateFile: TCertificateFile): TJsonObject;
begin
  Result := TJsonObject.Create;
  try
    Result.AddPair('password', vCertificateFile.password);
    Result.AddPair('file', TJSONString.Create(FileToBase64(vCertificateFile.FileName)));
    Result.AddPair('extension', vCertificateFile.Extension);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonCertificate# Erro ao tentar criar json do tipo TCertificateFile. ' + E.Message);
    end;
  end;
end;

function JsonEmit(const vEmit: TEmit): TJsonObject;
var
  emit: TJsonObject;

  function JsonEnderEmit(const vEnd: TEndereco): TJsonObject;
  begin
    Result := TJsonObject.Create;
    Result.AddPair('xLgr', vEnd.xLgr.Trim);
    Result.AddPair('nro', vEnd.nro.Trim);
    Result.AddPair('xCpl', vEnd.xCpl.Trim);
    Result.AddPair('xBairro', vEnd.xBairro.Trim);
    Result.AddPair('cMun', TJSONString.Create(IntToStr(vEnd.cMun)));
    Result.AddPair('xMun', vEnd.xMun.Trim);
    Result.AddPair('UF', vEnd.UF.Trim);
    Result.AddPair('CEP', vEnd.CEP.Trim);
    Result.AddPair('cPais', TJSONString.Create(IntToStr(vEnd.cPais)));
    Result.AddPair('xPais', vEnd.xPais.Trim);
    Result.AddPair('fone', vEnd.fone.Trim);
  end;

begin
  Result := TJsonObject.Create;
  emit := TJsonObject.Create;
  try
    emit.AddPair('CNPJCPF', vEmit.CNPJCPF.Trim);
    emit.AddPair('xNome', vEmit.xNome.Trim);
    emit.AddPair('xFant', vEmit.xFant.Trim);
    emit.AddPair('IE', vEmit.IE.Trim);
    emit.AddPair('IEST', vEmit.IEST.Trim);
    emit.AddPair('IM', vEmit.IM.Trim);
    emit.AddPair('CNAE', vEmit.CNAE.Trim);
    emit.AddPair('CRT', TJSONString.Create(CRTToStr(vEmit.CRT)));

    emit.AddPair('enderEmit', JsonEnderEmit(vEmit.enderEmit));
    Result.AddPair('emit', emit);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonEmit# Erro ao tentar criar JSON do tipo TEmit. ' + E.Message);
    end;
  end;
end;

function JsonAutXML(const vListAutXML: TListAutXML): TJsonObject;
var
  JSONArray: TJSONArray;
  jsonObj: TJsonObject;
  I: Integer;
begin
  Result := nil;
  if Length(vListAutXML) = 0 then
    Exit;

  Result := TJsonObject.Create;
  JSONArray := TJSONArray.Create;
  try
    for I := 0 to High(vListAutXML) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('CNPJCPF', vListAutXML[I].Trim);
      JSONArray.AddElement(jsonObj);
    end;

    Result.AddPair('autXML', JSONArray);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonAutXML# Erro ao tentar criar JSON do tipo TListAutXML. ' + E.Message);
    end;
  end;
end;

function JsonUserNotification(const vListNotification: TListNotification): TJSONArray;
var
  jsonObj: TJsonObject;
  I: Integer;
begin
  Result := TJSONArray.Create;
  try
    if (High(vListNotification) = 0) then
      Exit;

    for I := 0 to High(vListNotification) do
    begin
      if vListNotification[I].email <> '' then
      begin
        jsonObj := TJsonObject.Create;

        if vListNotification[I].email.Trim <> '' then
          jsonObj.AddPair('email', vListNotification[I].email.Trim);
        jsonObj.AddPair('type', NotificationToStr(vListNotification[I].TypeNotification));
        Result.Add(jsonObj);
      end;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonUserNotification# Erro ao tentar criar json "TListNotification". ' + E.Message);
    end;
  end;
end;

function JsonNFeEmission(const nfe: TNFeNFCe; const async: Boolean; const vTimeZone: TTimeZone; vFormatSettings: TFormatSettings): TJsonObject; overload;
var
  jsonArrayNFe: TJSONArray;
begin
  Result := TJsonObject.Create;
  try
    jsonArrayNFe := TJSONArray.Create;
    jsonArrayNFe.AddElement(JsonInfNFeNFCe(nfe, dfeNFe, vTimeZone, vFormatSettings));

    Result.AddPair('async', TJSONBool.Create(async));
    Result.AddPair('NFe', jsonArrayNFe);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create(PWideChar('#JsonNFeEmission# Erro ao tentar criar JSON do tipo TNFeNFCe (modelo 55, ' + IfThen(async, 'assincrono', 'sincrono') + '). ') + E.Message);
    end;
  end;
end;

function JsonNFeEmission(const ListNFe: TListNFeNFCe; const async: Boolean; const vTimeZone: TTimeZone; vFormatSettings: TFormatSettings): TJsonObject;
var
  jsonArrayNFe: TJSONArray;
  I: Integer;
begin
  Result := nil;
  if Length(ListNFe) = 0 then
    Exit;

  Result := TJsonObject.Create;
  try
    jsonArrayNFe := TJSONArray.Create;
    for I := 0 to High(ListNFe) do
      jsonArrayNFe.AddElement(JsonInfNFeNFCe(ListNFe[I], dfeNFe, vTimeZone, vFormatSettings));

    Result.AddPair('async', TJSONBool.Create(async));
    Result.AddPair('NFe', jsonArrayNFe);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create(PWideChar('#JsonNFeEmission# Erro ao tentar criar JSON do tipo TListNFeNFCe (modelo 55, ' + IfThen(async, 'assincrono', 'sincrono') + '). ') + E.Message);
    end;
  end;
end;

function JsonNFCeEmission(const nfce: TNFeNFCe; const async: Boolean; const vTimeZone: TTimeZone; vFormatSettings: TFormatSettings): TJsonObject; overload;
var
  jsonArrayNFe: TJSONArray;
begin
  Result := TJsonObject.Create;
  try
    jsonArrayNFe := TJSONArray.Create;
    jsonArrayNFe.AddElement(JsonInfNFeNFCe(nfce, dfeNFCe, vTimeZone, vFormatSettings));

    Result.AddPair('async', TJSONBool.Create(async));
    Result.AddPair('NFCe', jsonArrayNFe);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create(PWideChar('#JsonNFCeEmission# Erro ao tentar criar JSON do tipo TNFeNFCe (modelo 65, ' + IfThen(async, 'assincrono', 'sincrono') + '). ') + E.Message);
    end;
  end;
end;

function JsonNFCeEmission(const ListNFCe: TListNFeNFCe; const async: Boolean; const vTimeZone: TTimeZone; vFormatSettings: TFormatSettings): TJsonObject;
var
  jsonArrayNFe: TJSONArray;
  I: Integer;
begin
  Result := nil;
  if Length(ListNFCe) = 0 then
    Exit;

  Result := TJsonObject.Create;
  try
    jsonArrayNFe := TJSONArray.Create;
    for I := 0 to High(ListNFCe) do
      jsonArrayNFe.AddElement(JsonInfNFeNFCe(ListNFCe[I], dfeNFCe, vTimeZone, vFormatSettings));

    Result.AddPair('async', TJSONBool.Create(async));
    Result.AddPair('NFCe', jsonArrayNFe);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create(PWideChar('#JsonNFCeEmission# Erro ao tentar criar JSON do tipo TListNFeNFCe (modelo 65, ' + IfThen(async, 'assincrono', 'sincrono') + '). ') + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCe(const vNFeNFCe: TNFeNFCe; const vModeloDFe: TModeloDFe; const vTimeZone: TTimeZone; vFormatSettings: TFormatSettings): TJsonObject;
var
  jsonInfNF: TJsonObject;
begin
  Result := TJsonObject.Create;
  jsonInfNF := TJsonObject.Create;
  try
    jsonInfNF.AddPair('agropecuario', JsonInfNFeNFCeAgropecuario(vNFeNFCe.agropecuario));
    jsonInfNF.AddPair('autXML', JsonInfNFeNFCeAutXML(vNFeNFCe.autxml));
    jsonInfNF.AddPair('cana', JsonInfNFeNFCeCana(vNFeNFCe.cana, vFormatSettings));
    jsonInfNF.AddPair('cobr', JsonInfNFeNFCeCobr(vNFeNFCe.cobr, vFormatSettings));
    jsonInfNF.AddPair('compra', JsonInfNFeNFCeCompra(vNFeNFCe.compra));
    jsonInfNF.AddPair('dest', JsonInfNFeNFCeDest(vNFeNFCe.dest, vModeloDFe));
    jsonInfNF.AddPair('det', JsonInfNFeNFCeDet(vNFeNFCe.det, vFormatSettings));
    jsonInfNF.AddPair('emit', JsonInfNFeNFCeEmit(vNFeNFCe.emit));
    jsonInfNF.AddPair('entrega', JsonInfNFeNFCeEntrega(vNFeNFCe.entrega));
    jsonInfNF.AddPair('exporta', JsonInfNFeNFCeExporta(vNFeNFCe.exporta));
    jsonInfNF.AddPair('ide', JsonInfNFeNFCeIde(vNFeNFCe.ide, vModeloDFe, vTimeZone));
    jsonInfNF.AddPair('infAdic', JsonInfNFeNFCeInfAdic(vNFeNFCe.infAdic));
    jsonInfNF.AddPair('infIntermed', JsonInfNFeNFCeInfIntermed(vNFeNFCe.infIntermed));
    jsonInfNF.AddPair('infRespTec', JsonInfNFeNFCeInfRespTec(vNFeNFCe.infRespTec));
    jsonInfNF.AddPair('pag', JsonInfNFeNFCePag(vNFeNFCe.pag, vFormatSettings));
    jsonInfNF.AddPair('retirada', JsonInfNFeNFCeRetirada(vNFeNFCe.retirada));
    jsonInfNF.AddPair('total', JsonInfNFeNFCeTotal(vNFeNFCe.total, vFormatSettings));
    jsonInfNF.AddPair('transp', JsonInfNFeNFCeTransp(vNFeNFCe.Transp, vFormatSettings));
    jsonInfNF.AddPair('versao', TJSONString.Create(VersaoNFToStr(vNFeNFCe.Versao)));

    Result.AddPair('idExternal', vNFeNFCe.idExternal);
    Result.AddPair('infNF', jsonInfNF);
    if vNFeNFCe.infProt.chDfe.Trim <> '' then
      Result.AddPair('infProt', JsonInfProt(vNFeNFCe.infProt, vTimeZone));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create(PWideChar('#JsonInfNFeNFCe# Erro ao tentar criar JSON do tipo TNFeNFCe (modelo ' + ModeloDFeToStr(vModeloDFe) + '). ') + E.Message);
    end;
  end;
end;

function JsonInfProt(const vInfProt: TInfProt; const vTimeZone: TTimeZone): TJsonObject;
begin
  Result := nil;
  try
    if vInfProt.chDfe.Trim <> '' then
    begin
      Result := TJsonObject.Create;
      Result.AddPair('chDfe', vInfProt.chDfe.Trim);
      Result.AddPair('cStat', TJSONString.Create(vInfProt.CStat.ToString));
      Result.AddPair('dhRecbto', TJSONString.Create(DateTimeWithTimeZoneToStr(vInfProt.DhRecbto, vTimeZone)));
      Result.AddPair('digVal', vInfProt.digVal.Trim);
      Result.AddPair('nProt', vInfProt.nProt.Trim);
      Result.AddPair('tpAmb', TJSONString.Create(AmbToStr(vInfProt.tpAmb)));
      Result.AddPair('verAplic', vInfProt.VerAplic.Trim);
      Result.AddPair('xMotivo', vInfProt.XMotivo.Trim);
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfProt# Erro ao tentar criar JSON do tipo TInfProt. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeAgropecuario(const vAgropecuario: TAgropecuario): TJsonObject;
begin
  Result := nil;
  try
    if vAgropecuario.nReceituario.Trim <> '' then
    begin
      Result := TJsonObject.Create;
      Result.AddPair('nReceituario', vAgropecuario.nReceituario.Trim);
      Result.AddPair('CPFRespTec', vAgropecuario.CPFRespTec.Trim);
    end
    else if vAgropecuario.tpGuia <> tpgNenhum then
    begin
      Result := TJsonObject.Create;
      Result.AddPair('tpGuia', TJSONString.Create(TGuiaToStr(vAgropecuario.tpGuia)));
      Result.AddPair('UFGuia', vAgropecuario.UFGuia.Trim);
      Result.AddPair('serieGuia', vAgropecuario.serieGuia.Trim);
      Result.AddPair('nGuia', vAgropecuario.nGuia.Trim);
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeAgropecuario# Erro ao tentar criar JSON do tipo TAgropecuario. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeAutXML(const vAutXML: TListAutXML): TJSONArray;
var
  jsonObj: TJsonObject;
  I: Integer;
begin
  Result := nil;
  if Length(vAutXML) = 0 then
    Exit;

  Result := TJSONArray.Create;
  try
    for I := 0 to High(vAutXML) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('CNPJCPF', vAutXML[I].Trim);
      Result.AddElement(jsonObj);
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeAutXML# Erro ao tentar criar JSON do tipo TListAutXML. ' + E.Message);
    end;
  end;

end;

function JsonInfNFeNFCeCana(const vCana: TCana; vFormatSettings: TFormatSettings): TJsonObject;
  function JsonForDia(const vforDia: TListForDia): TJSONArray;
  var
    I: Integer;
    jsonObj: TJsonObject;
  begin
    Result := TJSONArray.Create;
    for I := 0 to High(vforDia) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('dia', TJSONString.Create(IntToStr(vforDia[I].dia)));
      jsonObj.AddPair('qtde', TJSONString.Create(FormatFloat(FORMAT_DEC_10, vforDia[I].qtde, vFormatSettings)));
      Result.AddElement(jsonObj);
    end;
  end;

  function JsonDeduc(const vDeduc: TListDeduc): TJSONArray;
  var
    I: Integer;
    jsonObj: TJsonObject;
  begin
    Result := TJSONArray.Create;
    for I := 0 to High(vDeduc) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('xDed', vDeduc[I].xDed.Trim);
      jsonObj.AddPair('vDed', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vDeduc[I].vDed, vFormatSettings)));
      Result.AddElement(jsonObj);
    end;
  end;

begin
  Result := nil;
  try
    if (vCana.safra.Trim <> '') or (vCana.ref.Trim <> '') or (Length(vCana.forDia) > 0) or (Length(vCana.deduc) > 0) then
    begin
      Result := TJsonObject.Create;

      Result.AddPair('safra', vCana.safra.Trim);
      Result.AddPair('ref', vCana.ref.Trim);
      Result.AddPair('qTotMes', TJSONString.Create(FormatFloat(FORMAT_DEC_10, vCana.qTotMes, vFormatSettings)));
      Result.AddPair('qTotAnt', TJSONString.Create(FormatFloat(FORMAT_DEC_10, vCana.qTotAnt, vFormatSettings)));
      Result.AddPair('qTotGer', TJSONString.Create(FormatFloat(FORMAT_DEC_10, vCana.qTotGer, vFormatSettings)));
      Result.AddPair('vFor', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCana.vFor, vFormatSettings)));
      Result.AddPair('vTotDed', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCana.vTotDed, vFormatSettings)));
      Result.AddPair('vLiqFor', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCana.vLiqFor, vFormatSettings)));

      if Length(vCana.forDia) > 0 then
        Result.AddPair('forDia', JsonForDia(vCana.forDia));

      if Length(vCana.deduc) > 0 then
        Result.AddPair('deduc', JsonDeduc(vCana.deduc));
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeCana# Erro ao tentar criar JSON do tipo TCana. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeCobr(const vCobr: TCobr; vFormatSettings: TFormatSettings): TJsonObject;
  function JsonCobrFat(const vFat: TFat): TJsonObject;
  begin
    Result := TJsonObject.Create;
    Result.AddPair('nFat', vFat.nFat.Trim);
    Result.AddPair('vOrig', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vFat.vOrig, vFormatSettings)));
    Result.AddPair('vDesc', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vFat.vDesc, vFormatSettings)));
    Result.AddPair('vLiq', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vFat.vLiq, vFormatSettings)));
  end;

  function JsonCobrDup(const vListDup: TListDup): TJSONArray;
  var
    jsonObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;
    for I := 0 to High(vListDup) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('nDup', vListDup[I].nDup.Trim);
      jsonObj.AddPair('dVenc', TJSONString.Create(DateToStr(vListDup[I].dVenc, vFormatSettings)));
      jsonObj.AddPair('vDup', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vListDup[I].vDup, vFormatSettings)));
      Result.AddElement(jsonObj);
    end;
  end;

begin
  Result := nil;
  try
    if (Length(vCobr.dup) > 0) or (vCobr.fat.nFat <> '') or (vCobr.fat.vOrig > 0) or (vCobr.fat.vDesc > 0) or (vCobr.fat.vLiq > 0) then
    begin
      Result := TJsonObject.Create;
      if (Length(vCobr.dup) > 0) then
        Result.AddPair('dup', JsonCobrDup(vCobr.dup));
      if (vCobr.fat.nFat <> '') or (vCobr.fat.vOrig > 0) or (vCobr.fat.vDesc > 0) or (vCobr.fat.vLiq > 0) then
        Result.AddPair('fat', JsonCobrFat(vCobr.fat));
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeCobr# Erro ao tentar criar JSON do tipo TCobr. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeCompra(const vCompra: TCompra): TJsonObject;
begin
  Result := nil;

  if (vCompra.xNEmp.Trim <> '') or (vCompra.xPed.Trim <> '') or (vCompra.xCont.Trim <> '') then
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('xNEmp', vCompra.xNEmp.Trim);
      Result.AddPair('xPed', vCompra.xPed.Trim);
      Result.AddPair('xCont', vCompra.xCont.Trim);
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonInfNFeNFCeCompra# Erro ao tentar criar JSON do tipo TCompra. ' + E.Message);
      end;
    end;
  end;
end;

function JsonInfNFeNFCeDest(const vDest: TDest; const vModeloDFe: TModeloDFe): TJsonObject;

  function JsonEnderDest(const vEnd: TEndereco): TJsonObject;
  begin
    Result := TJsonObject.Create;
    Result.AddPair('xLgr', vEnd.xLgr.Trim);
    Result.AddPair('nro', vEnd.nro.Trim);
    Result.AddPair('xCpl', vEnd.xCpl.Trim);
    Result.AddPair('xBairro', vEnd.xBairro.Trim);
    Result.AddPair('cMun', TJSONString.Create(IntToStr(vEnd.cMun)));
    Result.AddPair('xMun', vEnd.xMun.Trim);
    Result.AddPair('UF', vEnd.UF.Trim);
    Result.AddPair('CEP', vEnd.CEP.Trim);
    Result.AddPair('cPais', TJSONString.Create(IntToStr(vEnd.cPais)));
    Result.AddPair('xPais', vEnd.xPais.Trim);
    Result.AddPair('fone', vEnd.fone.Trim);
  end;

begin
  Result := TJsonObject.Create;
  try
    Result.AddPair('idEstrangeiro', vDest.idEstrangeiro.Trim);
    Result.AddPair('CNPJCPF', vDest.CNPJCPF.Trim);
    Result.AddPair('xNome', vDest.xNome.Trim);
    Result.AddPair('indIEDest', TJSONString.Create(IndIEDestToStr(vDest.indIEDest)));
    Result.AddPair('IE', vDest.IE.Trim);
    Result.AddPair('ISUF', vDest.ISUF.Trim);
    Result.AddPair('IM', vDest.IM.Trim);
    Result.AddPair('email', vDest.email.Trim);

    if (vModeloDFe = dfeNFe) or (vDest.enderDest.xLgr.Trim <> '') then
      Result.AddPair('enderDest', JsonEnderDest(vDest.enderDest));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeDest# Erro ao tentar criar JSON do tipo TDest. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeDet(const vListDet: TListDet; vFormatSettings: TFormatSettings): TJSONArray;
var
  I: Integer;
  jsonObjDet: TJsonObject;

  function JsonNVE(vListNVE: TListNVE): TJSONArray;
  var
    I: Integer;
  begin
    Result := TJSONArray.Create;
    try
      for I := 0 to High(vListNVE) do
        Result.AddElement(TJSONString.Create(vListNVE[I].Trim));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonNVE# Erro ao tentar criar JSON do tipo TListNVE. ' + E.Message);
      end;
    end;
  end;

  function JsonGCred(const vListCred: TListGCred): TJSONArray;
  var
    jsonObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;
    try
      for I := 0 to High(vListCred) do
      begin
        jsonObj := TJsonObject.Create;
        jsonObj.AddPair('cCredPresumido', vListCred[I].cCredPresumido.Trim);
        jsonObj.AddPair('pCredPresumido', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vListCred[I].pCredPresumido, vFormatSettings)));
        jsonObj.AddPair('vCredPresumido', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vListCred[I].vCredPresumido, vFormatSettings)));
        Result.AddElement(jsonObj);
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonGCred# Erro ao tentar criar JSON do tipo TListGCred. ' + E.Message);
      end;
    end;
  end;

  function JsonDI(vListDI: TListDI): TJSONArray;
  var
    jsonObj, adiObj: TJsonObject;
    adiArray: TJSONArray;
    I, J: Integer;
  begin
    Result := TJSONArray.Create;
    try
      for I := 0 to High(vListDI) do
      begin
        jsonObj := TJsonObject.Create;

        jsonObj.AddPair('nDI', vListDI[I].nDI.Trim);
        jsonObj.AddPair('dDI', TJSONString.Create(DateToStr(vListDI[I].dDI, vFormatSettings)));
        jsonObj.AddPair('xLocDesemb', vListDI[I].xLocDesemb.Trim);
        jsonObj.AddPair('UFDesemb', vListDI[I].UFDesemb.Trim);
        jsonObj.AddPair('dDesemb', TJSONString.Create(DateToStr(vListDI[I].dDesemb, vFormatSettings)));
        jsonObj.AddPair('tpViaTransp', TJSONString.Create(ViaTranspToStr(vListDI[I].tpViaTransp)));
        jsonObj.AddPair('vAFRMM', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vListDI[I].vAFRMM, vFormatSettings)));
        jsonObj.AddPair('tpIntermedio', TJSONString.Create(IntermediarioToStr(vListDI[I].tpIntermedio)));
        jsonObj.AddPair('CNPJ', vListDI[I].cnpj.Trim);
        jsonObj.AddPair('UFTerceiro', vListDI[I].UFTerceiro.Trim);
        jsonObj.AddPair('cExportador', vListDI[I].cExportador.Trim);

        adiArray := TJSONArray.Create;
        for J := 0 to High(vListDI[I].adi) do
        begin
          adiObj := TJsonObject.Create;
          adiObj.AddPair('nAdicao', TJSONString.Create(IntToStr(vListDI[I].adi[J].nAdicao)));
          adiObj.AddPair('nSeqAdic', TJSONString.Create(IntToStr(vListDI[I].adi[J].nSeqAdic)));
          adiObj.AddPair('cFabricante', vListDI[I].adi[J].cFabricante.Trim);
          adiObj.AddPair('vDescDI', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vListDI[I].adi[J].vDescDI, vFormatSettings)));
          adiObj.AddPair('nDraw', vListDI[I].adi[J].nDraw.Trim);
          adiArray.AddElement(adiObj);
        end;

        jsonObj.AddPair('adi', adiArray);
        Result.AddElement(jsonObj);
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonDI# Erro ao tentar criar JSON do tipo TListDI. ' + E.Message);
      end;
    end;
  end;

  function JsonDetExport(vListDetExport: TListDetExport): TJSONArray;
  var
    jsonObj, exportIndObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;
    try
      for I := 0 to High(vListDetExport) do
      begin
        jsonObj := TJsonObject.Create;
        if (vListDetExport[I].exportInd_chNFe.Trim <> '') or (vListDetExport[I].exportInd_nRE.Trim <> '') then
        begin
          exportIndObj := TJsonObject.Create;
          exportIndObj.AddPair('chNFe', vListDetExport[I].exportInd_chNFe.Trim);
          exportIndObj.AddPair('nRE', vListDetExport[I].exportInd_nRE.Trim);
          exportIndObj.AddPair('qExport', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vListDetExport[I].exportInd_qExport, vFormatSettings)));
          jsonObj.AddPair('exportInd', exportIndObj);
        end;
        jsonObj.AddPair('nDraw', vListDetExport[I].nDraw.Trim);

        Result.AddElement(jsonObj);
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonDetExport# Erro ao tentar criar JSON do tipo TListDetExport. ' + E.Message);
      end;
    end;
  end;

  function JsonRastro(vListRastro: TListRastro): TJSONArray;
  var
    jsonObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;
    try
      for I := 0 to High(vListRastro) do
      begin
        jsonObj := TJsonObject.Create;
        jsonObj.AddPair('cAgreg', vListRastro[I].cAgreg.Trim);
        jsonObj.AddPair('dFab', TJSONString.Create(DateToStr(vListRastro[I].dFab, vFormatSettings)));
        jsonObj.AddPair('dVal', TJSONString.Create(DateToStr(vListRastro[I].dVal, vFormatSettings)));
        jsonObj.AddPair('nLote', vListRastro[I].nLote.Trim);
        jsonObj.AddPair('qLote', TJSONString.Create(FormatFloat(FORMAT_DEC_03, vListRastro[I].qLote, vFormatSettings)));
        Result.AddElement(jsonObj);
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonRastro# Erro ao tentar criar JSON do tipo TListRastro. ' + E.Message);
      end;
    end;
  end;

  function JsonArma(vListArma: TListArma): TJSONArray;
  var
    jsonObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;
    try
      for I := 0 to High(vListArma) do
      begin
        jsonObj := TJsonObject.Create;
        jsonObj.AddPair('descr', vListArma[I].descr.Trim);
        jsonObj.AddPair('nCano', vListArma[I].nCano.Trim);
        jsonObj.AddPair('nSerie', vListArma[I].nSerie.Trim);
        jsonObj.AddPair('tpArma', TJSONString.Create(TArmaToStr(vListArma[I].tpArma)));
        Result.AddElement(jsonObj);
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonArma# Erro ao tentar criar JSON do tipo TListArma. ' + E.Message);
      end;
    end;
  end;

  function JsonVeicProd(const vVeicProd: TVeicProd): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('anoFab', TJSONString.Create(IntToStr(vVeicProd.anoFab)));
      Result.AddPair('anoMod', TJSONString.Create(IntToStr(vVeicProd.anoMod)));
      Result.AddPair('cCor', vVeicProd.cCor.Trim);
      Result.AddPair('cCorDENATRAN', vVeicProd.cCorDENATRAN.Trim);
      Result.AddPair('chassi', vVeicProd.chassi.Trim);
      Result.AddPair('cilin', vVeicProd.cilin.Trim);
      Result.AddPair('cMod', vVeicProd.cMod.Trim);
      Result.AddPair('CMT', vVeicProd.CMT.Trim);
      Result.AddPair('condVeic', TJSONString.Create(CondVeicToStr(vVeicProd.condVeic)));
      Result.AddPair('dist', vVeicProd.dist.Trim);
      Result.AddPair('espVeic', TJSONString.Create(IntToStr(vVeicProd.espVeic)));
      Result.AddPair('lota', TJSONString.Create(IntToStr(vVeicProd.lota)));
      Result.AddPair('nMotor', vVeicProd.nMotor.Trim);
      Result.AddPair('nSerie', vVeicProd.nSerie.Trim);
      Result.AddPair('pesoB', vVeicProd.pesoB.Trim);
      Result.AddPair('pesoL', vVeicProd.pesoL.Trim);
      Result.AddPair('pot', vVeicProd.pot.Trim);
      Result.AddPair('tpComb', vVeicProd.tpComb.Trim);
      Result.AddPair('tpOp', TJSONString.Create(TOpToStr(vVeicProd.tpOp)));
      Result.AddPair('tpPint', vVeicProd.tpPint.Trim);
      Result.AddPair('tpRest', TJSONString.Create(IntToStr(vVeicProd.tpRest)));
      Result.AddPair('tpVeic', TJSONString.Create(IntToStr(vVeicProd.tpVeic)));
      Result.AddPair('VIN', vVeicProd.VIN.Trim);
      Result.AddPair('xCor', vVeicProd.xCor.Trim);
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonVeicProd# Erro ao tentar criar JSON do tipo TVeicProd. ' + E.Message);
      end;
    end;
  end;

  function JsonMed(const vMed: TMed): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('cProdANVISA', vMed.cProdANVISA.Trim);
      Result.AddPair('xMotivoIsencao', vMed.xMotivoIsencao.Trim);
      Result.AddPair('vPMC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vMed.vPMC, vFormatSettings)));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonMed# Erro ao tentar criar JSON do tipo TMed. ' + E.Message);
      end;
    end;
  end;

  function JsonComb(const vComb: TComb): TJsonObject;
    function JsonCIDE(const vCIDE: TCIDE): TJsonObject;
    begin
      Result := TJsonObject.Create;
      Result.AddPair('qBCProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCIDE.qBCProd, vFormatSettings)));
      Result.AddPair('vAliqProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCIDE.vAliqProd, vFormatSettings)));
      Result.AddPair('vCIDE', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCIDE.vCIDE, vFormatSettings)));
    end;

    function JsonEncerrante(const vEncerrante: TEncerrante): TJsonObject;
    begin
      Result := TJsonObject.Create;
      Result.AddPair('nBico', TJSONString.Create(IntToStr(vEncerrante.nBico)));
      Result.AddPair('nBomba', TJSONString.Create(IntToStr(vEncerrante.nBomba)));
      Result.AddPair('nTanque', TJSONString.Create(IntToStr(vEncerrante.nTanque)));
      Result.AddPair('vEncIni', TJSONString.Create(FormatFloat(FORMAT_DEC_03, vEncerrante.vEncIni, vFormatSettings)));
      Result.AddPair('vEncFin', TJSONString.Create(FormatFloat(FORMAT_DEC_03, vEncerrante.vEncFin, vFormatSettings)));
    end;

    function JsonOrigComb(const vListOrigComb: TListOrigComb): TJSONArray;
    var
      jsonObj: TJsonObject;
      I: Integer;
    begin
      Result := TJSONArray.Create;
      for I := 0 to High(vListOrigComb) do
      begin
        jsonObj := TJsonObject.Create;
        jsonObj.AddPair('cUFOrig', TJSONString.Create(IntToStr(vListOrigComb[I].cUFOrig)));
        jsonObj.AddPair('indImport', TJSONString.Create(IndImportToStr(vListOrigComb[I].indImport)));
        jsonObj.AddPair('pOrig', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vListOrigComb[I].pOrig, vFormatSettings)));
        Result.AddElement(jsonObj);
      end;
    end;

  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('cProdANP', TJSONString.Create(IntToStr(vComb.cProdANP)));
      Result.AddPair('descANP', vComb.descANP.Trim);
      Result.AddPair('pGLP', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vComb.pGLP, vFormatSettings)));
      Result.AddPair('pGNn', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vComb.pGNn, vFormatSettings)));
      Result.AddPair('pGNi', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vComb.pGNi, vFormatSettings)));
      Result.AddPair('vPart', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vComb.vPart, vFormatSettings)));
      Result.AddPair('CODIF', vComb.CODIF.Trim);
      Result.AddPair('qTemp', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vComb.qTemp, vFormatSettings)));
      Result.AddPair('UFCons', vComb.UFCons.Trim);
      Result.AddPair('pBio', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vComb.pBio, vFormatSettings)));

      if (vComb.CIDE.qBCProd > 0) or (vComb.CIDE.vAliqProd > 0) or (vComb.CIDE.vCIDE > 0) then
        Result.AddPair('CIDE', JsonCIDE(vComb.CIDE));
      Result.AddPair('encerrante', JsonEncerrante(vComb.encerrante));
      if Length(vComb.origComb) > 0 then
        Result.AddPair('origComb', JsonOrigComb(vComb.origComb));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonComb# Erro ao tentar criar JSON do tipo TComb. ' + E.Message);
      end;
    end;
  end;

  function JsonICMS(const vIcms: TICMS): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('CST', TJSONString.Create(CSTIcmsToStr(vIcms.CST_CSOSN)));
      Result.AddPair('orig', OrigemMercadoriaToStr(vIcms.orig));

      if vIcms.CST_CSOSN = cst00 then
      begin
        Result.AddPair('modBC', TJSONString.Create(ModBCToStr(vIcms.ICMS00.modBC)));
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS00.vBC, vFormatSettings)));
        Result.AddPair('pICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS00.pICMS, vFormatSettings)));
        Result.AddPair('vICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS00.vIcms, vFormatSettings)));
        Result.AddPair('pFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS00.pFCP, vFormatSettings)));
        Result.AddPair('vFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS00.vFCP, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = cst02 then
      begin
        Result.AddPair('qBCMono', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS02.qBCMono, vFormatSettings)));
        Result.AddPair('adRemICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS02.adRemICMS, vFormatSettings)));
        Result.AddPair('vICMSMono', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS02.vICMSMono, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = cst10 then
      begin
        Result.AddPair('modBC', TJSONString.Create(ModBCToStr(vIcms.ICMS10.modBC)));
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS10.vBC, vFormatSettings)));
        Result.AddPair('pRedBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS10.pRedBC, vFormatSettings)));
        Result.AddPair('pICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS10.pICMS, vFormatSettings)));
        Result.AddPair('vICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS10.vIcms, vFormatSettings)));
        Result.AddPair('vBCFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS10.vBCFCP, vFormatSettings)));
        Result.AddPair('pFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS10.pFCP, vFormatSettings)));
        Result.AddPair('vFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS10.vFCP, vFormatSettings)));
        Result.AddPair('modBCST', TJSONString.Create(ModBCSTToStr(vIcms.ICMS10.modBCST)));
        Result.AddPair('pMVAST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS10.pMVAST, vFormatSettings)));
        Result.AddPair('pRedBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS10.pRedBCST, vFormatSettings)));
        Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS10.vBCST, vFormatSettings)));
        Result.AddPair('pICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS10.pICMSST, vFormatSettings)));
        Result.AddPair('vICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS10.vICMSST, vFormatSettings)));
        Result.AddPair('vBCFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS10.vBCFCPST, vFormatSettings)));
        Result.AddPair('pFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS10.pFCPST, vFormatSettings)));
        Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS10.vFCPST, vFormatSettings)));
        Result.AddPair('pBCOp', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS10.pBCOp, vFormatSettings)));
        Result.AddPair('UFST', vIcms.ICMS10.UFST.Trim);
        Result.AddPair('vICMSSTDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS10.vICMSSTDeson, vFormatSettings)));
        Result.AddPair('motDesICMSST', TJSONString.Create(MotDesICMSToStr(vIcms.ICMS10.motDesICMSST)));
      end
      else if vIcms.CST_CSOSN = cst15 then
      begin
        Result.AddPair('qBCMono', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS15.qBCMono, vFormatSettings)));
        Result.AddPair('adRemICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS15.adRemICMS, vFormatSettings)));
        Result.AddPair('vICMSMono', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS15.vICMSMono, vFormatSettings)));
        Result.AddPair('qBCMonoReten', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS15.qBCMonoReten, vFormatSettings)));
        Result.AddPair('adRemICMSReten', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS15.adRemICMSReten, vFormatSettings)));
        Result.AddPair('vICMSMonoReten', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS15.vICMSMonoReten, vFormatSettings)));
        Result.AddPair('pRedAdRem', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS15.pRedAdRem, vFormatSettings)));
        Result.AddPair('motRedAdRem', TJSONString.Create(MotRedAdRemToStr(vIcms.ICMS15.motRedAdRem)));
      end
      else if vIcms.CST_CSOSN = cst20 then
      begin
        Result.AddPair('modBC', TJSONString.Create(ModBCToStr(vIcms.ICMS20.modBC)));
        Result.AddPair('pRedBC', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS20.pRedBC, vFormatSettings)));
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS20.vBC, vFormatSettings)));
        Result.AddPair('pICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS20.pICMS, vFormatSettings)));
        Result.AddPair('vICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS20.vIcms, vFormatSettings)));
        Result.AddPair('vBCFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS20.vBCFCP, vFormatSettings)));
        Result.AddPair('pFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS20.pFCP, vFormatSettings)));
        Result.AddPair('vFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS20.vFCP, vFormatSettings)));
        Result.AddPair('vICMSDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS20.vICMSDeson, vFormatSettings)));
        Result.AddPair('motDesICMS', TJSONString.Create(MotDesICMSToStr(vIcms.ICMS20.motDesICMS)));
        Result.AddPair('indDeduzDeson', TJSONString.Create(SimNaoNenhumToStr(vIcms.ICMS20.indDeduzDeson)));
      end
      else if vIcms.CST_CSOSN = cst30 then
      begin
        Result.AddPair('modBCST', TJSONString.Create(ModBCSTToStr(vIcms.ICMS30.modBCST)));
        Result.AddPair('pMVAST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS30.pMVAST, vFormatSettings)));
        Result.AddPair('pRedBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS30.pRedBCST, vFormatSettings)));
        Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS30.vBCST, vFormatSettings)));
        Result.AddPair('pICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS30.pICMSST, vFormatSettings)));
        Result.AddPair('vICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS30.vICMSST, vFormatSettings)));
        Result.AddPair('vBCFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS30.vBCFCPST, vFormatSettings)));
        Result.AddPair('pFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS30.pFCPST, vFormatSettings)));
        Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS30.vFCPST, vFormatSettings)));
        Result.AddPair('vICMSDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS30.vICMSDeson, vFormatSettings)));
        Result.AddPair('motDesICMS', TJSONString.Create(MotDesICMSToStr(vIcms.ICMS30.motDesICMS)));
        Result.AddPair('indDeduzDeson', TJSONString.Create(SimNaoNenhumToStr(vIcms.ICMS30.indDeduzDeson)));
      end
      else if vIcms.CST_CSOSN = cst40 then
      begin
        Result.AddPair('vICMSDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS40.vICMSDeson, vFormatSettings)));
        Result.AddPair('motDesICMS', TJSONString.Create(MotDesICMSToStr(vIcms.ICMS40.motDesICMS)));
        Result.AddPair('indDeduzDeson', TJSONString.Create(SimNaoNenhumToStr(vIcms.ICMS40.indDeduzDeson)));
      end
      else if vIcms.CST_CSOSN = cst41 then
      begin
        Result.AddPair('vICMSDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS41.vICMSDeson, vFormatSettings)));
        Result.AddPair('motDesICMS', TJSONString.Create(MotDesICMSToStr(vIcms.ICMS41.motDesICMS)));
        Result.AddPair('indDeduzDeson', TJSONString.Create(SimNaoNenhumToStr(vIcms.ICMS41.indDeduzDeson)));
      end
      else if vIcms.CST_CSOSN = cst50 then
      begin
        Result.AddPair('vICMSDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS50.vICMSDeson, vFormatSettings)));
        Result.AddPair('motDesICMS', TJSONString.Create(MotDesICMSToStr(vIcms.ICMS50.motDesICMS)));
        Result.AddPair('indDeduzDeson', TJSONString.Create(SimNaoNenhumToStr(vIcms.ICMS50.indDeduzDeson)));
      end
      else if vIcms.CST_CSOSN = cst51 then
      begin
        Result.AddPair('modBC', TJSONString.Create(ModBCToStr(vIcms.ICMS51.modBC)));
        Result.AddPair('pRedBC', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS51.pRedBC, vFormatSettings)));
        Result.AddPair('cBenefRBC', vIcms.ICMS51.cBenefRBC);
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS51.vBC, vFormatSettings)));
        Result.AddPair('pICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS51.pICMS, vFormatSettings)));
        Result.AddPair('vICMSOp', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS51.vICMSOp, vFormatSettings)));
        Result.AddPair('pDif', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS51.pDif, vFormatSettings)));
        Result.AddPair('vICMSDif', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS51.vICMSDif, vFormatSettings)));
        Result.AddPair('vICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS51.vIcms, vFormatSettings)));
        Result.AddPair('vBCFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS51.vBCFCP, vFormatSettings)));
        Result.AddPair('pFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS51.pFCP, vFormatSettings)));
        Result.AddPair('vFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS51.vFCP, vFormatSettings)));
        Result.AddPair('pFCPDif', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS51.pFCPDif, vFormatSettings)));
        Result.AddPair('vFCPDif', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS51.vFCPDif, vFormatSettings)));
        Result.AddPair('vFCPEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS51.vFCPEfet, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = cst53 then
      begin
        Result.AddPair('qBCMono', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS53.qBCMono, vFormatSettings)));
        Result.AddPair('adRemICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS53.adRemICMS, vFormatSettings)));
        Result.AddPair('vICMSMonoOp', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS53.vICMSMonoOp, vFormatSettings)));
        Result.AddPair('pDif', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS53.pDif, vFormatSettings)));
        Result.AddPair('vICMSMonoDif', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS53.vICMSMonoDif, vFormatSettings)));
        Result.AddPair('vICMSMono', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS53.vICMSMono, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = cst60 then
      begin
        Result.AddPair('vBCSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS60.vBCSTRet, vFormatSettings)));
        Result.AddPair('pST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS60.pST, vFormatSettings)));
        Result.AddPair('vICMSSubstituto', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS60.vICMSSubstituto, vFormatSettings)));
        Result.AddPair('vICMSSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS60.vICMSSTRet, vFormatSettings)));
        Result.AddPair('vBCFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS60.vBCFCPSTRet, vFormatSettings)));
        Result.AddPair('pFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS60.pFCPSTRet, vFormatSettings)));
        Result.AddPair('vFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS60.vFCPSTRet, vFormatSettings)));
        Result.AddPair('pRedBCEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS60.pRedBCEfet, vFormatSettings)));
        Result.AddPair('vBCEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS60.vBCEfet, vFormatSettings)));
        Result.AddPair('pICMSEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS60.pICMSEfet, vFormatSettings)));
        Result.AddPair('vICMSEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS60.vICMSEfet, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = cst61 then
      begin
        Result.AddPair('qBCMonoRet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS61.qBCMonoRet, vFormatSettings)));
        Result.AddPair('adRemICMSRet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS61.adRemICMSRet, vFormatSettings)));
        Result.AddPair('vICMSMonoRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS61.vICMSMonoRet, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = cst70 then
      begin
        Result.AddPair('modBC', TJSONString.Create(ModBCToStr(vIcms.ICMS70.modBC)));
        Result.AddPair('pRedBC', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS70.pRedBC, vFormatSettings)));
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS70.vBC, vFormatSettings)));
        Result.AddPair('pICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS70.pICMS, vFormatSettings)));
        Result.AddPair('vICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS70.vIcms, vFormatSettings)));
        Result.AddPair('vBCFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS70.vBCFCP, vFormatSettings)));
        Result.AddPair('pFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS70.pFCP, vFormatSettings)));
        Result.AddPair('vFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS70.vFCP, vFormatSettings)));
        Result.AddPair('modBCST', TJSONString.Create(ModBCSTToStr(vIcms.ICMS70.modBCST)));
        Result.AddPair('pMVAST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS70.pMVAST, vFormatSettings)));
        Result.AddPair('pRedBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS70.pRedBCST, vFormatSettings)));
        Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS70.vBCST, vFormatSettings)));
        Result.AddPair('pICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS70.pICMSST, vFormatSettings)));
        Result.AddPair('vICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS70.vICMSST, vFormatSettings)));
        Result.AddPair('vBCFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS70.vBCFCPST, vFormatSettings)));
        Result.AddPair('pFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS70.pFCPST, vFormatSettings)));
        Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS70.vFCPST, vFormatSettings)));
        Result.AddPair('vICMSDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS70.vICMSDeson, vFormatSettings)));
        Result.AddPair('motDesICMS', TJSONString.Create(MotDesICMSToStr(vIcms.ICMS70.motDesICMS)));
        Result.AddPair('indDeduzDeson', TJSONString.Create(SimNaoNenhumToStr(vIcms.ICMS70.indDeduzDeson)));
        Result.AddPair('vICMSSTDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS70.vICMSSTDeson, vFormatSettings)));
        Result.AddPair('motDesICMSST', TJSONString.Create(MotDesICMSToStr(vIcms.ICMS70.motDesICMSST)));
      end
      else if vIcms.CST_CSOSN = cst90 then
      begin
        Result.AddPair('modBC', TJSONString.Create(ModBCToStr(vIcms.ICMS90.modBC)));
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.vBC, vFormatSettings)));
        Result.AddPair('pRedBC', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS90.pRedBC, vFormatSettings)));
        Result.AddPair('pICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS90.pICMS, vFormatSettings)));
        Result.AddPair('vICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.vIcms, vFormatSettings)));
        Result.AddPair('vBCFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.vBCFCP, vFormatSettings)));
        Result.AddPair('pFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS90.pFCP, vFormatSettings)));
        Result.AddPair('vFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.vFCP, vFormatSettings)));
        Result.AddPair('modBCST', TJSONString.Create(ModBCSTToStr(vIcms.ICMS90.modBCST)));
        Result.AddPair('pMVAST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.pMVAST, vFormatSettings)));
        Result.AddPair('pRedBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS90.pRedBCST, vFormatSettings)));
        Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.vBCST, vFormatSettings)));
        Result.AddPair('pICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS90.pICMSST, vFormatSettings)));
        Result.AddPair('vICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.vICMSST, vFormatSettings)));
        Result.AddPair('vBCFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.vBCFCPST, vFormatSettings)));
        Result.AddPair('pFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS90.pFCPST, vFormatSettings)));
        Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.vFCPST, vFormatSettings)));
        Result.AddPair('vICMSDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.vICMSDeson, vFormatSettings)));
        Result.AddPair('motDesICMS', TJSONString.Create(MotDesICMSToStr(vIcms.ICMS90.motDesICMS)));
        Result.AddPair('indDeduzDeson', TJSONString.Create(SimNaoNenhumToStr(vIcms.ICMS90.indDeduzDeson)));
        Result.AddPair('pBCOp', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS90.pBCOp, vFormatSettings)));
        Result.AddPair('UFST', vIcms.ICMS90.UFST.Trim);
        Result.AddPair('vICMSSTDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS90.vICMSSTDeson, vFormatSettings)));
        Result.AddPair('motDesICMSST', TJSONString.Create(MotDesICMSToStr(vIcms.ICMS90.motDesICMSST)));
      end
      else if vIcms.CST_CSOSN = csosn101 then
      begin
        Result.AddPair('pCredSN', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS101.pCredSN, vFormatSettings)));
        Result.AddPair('vCredICMSSN', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS101.vCredICMSSN, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = csosn201 then
      begin
        Result.AddPair('modBCST', TJSONString.Create(ModBCSTToStr(vIcms.ICMS201.modBCST)));
        Result.AddPair('pMVAST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS201.pMVAST, vFormatSettings)));
        Result.AddPair('pRedBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS201.pRedBCST, vFormatSettings)));
        Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS201.vBCST, vFormatSettings)));
        Result.AddPair('pICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS201.pICMSST, vFormatSettings)));
        Result.AddPair('vICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS201.vICMSST, vFormatSettings)));
        Result.AddPair('vBCFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS201.vBCFCPST, vFormatSettings)));
        Result.AddPair('pFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS201.pFCPST, vFormatSettings)));
        Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS201.vFCPST, vFormatSettings)));
        Result.AddPair('pCredSN', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS201.pCredSN, vFormatSettings)));
        Result.AddPair('vCredICMSSN', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS201.vCredICMSSN, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = csosn202 then
      begin
        Result.AddPair('modBCST', TJSONString.Create(ModBCSTToStr(vIcms.ICMS202.modBCST)));
        Result.AddPair('pMVAST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS202.pMVAST, vFormatSettings)));
        Result.AddPair('pRedBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS202.pRedBCST, vFormatSettings)));
        Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS202.vBCST, vFormatSettings)));
        Result.AddPair('pICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS202.pICMSST, vFormatSettings)));
        Result.AddPair('vICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS202.vICMSST, vFormatSettings)));
        Result.AddPair('vBCFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS202.vBCFCPST, vFormatSettings)));
        Result.AddPair('pFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS202.pFCPST, vFormatSettings)));
        Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS202.vFCPST, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = csosn203 then
      begin
        Result.AddPair('modBCST', TJSONString.Create(ModBCSTToStr(vIcms.ICMS203.modBCST)));
        Result.AddPair('pMVAST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS203.pMVAST, vFormatSettings)));
        Result.AddPair('pRedBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS203.pRedBCST, vFormatSettings)));
        Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS203.vBCST, vFormatSettings)));
        Result.AddPair('pICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS203.pICMSST, vFormatSettings)));
        Result.AddPair('vICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS203.vICMSST, vFormatSettings)));
        Result.AddPair('vBCFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS203.vBCFCPST, vFormatSettings)));
        Result.AddPair('pFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS203.pFCPST, vFormatSettings)));
        Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS203.vFCPST, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = csosn500 then
      begin
        Result.AddPair('vBCSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS500.vBCSTRet, vFormatSettings)));
        Result.AddPair('pST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS500.pST, vFormatSettings)));
        Result.AddPair('vICMSSubstituto', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS500.vICMSSubstituto, vFormatSettings)));
        Result.AddPair('vICMSSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS500.vICMSSTRet, vFormatSettings)));
        Result.AddPair('vBCFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS500.vBCFCPSTRet, vFormatSettings)));
        Result.AddPair('pFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS500.pFCPSTRet, vFormatSettings)));
        Result.AddPair('vFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS500.vFCPSTRet, vFormatSettings)));
        Result.AddPair('pRedBCEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS500.pRedBCEfet, vFormatSettings)));
        Result.AddPair('vBCEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS500.vBCEfet, vFormatSettings)));
        Result.AddPair('pICMSEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS500.pICMSEfet, vFormatSettings)));
        Result.AddPair('vICMSEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS500.vICMSEfet, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = csosn900 then
      begin
        Result.AddPair('modBC', TJSONString.Create(ModBCToStr(vIcms.ICMS900.modBC)));
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS900.vBC, vFormatSettings)));
        Result.AddPair('pRedBC', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS900.pRedBC, vFormatSettings)));
        Result.AddPair('pICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS900.pICMS, vFormatSettings)));
        Result.AddPair('vICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS900.vIcms, vFormatSettings)));
        Result.AddPair('modBCST', TJSONString.Create(ModBCSTToStr(vIcms.ICMS900.modBCST)));
        Result.AddPair('pMVAST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS900.pMVAST, vFormatSettings)));
        Result.AddPair('pRedBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS900.pRedBCST, vFormatSettings)));
        Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS900.vBCST, vFormatSettings)));
        Result.AddPair('pICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS900.pICMSST, vFormatSettings)));
        Result.AddPair('vICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS900.vICMSST, vFormatSettings)));
        Result.AddPair('vBCFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS900.vBCFCPST, vFormatSettings)));
        Result.AddPair('pFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS900.pFCPST, vFormatSettings)));
        Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS900.vFCPST, vFormatSettings)));
        Result.AddPair('pCredSN', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMS900.pCredSN, vFormatSettings)));
        Result.AddPair('vCredICMSSN', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMS900.vCredICMSSN, vFormatSettings)));
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonICMS# Erro ao criar JSON do tipo TICMS. ' + E.Message);
      end;
    end;
  end;

  function JsonICMSST(const vIcms: TICMS): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('CST', TJSONString.Create(CSTIcmsToStr(vIcms.CST_CSOSN)));
      Result.AddPair('orig', OrigemMercadoriaToStr(vIcms.orig));

      if vIcms.CST_CSOSN = cstRep41 then
      begin
        Result.AddPair('vBCSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep41.vBCSTRet, vFormatSettings)));
        Result.AddPair('pST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSRep41.pST, vFormatSettings)));
        Result.AddPair('vICMSSubstituto', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep41.vICMSSubstituto, vFormatSettings)));
        Result.AddPair('vICMSSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep41.vICMSSTRet, vFormatSettings)));
        Result.AddPair('vBCFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep41.vBCFCPSTRet, vFormatSettings)));
        Result.AddPair('pFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSRep41.pFCPSTRet, vFormatSettings)));
        Result.AddPair('vFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep41.vFCPSTRet, vFormatSettings)));
        Result.AddPair('vBCSTDest', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep41.vBCSTDest, vFormatSettings)));
        Result.AddPair('vICMSSTDest', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep41.vICMSSTDest, vFormatSettings)));
        Result.AddPair('pRedBCEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSRep41.pRedBCEfet, vFormatSettings)));
        Result.AddPair('vBCEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep41.vBCEfet, vFormatSettings)));
        Result.AddPair('pICMSEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSRep41.pICMSEfet, vFormatSettings)));
        Result.AddPair('vICMSEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep41.vICMSEfet, vFormatSettings)));
      end
      else if vIcms.CST_CSOSN = cstRep60 then
      begin
        Result.AddPair('vBCSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep60.vBCSTRet, vFormatSettings)));
        Result.AddPair('pST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSRep60.pST, vFormatSettings)));
        Result.AddPair('vICMSSubstituto', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep60.vICMSSubstituto, vFormatSettings)));
        Result.AddPair('vICMSSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep60.vICMSSTRet, vFormatSettings)));
        Result.AddPair('vBCFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep60.vBCFCPSTRet, vFormatSettings)));
        Result.AddPair('pFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSRep60.pFCPSTRet, vFormatSettings)));
        Result.AddPair('vFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep60.vFCPSTRet, vFormatSettings)));
        Result.AddPair('vBCSTDest', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep60.vBCSTDest, vFormatSettings)));
        Result.AddPair('vICMSSTDest', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep60.vICMSSTDest, vFormatSettings)));
        Result.AddPair('pRedBCEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSRep60.pRedBCEfet, vFormatSettings)));
        Result.AddPair('vBCEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep60.vBCEfet, vFormatSettings)));
        Result.AddPair('pICMSEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSRep60.pICMSEfet, vFormatSettings)));
        Result.AddPair('vICMSEfet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSRep60.vICMSEfet, vFormatSettings)));
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonICMSST# Erro ao tentar criar JSON do tipo TICMS. ' + E.Message);
      end;
    end;
  end;

  function JsonICMSPart(const vIcms: TICMS): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('CST', TJSONString.Create(CSTIcmsToStr(vIcms.CST_CSOSN)));
      Result.AddPair('orig', OrigemMercadoriaToStr(vIcms.orig));

      if vIcms.CST_CSOSN = cstPart10 then
      begin
        Result.AddPair('modBC', TJSONString.Create(ModBCToStr(vIcms.ICMSPart10.modBC)));
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart10.vBC, vFormatSettings)));
        Result.AddPair('pRedBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart10.pRedBC, vFormatSettings)));
        Result.AddPair('pICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart10.pICMS, vFormatSettings)));
        Result.AddPair('vICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart10.vIcms, vFormatSettings)));
        Result.AddPair('vBCFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart10.vBCFCP, vFormatSettings)));
        Result.AddPair('pFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart10.pFCP, vFormatSettings)));
        Result.AddPair('vFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart10.vFCP, vFormatSettings)));
        Result.AddPair('modBCST', TJSONString.Create(ModBCSTToStr(vIcms.ICMSPart10.modBCST)));
        Result.AddPair('pMVAST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart10.pMVAST, vFormatSettings)));
        Result.AddPair('pRedBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart10.pRedBCST, vFormatSettings)));
        Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart10.vBCST, vFormatSettings)));
        Result.AddPair('pICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart10.pICMSST, vFormatSettings)));
        Result.AddPair('vICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart10.vICMSST, vFormatSettings)));
        Result.AddPair('vBCFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart10.vBCFCPST, vFormatSettings)));
        Result.AddPair('pFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart10.pFCPST, vFormatSettings)));
        Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart10.vFCPST, vFormatSettings)));
        Result.AddPair('pBCOp', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart10.pBCOp, vFormatSettings)));
        Result.AddPair('UFST', vIcms.ICMSPart10.UFST.Trim);
        Result.AddPair('vICMSSTDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart10.vICMSSTDeson, vFormatSettings)));
        Result.AddPair('motDesICMSST', TJSONString.Create(MotDesICMSToStr(vIcms.ICMSPart10.motDesICMSST)));
      end
      else if vIcms.CST_CSOSN = cstPart90 then
      begin
        Result.AddPair('modBC', TJSONString.Create(ModBCToStr(vIcms.ICMSPart90.modBC)));
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart90.vBC, vFormatSettings)));
        Result.AddPair('pRedBC', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart90.pRedBC, vFormatSettings)));
        Result.AddPair('pICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart90.pICMS, vFormatSettings)));
        Result.AddPair('vICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart90.vIcms, vFormatSettings)));
        Result.AddPair('vBCFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart90.vBCFCP, vFormatSettings)));
        Result.AddPair('pFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart90.pFCP, vFormatSettings)));
        Result.AddPair('vFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart90.vFCP, vFormatSettings)));
        Result.AddPair('modBCST', TJSONString.Create(ModBCSTToStr(vIcms.ICMSPart90.modBCST)));
        Result.AddPair('pMVAST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart90.pMVAST, vFormatSettings)));
        Result.AddPair('pRedBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart90.pRedBCST, vFormatSettings)));
        Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart90.vBCST, vFormatSettings)));
        Result.AddPair('pICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart90.pICMSST, vFormatSettings)));
        Result.AddPair('vICMSST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart90.vICMSST, vFormatSettings)));
        Result.AddPair('vBCFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart90.vBCFCPST, vFormatSettings)));
        Result.AddPair('pFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart90.pFCPST, vFormatSettings)));
        Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart90.vFCPST, vFormatSettings)));
        Result.AddPair('pBCOp', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIcms.ICMSPart90.pBCOp, vFormatSettings)));
        Result.AddPair('UFST', vIcms.ICMSPart90.UFST.Trim);
        Result.AddPair('vICMSSTDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIcms.ICMSPart90.vICMSSTDeson, vFormatSettings)));
        Result.AddPair('motDesICMSST', TJSONString.Create(MotDesICMSToStr(vIcms.ICMSPart90.motDesICMSST)));
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonICMSPart# Erro ao tentar criar JSON do tipo TICMS. ' + E.Message);
      end;
    end;
  end;

  function JsonICMSUFDest(const vICMSUFDest: TICMSUFDest): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('pFCPUFDest', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vICMSUFDest.pFCPUFDest, vFormatSettings)));
      Result.AddPair('pICMSInter', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vICMSUFDest.pICMSInter, vFormatSettings)));
      Result.AddPair('pICMSInterPart', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vICMSUFDest.pICMSInterPart, vFormatSettings)));
      Result.AddPair('pICMSUFDest', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vICMSUFDest.pICMSUFDest, vFormatSettings)));
      Result.AddPair('vBCFCPUFDest', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vICMSUFDest.vBCFCPUFDest, vFormatSettings)));
      Result.AddPair('vBCUFDest', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vICMSUFDest.vBCUFDest, vFormatSettings)));
      Result.AddPair('vFCPUFDest', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vICMSUFDest.vFCPUFDest, vFormatSettings)));
      Result.AddPair('vICMSUFDest', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vICMSUFDest.vICMSUFDest, vFormatSettings)));
      Result.AddPair('vICMSUFRemet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vICMSUFDest.vICMSUFRemet, vFormatSettings)));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonICMSUFDest# Erro ao tentar criar JSON do tipo TICMSUFDest. ' + E.Message);
      end;
    end;
  end;

  function JsonIPI(const vIPI: TIPI): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('CST', TJSONString.Create(CSTIPIToStr(vIPI.CST)));
      Result.AddPair('CNPJProd', vIPI.CNPJProd.Trim);
      Result.AddPair('cSelo', vIPI.cSelo.Trim);
      Result.AddPair('qSelo', TJSONString.Create(IntToStr(vIPI.qSelo)));
      Result.AddPair('cEnq', vIPI.cEnq.Trim);

      // Se o CST for compatível com TIPITrib, adiciona os valores correspondentes
      if vIPI.CST in [ipi00, ipi49, ipi50, ipi99] then
      begin
        Result.AddPair('qUnid', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIPI.IPITrib.qUnid, vFormatSettings)));
        Result.AddPair('vUnid', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIPI.IPITrib.vUnid, vFormatSettings)));
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIPI.IPITrib.vBC, vFormatSettings)));
        Result.AddPair('pIPI', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vIPI.IPITrib.pIPI, vFormatSettings)));
        Result.AddPair('vIPI', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vIPI.IPITrib.vIPI, vFormatSettings)));
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonIPI# Erro ao tentar criar JSON do tipo TIPI. ' + E.Message);
      end;
    end;
  end;

  function JsonPIS(const vPIS: TPIS): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('CST', TJSONString.Create(CSTPISToStr(vPIS.CST)));

      if vPIS.CST in [pis01, pis02] then
      begin
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vPIS.PISAliq.vBC, vFormatSettings)));
        Result.AddPair('pPIS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vPIS.PISAliq.pPIS, vFormatSettings)));
        Result.AddPair('vPIS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vPIS.PISAliq.vPIS, vFormatSettings)));
      end;

      if vPIS.CST = pis03 then
      begin
        Result.AddPair('qBCProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vPIS.PISQtde.qBCProd, vFormatSettings)));
        Result.AddPair('vAliqProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vPIS.PISQtde.vAliqProd, vFormatSettings)));
        Result.AddPair('vPIS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vPIS.PISQtde.vPIS, vFormatSettings)));
      end;

      if vPIS.CST in [pis49, pis50, pis51, pis52, pis53, pis54, pis55, pis56, pis60, pis61, pis62, pis63, pis64, pis65,
        pis66, pis67, pis70, pis71, pis72, pis73, pis74, pis75, pis98, pis99] then
      begin
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vPIS.PISOutr.vBC, vFormatSettings)));
        Result.AddPair('pPIS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vPIS.PISOutr.pPIS, vFormatSettings)));
        Result.AddPair('qBCProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vPIS.PISOutr.qBCProd, vFormatSettings)));
        Result.AddPair('vAliqProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vPIS.PISOutr.vAliqProd, vFormatSettings)));
        Result.AddPair('vPIS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vPIS.PISOutr.vPIS, vFormatSettings)));
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonPIS# Erro ao tentar criar JSON do tipo TPIS. ' + E.Message);
      end;
    end;
  end;

  function JsonPISST(const vPISST: TPISST): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('indSomaPISST', TJSONString.Create(IndSomaPISSTToStr(vPISST.indSomaPISST)));
      Result.AddPair('pPIS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vPISST.pPIS, vFormatSettings)));
      Result.AddPair('qBCProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vPISST.qBCProd, vFormatSettings)));
      Result.AddPair('vAliqProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vPISST.vAliqProd, vFormatSettings)));
      Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vPISST.vBC, vFormatSettings)));
      Result.AddPair('vPIS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vPISST.vPIS, vFormatSettings)));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonPISST# Erro ao tentar criar JSON do tipo TPISST. ' + E.Message);
      end;
    end;
  end;

  function JsonCOFINS(const vCOFINS: TCOFINS): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('CST', TJSONString.Create(CSTCOFINSToStr(vCOFINS.CST)));

      if vCOFINS.CST in [cof01, cof02] then
      begin
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCOFINS.COFINSAliq.vBC, vFormatSettings)));
        Result.AddPair('pCOFINS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCOFINS.COFINSAliq.pCOFINS, vFormatSettings)));
        Result.AddPair('vCOFINS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCOFINS.COFINSAliq.vCOFINS, vFormatSettings)));
      end;

      if vCOFINS.CST = cof03 then
      begin
        Result.AddPair('qBCProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCOFINS.COFINSQtde.qBCProd, vFormatSettings)));
        Result.AddPair('vAliqProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCOFINS.COFINSQtde.vAliqProd, vFormatSettings)));
        Result.AddPair('vCOFINS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCOFINS.COFINSQtde.vCOFINS, vFormatSettings)));
      end;

      if vCOFINS.CST in [cof49, cof50, cof51, cof52, cof53, cof54, cof55, cof56, cof60, cof61, cof62, cof63, cof64,
        cof65, cof66, cof67, cof70, cof71, cof72, cof73, cof74, cof75, cof98, cof99] then
      begin
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCOFINS.COFINSOutr.vBC, vFormatSettings)));
        Result.AddPair('pCOFINS', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCOFINS.COFINSOutr.pCOFINS, vFormatSettings)));
        Result.AddPair('qBCProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCOFINS.COFINSOutr.qBCProd, vFormatSettings)));
        Result.AddPair('vAliqProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCOFINS.COFINSOutr.vAliqProd, vFormatSettings)));
        Result.AddPair('vCOFINS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCOFINS.COFINSOutr.vCOFINS, vFormatSettings)));
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonCOFINS# Erro ao tentar criar JSON do tipo TCOFINS. ' + E.Message);
      end;
    end;
  end;

  function JsonCOFINSST(const vCOFINSST: TCOFINSST): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('indSomaCOFINSST', TJSONString.Create(IndSomaCOFINSSTToStr(vCOFINSST.indSomaCOFINSST)));
      Result.AddPair('pCofins', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCOFINSST.pCOFINS, vFormatSettings)));
      Result.AddPair('qBCProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCOFINSST.qBCProd, vFormatSettings)));
      Result.AddPair('vAliqProd', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vCOFINSST.vAliqProd, vFormatSettings)));
      Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCOFINSST.vBC, vFormatSettings)));
      Result.AddPair('vCofins', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vCOFINSST.vCOFINS, vFormatSettings)));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonCOFINSST# Erro ao tentar criar JSON do tipo TCOFINSST. ' + E.Message);
      end;
    end;
  end;

  function JsonII(const vII: TII): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vII.vBC, vFormatSettings)));
      Result.AddPair('vDespAdu', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vII.vDespAdu, vFormatSettings)));
      Result.AddPair('vII', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vII.vII, vFormatSettings)));
      Result.AddPair('vIOF', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vII.vIOF, vFormatSettings)));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonII# Erro ao tentar criar JSON do tipo TII. ' + E.Message);
      end;
    end;
  end;

  function JsonImpostoDevol(const vImpostoDevol: TImpostoDevol): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('pDevol', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vImpostoDevol.pDevol, vFormatSettings)));
      Result.AddPair('vIPIDevol', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vImpostoDevol.vIPIDevol, vFormatSettings)));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonImpostoDevol# Erro ao tentar criar JSON do tipo TImpostoDevol. ' + E.Message);
      end;
    end;
  end;

  function JsonISSQN(const vISSQN: TISSQN): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('cListServ', vISSQN.cListServ.Trim);
      Result.AddPair('cMun', TJSONString.Create(IntToStr(vISSQN.cMun)));
      Result.AddPair('cMunFG', TJSONString.Create(IntToStr(vISSQN.cMunFG)));
      Result.AddPair('cPais', TJSONString.Create(IntToStr(vISSQN.cPais)));
      Result.AddPair('cServico', vISSQN.cServico.Trim);
      Result.AddPair('indIncentivo', TJSONString.Create(SimNaoToStr(vISSQN.indIncentivo)));
      Result.AddPair('indISS', TJSONString.Create(IndISSToStr(vISSQN.indISS)));
      Result.AddPair('nProcesso', vISSQN.nProcesso.Trim);
      Result.AddPair('vAliq', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vISSQN.vAliq, vFormatSettings)));
      Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQN.vBC, vFormatSettings)));
      Result.AddPair('vDeducao', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQN.vDeducao, vFormatSettings)));
      Result.AddPair('vDescCond', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQN.vDescCond, vFormatSettings)));
      Result.AddPair('vDescIncond', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQN.vDescIncond, vFormatSettings)));
      Result.AddPair('vISSQN', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQN.vISSQN, vFormatSettings)));
      Result.AddPair('vISSRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQN.vISSRet, vFormatSettings)));
      Result.AddPair('vOutro', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQN.vOutro, vFormatSettings)));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonISSQN# Erro ao tentar criar JSON do tipo TISSQN. ' + E.Message);
      end;
    end;
  end;

  function JsonImposto(const vImposto: TImposto): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('ICMS', JsonICMS(vImposto.ICMS));
      if vImposto.ICMS.CST_CSOSN in [cstRep41, cstRep60] then
        Result.AddPair('ICMSST', JsonICMSST(vImposto.ICMS));
      if vImposto.ICMS.CST_CSOSN in [cstPart10, cstPart90] then
        Result.AddPair('ICMSPart', JsonICMSPart(vImposto.ICMS));
      Result.AddPair('IPI', JsonIPI(vImposto.IPI));
      Result.AddPair('PIS', JsonPIS(vImposto.PIS));
      if vImposto.PISST.vPIS > 0 then
        Result.AddPair('PISST', JsonPISST(vImposto.PISST));
      Result.AddPair('COFINS', JsonCOFINS(vImposto.COFINS));
      if vImposto.COFINSST.vCOFINS > 0 then
        Result.AddPair('COFINSST', JsonCOFINSST(vImposto.COFINSST));
      if vImposto.II.vII > 0 then
        Result.AddPair('II', JsonII(vImposto.II));
      if (vImposto.impostoDevol.pDevol > 0) or (vImposto.impostoDevol.vIPIDevol > 0) then
        Result.AddPair('impostoDevol', JsonImpostoDevol(vImposto.impostoDevol));
      if (vImposto.ICMSUFDest.pICMSInterPart > 0) then
        Result.AddPair('ICMSUFDest', JsonICMSUFDest(vImposto.ICMSUFDest));
      if (vImposto.ISSQN.cListServ.Trim <> '') then
        Result.AddPair('ISSQN', JsonISSQN(vImposto.ISSQN));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonImposto# Erro ao tentar criar JSON do tipo TImposto. ' + E.Message);
      end;
    end;
  end;

  function JsonProd(const vProd: TProd): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      if Length(vProd.NVE) > 0 then
        Result.AddPair('NVE', JsonNVE(vProd.NVE));
      if Length(vProd.DI) > 0 then
        Result.AddPair('DI', JsonDI(vProd.DI));
      if Length(vProd.detExport) > 0 then
        Result.AddPair('detExport', JsonDetExport(vProd.detExport));
      if Length(vProd.rastro) > 0 then
        Result.AddPair('rastro', JsonRastro(vProd.rastro));
      if Length(vProd.arma) > 0 then
        Result.AddPair('arma', JsonArma(vProd.arma));
      Result.AddPair('gCred', JsonGCred(vProd.gCred));
      if vProd.veicProd.chassi.Trim <> '' then
        Result.AddPair('veicProd', JsonVeicProd(vProd.veicProd));
      Result.AddPair('med', JsonMed(vProd.med));
      if vProd.comb.cProdANP > 0 then
        Result.AddPair('comb', JsonComb(vProd.comb));

      Result.AddPair('cBarraTrib', vProd.cBarraTrib.Trim);
      Result.AddPair('cBarra', vProd.cBarra.Trim);
      Result.AddPair('cBenef', vProd.cBenef.Trim);
      Result.AddPair('cEAN', vProd.cEAN.Trim);
      Result.AddPair('cEANTrib', vProd.cEANTrib.Trim);
      Result.AddPair('CEST', vProd.CEST.Trim);
      Result.AddPair('CFOP', TJSONString.Create(IntToStr(vProd.CFOP)));
      Result.AddPair('CNPJFab', vProd.CNPJFab.Trim);
      Result.AddPair('cProd', vProd.cProd.Trim);
      Result.AddPair('EXTIPI', vProd.EXTIPI.Trim);
      Result.AddPair('indEscala', TJSONString.Create(IndEscalaToStr(vProd.indEscala)));
      Result.AddPair('indTot', TJSONString.Create(IndTotalToStr(vProd.indTot)));
      Result.AddPair('NCM', vProd.NCM.Trim);
      Result.AddPair('nFCI', vProd.nFCI.Trim);
      Result.AddPair('nItemPed', vProd.nItemPed.Trim);
      Result.AddPair('nRECOPI', vProd.nRECOPI.Trim);
      Result.AddPair('qCom', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vProd.qCom, vFormatSettings)));
      Result.AddPair('qTrib', TJSONString.Create(FormatFloat(FORMAT_DEC_04, vProd.qTrib, vFormatSettings)));
      Result.AddPair('uCom', vProd.uCom.Trim);
      Result.AddPair('uTrib', vProd.uTrib.Trim);
      Result.AddPair('vDesc', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vProd.vDesc, vFormatSettings)));
      Result.AddPair('vFrete', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vProd.vFrete, vFormatSettings)));
      Result.AddPair('vOutro', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vProd.vOutro, vFormatSettings)));
      Result.AddPair('vProd', TJSONString.Create(FormatFloat(FORMAT_DEC_10, vProd.vProd, vFormatSettings)));
      Result.AddPair('vSeg', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vProd.vSeg, vFormatSettings)));
      Result.AddPair('vUnCom', TJSONString.Create(FormatFloat(FORMAT_DEC_10, vProd.vUnCom, vFormatSettings)));
      Result.AddPair('vUnTrib', TJSONString.Create(FormatFloat(FORMAT_DEC_10, vProd.vUnTrib, vFormatSettings)));
      Result.AddPair('xPed', vProd.xPed.Trim);
      Result.AddPair('xProd', vProd.xProd.Trim);
      Result.AddPair('vTotTrib', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vProd.vTotTrib, vFormatSettings)));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonProd# Erro ao tentar criar JSON do tipo TProd. ' + E.Message);
      end;
    end;
  end;

  function JsonDet(const vDet: TDet): TJsonObject;
  begin
    Result := TJsonObject.Create;
    Result.AddPair('prod', JsonProd(vDet.prod));
    Result.AddPair('imposto', JsonImposto(vDet.imposto));
    Result.AddPair('infAdPro', vDet.infAdPro);
    Result.AddPair('nItem', TJSONString.Create(IntToStr(vDet.nItem)));
  end;

begin
  Result := nil;
  try
    if Length(vListDet) > 0 then
    begin
      Result := TJSONArray.Create;

      for I := 0 to High(vListDet) do
      begin
        jsonObjDet := JsonDet(vListDet[I]);
        Result.AddElement(jsonObjDet);
      end;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeDet# Erro ao tentar criar JSON do tipo TListDet. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeEmit(const vEmit: TEmit): TJsonObject;

  function JsonEnderEmit(const vEnd: TEndereco): TJsonObject;
  begin
    Result := TJsonObject.Create;
    Result.AddPair('xLgr', vEnd.xLgr.Trim);
    Result.AddPair('nro', vEnd.nro.Trim);
    Result.AddPair('xCpl', vEnd.xCpl.Trim);
    Result.AddPair('xBairro', vEnd.xBairro.Trim);
    Result.AddPair('cMun', TJSONString.Create(IntToStr(vEnd.cMun)));
    Result.AddPair('xMun', vEnd.xMun.Trim);
    Result.AddPair('UF', vEnd.UF.Trim);
    Result.AddPair('CEP', vEnd.CEP.Trim);
    Result.AddPair('cPais', TJSONString.Create(IntToStr(vEnd.cPais)));
    Result.AddPair('xPais', vEnd.xPais.Trim);
    Result.AddPair('fone', vEnd.fone.Trim);
  end;

begin
  Result := TJsonObject.Create;
  try
    Result.AddPair('CNPJCPF', vEmit.CNPJCPF.Trim);
    Result.AddPair('xNome', vEmit.xNome.Trim);
    Result.AddPair('xFant', vEmit.xFant.Trim);
    Result.AddPair('IE', vEmit.IE.Trim);
    Result.AddPair('IEST', vEmit.IEST.Trim);
    Result.AddPair('IM', vEmit.IM.Trim);
    Result.AddPair('CNAE', vEmit.CNAE.Trim);
    Result.AddPair('CRT', TJSONString.Create(CRTToStr(vEmit.CRT)));

    Result.AddPair('enderEmit', JsonEnderEmit(vEmit.enderEmit));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeEmit# Erro ao tentar criar JSON do tipo TEmit. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeEntrega(const vEntrega: TEntrega): TJsonObject;
begin
  Result := nil;

  if (vEntrega.xLgr.Trim <> '') then
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('CNPJCPF', vEntrega.CNPJCPF.Trim);
      Result.AddPair('xNome', vEntrega.xNome.Trim);
      Result.AddPair('xLgr', vEntrega.xLgr.Trim);
      Result.AddPair('nro', vEntrega.nro.Trim);
      Result.AddPair('xCpl', vEntrega.xCpl.Trim);
      Result.AddPair('xBairro', vEntrega.xBairro.Trim);
      Result.AddPair('cMun', TJSONString.Create(IntToStr(vEntrega.cMun)));
      Result.AddPair('xMun', vEntrega.xMun.Trim);
      Result.AddPair('UF', vEntrega.UF.Trim);
      Result.AddPair('CEP', vEntrega.CEP.Trim);
      Result.AddPair('cPais', TJSONString.Create(IntToStr(vEntrega.cPais)));
      Result.AddPair('xPais', vEntrega.xPais.Trim);
      Result.AddPair('fone', vEntrega.fone.Trim);
      Result.AddPair('email', vEntrega.email.Trim);
      Result.AddPair('IE', vEntrega.IE.Trim);
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonInfNFeNFCeEntrega# Erro ao tentar criar JSON do tipo TEntrega. ' + E.Message);
      end;
    end;
  end;
end;

function JsonInfNFeNFCeExporta(const vExporta: TExporta): TJsonObject;
begin
  Result := nil;

  if (vExporta.UFSaidaPais.Trim <> '') or (vExporta.xLocExporta.Trim <> '') then
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('UFSaidaPais', vExporta.UFSaidaPais.Trim);
      Result.AddPair('xLocExporta', vExporta.xLocExporta.Trim);
      Result.AddPair('xLocDespacho', vExporta.xLocDespacho.Trim);
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonInfNFeNFCeExporta# Erro ao tentar criar JSON do tipo TExporta. ' + E.Message);
      end;
    end;
  end;
end;

function JsonInfNFeNFCeIde(const vIde: TIde; const vModeloDFe: TModeloDFe; const vTimeZone: TTimeZone): TJsonObject;

  function JsonNFref(const vListNFref: TListNFref): TJSONArray;
  var
    jsonObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;

    for I := 0 to High(vListNFref) do
    begin
      if (vListNFref[I].refCTe.Trim <> '') or (vListNFref[I].refNFe.Trim <> '') or (vListNFref[I].refNFeSig.Trim <> '') then
      begin
        jsonObj := TJsonObject.Create;
        if vListNFref[I].refCTe.Trim <> '' then
          jsonObj.AddPair('refCTe', vListNFref[I].refCTe.Trim);
        if vListNFref[I].refNFe.Trim <> '' then
          jsonObj.AddPair('refNFe', vListNFref[I].refNFe.Trim);
        if vListNFref[I].refNFeSig.Trim <> '' then
          jsonObj.AddPair('refNFeSig', vListNFref[I].refNFeSig.Trim);
        Result.AddElement(jsonObj);
      end;
    end;
  end;

begin
  Result := TJsonObject.Create;
  try
    Result.AddPair('cMunFG', TJSONString.Create(IntToStr(vIde.cMunFG)));
    Result.AddPair('cNF', TJSONString.Create(IntToStr(vIde.cNF)));
    Result.AddPair('cUF', TJSONString.Create(IntToStr(vIde.cUF)));
    Result.AddPair('dhEmi', TJSONString.Create(DateTimeWithTimeZoneToStr(vIde.dhEmi, vTimeZone)));
    if (vModeloDFe = dfeNFe) and (vIde.dhSaiEnt <> 0) then
      Result.AddPair('dhSaiEnt', TJSONString.Create(DateTimeWithTimeZoneToStr(vIde.dhSaiEnt, vTimeZone)));
    Result.AddPair('finNFe', TJSONString.Create(FinalidadeToStr(vIde.finNFe)));
    Result.AddPair('idDest', TJSONString.Create(TDestToStr(vIde.idDest)));
    Result.AddPair('indFinal', TJSONString.Create(IndFinalToStr(vIde.indFinal)));
    Result.AddPair('indIntermed', TJSONString.Create(IntermedToStr(vIde.indIntermed)));
    Result.AddPair('indPres', TJSONString.Create(IndPresToStr(vIde.indPres)));
    Result.AddPair('natOp', vIde.natOp.Trim);
    Result.AddPair('nNF', TJSONString.Create(IntToStr(vIde.nNF)));
    Result.AddPair('procEmi', TJSONString.Create(ProcEmiToStr(vIde.procEmi)));
    Result.AddPair('serie', TJSONString.Create(IntToStr(vIde.serie)));
    Result.AddPair('tpAmb', TJSONString.Create(AmbToStr(vIde.tpAmb)));
    Result.AddPair('tpEmis', TJSONString.Create(EmisToStr(vIde.tmEmis)));
    Result.AddPair('tpImp', TJSONString.Create(TImpToStr(vIde.tmImp)));
    Result.AddPair('tpNF', TJSONString.Create(NFToStr(vIde.tpNF)));
    Result.AddPair('verProc', vIde.verProc.Trim);

    if (vIde.dhCont > 0) or (vIde.xJust.Trim <> '') then
    begin
      Result.AddPair('dhCont', TJSONString.Create(DateTimeWithTimeZoneToStr(vIde.dhCont, vTimeZone)));
      Result.AddPair('xJust', vIde.xJust.Trim);
    end;

    if Length(vIde.NFref) > 0 then
      Result.AddPair('NFref', JsonNFref(vIde.NFref));
  except
    on E: Exception do
      raise Exception.Create('#JsonInfNFeNFCeIde# Erro ao tentar criar JSON do tipo TIde. ' + E.Message);
  end;
end;

function JsonInfNFeNFCeInfAdic(const vInfAdic: TInfAdic): TJsonObject;

  function JsonObsCont(const vListObsCont: TListObsCont): TJSONArray;
  var
    jsonObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;
    for I := 0 to High(vListObsCont) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('xCampo', vListObsCont[I].xCampo.Trim);
      jsonObj.AddPair('xTexto', vListObsCont[I].xTexto.Trim);
      Result.AddElement(jsonObj);
    end;
  end;

  function JsonObsFisco(const vListObsFisco: TListObsFisco): TJSONArray;
  var
    jsonObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;
    for I := 0 to High(vListObsFisco) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('xCampo', vListObsFisco[I].xCampo.Trim);
      jsonObj.AddPair('xTexto', vListObsFisco[I].xTexto.Trim);
      Result.AddElement(jsonObj);
    end;
  end;

  function JsonProcRef(const vListProcRef: TListProcRef): TJSONArray;
  var
    jsonObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;
    for I := 0 to High(vListProcRef) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('nProc', vListProcRef[I].nProc.Trim);
      jsonObj.AddPair('indProc', TJSONString.Create(IndProcToStr(vListProcRef[I].indProc)));

      if vListProcRef[I].tpAto <> taNenhum then
        jsonObj.AddPair('tpAto', TJSONString.Create(TAtoToStr(vListProcRef[I].tpAto)));

      Result.AddElement(jsonObj);
    end;
  end;

begin
  Result := nil;
  try
    if (vInfAdic.infAdFisco.Trim <> '') or (vInfAdic.infCpl.Trim <> '') or (Length(vInfAdic.obsCont) > 0) or (Length(vInfAdic.obsFisco) > 0) or
      (Length(vInfAdic.procRef) > 0) then
    begin
      Result := TJsonObject.Create;
      Result.AddPair('infAdFisco', vInfAdic.infAdFisco.Trim);
      Result.AddPair('infCpl', vInfAdic.infCpl.Trim);

      if Length(vInfAdic.obsCont) > 0 then
        Result.AddPair('obsCont', JsonObsCont(vInfAdic.obsCont));

      if Length(vInfAdic.obsFisco) > 0 then
        Result.AddPair('obsFisco', JsonObsFisco(vInfAdic.obsFisco));

      if Length(vInfAdic.procRef) > 0 then
        Result.AddPair('procRef', JsonProcRef(vInfAdic.procRef));
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeInfAdic# Erro ao tentar criar JSON do tipo TInfAdic. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeInfIntermed(const vInfIntermed: TInfIntermed): TJsonObject;
begin
  Result := nil;
  try
    if vInfIntermed.cnpj.Trim + vInfIntermed.idCadIntTran.Trim <> '' then
    begin
      Result := TJsonObject.Create;
      Result.AddPair('CNPJ', vInfIntermed.cnpj.Trim);
      Result.AddPair('idCadIntTran', vInfIntermed.idCadIntTran.Trim);
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeInfIntermed# Erro ao tentar criar JSON do tipo TInfIntermed. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeInfRespTec(const vInfRespTec: TInfRespTec): TJsonObject;
begin
  Result := nil;

  try
    if vInfRespTec.cnpj.Trim <> '' then
    begin
      Result := TJsonObject.Create;
      Result.AddPair('CNPJ', vInfRespTec.cnpj.Trim);
      Result.AddPair('xContato', vInfRespTec.xContato.Trim);
      Result.AddPair('email', vInfRespTec.email.Trim);
      Result.AddPair('fone', vInfRespTec.fone.Trim);

      if (vInfRespTec.idCSRT.Trim <> '') and (vInfRespTec.hashCSRT.Trim <> '') then
      begin
        Result.AddPair('idCSRT', vInfRespTec.idCSRT.Trim);
        Result.AddPair('hashCSRT', vInfRespTec.hashCSRT.Trim);
      end;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeInfRespTec# Erro ao tentar criar JSON do tipo TInfRespTec. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCePag(const vPag: TPag; vFormatSettings: TFormatSettings): TJsonObject;

  function JsonDetPag(const vListDetPag: TListDetPag): TJSONArray;
  var
    jsonObj, jsonCardObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;
    for I := 0 to High(vListDetPag) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('indPag', TJSONString.Create(IndPagToStr(vListDetPag[I].indPag)));
      jsonObj.AddPair('tPag', TJSONString.Create(FormaPagToStr(vListDetPag[I].TPag)));
      jsonObj.AddPair('xPag', vListDetPag[I].xPag.Trim);
      jsonObj.AddPair('vPag', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vListDetPag[I].vPag, vFormatSettings)));
      jsonObj.AddPair('dPag', TJSONString.Create(DateToStr(vListDetPag[I].dPag, vFormatSettings)));

      if (vListDetPag[I].CNPJPag.Trim <> '') or (vListDetPag[I].UFPag.Trim <> '') then
      begin
        jsonObj.AddPair('CNPJPag', vListDetPag[I].CNPJPag.Trim);
        jsonObj.AddPair('UFPag', vListDetPag[I].UFPag.Trim);
      end;

      if vListDetPag[I].card.tpIntegra <> tiNaoInformado then
      begin
        jsonCardObj := TJsonObject.Create;
        jsonCardObj.AddPair('tpIntegra', TJSONString.Create(IntegraToStr(vListDetPag[I].card.tpIntegra)));
        jsonCardObj.AddPair('CNPJ', vListDetPag[I].card.cnpj.Trim);
        jsonCardObj.AddPair('tBand', TJSONString.Create(BandeiraCartaoToStr(vListDetPag[I].card.tBand)));
        jsonCardObj.AddPair('cAut', vListDetPag[I].card.cAut.Trim);
        jsonCardObj.AddPair('CNPJReceb', vListDetPag[I].card.CNPJReceb.Trim);
        jsonCardObj.AddPair('idTermPag', vListDetPag[I].card.idTermPag.Trim);
        jsonObj.AddPair('card', jsonCardObj);
      end;

      Result.AddElement(jsonObj);
    end;
  end;

begin
  try
    Result := TJsonObject.Create;
    Result.AddPair('vTroco', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vPag.vTroco, vFormatSettings)));
    if Length(vPag.detPag) > 0 then
      Result.AddPair('detPag', JsonDetPag(vPag.detPag));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCePag# Erro ao tentar criar JSON do tipo TPag. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeRetirada(const vRetirada: TRetirada): TJsonObject;
begin
  Result := nil;

  if (vRetirada.xLgr.Trim <> '') then
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('CNPJCPF', vRetirada.CNPJCPF.Trim);
      Result.AddPair('xNome', vRetirada.xNome.Trim);
      Result.AddPair('xLgr', vRetirada.xLgr.Trim);
      Result.AddPair('nro', vRetirada.nro.Trim);
      Result.AddPair('xCpl', vRetirada.xCpl.Trim);
      Result.AddPair('xBairro', vRetirada.xBairro.Trim);
      Result.AddPair('cMun', TJSONString.Create(IntToStr(vRetirada.cMun)));
      Result.AddPair('xMun', vRetirada.xMun.Trim);
      Result.AddPair('UF', vRetirada.UF.Trim);
      Result.AddPair('CEP', vRetirada.CEP.Trim);
      Result.AddPair('cPais', TJSONString.Create(IntToStr(vRetirada.cPais)));
      Result.AddPair('xPais', vRetirada.xPais.Trim);
      Result.AddPair('fone', vRetirada.fone.Trim);
      Result.AddPair('email', vRetirada.email.Trim);
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonInfNFeNFCeRetirada# Erro ao tentar criar JSON do tipo TRetirada. ' + E.Message);
      end;
    end;
  end;
end;

function JsonInfNFeNFCeTotal(const vTotal: TTotal; vFormatSettings: TFormatSettings): TJsonObject;
  function JsonICMSTot(vICMSTot: TICMSTot): TJsonObject;
  begin
    Result := TJsonObject.Create;
    try
      Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vBC, vFormatSettings)));
      Result.AddPair('vICMS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vIcms, vFormatSettings)));
      Result.AddPair('vBCST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vBCST, vFormatSettings)));
      Result.AddPair('vST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vST, vFormatSettings)));
      Result.AddPair('vCOFINS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vCOFINS, vFormatSettings)));
      Result.AddPair('vDesc', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vDesc, vFormatSettings)));
      Result.AddPair('vFrete', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vFrete, vFormatSettings)));
      Result.AddPair('vII', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vII, vFormatSettings)));
      Result.AddPair('vIPI', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vIPI, vFormatSettings)));
      Result.AddPair('vIPIDevol', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vIPIDevol, vFormatSettings)));
      Result.AddPair('vNF', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vNF, vFormatSettings)));
      Result.AddPair('vOutro', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vOutro, vFormatSettings)));
      Result.AddPair('vPIS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vPIS, vFormatSettings)));
      Result.AddPair('vProd', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vProd, vFormatSettings)));
      Result.AddPair('vSeg', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vSeg, vFormatSettings)));
      Result.AddPair('vTotTrib', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vTotTrib, vFormatSettings)));

      Result.AddPair('vICMSDeson', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vICMSDeson, vFormatSettings)));
      Result.AddPair('vFCPUFDest', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vFCPUFDest, vFormatSettings)));
      Result.AddPair('vICMSUFDest', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vICMSUFDest, vFormatSettings)));
      Result.AddPair('vICMSUFRemet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vICMSUFRemet, vFormatSettings)));

      Result.AddPair('vFCP', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vFCP, vFormatSettings)));
      Result.AddPair('vFCPST', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vFCPST, vFormatSettings)));
      Result.AddPair('vFCPSTRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vFCPSTRet, vFormatSettings)));
      Result.AddPair('qBCMono', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.qBCMono, vFormatSettings)));
      Result.AddPair('qBCMonoRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.qBCMonoRet, vFormatSettings)));
      Result.AddPair('qBCMonoReten', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.qBCMonoReten, vFormatSettings)));
      Result.AddPair('vICMSMono', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vICMSMono, vFormatSettings)));
      Result.AddPair('vICMSMonoRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vICMSMonoRet, vFormatSettings)));
      Result.AddPair('vICMSMonoReten', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.ICMSTot.vICMSMonoReten, vFormatSettings)));
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonICMSTot# Erro ao tentar criar JSON do tipo TICMSTot. ' + E.Message);
      end;
    end;
  end;

  function JsonISSQNtot(vISSQNtot: TISSQNtot): TJsonObject;
  begin
    Result := nil;
    try
      if (vISSQNtot.vServ > 0) or (vISSQNtot.vBC > 0) or (vISSQNtot.vISS > 0) or (vISSQNtot.vPIS > 0) or (vISSQNtot.vCOFINS > 0) then
      begin
        Result := TJsonObject.Create;

        Result.AddPair('dCompet', TJSONString.Create(DateToStr(vISSQNtot.dCompet, vFormatSettings)));
        Result.AddPair('vBC', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQNtot.vBC, vFormatSettings)));
        Result.AddPair('vCOFINS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQNtot.vCOFINS, vFormatSettings)));
        Result.AddPair('vDeducao', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQNtot.vDeducao, vFormatSettings)));
        Result.AddPair('vDescCond', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQNtot.vDescCond, vFormatSettings)));
        Result.AddPair('vDescIncond', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQNtot.vDescIncond, vFormatSettings)));
        Result.AddPair('vISS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQNtot.vISS, vFormatSettings)));
        Result.AddPair('vISSRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQNtot.vISSRet, vFormatSettings)));
        Result.AddPair('vOutro', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQNtot.vOutro, vFormatSettings)));
        Result.AddPair('vPIS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQNtot.vPIS, vFormatSettings)));
        Result.AddPair('vServ', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vISSQNtot.vServ, vFormatSettings)));
        if vISSQNtot.cRegTrib <> RTISSNenhum then
          Result.AddPair('cRegTrib', TJSONString.Create(RegTribToStr(vISSQNtot.cRegTrib)));
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonISSQNtot# Erro ao tentar criar JSON do tipo TISSQNtot. ' + E.Message);
      end;
    end;
  end;

  function JsonRetTrib(vretTrib: TRetTrib): TJsonObject;
  begin
    Result := nil;
    try
      if (vretTrib.vRetPIS > 0) or (vretTrib.vRetCOFINS > 0) or (vretTrib.vRetCSLL > 0) or (vretTrib.vBCIRRF > 0) or (vretTrib.vIRRF > 0) or (vretTrib.vBCRetPrev > 0) or
        (vretTrib.vRetPrev > 0) then
      begin
        Result := TJsonObject.Create;

        Result.AddPair('vBCIRRF', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.retTrib.vBCIRRF, vFormatSettings)));
        Result.AddPair('vBCRetPrev', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.retTrib.vBCRetPrev, vFormatSettings)));
        Result.AddPair('vIRRF', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.retTrib.vIRRF, vFormatSettings)));
        Result.AddPair('vRetCOFINS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.retTrib.vRetCOFINS, vFormatSettings)));
        Result.AddPair('vRetCSLL', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.retTrib.vRetCSLL, vFormatSettings)));
        Result.AddPair('vRetPIS', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.retTrib.vRetPIS, vFormatSettings)));
        Result.AddPair('vRetPrev', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vTotal.retTrib.vRetPrev, vFormatSettings)));
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create('#JsonRetTrib# Erro ao tentar criar JSON do tipo TRetTrib. ' + E.Message);
      end;
    end;
  end;

begin
  Result := TJsonObject.Create;
  try
    Result.AddPair('ICMSTot', JsonICMSTot(vTotal.ICMSTot));
    Result.AddPair('ISSQNtot', JsonISSQNtot(vTotal.ISSQNtot));
    Result.AddPair('retTrib', JsonRetTrib(vTotal.retTrib));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeTotal# Erro ao tentar criar JSON do tipo TTotal. ' + E.Message);
    end;
  end;
end;

function JsonInfNFeNFCeTransp(const vTransp: TTransp; vFormatSettings: TFormatSettings): TJsonObject;
  function JsonTransporta(const vTransporta: TTransporta): TJsonObject;
  begin
    Result := TJsonObject.Create;
    Result.AddPair('CNPJ', vTransporta.cnpj.Trim);
    Result.AddPair('CPF', vTransporta.CPF.Trim);
    Result.AddPair('xNome', vTransporta.xNome.Trim);
    Result.AddPair('IE', vTransporta.IE.Trim);
    Result.AddPair('xEnder', vTransporta.xEnder.Trim);
    Result.AddPair('xMun', vTransporta.xMun.Trim);
    Result.AddPair('UF', vTransporta.UF.Trim);
  end;

  function JsonRetTransp(const vRetTransp: TRetTransp): TJsonObject;
  begin
    Result := TJsonObject.Create;
    Result.AddPair('vServ', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vRetTransp.vServ, vFormatSettings)));
    Result.AddPair('vBCRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vRetTransp.vBCRet, vFormatSettings)));
    Result.AddPair('pICMSRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vRetTransp.pICMSRet, vFormatSettings)));
    Result.AddPair('vICMSRet', TJSONString.Create(FormatFloat(FORMAT_DEC_02, vRetTransp.vICMSRet, vFormatSettings)));
    Result.AddPair('CFOP', TJSONString.Create(IntToStr(vRetTransp.CFOP)));
    Result.AddPair('cMunFG', TJSONString.Create(IntToStr(vRetTransp.cMunFG)));
  end;

  function JsonVeicTransp(const vVeicTransp: TVeicTransp): TJsonObject;
  begin
    Result := TJsonObject.Create;
    Result.AddPair('placa', vVeicTransp.placa.Trim);
    Result.AddPair('UF', vVeicTransp.UF.Trim);
    Result.AddPair('RNTC', vVeicTransp.RNTC.Trim);
  end;

  function JsonReboque(const vListReboque: TListReboque): TJSONArray;
  var
    jsonObj: TJsonObject;
    I: Integer;
  begin
    Result := TJSONArray.Create;
    for I := 0 to High(vListReboque) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('placa', vListReboque[I].placa.Trim);
      jsonObj.AddPair('UF', vListReboque[I].UF.Trim);
      jsonObj.AddPair('RNTC', vListReboque[I].RNTC.Trim);
      Result.AddElement(jsonObj);
    end;
  end;

  function JsonVol(const vListVol: TListVol): TJSONArray;
  var
    jsonObj, jsonObjLacre: TJsonObject;
    I, J: Integer;
    jsonArrayLacre: TJSONArray;
  begin
    Result := TJSONArray.Create;
    for I := 0 to High(vListVol) do
    begin
      jsonObj := TJsonObject.Create;
      jsonObj.AddPair('qVol', TJSONString.Create(IntToStr(vListVol[I].qVol)));
      jsonObj.AddPair('esp', vListVol[I].esp.Trim);
      jsonObj.AddPair('marca', vListVol[I].marca.Trim);
      jsonObj.AddPair('nVol', vListVol[I].nVol.Trim);
      jsonObj.AddPair('pesoL', TJSONString.Create(FormatFloat(FORMAT_DEC_03, vListVol[I].pesoL, vFormatSettings)));
      jsonObj.AddPair('pesoB', TJSONString.Create(FormatFloat(FORMAT_DEC_03, vListVol[I].pesoB, vFormatSettings)));

      if Length(vListVol[I].lacres) > 0 then
      begin
        jsonArrayLacre := TJSONArray.Create;
        for J := 0 to High(vListVol[I].lacres) do
        begin
          jsonObjLacre := TJsonObject.Create;
          jsonObjLacre.AddPair('nLacre', vListVol[I].lacres[J].Trim);
          jsonArrayLacre.AddElement(jsonObjLacre);
        end;
        jsonObj.AddPair('lacres', jsonArrayLacre);
      end;
      Result.AddElement(jsonObj);
    end;
  end;

begin
  Result := TJsonObject.Create;
  Result.AddPair('modFrete', TJSONString.Create(ModFreteToStr(vTransp.modFrete)));
  Result.AddPair('vagao', vTransp.vagao.Trim);
  Result.AddPair('balsa', vTransp.balsa.Trim);

  try
    if (vTransp.transporta.cnpj.Trim <> '') or (vTransp.transporta.xNome <> '') or (vTransp.transporta.IE <> '') or (vTransp.transporta.xEnder <> '') or
      (vTransp.transporta.xMun <> '') or (vTransp.transporta.UF <> '') then
      Result.AddPair('transporta', JsonTransporta(vTransp.transporta));

    if (vTransp.retTransp.vServ > 0) or (vTransp.retTransp.vBCRet > 0) or (vTransp.retTransp.pICMSRet > 0) or (vTransp.retTransp.vICMSRet > 0) or
      (vTransp.retTransp.CFOP > 0) or (vTransp.retTransp.cMunFG > 0) then
      Result.AddPair('retTransp', JsonRetTransp(vTransp.retTransp));

    if (vTransp.veicTransp.placa.Trim <> '') or (vTransp.veicTransp.UF.Trim <> '') or (vTransp.veicTransp.RNTC.Trim <> '') then
      Result.AddPair('veicTransp', JsonVeicTransp(vTransp.veicTransp));

    if Length(vTransp.reboque) > 0 then
      Result.AddPair('reboque', JsonReboque(vTransp.reboque));

    if Length(vTransp.vol) > 0 then
      Result.AddPair('vol', JsonVol(vTransp.vol));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonInfNFeNFCeTransp# Erro ao tentar criar JSON do tipo TTransp. ' + E.Message);
    end;
  end;
end;

function JsonCancelNFeNFCe(const vListEventCancel: TListEventCancel; const vAsync: Boolean; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TJsonObject; overload;
var
  jsonEventsObj: TJsonObject;
  jsonEventsArray: TJSONArray;
  I: Integer;
begin
  Result := TJsonObject.Create;
  jsonEventsArray := TJSONArray.Create;
  try
    for I := 0 to High(vListEventCancel) do
    begin
      jsonEventsObj := TJsonObject.Create;
      jsonEventsObj.AddPair('cUF', TJSONString.Create(IntToStr(vListEventCancel[I].cUF)));
      if vListEventCancel[I].chDfe.Trim <> '' then
        jsonEventsObj.AddPair('chDfe', vListEventCancel[I].chDfe);
      if vListEventCancel[I].idDfe.Trim <> '' then
        jsonEventsObj.AddPair('idDfe', vListEventCancel[I].idDfe);
      if vListEventCancel[I].idExternal.Trim <> '' then
        jsonEventsObj.AddPair('idExternal', vListEventCancel[I].idExternal);
      jsonEventsObj.AddPair('dhEvento', TJSONString.Create(DateTimeWithTimeZoneToStr(vListEventCancel[I].dhEvento, vTimeZone)));
      jsonEventsObj.AddPair('nProt', vListEventCancel[I].nProt);
      jsonEventsObj.AddPair('xJust', vListEventCancel[I].xJust);
      jsonEventsArray.AddElement(jsonEventsObj);
    end;
    Result.AddPair('events', jsonEventsArray);
    Result.AddPair('tpAmb', TJSONString.Create(AmbToStr(vTpAmb)));
    Result.AddPair('async', TJSONBool.Create(vAsync));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonCancelNFeNFCe# Erro ao tentar criar JSON do tipo TListEventCancel. ' + E.Message);
    end;
  end;
end;

function JsonCancelNFeNFCe(const vEventCancel: TEventCancel; const vAsync: Boolean; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TJsonObject; overload;
var
  jsonEventsObj: TJsonObject;
  jsonEventsArray: TJSONArray;
begin
  Result := TJsonObject.Create;
  jsonEventsArray := TJSONArray.Create;
  try
    jsonEventsObj := TJsonObject.Create;
    jsonEventsObj.AddPair('cUF', TJSONString.Create(IntToStr(vEventCancel.cUF)));
    if vEventCancel.chDfe.Trim <> '' then
      jsonEventsObj.AddPair('chDfe', vEventCancel.chDfe);
    if vEventCancel.idDfe.Trim <> '' then
      jsonEventsObj.AddPair('idDfe', vEventCancel.idDfe);
    if vEventCancel.idExternal.Trim <> '' then
      jsonEventsObj.AddPair('idExternal', vEventCancel.idExternal);
    jsonEventsObj.AddPair('dhEvento', TJSONString.Create(DateTimeWithTimeZoneToStr(vEventCancel.dhEvento, vTimeZone)));
    jsonEventsObj.AddPair('nProt', vEventCancel.nProt);
    jsonEventsObj.AddPair('xJust', vEventCancel.xJust);
    jsonEventsArray.AddElement(jsonEventsObj);
    Result.AddPair('events', jsonEventsArray);
    Result.AddPair('tpAmb', TJSONString.Create(AmbToStr(vTpAmb)));
    Result.AddPair('async', TJSONBool.Create(vAsync));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonCancelNFeNFCe# Erro ao tentar criar JSON do tipo TEventCancel. ' + E.Message);
    end;
  end;
end;

function JsonDisenableNFeNFCe(const vListEventDisenable: TListEventDisenable; const vAsync: Boolean; const vTpAmb: TAmb): TJsonObject; overload;
var
  jsonEventsObj: TJsonObject;
  jsonEventsArray: TJSONArray;
  I: Integer;
begin
  Result := TJsonObject.Create;
  jsonEventsArray := TJSONArray.Create;
  try
    for I := 0 to High(vListEventDisenable) do
    begin
      jsonEventsObj := TJsonObject.Create;
      jsonEventsObj.AddPair('xJust', vListEventDisenable[I].xJust);
      jsonEventsObj.AddPair('ano', TJSONString.Create(IntToStr(vListEventDisenable[I].ano)));
      jsonEventsObj.AddPair('serie', TJSONString.Create(IntToStr(vListEventDisenable[I].serie)));
      jsonEventsObj.AddPair('nNFIni', TJSONString.Create(IntToStr(vListEventDisenable[I].nNFIni)));
      jsonEventsObj.AddPair('nNFFin', TJSONString.Create(IntToStr(vListEventDisenable[I].nNFFin)));
      jsonEventsArray.AddElement(jsonEventsObj);
    end;
    Result.AddPair('events', jsonEventsArray);
    Result.AddPair('tpAmb', TJSONString.Create(AmbToStr(vTpAmb)));
    Result.AddPair('async', TJSONBool.Create(vAsync));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonDisenableNFeNFCe# Erro ao tentar criar JSON do tipo TListEventDisenable. ' + E.Message);
    end;
  end;
end;

function JsonDisenableNFeNFCe(const vEventDisenable: TEventDisenable; const vAsync: Boolean; const vTpAmb: TAmb): TJsonObject; overload;
var
  jsonEventsObj: TJsonObject;
  jsonEventsArray: TJSONArray;
begin
  Result := TJsonObject.Create;
  jsonEventsArray := TJSONArray.Create;
  try
    jsonEventsObj := TJsonObject.Create;
    jsonEventsObj.AddPair('xJust', vEventDisenable.xJust);
    jsonEventsObj.AddPair('ano', TJSONString.Create(IntToStr(vEventDisenable.ano)));
    jsonEventsObj.AddPair('serie', TJSONString.Create(IntToStr(vEventDisenable.serie)));
    jsonEventsObj.AddPair('nNFIni', TJSONString.Create(IntToStr(vEventDisenable.nNFIni)));
    jsonEventsObj.AddPair('nNFFin', TJSONString.Create(IntToStr(vEventDisenable.nNFFin)));
    jsonEventsArray.AddElement(jsonEventsObj);
    Result.AddPair('events', jsonEventsArray);
    Result.AddPair('tpAmb', TJSONString.Create(AmbToStr(vTpAmb)));
    Result.AddPair('async', TJSONBool.Create(vAsync));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonDisenableNFeNFCe# Erro ao tentar criar JSON do tipo TEventDisenable. ' + E.Message);
    end;
  end;
end;

function JsonCorrectionNFe(const vListEventCorrection: TListEventCorrection; const vAsync: Boolean; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TJsonObject; overload;
var
  jsonEventsObj: TJsonObject;
  jsonEventsArray: TJSONArray;
  I: Integer;
begin
  Result := TJsonObject.Create;
  jsonEventsArray := TJSONArray.Create;
  try
    for I := 0 to High(vListEventCorrection) do
    begin
      jsonEventsObj := TJsonObject.Create;
      jsonEventsObj.AddPair('cUF', TJSONString.Create(IntToStr(vListEventCorrection[I].cUF)));
      jsonEventsObj.AddPair('nSeqEvento', TJSONString.Create(IntToStr(vListEventCorrection[I].nSeqEvento)));
      if vListEventCorrection[I].chDfe.Trim <> '' then
        jsonEventsObj.AddPair('chDfe', vListEventCorrection[I].chDfe);
      if vListEventCorrection[I].idDfe.Trim <> '' then
        jsonEventsObj.AddPair('idDfe', vListEventCorrection[I].idDfe);
      if vListEventCorrection[I].idExternal.Trim <> '' then
        jsonEventsObj.AddPair('idExternal', vListEventCorrection[I].idExternal);
      jsonEventsObj.AddPair('dhEvento', TJSONString.Create(DateTimeWithTimeZoneToStr(vListEventCorrection[I].dhEvento, vTimeZone)));
      jsonEventsObj.AddPair('xCorrecao', vListEventCorrection[I].xCorrecao);
      jsonEventsArray.AddElement(jsonEventsObj);
    end;
    Result.AddPair('events', jsonEventsArray);
    Result.AddPair('tpAmb', TJSONString.Create(AmbToStr(vTpAmb)));
    Result.AddPair('async', TJSONBool.Create(vAsync));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonCorrectionNFe# Erro ao tentar criar JSON do tipo TListEventCorrection. ' + E.Message);
    end;
  end;
end;

function JsonCorrectionNFe(const vEventCorrection: TEventCorrection; const vAsync: Boolean; const vTpAmb: TAmb; const vTimeZone: TTimeZone): TJsonObject; overload;
var
  jsonEventsObj: TJsonObject;
  jsonEventsArray: TJSONArray;
begin
  Result := TJsonObject.Create;
  jsonEventsArray := TJSONArray.Create;
  try
    jsonEventsObj := TJsonObject.Create;
    jsonEventsObj.AddPair('cUF', TJSONString.Create(IntToStr(vEventCorrection.cUF)));
    jsonEventsObj.AddPair('nSeqEvento', TJSONString.Create(IntToStr(vEventCorrection.nSeqEvento)));
    if vEventCorrection.chDfe.Trim <> '' then
      jsonEventsObj.AddPair('chDfe', vEventCorrection.chDfe);
    if vEventCorrection.idDfe.Trim <> '' then
      jsonEventsObj.AddPair('idDfe', vEventCorrection.idDfe);
    if vEventCorrection.idExternal.Trim <> '' then
      jsonEventsObj.AddPair('idExternal', vEventCorrection.idExternal);
    jsonEventsObj.AddPair('dhEvento', TJSONString.Create(DateTimeWithTimeZoneToStr(vEventCorrection.dhEvento, vTimeZone)));
    jsonEventsObj.AddPair('xCorrecao', vEventCorrection.xCorrecao);
    jsonEventsArray.AddElement(jsonEventsObj);
    Result.AddPair('events', jsonEventsArray);
    Result.AddPair('tpAmb', TJSONString.Create(AmbToStr(vTpAmb)));
    Result.AddPair('async', TJSONBool.Create(vAsync));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonCorrectionNFe# Erro ao tentar criar JSON do tipo TEventCorrection. ' + E.Message);
    end;
  end;
end;

function JsonPagination(const vPageSize, vPage: Integer): TJsonObject;
begin
  Result := TJsonObject.Create;
  try
    Result.AddPair('pageSize', TJSONNumber.Create(IntToStr(vPageSize)));
    Result.AddPair('page', TJSONNumber.Create(IntToStr(vPage)));
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonPagination# Erro ao tentar criar JSON do tipo Paginação. ' + E.Message);
    end;
  end;
end;

function JsonXML(const vXML: String): TJsonObject;
begin
  Result := TJsonObject.Create;
  try
    Result.AddPair('xml', vXML);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('#JsonXML# Erro ao tentar criar JSON do tipo XML. ' + E.Message);
    end;
  end;
end;

function JsonStrToInt(vObj: TJsonObject; vCampo: String): Integer;
var
  valor: String;
begin
  vObj.TryGetValue<String>(vCampo, valor);
  Result := StrToIntDef(valor, 0);
end;

function JsonStrToFloat(vObj: TJsonObject; vCampo: String): Double;
var
  valor: String;
begin
  vObj.TryGetValue<String>(vCampo, valor);
  Result := StrToFloatDef(valor, 0);
end;

function JsonStrToDateTime(vObj: TJsonObject; vCampo: String): TDateTime;
var
  valor: String;
begin
  vObj.TryGetValue<String>(vCampo, valor);
  TryISO8601ToDate(valor, Result, False);
end;

end.

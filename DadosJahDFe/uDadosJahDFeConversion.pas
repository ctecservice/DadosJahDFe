unit uDadosJahDFeConversion;

interface

uses
  System.Classes, System.SysUtils, StrUtils, DateUtils, System.Generics.Collections, uDadosJahDFeTypes, System.NetEncoding;

// Tipos
function RouteToStr(const t: TRoute; const v: TVersionAPI): string;
function SaveXMLPDFFileToStr(const s: TSaveXMLPDFFile): String;
function VersaoQrCodeNFCeToStr(const v: TVersaoQrCodeNFCe): string;
function StrToVersaoQrCodeNFCe(const v: string): TVersaoQrCodeNFCe;
function CRTToStr(const c: TCRT): string;
function StrToCRT(const c: string): TCRT;
function AmbToStr(const t: TAmb): string;
function AmbToDescStr(const t: TAmb): string;
function StrToAmb(const t: string): TAmb;
function TypeUserToStr(const t: TTypeUser): string;
function NotificationToStr(const t: TTNotification): string;
function StrToNotification(const t: string): TTNotification;
function VersaoNFToStr(const t: TVersaoNF): string;
function SimNaoToStr(const t: TSimNao): string;
function SimNaoNenhumToStr(const t: TSimNaoNenhum): string;
function NFToStr(const t: TNF): string;
function IndFinalToStr(const t: TIndFinal): string;
function IndIEDestToStr(const t: TIndIEDest): string;
function ProcEmiToStr(const t: TProcEmi): string;
function IndPresToStr(const t: TIndPres): string;
function TDestToStr(const t: TTDest): string;
function FinalidadeToStr(const t: TFinalidade): string;
function IntermedToStr(const t: TIntermed): string;
function ModFreteToStr(const t: TModFrete): string;
function IndPagToStr(const t: TIndPag): string;
function IntegraToStr(const t: TTIntegra): string;
function TImpToStr(const t: TTImp): string;
function EmisToStr(const t: TTEmis): string;
function ViaTranspToStr(const t: TViaTransp): string;
function IntermediarioToStr(const t: TIntermediario): string;
function TOpToStr(const t: TTOp): string;
function CondVeicToStr(const t: TCondVeic): string;
function TArmaToStr(const t: TTArma): string;
function IndImportToStr(const t: TIndImport): string;
function MotRedAdRemToStr(const t: TMotRedAdRem): string;
function MotDesICMSToStr(const t: TMotDesICMS): string;
function StrToMotDesICMS(const t: string): TMotDesICMS;
function ModBCToStr(const t: TModBC): string;
function StrToModBC(const t: string): TModBC;
function ModBCSTToStr(const t: TModBCST): string;
function StrToModBCST(const t: string): TModBCST;
function FormaPagToStr(const t: TFormaPag): string;
function BandeiraCartaoToStr(const t: TBandeiraCartao): string;
function RegTribToStr(const t: TRegTrib): string;
function IndProcToStr(const t: TIndProc): string;
function IndEscalaToStr(const t: TIndEscala): string;
function IndTotalToStr(const t: TIndTotal): string;
function TAtoToStr(const t: TTAto): string;
function TGuiaToStr(const t: TTGuia): string;
function CSTIcmsToStr(const t: TCSTIcms): string;
function CSTIPIToStr(const t: TCSTIPI): string;
function StrToCSTIPI(const t: string): TCSTIPI;
function CSTPISToStr(const t: TCSTPIS): string;
function StrToCSTPIS(const t: string): TCSTPIS;
function CSTCOFINSToStr(const t: TCSTCOFINS): string;
function StrToCSTCOFINS(const t: string): TCSTCOFINS;
function IndISSToStr(const t: TIndISS): string;
function IndSomaCOFINSSTToStr(const t: TIndSomaCOFINSST): string;
function IndSomaPISSTToStr(const t: TIndSomaPISST): string;
function ModeloDFeToStr(const t: TModeloDFe): string;
function ModeloDFeToInt(const t: TModeloDFe): Integer;
function StrToSituationDFeAPI(const s: string): TSituationDFeAPI;
function SituationDFeAPIToStr(const s: TSituationDFeAPI): String;
function StrToSituationAPI(const s: string): TSituationAPI;
function SituationAPIToStr(const s: TSituationAPI): String;
function TipoImpressaoNFeToStr(const t: TTipoImpressaoNFe): string;
function TipoImpressaoNFCeToStr(const t: TTipoImpressaoNFCe): string;
function TimeZoneToStr(const f: TTimeZone): string;
function StrToTimeZone(const f: string): TTimeZone;
function OrigemMercadoriaToStr(const o: TOrigemMercadoria): string;
function UFToCodigo(const uf: String): Integer;

// Outros
function ArrayListToStr(const list: TArray<String>): string;
function FileToBase64(const FileName: string): String;
function Base64ToFile(const Base64Str, FileName: string): Boolean;
function StrToDateTimeDJ(const d: String): TDateTime;
function DateWithTimeZoneToStr(const d: TDate; const f: TTimeZone): String;
function DateTimeWithTimeZoneToStr(const d: TDateTime; const f: TTimeZone): String;
function TypeToStr(const aType: variant; const aArrayString: array of string; const aArrayType: array of variant): String;
function StrToType(const aValue: string; const aArrayString: array of string; const aArrayType: array of variant; aDefaultValue: variant): variant;

implementation

function TypeToStr(const aType: variant; const aArrayString: array of string; const aArrayType: array of variant): String;
var
  I: Integer;
begin
  Result := '';
  for I := Low(aArrayType) to High(aArrayType) do
    if aType = aArrayType[I] then
      Exit(aArrayString[I]);
end;

function StrToType(const aValue: string; const aArrayString: array of string; const aArrayType: array of variant; aDefaultValue: variant): variant;
var
  I: Integer;
begin
  Result := aDefaultValue;
  for I := Low(aArrayString) to High(aArrayString) do
    if AnsiSameText(aValue, aArrayString[I]) then
      Exit(aArrayType[I]);
end;

function RouteToStr(const t: TRoute; const v: TVersionAPI): string;
begin
  Result := TypeToStr(v, ['/v1'], [v1]) +
    TypeToStr(t,
    ['/auth/user/login', '/auth/system/login', '/auth/user/reset', '/auth/system/reset', '/auth/user/logout', '/auth/user/logout', '/auth/user/forget', '/auth/system/forget',
    '/system', '/system/resp-tec-csrt', '/user', '/user/list', '/user/restore', '/user/notification', '/certificate', '/emit', '/autxml',
    '/nfe', '/nfe/cancel', '/nfe/disenable', '/nfe/correction', '/nfe/cancel/print', '/nfe/disenable/print', '/nfe/correction/print', '/nfe/xml', '/nfe/danfe', '/nfe/service-status',
    '/nfe/sefaz', '/nfce', '/nfce/cancel', '/nfce/disenable', '/nfce/cancel/print', '/nfce/disenable/print', '/nfce/xml', '/nfce/danfe', '/nfce/service-status', '/nfce/sefaz'],
    [rtAuthUserLogin, rtAuthSystemLogin, rtAuthUserReset, rtAuthSystemReset, rtAuthUserLogout, rtAuthSystemLogout, rtAuthUserForget, rtAuthSystemForget,
    rtSystem, rtSystemRespTecCSRT, rtUser, rtUserList, rtUserRestore, rtUserNotification, rtCertificate, rtEmitente, rtAutXML,
    rtNFe, rtNFeCancel, rtNFeDisenable, rtNFeCorrection, rtNFeCancelPrint, rtNFeDisenablePrint, rtNFeCorrectionPrint, rtNFeXML, rtNFeDANFe, rtNFeServiceStatus,
    rtNFeSefaz, rtNFCe, rtNFCeCancel, rtNFCeDisenable, rtNFCeCancelPrint, rtNFCeDisenablePrint, rtNFCeXML, rtNFCeDANFCe, rtNFCeServiceStatus, rtNFCeSefaz]);
end;

function SaveXMLPDFFileToStr(const s: TSaveXMLPDFFile): String;
begin
  Result := TypeToStr(s,
    ['NFe', 'NFeCorrection', 'NFeDisenable', 'NFeCancel', 'NFCe', 'NFCeDisenable', 'NFCeCancel'],
    [tsxfNFe, tsxfNFeCorrection, tsxfNFeDisenable, tsxfNFeCancel, tsxfNFCe, tsxfNFCeDisenable, tsxfNFCeCancel]);
end;

function VersaoQrCodeNFCeToStr(const v: TVersaoQrCodeNFCe): string;
begin
  Result := TypeToStr(v,
    ['0', '1', '2', '3'],
    [vqc0, vqc1, vqc2, vqc3]);
end;

function StrToVersaoQrCodeNFCe(const v: string): TVersaoQrCodeNFCe;
begin
  Result := StrToType(v,
    ['0', '1', '2', '3'],
    [vqc0, vqc1, vqc2, vqc3], vqc0);
end;

function TimeZoneToStr(const f: TTimeZone): string;
begin
  Result := TypeToStr(f,
    ['-12:00', '-11:00', '-10:00', '-09:30', '-09:00', '-08:00', '-07:00', '-06:00', '-05:00', '-04:00', '-03:30', '-03:00',
    '-02:00', '-01:00', '+00:00', '+01:00', '+02:00', '+03:00', '+04:00', '+04:30', '+05:00', '+05:30', '+05:45', '+06:00', '+06:30', '+07:00', '+08:00', '+08:45', '+09:00',
    '+09:30', '+10:00', '+10:30', '+11:00', '+12:00', '+12:45', '+13:00', '+14:00'],
    [tzLess1200, tzLess1100, tzLess1000, tzLess0930, tzLess0900, tzLess0800, tzLess0700, tzLess0600, tzLess0500, tzLess0400, tzLess0330, tzLess0300,
    tzLess0200, tzLess0100, tz0000, tzMore0100, tzMore0200, tzMore0300, tzMore0400, tzMore0430, tzMore0500, tzMore0530, tzMore0545, tzMore0600, tzMore0630,
    tzMore0700, tzMore0800, tzMore0845, tzMore0900, tzMore0930, tzMore1000, tzMore1030, tzMore1100, tzMore1200, tzMore1245, tzMore1300, tzMore1400]);
end;

function StrToTimeZone(const f: string): TTimeZone;
begin
  Result := StrToType(f,
    ['-12:00', '-11:00', '-10:00', '-09:30', '-09:00', '-08:00', '-07:00', '-06:00', '-05:00', '-04:00', '-03:30', '-03:00',
    '-02:00', '-01:00', '+00:00', '+01:00', '+02:00', '+03:00', '+04:00', '+04:30', '+05:00', '+05:30', '+05:45', '+06:00', '+06:30', '+07:00', '+08:00', '+08:45', '+09:00',
    '+09:30', '+10:00', '+10:30', '+11:00', '+12:00', '+12:45', '+13:00', '+14:00'],
    [tzLess1200, tzLess1100, tzLess1000, tzLess0930, tzLess0900, tzLess0800, tzLess0700, tzLess0600, tzLess0500, tzLess0400, tzLess0330, tzLess0300,
    tzLess0200, tzLess0100, tz0000, tzMore0100, tzMore0200, tzMore0300, tzMore0400, tzMore0430, tzMore0500, tzMore0530, tzMore0545, tzMore0600, tzMore0630,
    tzMore0700, tzMore0800, tzMore0845, tzMore0900, tzMore0930, tzMore1000, tzMore1030, tzMore1100, tzMore1200, tzMore1245, tzMore1300, tzMore1400], tzLess0300);
end;

function CRTToStr(const c: TCRT): string;
begin
  Result := TypeToStr(c,
    ['1', '2', '3', '4'],
    [crtSimplesNacional, crtSimplesExcessoReceita, crtRegimeNormal, crtMEI]);
end;

function StrToCRT(const c: string): TCRT;
begin
  Result := StrToType(c,
    ['1', '2', '3', '4'],
    [crtSimplesNacional, crtSimplesExcessoReceita, crtRegimeNormal, crtMEI], crtRegimeNormal);
end;

function ArrayListToStr(const list: TArray<String>): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to High(list) do
    Result := Result + IfThen(Result.Trim = '', '', '; ') + list[I];
end;

function FileToBase64(const FileName: string): String;
var
  FileStream: TFileStream;
  Base64Stream: TStringStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    try
      Base64Stream := TStringStream.Create('');
      try
        TNetEncoding.Base64.Encode(FileStream, Base64Stream);
        Result := Base64Stream.DataString;
      finally
        Base64Stream.Free;
      end;
    except
      on e: Exception do
        raise Exception.Create('FileName: "' + FileName + '". Exception: ' + e.Message);
    end;
  finally
    FileStream.Free;
  end;
end;

function Base64ToFile(const Base64Str, FileName: string): Boolean;
var
  MemoryStream: TMemoryStream;
  Base64Data: string;
  Base64Decoder: TBase64Encoding;
  Bytes: TBytes;
begin
  MemoryStream := TMemoryStream.Create;
  Base64Decoder := TBase64Encoding.Create;
  try
    try
      if Pos('data:', Base64Str) > 0 then
        Base64Data := Copy(Base64Str, Pos(',', Base64Str) + 1, Length(Base64Str))
      else
        Base64Data := Base64Str;
      Bytes := Base64Decoder.DecodeStringToBytes(Base64Data);
      MemoryStream.WriteBuffer(Bytes[0], Length(Bytes));

      MemoryStream.SaveToFile(FileName);
      Result := True;
    except
      on e: Exception do
        raise Exception.Create('FileName: "' + FileName + '". Exception: ' + e.Message);
    end;
  finally
    MemoryStream.Free;
    Base64Decoder.Free;
  end;
end;

function AmbToStr(const t: TAmb): string;
begin
  Result := TypeToStr(t,
    ['1', '2'],
    [taProducao, taHomologacao]);
end;

function AmbToDescStr(const t: TAmb): string;
begin
  Result := TypeToStr(t,
    ['PRODUÇÃO', 'HOMOLOGAÇÃO'],
    [taProducao, taHomologacao]);
end;

function StrToAmb(const t: string): TAmb;
begin
  Result := StrToType(t,
    ['1', '2'],
    [taProducao, taHomologacao], taProducao);
end;

function StrToDateTimeDJ(const d: String): TDateTime;
begin
  TryISO8601ToDate(d, Result, False);
end;

function DateWithTimeZoneToStr(const d: TDate; const f: TTimeZone): String;
begin
  Result := FormatDateTime('yyyy-MM-dd"T"', d) + '00:00:00' + TimeZoneToStr(f);
end;

function DateTimeWithTimeZoneToStr(const d: TDateTime; const f: TTimeZone): String;
begin
  Result := FormatDateTime('yyyy-MM-dd"T"hh:mm:ss', d) + TimeZoneToStr(f);
end;

function TypeUserToStr(const t: TTypeUser): string;
begin
  Result := TypeToStr(t,
    ['user', 'system'],
    [tuUser, tuSystem]);
end;

function NotificationToStr(const t: TTNotification): string;
begin
  Result := TypeToStr(t,
    ['all', 'status-servico', 'nfe'],
    [ttnAll, ttnStatusServico, ttnNFe]);
end;

function StrToNotification(const t: string): TTNotification;
begin
  Result := StrToType(t,
    ['all', 'status-servico', 'nfe'],
    [ttnAll, ttnStatusServico, ttnNFe], ttnAll);
end;

function VersaoNFToStr(const t: TVersaoNF): string;
begin
  Result := TypeToStr(t,
    ['4.00'],
    [v4]);
end;

function SimNaoToStr(const t: TSimNao): string;
begin
  Result := TypeToStr(t,
    ['1', '2'],
    [snnSim, snnNao]);
end;

function SimNaoNenhumToStr(const t: TSimNaoNenhum): string;
begin
  Result := TypeToStr(t,
    ['', '1', '0'],
    [snnNenhum, snnSim, snnNao]);
end;

function NFToStr(const t: TNF): string;
begin
  Result := TypeToStr(t,
    ['0', '1'],
    [tnfEntrada, tnfSaida]);
end;

function IndFinalToStr(const t: TIndFinal): string;
begin
  Result := TypeToStr(t,
    ['0', '1'],
    [tifNao, tifConsumidorFinal]);
end;

function IndIEDestToStr(const t: TIndIEDest): string;
begin
  Result := TypeToStr(t,
    ['1', '2', '9'],
    [tiedContribuinte, tiedIsento, tiedNaoContribuinte]);
end;

function ProcEmiToStr(const t: TProcEmi): string;
begin
  Result := TypeToStr(t,
    ['0', '1', '2', '3'],
    [tpeAplicativoContribuinte, tpeAvulsaFisco, tpeAvulsaContribuinte, tpeContribuinteAplicativoFisco]);
end;

function IndPresToStr(const t: TIndPres): string;
begin
  Result := TypeToStr(t,
    ['0', '1', '2', '3', '4', '5', '9'],
    [tipNao, tipPresencial, tipInternet, tipTeleatendimento, tipEntregaDomicilio, tipPresencialForaEstabelecimento, tipOutros]);
end;

function TDestToStr(const t: TTDest): string;
begin
  Result := TypeToStr(t,
    ['1', '2', '3'],
    [tdInterna, tdInterestadual, tdExterior]);
end;

function FinalidadeToStr(const t: TFinalidade): string;
begin
  Result := TypeToStr(t,
    ['1', '2', '3', '4'],
    [tfNormal, tfComplementar, tfAjuste, tfDevolucao]);
end;

function IntermedToStr(const t: TIntermed): string;
begin
  Result := TypeToStr(t,
    ['', '0', '1'],
    [tiSemOperacao, tiOperacaoSemIntermediador, tiOperacaoComIntermediador]);
end;

function ModFreteToStr(const t: TModFrete): string;
begin
  Result := TypeToStr(t,
    ['0', '1', '2', '3', '4', '9'],
    [tmfContaEmitente, tmfContaDestinatario, tmfContaTerceiros, tmfProprioRemetente, tmfProprioDestinatario, tmfSemFrete]);
end;

function IndPagToStr(const t: TIndPag): string;
begin
  Result := TypeToStr(t,
    ['0', '1', '2', ''],
    [tipVista, tipPrazo, tipOutras, tipNenhum]);
end;

function IntegraToStr(const t: TTIntegra): string;
begin
  Result := TypeToStr(t,
    ['', '1', '2'],
    [tiNaoInformado, tiPagIntegrado, tiPagNaoIntegrado]);
end;

function TImpToStr(const t: TTImp): string;
begin
  Result := TypeToStr(t,
    ['0', '1', '2', '3', '4', '5'],
    [tiSemGeracao, tiRetrato, tiPaisagem, tiSimplificado, tiNFCe, tiMsgEletronica]);
end;

function EmisToStr(const t: TTEmis): string;
begin
  Result := TypeToStr(t,
    ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
    [teNormal, teContingencia, teSCAN, teDPEC, teFSDA, teSVCAN, teSVCRS, teSVCSP, teOffLine]);
end;

function ViaTranspToStr(const t: TViaTransp): string;
begin
  Result := TypeToStr(t,
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', ''],
    [tvMaritima, tvFluvial, tvLacustre, tvAerea, tvPostal, tvFerroviaria, tvRodoviaria, tvConduto, tvMeiosProprios,
    tvEntradaSaidaFicta, tvCourier, tvEmMaos, tvPorReboque, tvNaoInformado]);
end;

function IntermediarioToStr(const t: TIntermediario): string;
begin
  Result := TypeToStr(t,
    ['1', '2', '3', ''],
    [tiContaPropria, tiContaOrdem, tiEncomenda, timNaoInformado]);
end;

function TOpToStr(const t: TTOp): string;
begin
  Result := TypeToStr(t,
    ['1', '2', '3', '0'],
    [toVendaConcessionaria, toFaturamentoDireto, toVendaDireta, toOutros]);
end;

function CondVeicToStr(const t: TCondVeic): string;
begin
  Result := TypeToStr(t,
    ['1', '2', '3'],
    [cvAcabado, cvInacabado, cvSemiAcabado]);
end;

function TArmaToStr(const t: TTArma): string;
begin
  Result := TypeToStr(t,
    ['0', '1'],
    [taUsoPermitido, taUsoRestrito]);
end;

function IndImportToStr(const t: TIndImport): string;
begin
  Result := TypeToStr(t,
    ['0', '1'],
    [iiNacional, iiImportado]);
end;

function MotRedAdRemToStr(const t: TMotRedAdRem): string;
begin
  Result := TypeToStr(t,
    ['1', '9'],
    [motTranspColetivo, motOutros]);
end;

function MotDesICMSToStr(const t: TMotDesICMS): string;
begin
  Result := TypeToStr(t,
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '16', '90', ''],
    [mdiTaxi, mdiDeficienteFisico, mdiProdutorAgropecuario, mdiFrotistaLocadora, mdiDiplomaticoConsular,
    mdiAmazoniaLivreComercio, mdiSuframa, mdiVendaOrgaosPublicos, mdiOutros, mdiDeficienteCondutor,
    mdiDeficienteNaoCondutor, mdiOrgaoFomento, mdiOlimpiadaRio2016, mdiSolicitadoFisco, TMotDesICMS(-1)]);
end;

function StrToMotDesICMS(const t: string): TMotDesICMS;
begin
  Result := StrToType(t,
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '16', '90', '', '0'],
    [mdiTaxi, mdiDeficienteFisico, mdiProdutorAgropecuario, mdiFrotistaLocadora, mdiDiplomaticoConsular,
    mdiAmazoniaLivreComercio, mdiSuframa, mdiVendaOrgaosPublicos, mdiOutros, mdiDeficienteCondutor,
    mdiDeficienteNaoCondutor, mdiOrgaoFomento, mdiOlimpiadaRio2016, mdiSolicitadoFisco, TMotDesICMS(-1), TMotDesICMS(-1)], TMotDesICMS(-1));
end;

function ModBCToStr(const t: TModBC): string;
begin
  Result := TypeToStr(t,
    ['0', '1', '2', '3', ''],
    [dbiMargemValorAgregado, dbiPauta, dbiPrecoTabelado, dbiValorOperacao, dbiNenhum]);
end;

function StrToModBC(const t: string): TModBC;
begin
  Result := StrToType(t,
    ['0', '1', '2', '3', ''],
    [dbiMargemValorAgregado, dbiPauta, dbiPrecoTabelado, dbiValorOperacao, dbiNenhum], dbiNenhum);
end;

function ModBCSTToStr(const t: TModBCST): string;
begin
  Result := TypeToStr(t,
    ['0', '1', '2', '3', '4', '5', '6', ''],
    [dbisPrecoTabelado, dbisListaNegativa, dbisListaPositiva, dbisListaNeutra, dbisMargemValorAgregado, dbisPauta, dbisValordaOperacao, TModBCST(-1)]);
end;

function StrToModBCST(const t: string): TModBCST;
begin
  Result := StrToType(t,
    ['0', '1', '2', '3', '4', '5', '6', ''],
    [dbisPrecoTabelado, dbisListaNegativa, dbisListaPositiva, dbisListaNeutra, dbisMargemValorAgregado, dbisPauta, dbisValordaOperacao, TModBCST(-1)], TModBCST(-1));
end;

function FormaPagToStr(const t: TFormaPag): string;
begin
  Result := TypeToStr(t,
    ['01', '02', '03', '04', '05', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '90', '98', '99', '20', '21', '22'],
    [fpDinheiro, fpCheque, fpCartaoCredito, fpCartaoDebito, fpCreditoLoja, fpValeAlimentacao, fpValeRefeicao, fpValePresente, fpValeCombustivel, fpDuplicataMercantil,
    fpBoletoBancario, fpDepositoBancario, fpPagamentoInstantaneo, fpTransfBancario, fpProgramaFidelidade, fpSemPagamento, fpRegimeEspecial, fpOutro,
    fpPagamentoInstantaneoEstatico, fpCreditoEmLojaPorDevolucao, fpFalhaHardware]);
end;

function BandeiraCartaoToStr(const t: TBandeiraCartao): string;
begin
  Result := TypeToStr(t,
    ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '99', ''],
    [bcVisa, bcMasterCard, bcAmericanExpress, bcSorocred, bcDinersClub, bcElo, bcHipercard, bcAura, bcCabal, bcAlelo, bcBanesCard, bcCalCard, bcCredz, bcDiscover, bcGoodCard,
    bcGreenCard, bcHiper, bcJcB, bcMais, bcMaxVan, bcPolicard, bcRedeCompras, bcSodexo, bcValeCard, bcVerocheque, bcVR, bcTicket, bcOutros, TBandeiraCartao(-1)]);
end;

function RegTribToStr(const t: TRegTrib): string;
begin
  Result := TypeToStr(t,
    ['0', '1', '2', '3', '4', '5', '6'],
    [RTISSNenhum, RTISSMicroempresaMunicipal, RTISSEstimativa, RTISSSociedadeProfissionais, RTISSCooperativa, RTISSMEI, RTISSMEEPP]);
end;

function IndProcToStr(const t: TIndProc): string;
begin
  Result := TypeToStr(t,
    ['0', '1', '2', '3', '4', '9'],
    [ipSEFAZ, ipJusticaFederal, ipJusticaEstadual, ipSecexRFB, ipCONFAZ, ipOutros]);
end;

function IndEscalaToStr(const t: TIndEscala): string;
begin
  Result := TypeToStr(t,
    ['S', 'N', ''],
    [ieRelevante, ieNaoRelevante, ieNenhum]);
end;

function IndTotalToStr(const t: TIndTotal): string;
begin
  Result := TypeToStr(t,
    ['0', '1'],
    [itNaoSomaTotalNFe, itSomaTotalNFe]);
end;

function TAtoToStr(const t: TTAto): string;
begin
  Result := TypeToStr(t,
    ['', '08', '10', '12', '14', '15'],
    [taNenhum, taTermoAcordo, taRegimeEspecial, taAutorizacaoEspecifica, taAjusteSNIEF, taConvenioICMS]);
end;

function OrigemMercadoriaToStr(const o: TOrigemMercadoria): string;
begin
  Result := TypeToStr(o,
    ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ''],
    [omNacional, omEstrangeiraImportacaoDireta, omEstrangeiraAdquiridaBrasil, omNacionalConteudoImportacaoSuperior40, omNacionalProcessosBasicos,
    omNacionalConteudoImportacaoInferiorIgual40, omEstrangeiraImportacaoDiretaSemSimilar, omEstrangeiraAdquiridaBrasilSemSimilar, omNacionalConteudoImportacaoSuperior70,
    omReservadoParaUsoFuturo, omVazio]);
end;

function TGuiaToStr(const t: TTGuia): string;
begin
  Result := TypeToStr(t,
    ['', '1', '2', '3', '4', '5', '6', '7'],
    [tpgNenhum, tpgGTA, tpgTTA, tpgDTA, tpgATV, tpgPTV, tpgGTV, tpgGuiaFlorestal]);
end;

function CSTIcmsToStr(const t: TCSTIcms): string;
begin
  Result := TypeToStr(t,
    ['cst00', 'cst02', 'cst10', 'cst15', 'cst20', 'cst30', 'cst40', 'cst41', 'cst50', 'cst51', 'cst53', 'cst60', 'cst61', 'cst70', 'cst90', 'cstPart10',
    'cstPart90', 'cstRep41', 'cstRep60', 'csosn101', 'csosn102', 'csosn103', 'csosn201', 'csosn202', 'csosn203', 'csosn300', 'csosn400', 'csosn500', 'csosn900'],
    [cst00, cst02, cst10, cst15, cst20, cst30, cst40, cst41, cst50, cst51, cst53, cst60, cst61, cst70, cst90, cstPart10, cstPart90, cstRep41,
    cstRep60, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900]);
end;

function CSTIPIToStr(const t: TCSTIPI): string;
begin
  Result := TypeToStr(t,
    ['00', '01', '02', '03', '04', '49', '50', '51', '52', '53', '54', '55', '99'],
    [ipi00, ipi01, ipi02, ipi03, ipi04, ipi49, ipi50, ipi51, ipi52, ipi53, ipi54, ipi55, ipi99]);
end;

function StrToCSTIPI(const t: string): TCSTIPI;
begin
  Result := StrToType(t,
    ['00', '01', '02', '03', '04', '49', '50', '51', '52', '53', '54', '55', '99'],
    [ipi00, ipi01, ipi02, ipi03, ipi04, ipi49, ipi50, ipi51, ipi52, ipi53, ipi54, ipi55, ipi99], ipi00);
end;

function CSTPISToStr(const t: TCSTPIS): string;
begin
  Result := TypeToStr(t,
    ['01', '02', '03', '04', '05', '06', '07', '08', '09', '49', '50', '51', '52', '53', '54', '55', '56', '60', '61',
    '62', '63', '64', '65', '66', '67', '70', '71', '72', '73', '74', '75', '98', '99'],
    [pis01, pis02, pis03, pis04, pis05, pis06, pis07, pis08, pis09, pis49, pis50, pis51, pis52, pis53, pis54, pis55, pis56, pis60, pis61,
    pis62, pis63, pis64, pis65, pis66, pis67, pis70, pis71, pis72, pis73, pis74, pis75, pis98, pis99]);
end;

function StrToCSTPIS(const t: string): TCSTPIS;
begin
  Result := StrToType(t,
    ['01', '02', '03', '04', '05', '06', '07', '08', '09', '49', '50', '51', '52', '53', '54', '55', '56', '60', '61',
    '62', '63', '64', '65', '66', '67', '70', '71', '72', '73', '74', '75', '98', '99'],
    [pis01, pis02, pis03, pis04, pis05, pis06, pis07, pis08, pis09, pis49, pis50, pis51, pis52, pis53, pis54, pis55, pis56, pis60, pis61,
    pis62, pis63, pis64, pis65, pis66, pis67, pis70, pis71, pis72, pis73, pis74, pis75, pis98, pis99], pis01);
end;

function CSTCOFINSToStr(const t: TCSTCOFINS): string;
begin
  Result := TypeToStr(t,
    ['01', '02', '03', '04', '05', '06', '07', '08', '09', '49', '50', '51', '52', '53', '54', '55', '56', '60', '61',
    '62', '63', '64', '65', '66', '67', '70', '71', '72', '73', '74', '75', '98', '99'],
    [cof01, cof02, cof03, cof04, cof05, cof06, cof07, cof08, cof09, cof49, cof50, cof51, cof52, cof53, cof54, cof55, cof56, cof60, cof61,
    cof62, cof63, cof64, cof65, cof66, cof67, cof70, cof71, cof72, cof73, cof74, cof75, cof98, cof99]);
end;

function StrToCSTCOFINS(const t: string): TCSTCOFINS;
begin
  Result := StrToType(t,
    ['01', '02', '03', '04', '05', '06', '07', '08', '09', '49', '50', '51', '52', '53', '54', '55', '56', '60', '61',
    '62', '63', '64', '65', '66', '67', '70', '71', '72', '73', '74', '75', '98', '99'],
    [cof01, cof02, cof03, cof04, cof05, cof06, cof07, cof08, cof09, cof49, cof50, cof51, cof52, cof53, cof54, cof55, cof56, cof60, cof61,
    cof62, cof63, cof64, cof65, cof66, cof67, cof70, cof71, cof72, cof73, cof74, cof75, cof98, cof99], cof01);
end;

function IndISSToStr(const t: TIndISS): string;
begin
  Result := TypeToStr(t,
    ['1', '2', '3', '4', '5', '6', '7'],
    [iiExigivel, iiNaoIncidencia, iiIsencao, iiExportacao, iiImunidade, iiExigSuspDecisaoJudicial, iiExigSuspProcessoAdm]);
end;

function IndSomaCOFINSSTToStr(const t: TIndSomaCOFINSST): string;
begin
  Result := TypeToStr(t,
    ['', '0', '1'],
    [iscNenhum, iscCOFINSSTNaoCompoe, iscCOFINSSTCompoe]);
end;

function IndSomaPISSTToStr(const t: TIndSomaPISST): string;
begin
  Result := TypeToStr(t,
    ['', '0', '1'],
    [ispNenhum, ispPISSTNaoCompoe, ispPISSTCompoe]);
end;

function ModeloDFeToStr(const t: TModeloDFe): string;
begin
  Result := TypeToStr(t,
    ['NFe', 'NFCe'],
    [dfeNFe, dfeNFCe]);
end;

function ModeloDFeToInt(const t: TModeloDFe): Integer;
begin
  Result := StrToIntDef(TypeToStr(t,
    ['55', '65'],
    [dfeNFe, dfeNFCe]), 0);
end;

function StrToSituationAPI(const s: string): TSituationAPI;
begin
  Result := StrToType(s,
    ['Received', 'InProcessing', 'Processed', 'Error'],
    [tsaReceived, tsaInProcessing, tsaProcessed, tsaError], tsaReceived);
end;

function SituationAPIToStr(const s: TSituationAPI): String;
begin
  Result := TypeToStr(s,
    ['Received', 'InProcessing', 'Processed', 'Error'],
    [tsaReceived, tsaInProcessing, tsaProcessed, tsaError]);
end;

function StrToSituationDFeAPI(const s: string): TSituationDFeAPI;
begin
  Result := StrToType(s,
    ['EmAberto', 'Emitido', 'Rejeitado', 'Cancelado'],
    [tsdaEmAberto, tsdaEmitido, tsdaRejeitado, tsdaCancelado], tsdaEmAberto);
end;

function SituationDFeAPIToStr(const s: TSituationDFeAPI): String;
begin
  Result := TypeToStr(s,
    ['EmAberto', 'Emitido', 'Rejeitado', 'Cancelado'],
    [tsdaEmAberto, tsdaEmitido, tsdaRejeitado, tsdaCancelado]);
end;

function TipoImpressaoNFeToStr(const t: TTipoImpressaoNFe): string;
begin
  Result := TypeToStr(t,
    ['Retrato', 'Paisagem', 'Simplificado'],
    [ttiRetrato, ttiPaisagem, ttiSimplificado]);
end;

function TipoImpressaoNFCeToStr(const t: TTipoImpressaoNFCe): string;
begin
  Result := TypeToStr(t,
    ['Cupom', 'NFCeA4'],
    [ttiCupom, ttiNFCeA4]);
end;

function UFToCodigo(const uf: String): Integer;
var
  vArrayUF: TArray<String>;
  vArrayCod: TArray<Integer>;
  I: Integer;
begin
  Result := -1;
  vArrayUF := ['AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'];
  vArrayCod := [12, 27, 16, 13, 29, 23, 53, 32, 52, 21, 51, 50, 31, 15, 25, 41, 26, 22, 33, 24, 43, 11, 14, 42, 35, 28, 17];

  for I := Low(vArrayUF) to High(vArrayUF) do
  begin
    if uf = vArrayUF[I] then
      Exit(vArrayCod[I]);
  end;
end;

end.

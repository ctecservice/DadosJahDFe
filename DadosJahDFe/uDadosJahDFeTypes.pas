unit uDadosJahDFeTypes;

interface

uses System.Classes, System.SysUtils, System.Generics.Collections;

type
  TVersionAPI = (v1);

  TError = record
    statusCode: Integer;
    error: String;
    messageList: TArray<String>;
  end;

  TResponseAPI = record
    statusCode: Integer;
    StatusText: String;
    Content: String;
    error: TError;
  end;

  TAccessToken = record
    accessToken: String;
    expiresAt: TDateTime;
  end;

  TResponseAPIPages = record
    currentPage: Integer;
    totalPages: Integer;
    totalItens: Integer;
  end;

  TSaveXMLPDFFile = (tsxfNFe, tsxfNFeCorrection, tsxfNFeDisenable, tsxfNFeCancel, tsxfNFCe, tsxfNFCeDisenable, tsxfNFCeCancel);

  TRequestResponseAPI = (tResponse, tRequest);

  TSituationDfeAPI = (tsdaEmAberto, tsdaEmitido, tsdaRejeitado, tsdaCancelado);

  TSituationAPI = (tsaReceived, tsaInProcessing, tsaProcessed, tsaError);

  TTimeZone = (tzLess1200, tzLess1100, tzLess1000, tzLess0930, tzLess0900, tzLess0800, tzLess0700, tzLess0600, tzLess0500, tzLess0400, tzLess0330, tzLess0300,
    tzLess0200, tzLess0100, tz0000, tzMore0100, tzMore0200, tzMore0300, tzMore0400, tzMore0430, tzMore0500, tzMore0530, tzMore0545, tzMore0600, tzMore0630,
    tzMore0700, tzMore0800, tzMore0845, tzMore0900, tzMore0930, tzMore1000, tzMore1030, tzMore1100, tzMore1200, tzMore1245, tzMore1300, tzMore1400);

  TTypeUser = (tuUser, tuSystem);

  TRoute = (rtAuthUserLogin, rtAuthSystemLogin, rtAuthUserReset, rtAuthSystemReset, rtAuthUserLogout, rtAuthSystemLogout, rtAuthUserForget, rtAuthSystemForget,
    rtSystem, rtSystemRespTecCSRT, rtUser, rtUserList, rtUserRestore, rtUserNotification, rtCertificate, rtEmitente, rtAutXML,
    rtNFe, rtNFeCancel, rtNFeDisenable, rtNFeCorrection, rtNFeCancelPrint, rtNFeDisenablePrint, rtNFeCorrectionPrint, rtNFeXML, rtNFeDANFe, rtNFeServiceStatus,
    rtNFeSefaz, rtNFCe, rtNFCeCancel, rtNFCeDisenable, rtNFCeCancelPrint, rtNFCeDisenablePrint, rtNFCeXML, rtNFCeDANFCe, rtNFCeServiceStatus, rtNFCeSefaz);

  TTNotification = (ttnAll, ttnStatusServico, ttnNFe);

  TModeloDFe = (dfeNFe, dfeNFCe);

  TVersaoNF = (v4);

  TVersaoQrCodeNFCe = (vqc0, vqc1, vqc2, vqc3);

  TTipoImpressaoNFe = (ttiRetrato, ttiPaisagem, ttiSimplificado);

  TTipoImpressaoNFCe = (ttiCupom, ttiNFCeA4);

  TSimNao = (snSim, snNao);

  TSimNaoNenhum = (snnNenhum, snnSim, snnNao);

  TNF = (tnfEntrada, tnfSaida);

  TIndFinal = (tifNao, tifConsumidorFinal);

  TIndIEDest = (tiedContribuinte, tiedIsento, tiedNaoContribuinte);

  TProcEmi = (tpeAplicativoContribuinte, tpeAvulsaFisco, tpeAvulsaContribuinte, tpeContribuinteAplicativoFisco);

  TIndPres = (tipNao, tipPresencial, tipInternet, tipTeleatendimento, tipEntregaDomicilio, tipPresencialForaEstabelecimento, tipOutros);

  TTDest = (tdInterna, tdInterestadual, tdExterior);

  TFinalidade = (tfNormal, tfComplementar, tfAjuste, tfDevolucao);

  TCRT = (crtSimplesNacional, crtSimplesExcessoReceita, crtRegimeNormal, crtMEI);

  TAmb = (taProducao, taHomologacao);

  TIntermed = (tiSemOperacao, tiOperacaoSemIntermediador, tiOperacaoComIntermediador);

  TModFrete = (tmfContaEmitente, tmfContaDestinatario, tmfContaTerceiros, tmfProprioRemetente, tmfProprioDestinatario, tmfSemFrete);

  TIndPag = (tipVista, tipPrazo, tipOutras, tipNenhum);

  TTIntegra = (tiNaoInformado, tiPagIntegrado, tiPagNaoIntegrado);

  TTImp = (tiSemGeracao, tiRetrato, tiPaisagem, tiSimplificado, tiNFCe, tiMsgEletronica);

  TTEmis = (teNormal, teContingencia, teSCAN, teDPEC, teFSDA, teSVCAN, teSVCRS, teSVCSP, teOffLine);

  TViaTransp = (tvMaritima, tvFluvial, tvLacustre, tvAerea, tvPostal, tvFerroviaria, tvRodoviaria, tvConduto, tvMeiosProprios,
    tvEntradaSaidaFicta, tvCourier, tvEmMaos, tvPorReboque, tvNaoInformado);

  TIntermediario = (tiContaPropria, tiContaOrdem, tiEncomenda, timNaoInformado);

  TTOp = (toVendaConcessionaria, toFaturamentoDireto, toVendaDireta, toOutros);

  TCondVeic = (cvAcabado, cvInacabado, cvSemiAcabado);

  TTArma = (taUsoPermitido, taUsoRestrito);

  TindImport = (iiNacional, iiImportado);

  TMotRedAdRem = (motTranspColetivo, motOutros);

  TMotDesICMS = (mdiTaxi, mdiDeficienteFisico, mdiProdutorAgropecuario, mdiFrotistaLocadora, mdiDiplomaticoConsular,
    mdiAmazoniaLivreComercio, mdiSuframa, mdiVendaOrgaosPublicos, mdiOutros, mdiDeficienteCondutor,
    mdiDeficienteNaoCondutor, mdiOrgaoFomento, mdiOlimpiadaRio2016, mdiSolicitadoFisco);

  TModBC = (dbiMargemValorAgregado, dbiPauta, dbiPrecoTabelado, dbiValorOperacao, dbiNenhum);

  TModBCST = (dbisPrecoTabelado, dbisListaNegativa, dbisListaPositiva, dbisListaNeutra, dbisMargemValorAgregado, dbisPauta, dbisValordaOperacao);

  TFormaPag = (fpDinheiro, fpCheque, fpCartaoCredito, fpCartaoDebito, fpCreditoLoja,
    fpValeAlimentacao, fpValeRefeicao, fpValePresente, fpValeCombustivel,
    fpDuplicataMercantil, fpBoletoBancario, fpDepositoBancario,
    fpPagamentoInstantaneo, fpTransfBancario, fpProgramaFidelidade,
    fpSemPagamento, fpRegimeEspecial, fpOutro, fpPagamentoInstantaneoEstatico,
    fpCreditoEmLojaPorDevolucao, fpFalhaHardware);

  TBandeiraCartao = (bcVisa, bcMasterCard, bcAmericanExpress, bcSorocred, bcDinersClub,
    bcElo, bcHipercard, bcAura, bcCabal, bcAlelo, bcBanesCard,
    bcCalCard, bcCredz, bcDiscover, bcGoodCard, bcGreenCard,
    bcHiper, bcJcB, bcMais, bcMaxVan, bcPolicard, bcRedeCompras,
    bcSodexo, bcValeCard, bcVerocheque, bcVR, bcTicket,
    bcOutros);

  TRegTrib = (RTISSNenhum, RTISSMicroempresaMunicipal, RTISSEstimativa, RTISSSociedadeProfissionais, RTISSCooperativa, RTISSMEI, RTISSMEEPP);

  TIndProc = (ipSEFAZ, ipJusticaFederal, ipJusticaEstadual, ipSecexRFB, ipCONFAZ, ipOutros);

  TIndEscala = (ieRelevante, ieNaoRelevante, ieNenhum);

  TIndTotal = (itNaoSomaTotalNFe, itSomaTotalNFe);

  TTAto = (taNenhum, taTermoAcordo, taRegimeEspecial, taAutorizacaoEspecifica, taAjusteSNIEF, taConvenioICMS);

  TTGuia = (tpgNenhum, tpgGTA, tpgTTA, tpgDTA, tpgATV, tpgPTV, tpgGTV, tpgGuiaFlorestal);

  TCSTIcms = (cst00, cst02, cst10, cst15, cst20, cst30, cst40, cst41, cst50, cst51, cst53, cst60, cst61, cst70, cst90, cstPart10, cstPart90, cstRep41,
    cstRep60, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900);

  TOrigemMercadoria = (omNacional, omEstrangeiraImportacaoDireta, omEstrangeiraAdquiridaBrasil, omNacionalConteudoImportacaoSuperior40, omNacionalProcessosBasicos,
    omNacionalConteudoImportacaoInferiorIgual40, omEstrangeiraImportacaoDiretaSemSimilar, omEstrangeiraAdquiridaBrasilSemSimilar, omNacionalConteudoImportacaoSuperior70,
    omReservadoParaUsoFuturo, omVazio);

  TCSTIPI = (ipi00, ipi01, ipi02, ipi03, ipi04, ipi49, ipi50, ipi51, ipi52, ipi53, ipi54, ipi55, ipi99);

  TCSTPIS = (pis01, pis02, pis03, pis04, pis05, pis06, pis07, pis08, pis09, pis49, pis50, pis51, pis52, pis53, pis54, pis55, pis56, pis60, pis61,
    pis62, pis63, pis64, pis65, pis66, pis67, pis70, pis71, pis72, pis73, pis74, pis75, pis98, pis99);

  TCSTCOFINS = (cof01, cof02, cof03, cof04, cof05, cof06, cof07, cof08, cof09, cof49, cof50, cof51, cof52, cof53, cof54, cof55, cof56, cof60, cof61,
    cof62, cof63, cof64, cof65, cof66, cof67, cof70, cof71, cof72, cof73, cof74, cof75, cof98, cof99);

  TIndSomaPISST = (ispNenhum, ispPISSTNaoCompoe, ispPISSTCompoe);

  TIndSomaCOFINSST = (iscNenhum, iscCOFINSSTNaoCompoe, iscCOFINSSTCompoe);

  TIndISS = (iiExigivel, iiNaoIncidencia, iiIsencao, iiExportacao, iiImunidade, iiExigSuspDecisaoJudicial, iiExigSuspProcessoAdm);

  TNotification = record
    Email: String;
    TypeNotification: TTNotification;
  end;

  TListNotification = TArray<TNotification>;

  TResponseNotification = record
    ListNotification: TListNotification;
    Pages: TResponseAPIPages;
  end;

  TCertificateFile = record
    FileName: String;
    Password: String;
    Extension: String;
  end;

  TCertificate = record
    NumeroSerie: String;
    RazaoSocial: String;
    CNPJ: String;
    Validade: TDate;
    Certificadora: String;
  end;

  TStatusService = record
    cStat: Integer;
    cUF: Integer;
    DhRecbto: TDateTime;
    DhRetorno: TDateTime;
    Msg: String;
    TMed: Integer;
    VerAplic: String;
    Versao: String;
    xMotivo: String;
    xObs: String;
    tpAmb: TAmb;
    responseTime: Integer;
  end;

  TListAutXML = TArray<String>;

  TNFref = record
    refNFe: String;
    refNFeSig: String;
    refCTe: String;
  end;

  TListNFref = TArray<TNFref>;

  TInfIntermed = record
    CNPJ: String;
    idCadIntTran: String;
  end;

  TIde = record
    cUF: Integer;
    cNF: Integer;
    natOp: String;
    serie: Integer;
    nNF: Integer;
    dhEmi: TDateTime;
    dhSaiEnt: TDateTime;
    tpNF: TNF;
    idDest: TTDest;
    cMunFG: Integer;
    tmImp: TTImp;
    tmEmis: TTEmis;
    tpAmb: TAmb;
    finNFe: TFinalidade;
    indFinal: TIndFinal;
    indPres: TIndPres;
    indIntermed: TIntermed;
    procEmi: TProcEmi;
    verProc: String;
    dhCont: TDateTime;
    xJust: String;
    NFref: TListNFref;
  end;

  TEndereco = record
    xLgr: String;
    nro: String;
    xCpl: String;
    xBairro: String;
    cMun: Integer;
    xMun: String;
    UF: String;
    CEP: String;
    cPais: Integer;
    xPais: String;
    fone: String;
  end;

  TEmit = record
    CNPJCPF: String;
    xNome: String;
    xFant: String;
    IE: String;
    IEST: String;
    IM: String;
    CNAE: String;
    CRT: TCRT;
    enderEmit: TEndereco;
  end;

  TDest = record
    CNPJCPF: String;
    xNome: String;
    idEstrangeiro: String;
    indIEDest: TIndIEDest;
    IE: String;
    ISUF: String;
    IM: String;
    Email: String;
    enderDest: TEndereco;
  end;

  TRetirada = record
    CNPJCPF: String;
    xNome: String;
    xLgr: String;
    nro: String;
    xCpl: String;
    xBairro: String;
    cMun: Integer;
    xMun: String;
    UF: String;
    CEP: String;
    cPais: Integer;
    xPais: String;
    fone: String;
    Email: String;
    IE: String;
  end;

  TEntrega = record
    CNPJCPF: String;
    xNome: String;
    xLgr: String;
    nro: String;
    xCpl: String;
    xBairro: String;
    cMun: Integer;
    xMun: String;
    UF: String;
    CEP: String;
    cPais: Integer;
    xPais: String;
    fone: String;
    Email: String;
    IE: String;
  end;

  TTransporta = record
    CNPJ: String;
    CPF: String;
    xNome: String;
    IE: String;
    xEnder: String;
    xMun: String;
    UF: String;
  end;

  TRetTransp = record
    vServ: Double;
    vBCRet: Double;
    pICMSRet: Double;
    vICMSRet: Double;
    CFOP: Integer;
    cMunFG: Integer;
  end;

  TVeicTransp = record
    placa: String;
    UF: String;
    RNTC: String;
  end;

  TReboque = record
    placa: String;
    UF: String;
    RNTC: String;
  end;

  TListReboque = TArray<TReboque>;

  TListNLacre = TArray<String>;

  TVol = record
    qVol: Integer;
    esp: String;
    marca: String;
    nVol: String;
    pesoL: Double;
    pesoB: Double;
    lacres: TListNLacre;
  end;

  TListVol = TArray<TVol>;

  TTransp = record
    modFrete: TModFrete;
    vagao: String;
    balsa: String;
    transporta: TTransporta;
    retTRansp: TRetTransp;
    veicTransp: TVeicTransp;
    reboque: TListReboque;
    vol: TListVol;
  end;

  TObsCont = record
    xCampo: String;
    xTexto: String;
  end;

  TListObsCont = TArray<TObsCont>;

  TObsFisco = record
    xCampo: String;
    xTexto: String;
  end;

  TListObsFisco = TArray<TObsFisco>;

  TProcRef = record
    nProc: String;
    indProc: TIndProc;
    tpAto: TTAto;
  end;

  TListProcRef = TArray<TProcRef>;

  TInfAdic = record
    infAdFisco: String;
    infCpl: String;
    obsCont: TListObsCont;
    obsFisco: TListObsFisco;
    procRef: TListProcRef;
  end;

  TFat = record
    nFat: String;
    vOrig: Double;
    vDesc: Double;
    vLiq: Double;
  end;

  TDup = record
    nDup: String;
    dVenc: TDate;
    vDup: Double;
  end;

  TListDup = TArray<TDup>;

  Tcobr = record
    fat: TFat;
    dup: TListDup;
  end;

  TCard = record
    tpIntegra: TTIntegra;
    CNPJ: String;
    tBand: TBandeiraCartao;
    cAut: String;
    CNPJReceb: String;
    idTermPag: String;
  end;

  TDetPag = record
    indPag: TIndPag;
    tPag: TFormaPag;
    xPag: String;
    vPag: Double;
    dPag: TDate;
    CNPJPag: String;
    UFPag: String;
    card: TCard;
  end;

  TListDetPag = TArray<TDetPag>;

  tPag = record
    detPag: TListDetPag;
    vTroco: Double;
  end;

  TExporta = record
    UFSaidaPais: String;
    xLocExporta: String;
    xLocDespacho: String;
  end;

  TCompra = record
    xNEmp: String;
    xPed: String;
    xCont: String;
  end;

  TForDia = record
    dia: Integer;
    qtde: Double;
  end;

  TListForDia = TArray<TForDia>;

  TDeduc = record
    xDed: String;
    vDed: Double;
  end;

  TListDeduc = TArray<TDeduc>;

  TCana = record
    qTotMes: Double;
    qTotAnt: Double;
    qTotGer: Double;
    vFor: Double;
    vTotDed: Double;
    vLiqFor: Double;
    safra: String;
    ref: String;
    forDia: TListForDia;
    deduc: TListDeduc;
  end;

  TAgropecuario = record
    nReceituario: String;
    CPFRespTec: String;
    tpGuia: TTGuia;
    UFGuia: String;
    serieGuia: String;
    nGuia: String;
  end;

  TRespTecCSRT = record
    cUF : Integer;
    idCSRT: Integer;
    CSRT: String;
  end;

  TListRespTecCSRT = TArray<TRespTecCSRT>;

  TResponseRespTecCSRT = record
    ListRespTecCSRT: TListRespTecCSRT;
    Pages: TResponseAPIPages;
  end;

  TInfRespTec = record
    CNPJ: String;
    xContato: String;
    Email: String;
    fone: String;
    IdCSRT: String;
    hashCSRT: String;
  end;

  TProtNFe = record
    tpAmb: TAmb;
    VerAplic: String;
    chNFe: String;
    DhRecbto: TDateTime;
    nProt: String;
    digVal: String;
    cStat: Integer;
    xMotivo: String;
  end;

  TICMSTot = record
    vBC: Double;
    vICMS: Double;
    vICMSDeson: Double;
    vFCPUFDest: Double;
    vICMSUFDest: Double;
    vICMSUFRemet: Double;
    vFCP: Double;
    vBCST: Double;
    vST: Double;
    vFCPST: Double;
    vFCPSTRet: Double;
    qBCMono: Double;
    vICMSMono: Double;
    qBCMonoReten: Double;
    vICMSMonoReten: Double;
    qBCMonoRet: Double;
    vICMSMonoRet: Double;
    vProd: Double;
    vFrete: Double;
    vSeg: Double;
    vDesc: Double;
    vII: Double;
    vIPI: Double;
    vIPIDevol: Double;
    vPIS: Double;
    vCOFINS: Double;
    vOutro: Double;
    vNF: Double;
    vTotTrib: Double;
  end;

  TISSQNtot = record
    vServ: Double;
    vBC: Double;
    vISS: Double;
    vPIS: Double;
    vCOFINS: Double;
    dCompet: TDate;
    vDeducao: Double;
    vOutro: Double;
    vDescIncond: Double;
    vDescCond: Double;
    vISSRet: Double;
    cRegTrib: TRegTrib;
  end;

  TRetTrib = record
    vRetPIS: Double;
    vRetCOFINS: Double;
    vRetCSLL: Double;
    vBCIRRF: Double;
    vIRRF: Double;
    vBCRetPrev: Double;
    vRetPrev: Double;
  end;

  TTotal = record
    ICMSTot: TICMSTot;
    ISSQNtot: TISSQNtot;
    retTrib: TRetTrib;
  end;

  TListNVE = TArray<String>;

  TgCred = record
    cCredPresumido: String;
    pCredPresumido: Double;
    vCredPresumido: Double;
  end;

  TListGCred = TArray<TgCred>;

  TAdi = record
    nAdicao: Integer;
    nSeqAdic: Integer;
    cFabricante: String;
    vDescDI: Double;
    nDraw: String;
  end;

  TListAdi = TArray<TAdi>;

  TDI = record
    nDI: String;
    dDI: TDate;
    xLocDesemb: String;
    UFDesemb: String;
    dDesemb: TDate;
    tpViaTransp: TViaTransp;
    vAFRMM: Double;
    tpIntermedio: TIntermediario;
    CNPJ: String;
    UFTerceiro: String;
    cExportador: String;
    adi: TListAdi;
  end;

  TListDI = TArray<TDI>;

  TDetExport = record
    nDraw: String;
    exportInd_nRE: String;
    exportInd_chNFe: String;
    exportInd_qExport: Double;
  end;

  TListDetExport = TArray<TDetExport>;

  TRastro = record
    nLote: String;
    qLote: Double;
    dFab: TDate;
    dVal: TDate;
    cAgreg: String;
  end;

  TListRastro = TArray<TRastro>;

  TVeicProd = record
    tpOp: TTOp;
    chassi: String;
    cCor: String;
    xCor: String;
    pot: String;
    cilin: String;
    pesoB: String;
    pesoL: String;
    nSerie: String;
    tpComb: String;
    nMotor: String;
    CMT: String;
    dist: String;
    anoMod: Integer;
    anoFab: Integer;
    tpPint: String;
    tpVeic: Integer;
    espVeic: Integer;
    VIN: String;
    condVeic: TCondVeic;
    cMod: String;
    cCorDENATRAN: String;
    lota: Integer;
    tpRest: Integer;
  end;

  TMed = record
    cProdANVISA: String;
    xMotivoIsencao: String;
    vPMC: Double;
  end;

  TArma = record
    tpArma: TTArma;
    nSerie: String;
    nCano: String;
    descr: String;
  end;

  TListArma = TArray<TArma>;

  TCIDE = record
    qBCProd: Double;
    vAliqProd: Double;
    vCIDE: Double;
  end;

  TEncerrante = record
    nBico: Integer;
    nBomba: Integer;
    nTanque: Integer;
    vEncIni: Double;
    vEncFin: Double;
  end;

  TOrigComb = record
    indImport: TindImport;
    cUFOrig: Integer;
    pOrig: Double;
  end;

  TListOrigComb = TArray<TOrigComb>;

  TComb = record
    cProdANP: Integer;
    descANP: String;
    pGLP: Double;
    pGNn: Double;
    pGNi: Double;
    vPart: Double;
    CODIF: String;
    qTemp: Double;
    UFCons: String;
    pBio: Double;
    CIDE: TCIDE;
    encerrante: TEncerrante;
    origComb: TListOrigComb;
  end;

  TProd = record
    cProd: String;
    cEAN: String;
    cBarra: String;
    xProd: String;
    NCM: String;
    NVE: TListNVE;
    CEST: String;
    indEscala: TIndEscala;
    CNPJFab: String;
    cBenef: String;
    gCred: TListGCred;
    EXTIPI: String;
    CFOP: Integer;
    uCom: String;
    qCom: Double;
    vUnCom: Double;
    vProd: Double;
    cEANTrib: String;
    cBarraTrib: String;
    uTrib: String;
    qTrib: Double;
    vUnTrib: Double;
    vFrete: Double;
    vSeg: Double;
    vDesc: Double;
    vOutro: Double;
    indTot: TIndTotal;
    xPed: String;
    nItemPed: String;
    nFCI: String;
    DI: TListDI;
    detExport: TListDetExport;
    rastro: TListRastro;
    veicProd: TVeicProd;
    med: TMed;
    arma: TListArma;
    comb: TComb;
    nRECOPI: String;
    vTotTrib: Double;
  end;

  TICMS00 = record
    modBC: TModBC;
    vBC: Double;
    pICMS: Double;
    vICMS: Double;
    pFCP: Double;
    vFCP: Double;
  end;

  TICMS02 = record
    qBCMono: Double;
    adRemICMS: Double;
    vICMSMono: Double;
  end;

  TICMS10 = record
    modBC: TModBC;
    vBC: Double;
    pRedBC: Double;
    pICMS: Double;
    vICMS: Double;
    vBCFCP: Double;
    pFCP: Double;
    vFCP: Double;
    modBCST: TModBCST;
    pMVAST: Double;
    pRedBCST: Double;
    vBCST: Double;
    pICMSST: Double;
    vICMSST: Double;
    vBCFCPST: Double;
    pFCPST: Double;
    vFCPST: Double;
    pBCOp: Double;
    UFST: String;
    vICMSSTDeson: Double;
    motDesICMSST: TMotDesICMS;
  end;

  TICMS15 = record
    qBCMono: Double;
    adRemICMS: Double;
    vICMSMono: Double;
    qBCMonoReten: Double;
    adRemICMSReten: Double;
    vICMSMonoReten: Double;
    pRedAdRem: Double;
    motRedAdRem: TMotRedAdRem;
  end;

  TICMS20 = record
    modBC: TModBC;
    pRedBC: Double;
    vBC: Double;
    pICMS: Double;
    vICMS: Double;
    vBCFCP: Double;
    pFCP: Double;
    vFCP: Double;
    vICMSDeson: Double;
    motDesICMS: TMotDesICMS;
    indDeduzDeson: TSimNaoNenhum;
  end;

  TICMS30 = record
    modBCST: TModBCST;
    pMVAST: Double;
    pRedBCST: Double;
    vBCST: Double;
    pICMSST: Double;
    vICMSST: Double;
    vBCFCPST: Double;
    pFCPST: Double;
    vFCPST: Double;
    vICMSDeson: Double;
    motDesICMS: TMotDesICMS;
    indDeduzDeson: TSimNaoNenhum;
  end;

  TICMS40 = record
    vICMSDeson: Double;
    motDesICMS: TMotDesICMS;
    indDeduzDeson: TSimNaoNenhum;
  end;

  TICMS41 = record
    vICMSDeson: Double;
    motDesICMS: TMotDesICMS;
    indDeduzDeson: TSimNaoNenhum;
  end;

  TICMS50 = record
    vICMSDeson: Double;
    motDesICMS: TMotDesICMS;
    indDeduzDeson: TSimNaoNenhum;
  end;

  TICMS51 = record
    modBC: TModBC;
    pRedBC: Double;
    cBenefRBC: String;
    vBC: Double;
    pICMS: Double;
    vICMSOp: Double;
    pDif: Double;
    vICMSDif: Double;
    vICMS: Double;
    vBCFCP: Double;
    pFCP: Double;
    vFCP: Double;
    pFCPDif: Double;
    vFCPDif: Double;
    vFCPEfet: Double;
  end;

  TICMS53 = record
    qBCMono: Double;
    adRemICMS: Double;
    vICMSMonoOp: Double;
    pDif: Double;
    vICMSMonoDif: Double;
    vICMSMono: Double;
  end;

  TICMS60 = record
    vBCSTRet: Double;
    pST: Double;
    vICMSSubstituto: Double;
    vICMSSTRet: Double;
    vBCFCPSTRet: Double;
    pFCPSTRet: Double;
    vFCPSTRet: Double;
    pRedBCEfet: Double;
    vBCEfet: Double;
    pICMSEfet: Double;
    vICMSEfet: Double;
  end;

  TICMS61 = record
    qBCMonoRet: Double;
    adRemICMSRet: Double;
    vICMSMonoRet: Double;
  end;

  TICMS70 = record
    modBC: TModBC;
    pRedBC: Double;
    vBC: Double;
    pICMS: Double;
    vICMS: Double;
    vBCFCP: Double;
    pFCP: Double;
    vFCP: Double;
    modBCST: TModBCST;
    pMVAST: Double;
    pRedBCST: Double;
    vBCST: Double;
    pICMSST: Double;
    vICMSST: Double;
    vBCFCPST: Double;
    pFCPST: Double;
    vFCPST: Double;
    vICMSDeson: Double;
    motDesICMS: TMotDesICMS;
    indDeduzDeson: TSimNaoNenhum;
    vICMSSTDeson: Double;
    motDesICMSST: TMotDesICMS;
  end;

  TICMS90 = record
    modBC: TModBC;
    vBC: Double;
    pRedBC: Double;
    pICMS: Double;
    vICMS: Double;
    vBCFCP: Double;
    pFCP: Double;
    vFCP: Double;
    modBCST: TModBCST;
    pMVAST: Double;
    pRedBCST: Double;
    vBCST: Double;
    pICMSST: Double;
    vICMSST: Double;
    vBCFCPST: Double;
    pFCPST: Double;
    vFCPST: Double;
    vICMSDeson: Double;
    motDesICMS: TMotDesICMS;
    indDeduzDeson: TSimNaoNenhum;
    pBCOp: Double;
    UFST: String;
    vICMSSTDeson: Double;
    motDesICMSST: TMotDesICMS;
  end;

  TICMSPart10 = record
    modBC: TModBC;
    vBC: Double;
    pRedBC: Double;
    pICMS: Double;
    vICMS: Double;
    vBCFCP: Double;
    pFCP: Double;
    vFCP: Double;
    modBCST: TModBCST;
    pMVAST: Double;
    pRedBCST: Double;
    vBCST: Double;
    pICMSST: Double;
    vICMSST: Double;
    vBCFCPST: Double;
    pFCPST: Double;
    vFCPST: Double;
    pBCOp: Double;
    UFST: String;
    vICMSSTDeson: Double;
    motDesICMSST: TMotDesICMS;
  end;

  TICMSPart90 = record
    modBC: TModBC;
    vBC: Double;
    pRedBC: Double;
    pICMS: Double;
    vICMS: Double;
    vBCFCP: Double;
    pFCP: Double;
    vFCP: Double;
    modBCST: TModBCST;
    pMVAST: Double;
    pRedBCST: Double;
    vBCST: Double;
    pICMSST: Double;
    vICMSST: Double;
    vBCFCPST: Double;
    pFCPST: Double;
    vFCPST: Double;
    pBCOp: Double;
    UFST: String;
    vICMSSTDeson: Double;
    motDesICMSST: TMotDesICMS;
  end;

  TICMSRep41 = record
    vBCSTRet: Double;
    pST: Double;
    vICMSSubstituto: Double;
    vICMSSTRet: Double;
    vBCFCPSTRet: Double;
    pFCPSTRet: Double;
    vFCPSTRet: Double;
    vBCSTDest: Double;
    vICMSSTDest: Double;
    pRedBCEfet: Double;
    vBCEfet: Double;
    pICMSEfet: Double;
    vICMSEfet: Double;
  end;

  TICMSRep60 = record
    vBCSTRet: Double;
    pST: Double;
    vICMSSubstituto: Double;
    vICMSSTRet: Double;
    vBCFCPSTRet: Double;
    pFCPSTRet: Double;
    vFCPSTRet: Double;
    vBCSTDest: Double;
    vICMSSTDest: Double;
    pRedBCEfet: Double;
    vBCEfet: Double;
    pICMSEfet: Double;
    vICMSEfet: Double;
  end;

  TICMS101 = record
    pCredSN: Double;
    vCredICMSSN: Double;
  end;

  TICMS201 = record
    modBCST: TModBCST;
    pMVAST: Double;
    pRedBCST: Double;
    vBCST: Double;
    pICMSST: Double;
    vICMSST: Double;
    vBCFCPST: Double;
    pFCPST: Double;
    vFCPST: Double;
    pCredSN: Double;
    vCredICMSSN: Double;
  end;

  TICMS202 = record
    modBCST: TModBCST;
    pMVAST: Double;
    pRedBCST: Double;
    vBCST: Double;
    pICMSST: Double;
    vICMSST: Double;
    vBCFCPST: Double;
    pFCPST: Double;
    vFCPST: Double;
  end;

  TICMS203 = record
    modBCST: TModBCST;
    pMVAST: Double;
    pRedBCST: Double;
    vBCST: Double;
    pICMSST: Double;
    vICMSST: Double;
    vBCFCPST: Double;
    pFCPST: Double;
    vFCPST: Double;
  end;

  TICMS500 = record
    vBCSTRet: Double;
    pST: Double;
    vICMSSubstituto: Double;
    vICMSSTRet: Double;
    vBCFCPSTRet: Double;
    pFCPSTRet: Double;
    vFCPSTRet: Double;
    pRedBCEfet: Double;
    vBCEfet: Double;
    pICMSEfet: Double;
    vICMSEfet: Double;
  end;

  TICMS900 = record
    modBC: TModBC;
    vBC: Double;
    pRedBC: Double;
    pICMS: Double;
    vICMS: Double;
    modBCST: TModBCST;
    pMVAST: Double;
    pRedBCST: Double;
    vBCST: Double;
    pICMSST: Double;
    vICMSST: Double;
    vBCFCPST: Double;
    pFCPST: Double;
    vFCPST: Double;
    pCredSN: Double;
    vCredICMSSN: Double;
  end;

  TICMS = record
    orig: TOrigemMercadoria;
    CST_CSOSN: TCSTIcms;
    ICMS00: TICMS00;
    ICMS02: TICMS02;
    ICMS10: TICMS10;
    ICMS15: TICMS15;
    ICMS20: TICMS20;
    ICMS30: TICMS30;
    ICMS40: TICMS40;
    ICMS41: TICMS41;
    ICMS50: TICMS50;
    ICMS51: TICMS51;
    ICMS53: TICMS53;
    ICMS60: TICMS60;
    ICMS61: TICMS61;
    ICMS70: TICMS70;
    ICMS90: TICMS90;
    ICMSPart10: TICMSPart10;
    ICMSPart90: TICMSPart90;
    ICMSRep41: TICMSRep41;
    ICMSRep60: TICMSRep60;
    ICMS101: TICMS101;
    ICMS201: TICMS201;
    ICMS202: TICMS202;
    ICMS203: TICMS203;
    ICMS500: TICMS500;
    ICMS900: TICMS900;
    // ICMS102, ICMS103, ICMS300 e ICMS400 preenche apenas o CSOSN e orig, não é necessário informar aqui
  end;

  TIPITrib = record
    qUnid: Double;
    vUnid: Double;
    vBC: Double;
    pIPI: Double;
    vIPI: Double;
  end;

  TIPI = record
    CST: TCSTIPI;
    CNPJProd: String;
    cSelo: String;
    qSelo: Integer;
    cEnq: String;
    IPITrib: TIPITrib;
    // CST IPI00, IPI49, IPI50 e IPI99 estão englobados no tipo TIPITrib
    // CST IPI01, IPI02, IPI03, IPI04, IPI51, IPI52, IPI53, IPI54, IPI55 preenche apenas o CST, CNPJProd, cSelo, qSelo e cEnq, não é necessário informar aqui
  end;

  TPISAliq = record
    vBC: Double;
    pPIS: Double;
    vPIS: Double;
  end;

  TPISQtde = record
    qBCProd: Double;
    vAliqProd: Double;
    vPIS: Double;
  end;

  TPISOutr = record
    qBCProd: Double;
    vAliqProd: Double;
    vBC: Double;
    pPIS: Double;
    vPIS: Double;
  end;

  TPIS = record
    CST: TCSTPIS;
    PISAliq: TPISAliq;
    PISQtde: TPISQtde;
    PISOutr: TPISOutr;
    // CST pis01, pis02 estão englobados em TPISAliq;
    // CST pis03 está englobado em TPISQtde;
    // CST pis49, pis50, pis51, pis52, pis53, pis54, pis55, pis56, pis60, pis61, pis62, pis63, pis64, pis65,
    // pis66, pis67, pis70, pis71, pis72, pis73, pis74, pis75, pis98, pis99 está englobado em TPISOutr;
    // CST pis04, pis05, pis06, pis07, pis08, pis09 preenche apenas o cst, não é necessário informar aqui
  end;

  TPISST = record
    vBC: Double;
    pPIS: Double;
    qBCProd: Double;
    vAliqProd: Double;
    vPIS: Double;
    indSomaPISST: TIndSomaPISST;
  end;

  TCOFINSAliq = record
    vBC: Double;
    pCOFINS: Double;
    vCOFINS: Double;
  end;

  TCOFINSQtde = record
    qBCProd: Double;
    vAliqProd: Double;
    vCOFINS: Double;
  end;

  TCOFINSOutr = record
    qBCProd: Double;
    vAliqProd: Double;
    vBC: Double;
    pCOFINS: Double;
    vCOFINS: Double;
  end;

  TCOFINS = record
    CST: TCSTCOFINS;
    COFINSAliq: TCOFINSAliq;
    COFINSQtde: TCOFINSQtde;
    COFINSOutr: TCOFINSOutr;
    // CST cof01, cof02 estão englobados em TPISAliq;
    // CST cof03 está englobado em TPISQtde;
    // CST cof49, cof50, cof51, cof52, cof53, cof54, cof55, cof56, cof60, cof61,
    // cof62, cof63, cof64, cof65, cof66, cof67, cof70, cof71, cof72, cof73, cof74, cof75, cof98, cof99 está englobado em TPISOutr;
    // CST cof04, cof05, cof06, cof07, cof08, cof09 preenche apenas o cst, não é necessário informar aqui
  end;

  TCOFINSST = record
    vBC: Double;
    pCOFINS: Double;
    qBCProd: Double;
    vAliqProd: Double;
    vCOFINS: Double;
    indSomaCOFINSST: TIndSomaCOFINSST;
  end;

  TII = record
    vBC: Double;
    vDespAdu: Double;
    vII: Double;
    vIOF: Double;
  end;

  TImpostoDevol = record
    pDevol: Double;
    vIPIDevol: Double;
  end;

  TISSQN = record
    vBC: Double;
    vAliq: Double;
    vISSQN: Double;
    cMunFG: Integer;
    cListServ: String;
    vDeducao: Double;
    vOutro: Double;
    vDescIncond: Double;
    vDescCond: Double;
    vISSRet: Double;
    indISS: TIndISS;
    cServico: String;
    cMun: Integer;
    cPais: Integer;
    nProcesso: String;
    indIncentivo: TSimNao;
  end;

  TICMSUFDest = record
    vBCUFDest: Double;
    vBCFCPUFDest: Double;
    pFCPUFDest: Double;
    pICMSUFDest: Double;
    pICMSInter: Double;
    pICMSInterPart: Double;
    vFCPUFDest: Double;
    vICMSUFDest: Double;
    vICMSUFRemet: Double;
  end;

  TImposto = record
    ICMS: TICMS;
    IPI: TIPI;
    PIS: TPIS;
    PISST: TPISST;
    COFINS: TCOFINS;
    COFINSST: TCOFINSST;
    II: TII;
    impostoDevol: TImpostoDevol;
    ISSQN: TISSQN;
    ICMSUFDest: TICMSUFDest;
  end;

  TDet = record
    nItem: Integer;
    infAdPro: String;
    prod: TProd;
    imposto: TImposto;
  end;

  TListDet = TArray<TDet>;

  TInfProt = record
    chDfe: String;
    cStat: Integer;
    DhRecbto: TDateTime;
    digVal: String;
    nProt: String;
    tpAmb: TAmb;
    VerAplic: String;
    xMotivo: String;
  end;

  TNFeNFCe = record
    idExternal: String;
    Versao: TVersaoNF;

    ide: TIde;
    autXML: TListAutXML; // Opcional
    emit: TEmit; // Opcional
    infIntermed: TInfIntermed;
    dest: TDest;
    det: TListDet;
    total: TTotal;
    retirada: TRetirada;
    entrega: TEntrega;
    Transp: TTransp;
    infAdic: TInfAdic;
    cobr: Tcobr;
    pag: tPag;
    exporta: TExporta;
    compra: TCompra;
    cana: TCana;
    agropecuario: TAgropecuario;
    infRespTec: TInfRespTec;
    infProt: TInfProt;
  end;

  TListNFeNFCe = TArray<TNFeNFCe>;

  TAuth = record
    _Type: TTypeUser;
    Email: String;
    Password: String;
  end;

  TSystem = record
    idSystem: String;
    nameCompany: String;
    nameSystem: String;
    Email: String;
    CNPJ: String;
    timezone: TTimeZone;
    createAt: TDateTime;
    updatedAt: TDateTime;
    deletedAt: TDateTime;
  end;

  TListSystem = TArray<TSystem>;

  TResponseSystem = record
    ListSystem: TListSystem;
    Pages: TResponseAPIPages;
  end;

  TNFCeUser = record
    CSC: String;
    IdCSC: String;
    versaoQRCode: TVersaoQrCodeNFCe;
  end;

  TUserModifySystem = record
    idUser: String;
    name: String;
    Email: String;
    Password: String;
    nfce: TNFCeUser;
  end;

  TListUserModifySystem = TArray<TUserModifySystem>;

  TUser = record
    idUser: String;
    idExternal: String;
    name: String;
    Email: String;
    CNPJ: String;
    timezone: TTimeZone;
    emit: TEmit;
    autXML: TListAutXML;
    notification: Boolean;
    expirationCertificate: TDate;
    nfce: TNFCeUser;
    createAt: TDateTime;
    updatedAt: TDateTime;
    deletedAt: TDateTime;
  end;

  TListUser = TArray<TUser>;

  TResponseUser = record
    ListUser: TListUser;
    Pages: TResponseAPIPages;
  end;

  TDanfPDF = record
    pdfBase64: String;
    pdfLink: String;
  end;

  TListDanfPDF = TArray<TDanfPDF>;

  TResponseDanfPDF = record
    ListDanfPDF: TListDanfPDF;
    Pages: TResponseAPIPages;
  end;

  TConsultSefazNFeNFCe = record
    cStat: Integer;
    cUF: Integer;
    chDfe: String;
    DhRecbto: TDateTime;
    digVal: String;
    Msg: String;
    TMed: Integer;
    VerAplic: String;
    Versao: String;
    xMotivo: String;
    cMsg: Integer;
    tpAmb: TAmb;
    xMsg: String;
  end;

  TListConsultSefazNFeNFCe = TArray<TConsultSefazNFeNFCe>;

  TResponseConsultSefazNFeNFCe = record
    ListNFeNFCe: TListConsultSefazNFeNFCe;
    Pages: TResponseAPIPages;
  end;

  TResponseEmissionNFeNFCe = record
    chDfe: String;
    cStat: Integer;
    dhEmi: TDateTime;
    DhRecbto: TDateTime;
    digVal: String;
    idBatch: String;
    idDfe: String;
    idExternal: String;
    nNF: Integer;
    vNF: Double;
    nProt: String;
    nRec: String;
    serie: Integer;
    situationDfe: TSituationDfeAPI;
    situation: TSituationAPI;
    tpAmb: TAmb;
    xMotivo: String;

    pdfBase64: String;
    pdfLink: String;
    xml: String;
    xmlLink: String;
  end;

  TListResponseEmissionNFeNFCe = TArray<TResponseEmissionNFeNFCe>;

  TResponseConsultNFeNFCe = record
    ListNFeNFCe: TListResponseEmissionNFeNFCe;
    Pages: TResponseAPIPages;
  end;

  TResponseXMLNFeNFCe = record
    idDfe: String;
    serie: Integer;
    chDfe: String;
    dhEmi: TDateTime;
    idExternal: String;
    tpAmb: TAmb;
    nNF: Integer;
    xml: String;
    xmlLink: String;
  end;

  TListResponseXMLNFeNFCe = TArray<TResponseXMLNFeNFCe>;

  TResponseConsultXMLNFeNFCe = record
    ListXML: TListResponseXMLNFeNFCe;
    Pages: TResponseAPIPages;
  end;

  TResponseCancelNFeNFCe = record
    idCan: String;
    idDfe: String;
    idBatch: String;
    xJust: String;
    dhEnv: TDateTime;
    cStat: Integer;
    dhRegEvento: TDateTime;
    nProtCan: String;
    CNPJDest: String;
    cOrgao: Integer;
    chDfe: String;
    digVal: String;
    emailDest: String;
    tpAmb: TAmb;
    xMotivo: String;
    situation: TSituationAPI;
    xml: String;
    xmlLink: String;
    pdfBase64: String;
    pdfLink: String;
  end;

  TListResponseCancelNFeNFCe = TArray<TResponseCancelNFeNFCe>;

  TResponseConsultCancelNFeNFCe = record
    ListEvent: TListResponseCancelNFeNFCe;
    Pages: TResponseAPIPages;
  end;

  TResponseDisenableNFeNFCe = record
    idInu: String;
    idBatch: String;
    ano: Integer;
    serie: Integer;
    nNFIni: Integer;
    nNFFin: Integer;
    xJust: String;
    dhEnv: TDateTime;
    cStat: Integer;
    DhRecbto: TDateTime;
    tpAmb: TAmb;
    xMotivo: String;
    nProtInu: String;
    situation: TSituationAPI;
    xml: String;
    xmlLink: String;
    pdfBase64: String;
    pdfLink: String;
  end;

  TListResponseDisenableNFeNFCe = TArray<TResponseDisenableNFeNFCe>;

  TResponseConsultDisenableNFeNFCe = record
    ListEvent: TListResponseDisenableNFeNFCe;
    Pages: TResponseAPIPages;
  end;

  TResponseCorrectionNFe = record
    idCce: String;
    idBatch: String;
    idDfe: String;
    chDfe: String;
    nSeqEvento: Integer;
    xCorrecao: String;
    digVal: String;
    dhEnv: TDateTime;

    cStat: Integer;
    dhRegEvento: TDateTime;
    tpAmb: TAmb;
    xMotivo: String;
    nProtCce: String;
    CNPJDest: String;
    cOrgao: Integer;
    situation: TSituationAPI;
    xml: String;
    xmlLink: String;
    pdfBase64: String;
    pdfLink: String;
  end;

  TListResponseCorrectionNFe = TArray<TResponseCorrectionNFe>;

  TResponseConsultCorrectionNFe = record
    ListEvent: TListResponseCorrectionNFe;
    Pages: TResponseAPIPages;
  end;

  TResponseDANFeDANFCe = record
    idDfe: String;
    serie: Integer;
    nNF: Integer;
    chDfe: String;
    idExternal: String;
    tpAmb: TAmb;
    pdfBase64: String;
    pdfLink: String;
  end;

  TListResponseDANFeDANFCe = TArray<TResponseDANFeDANFCe>;

  TResponseConsultDANFeDANFCe = record
    ListDANFeDANFCe: TListResponseDANFeDANFCe;
    Pages: TResponseAPIPages;
  end;

  TEventCancelPrint = record
    idCan: String;
    idDfe: String;
    chDfe: String;
    dhEnv: TDateTime;
    tpAmb: TAmb;
    pdfBase64: String;
    pdfLink: String;
  end;

  TListEventCancelPrint = TArray<TEventCancelPrint>;

  TResponseEventCancelPrint = record
    ListEvent: TListEventCancelPrint;
    Pages: TResponseAPIPages;
  end;

  TEventDisenablePrint = record
    idInu: String;
    tpAmb: TAmb;
    dhEnv: TDateTime;
    pdfBase64: String;
    pdfLink: String;
  end;

  TListEventDisenablePrint = TArray<TEventDisenablePrint>;

  TResponseEventDisenablePrint = record
    ListEvent: TListEventDisenablePrint;
    Pages: TResponseAPIPages;
  end;

  TEventCorrectionPrint = record
    idCce: String;
    idDfe: String;
    chDfe: String;
    dhEnv: TDateTime;
    tpAmb: TAmb;
    pdfBase64: String;
    pdfLink: String;
  end;

  TListEventCorrectionPrint = TArray<TEventCorrectionPrint>;

  TResponseEventCorrectionPrint = record
    ListEvent: TListEventCorrectionPrint;
    Pages: TResponseAPIPages;
  end;

  TEventCancel = record
    cUF: Integer;
    chDfe: String;
    idDfe: String;
    idExternal: String;
    dhEvento: TDateTime;
    nProt: String;
    xJust: String;
  end;

  TListEventCancel = TArray<TEventCancel>;

  TEventDisenable = record
    xJust: String;
    ano: Integer;
    serie: Integer;
    nNFIni: Integer;
    nNFFin: Integer;
  end;

  TListEventDisenable = TArray<TEventDisenable>;

  TEventCorrection = record
    cUF: Integer;
    nSeqEvento: Integer;
    chDfe: String;
    idDfe: String;
    idExternal: String;
    dhEvento: TDateTime;
    xCorrecao: String;
  end;

  TListEventCorrection = TArray<TEventCorrection>;

function ClearError: TError;
function ClearResponse: TResponseAPI;
function ClearResponseAPIPages: TResponseAPIPages;
function ClearAccessToken: TAccessToken;
function ClearResponseSystem: TResponseSystem;
function ClearResponseUser: TResponseUser;
function ClearResponseNotification: TResponseNotification;
function ClearSystem: TSystem;
function ClearResponseRespTecCSRT: TResponseRespTecCSRT;
function ClearRespTecCSRT: TRespTecCSRT;
function ClearUser: TUser;
function ClearCertificate: TCertificate;
function ClearEndereco: TEndereco;
function ClearEmit: TEmit;
function ClearNFCeUser: TNFCeUser;
function ClearResponseEmissionNFeNFCe: TResponseEmissionNFeNFCe;
function ClearConsultSefazNFeNFCe: TConsultSefazNFeNFCe;
function ClearResponseCancelNFeNFCe: TResponseCancelNFeNFCe;
function ClearResponseDisenableNFeNFCe: TResponseDisenableNFeNFCe;
function ClearResponseCorrectionNFe: TResponseCorrectionNFe;
function ClearResponseConsultCancelNFeNFCe: TResponseConsultCancelNFeNFCe;
function ClearResponseConsultDisenableNFeNFCe: TResponseConsultDisenableNFeNFCe;
function ClearResponseConsultCorrectionNFe: TResponseConsultCorrectionNFe;
function ClearResponseConsultXMLNFeNFCe: TResponseConsultXMLNFeNFCe;
function ClearResponseConsultDANFeDANFCe: TResponseConsultDANFeDANFCe;
function ClearResponseConsultNFeNFCe: TResponseConsultNFeNFCe;
function ClearResponseConsultSefazNFeNFCe: TResponseConsultSefazNFeNFCe;
function ClearResponseEventCancelPrint: TResponseEventCancelPrint;
function ClearResponseEventDisenablePrint: TResponseEventDisenablePrint;
function ClearResponseEventCorrectionPrint: TResponseEventCorrectionPrint;
function ClearStatusService: TStatusService;
function ClearResponseXMLNFeNFCe: TResponseXMLNFeNFCe;
function ClearResponseDANFeDANFCe: TResponseDANFeDANFCe;
function ClearEventCancelPrint: TEventCancelPrint;
function ClearEventCorrectionPrint: TEventCorrectionPrint;
function ClearEventDisenablePrint: TEventDisenablePrint;
function ClearNotification: TNotification;
function ClearResponseDanfPDF: TResponseDanfPDF;
function ClearDanfPDF: TDanfPDF;

implementation

function ClearError: TError;
begin
  Result.statusCode := 0;
  Result.error := '';
  SetLength(Result.messageList, 0);
end;

function ClearResponse: TResponseAPI;
begin
  Result.statusCode := 0;
  Result.StatusText := '';
  Result.Content := '';
  Result.error := ClearError;
end;

function ClearResponseAPIPages: TResponseAPIPages;
begin
  Result.currentPage := 0;
  Result.totalPages := 0;
  Result.totalItens := 0;
end;

function ClearAccessToken: TAccessToken;
begin
  Result.accessToken := '';
  Result.expiresAt := 0;
end;

function ClearResponseSystem: TResponseSystem;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListSystem, 0);
end;

function ClearResponseUser: TResponseUser;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListUser, 0);
end;

function ClearResponseNotification: TResponseNotification;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListNotification, 0);
end;

function ClearSystem: TSystem;
begin
  Result.idSystem := '';
  Result.nameCompany := '';
  Result.nameSystem := '';
  Result.Email := '';
  Result.CNPJ := '';
  Result.timezone := tzLess0300;
  Result.createAt := 0;
  Result.updatedAt := 0;
  Result.deletedAt := 0;
end;

function ClearResponseRespTecCSRT: TResponseRespTecCSRT;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListRespTecCSRT, 0);
end;

function ClearRespTecCSRT: TRespTecCSRT;
begin
  Result.cUF := 0;
  Result.idCSRT := 0;
  Result.CSRT := '';
end;

function ClearUser: TUser;
begin
  Result.idUser := '';
  Result.idExternal := '';
  Result.name := '';
  Result.Email := '';
  Result.CNPJ := '';
  Result.timezone := tzLess0300;
  Result.notification := False;
  Result.expirationCertificate := 0;
  Result.nfce := ClearNFCeUser;
  Result.emit := ClearEmit;
  SetLength(Result.autXML, 0);
  Result.createAt := 0;
  Result.updatedAt := 0;
  Result.deletedAt := 0;
end;

function ClearCertificate: TCertificate;
begin
  Result.NumeroSerie := '';
  Result.RazaoSocial := '';
  Result.CNPJ := '';
  Result.Validade := 0;
  Result.Certificadora := '';
end;

function ClearEndereco: TEndereco;
begin
  Result.xLgr := '';
  Result.nro := '';
  Result.xCpl := '';
  Result.xBairro := '';
  Result.cMun := 0;
  Result.xMun := '';
  Result.UF := '';
  Result.CEP := '';
  Result.cPais := 0;
  Result.xPais := '';
  Result.fone := '';
end;

function ClearEmit: TEmit;
begin
  Result.CNPJCPF := '';
  Result.xNome := '';
  Result.xFant := '';
  Result.IE := '';
  Result.IEST := '';
  Result.IM := '';
  Result.CNAE := '';
  Result.CRT := crtRegimeNormal; // Padrão
  Result.enderEmit := ClearEndereco;
end;

function ClearNFCeUser: TNFCeUser;
begin
  Result.CSC := '';
  Result.IdCSC := '';
  Result.versaoQRCode := vqc0;
end;

function ClearResponseEmissionNFeNFCe: TResponseEmissionNFeNFCe;
begin
  Result.chDfe := '';
  Result.cStat := 0;
  Result.dhEmi := 0;
  Result.DhRecbto := 0;
  Result.digVal := '';
  Result.idBatch := '';
  Result.idDfe := '';
  Result.idExternal := '';
  Result.nNF := 0;
  Result.vNF := 0;
  Result.nProt := '';
  Result.nRec := '';
  Result.serie := 0;
  Result.situationDfe := tsdaEmAberto;
  Result.situation := tsaReceived;
  Result.tpAmb := taProducao;
  Result.xMotivo := '';
  Result.pdfBase64 := '';
  Result.pdfLink := '';
  Result.xml := '';
  Result.xmlLink := '';
end;

function ClearConsultSefazNFeNFCe: TConsultSefazNFeNFCe;
begin
  Result.cStat := 0;
  Result.cUF := 0;
  Result.chDfe := '';
  Result.DhRecbto := 0;
  Result.digVal := '';
  Result.Msg := '';
  Result.TMed := 0;
  Result.VerAplic := '';
  Result.Versao := '';
  Result.xMotivo := '';
  Result.cMsg := 0;
  Result.tpAmb := taProducao;
  Result.xMsg := '';
end;

function ClearResponseCancelNFeNFCe: TResponseCancelNFeNFCe;
begin
  Result.idCan := '';
  Result.idDfe := '';
  Result.idBatch := '';
  Result.xJust := '';
  Result.dhEnv := 0;
  Result.cStat := 0;
  Result.dhRegEvento := 0;
  Result.nProtCan := '';
  Result.CNPJDest := '';
  Result.cOrgao := 0;
  Result.chDfe := '';
  Result.digVal := '';
  Result.emailDest := '';
  Result.tpAmb := taProducao;
  Result.xMotivo := '';
  Result.situation := tsaReceived;
  Result.xml := '';
  Result.xmlLink := '';
  Result.pdfBase64 := '';
  Result.pdfLink := '';
end;

function ClearResponseDisenableNFeNFCe: TResponseDisenableNFeNFCe;
begin
  Result.cStat := 0;
  Result.DhRecbto := 0;
  Result.tpAmb := taProducao;
  Result.xMotivo := '';
  Result.nProtInu := '';
  Result.situation := tsaReceived;
  Result.xml := '';
  Result.xmlLink := '';
  Result.pdfBase64 := '';
  Result.pdfLink := '';
  Result.idInu := '';
  Result.idBatch := '';
  Result.ano := 0;
  Result.serie := 0;
  Result.nNFIni := 0;
  Result.nNFFin := 0;
  Result.xJust := '';
  Result.dhEnv := 0;
end;

function ClearResponseCorrectionNFe: TResponseCorrectionNFe;
begin
  Result.cStat := 0;
  Result.dhRegEvento := 0;
  Result.CNPJDest := '';
  Result.nProtCce := '';
  Result.cOrgao := 0;
  Result.tpAmb := taProducao;
  Result.xMotivo := '';
  Result.situation := tsaReceived;
  Result.xml := '';
  Result.xmlLink := '';
  Result.pdfBase64 := '';
  Result.pdfLink := '';
  Result.idCce := '';
  Result.idBatch := '';
  Result.idDfe := '';
  Result.chDfe := '';
  Result.xCorrecao := '';
  Result.digVal := '';
  Result.dhEnv := 0;
  Result.nSeqEvento := 0;
end;

function ClearResponseConsultCancelNFeNFCe: TResponseConsultCancelNFeNFCe;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListEvent, 0);
end;

function ClearResponseConsultDisenableNFeNFCe: TResponseConsultDisenableNFeNFCe;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListEvent, 0);
end;

function ClearResponseConsultCorrectionNFe: TResponseConsultCorrectionNFe;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListEvent, 0);
end;

function ClearResponseConsultXMLNFeNFCe: TResponseConsultXMLNFeNFCe;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListXML, 0);
end;

function ClearResponseConsultDANFeDANFCe: TResponseConsultDANFeDANFCe;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListDANFeDANFCe, 0);
end;

function ClearResponseConsultNFeNFCe: TResponseConsultNFeNFCe;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListNFeNFCe, 0);
end;

function ClearResponseConsultSefazNFeNFCe: TResponseConsultSefazNFeNFCe;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListNFeNFCe, 0);
end;

function ClearResponseEventCancelPrint: TResponseEventCancelPrint;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListEvent, 0);
end;

function ClearResponseEventDisenablePrint: TResponseEventDisenablePrint;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListEvent, 0);
end;

function ClearResponseEventCorrectionPrint: TResponseEventCorrectionPrint;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListEvent, 0);
end;

function ClearStatusService: TStatusService;
begin
  Result.cStat := 0;
  Result.cUF := 0;
  Result.DhRecbto := 0;
  Result.DhRetorno := 0;
  Result.Msg := '';
  Result.TMed := 0;
  Result.VerAplic := '';
  Result.Versao := '';
  Result.xMotivo := '';
  Result.xObs := '';
  Result.tpAmb := taProducao;
  Result.responseTime := 0;
end;

function ClearResponseXMLNFeNFCe: TResponseXMLNFeNFCe;
begin
  Result.idDfe := '';
  Result.idExternal := '';
  Result.xml := '';
  Result.xmlLink := '';
  Result.serie := 0;
  Result.chDfe := '';
  Result.tpAmb := taProducao;
  Result.nNF := 0;
  Result.dhEmi := 0;
end;

function ClearResponseDANFeDANFCe: TResponseDANFeDANFCe;
begin
  Result.idDfe := '';
  Result.idExternal := '';
  Result.pdfBase64 := '';
  Result.pdfLink := '';
  Result.serie := 0;
  Result.nNF := 0;
  Result.chDfe := '';
  Result.tpAmb := taProducao;
end;

function ClearEventCancelPrint: TEventCancelPrint;
begin
  Result.idCan := '';
  Result.idDfe := '';
  Result.chDfe := '';
  Result.tpAmb := taProducao;
  Result.pdfBase64 := '';
  Result.pdfLink := '';
  Result.dhEnv := 0;
end;

function ClearEventCorrectionPrint: TEventCorrectionPrint;
begin
  Result.idCce := '';
  Result.idDfe := '';
  Result.chDfe := '';
  Result.tpAmb := taProducao;
  Result.pdfBase64 := '';
  Result.pdfLink := '';
  Result.dhEnv := 0;
end;

function ClearEventDisenablePrint: TEventDisenablePrint;
begin
  Result.idInu := '';
  Result.tpAmb := taProducao;
  Result.pdfBase64 := '';
  Result.pdfLink := '';
  Result.dhEnv := 0;
end;

function ClearNotification: TNotification;
begin
  Result.Email := '';
  Result.TypeNotification := ttnAll;
end;

function ClearResponseDanfPDF: TResponseDanfPDF;
begin
  Result.Pages := ClearResponseAPIPages;
  SetLength(Result.ListDanfPDF, 0);
end;

function ClearDanfPDF: TDanfPDF;
begin
  Result.pdfBase64 := '';
  Result.pdfLink := '';
end;

end.

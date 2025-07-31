unit uDadosJahDFeConsts;

interface

Const
  URLBASE = 'https://api-notas-api.jdmo92.easypanel.host/';

  STR_NFE = 'NFe (modelo 55)';
  STR_NFCE = 'NFCe (modelo 65)';

  // *AUTENTICA��O* //
  STR_LOGIN_SYSTEM = 'Requisi��o de login: System.';
  STR_LOGIN_USER = 'Requisi��o de login: User.';
  STR_LOGIN_ERRO = 'Erro ao tentar realizar login.';

  STR_FORGET_SYSTEM = 'Requisi��o de solicita��o de troca de senha: System.';
  STR_FORGET_USER = 'Requisi��o de solicita��o de troca de senha: User.';
  STR_FORGET_ERRO = 'Erro ao solicitar troca de senha.';

  STR_RESET_SYSTEM = 'Requisi��o de atualiza��o de token: System.';
  STR_RESET_USER = 'Requisi��o de atualiza��o de token: User.';
  STR_RESET_ERRO = 'Erro ao tentar realizar atualizar o token.';

  STR_LOGOUT_SYSTEM = 'Requisi��o de logout: System.';
  STR_LOGOUT_USER = 'Requisi��o de logout: User.';
  STR_LOGOUT_ERRO = 'Erro ao tentar realizar logout.';

  // *SYSTEM* //
  STR_SYSTEM_MODIFY = 'Requisi��o de Modifica��o de dados do System.';
  STR_SYSTEM_MODIFY_ERRO = 'Erro ao tentar alterar dados do System.';

  STR_SYSTEM_MY_ACCOUNT = 'Requisi��o de dados da conta do System.';
  STR_SYSTEM_MY_ACCOUNT_ERRO = 'Erro ao consultar dados da conta do System.';

  STR_SYSTEM_RESPTECCSRT = 'Requisi��o de Modifica��o de dados do Respons�vel T�cnico do System.';
  STR_SYSTEM_RESPTECCSRT_ERRO = 'Erro ao tentar modificar dados do Respons�vel T�cnico do System.';

  // *USER* //
  STR_USER_MODIFY = 'Requisi��o de Modifica��o de dados do usu�rio.';
  STR_USER_MODIFY_ERRO = 'Erro ao tentar alterar dados do usu�rio. ';

  STR_USER_DELETE = 'Requisi��o de inativa��o do usu�rio.';
  STR_USER_DELETE_ERRO = 'Erro ao tentar inativar usu�rio. ';

  STR_USER_RESTORE = 'Requisi��o de restaura��o do usu�rio.';
  STR_USER_RESTORE_ERRO = 'Erro ao tentar restaura��o usu�rio. ';

  STR_USER_LIST = 'Requisi��o de listagem dos usu�rios.';
  STR_USER_LIST_ERRO = 'Erro ao tentar listar os usu�rios. ';

  STR_USER_ADD = 'Requisi��o de cadastro do usu�rio.';
  STR_USER_ADD_ERRO = 'Erro ao tentar cadastrar o usu�rio. ';

  STR_USER_GET = 'Requisi��o de pesquisa do usu�rio.';
  STR_USER_GET_ERRO = 'Erro ao tentar pesquisar o usu�rio. ';

  STR_USER_MY_ACCOUNT = 'Requisi��o de dados da conta do usu�rio.';
  STR_USER_MY_ACCOUNT_ERRO = 'Erro ao consultar dados da conta do usu�rio.';

  STR_NOTIFICATION_LIST = 'Requisi��o de listagem das notifica��es.';
  STR_NOTIFICATION_LIST_ERRO = 'Erro ao tentar listar as notifica��es.';

  STR_NOTIFICATION_ADD = 'Requisi��o de cadastro da notifica��o.';
  STR_NOTIFICATION_ADD_ERRO = 'Erro ao tentar cadastrar as notifica��es.';

  STR_NOTIFICATION_DELETE = 'Requisi��o de exclus�o da notifica��o.';
  STR_NOTIFICATION_DELETE_ERRO = 'Erro ao tentar excluir as notifica��es.';

  STR_CERTIFICATE_ADD = 'Requisi��o de cadastro do certificado digital.';
  STR_CERTIFICATE_ADD_ERRO = 'Erro ao tentar cadastrar o certificado digital.';

  STR_CERTIFICATE_GET = 'Requisi��o de pesquisa do certificado digital.';
  STR_CERTIFICATE_GET_ERRO = 'Erro ao tentar pesquisar o certificado digital.';

  STR_EMIT_ADD = 'Requisi��o de cadastro do emitente.';
  STR_EMIT_ADD_ERRO = 'Erro ao tentar cadastrar o emitente.';

  STR_EMIT_GET = 'Requisi��o de pesquisa do emitente.';
  STR_EMIT_GET_ERRO = 'Erro ao tentar pesquisar o emitente.';

  STR_AUT_XML_ADD = 'Requisi��o de cadastro de autoriza��o de xml.';
  STR_AUT_XML_ADD_ERRO = 'Erro ao tentar cadastrar a autoriza��o de xml.';

  STR_AUT_XML_GET = 'Requisi��o de pesquisa do emitente.';
  STR_AUT_XML_GET_ERRO = 'Erro ao tentar pesquisar a autoriza��o de xml.';

  // *NFE* //
  STR_NFE_EMISSION_ASSYNC = 'Requisi��o de Emiss�o de ' + STR_NFE + ' em modo assincrono.';
  STR_NFE_EMISSION_ASSYNC_ERRO = 'Erro ao tentar emitir ' + STR_NFE + ' em modo assincrono.';

  STR_NFE_EMISSION_SYNC = 'Requisi��o de Emiss�o de ' + STR_NFE + ' em modo sincrono.';
  STR_NFE_EMISSION_SYNC_ERRO = 'Erro ao tentar emitir ' + STR_NFE + ' em modo sincrono.';

  STR_NFE_CANCEL_ASSYNC = 'Requisi��o de cancelamento da ' + STR_NFE + ' em modo assincrono.';
  STR_NFE_CANCEL_ASSYNC_ERRO = 'Erro ao tentar cancelar ' + STR_NFE + ' em modo assincrono.';

  STR_NFE_CANCEL_SYNC = 'Requisi��o de cancelamento da ' + STR_NFE + ' em modo sincrono.';
  STR_NFE_CANCEL_SYNC_ERRO = 'Erro ao tentar cancelar ' + STR_NFE + ' em modo sincrono.';

  STR_NFE_DISENABLE_ASSYNC = 'Requisi��o de Inutiliza��o de ' + STR_NFE + ' em modo assincrono.';
  STR_NFE_DISENABLE_ASSYNC_ERRO = 'Erro ao tentar inutilizar ' + STR_NFE + ' em modo assincrono.';

  STR_NFE_DISENABLE_SYNC = 'Requisi��o de Inutiliza��o de ' + STR_NFE + ' em modo sincrono.';
  STR_NFE_DISENABLE_SYNC_ERRO = 'Erro ao tentar inutilizar ' + STR_NFE + ' em modo sincrono.';

  STR_NFE_CORRECTION_ASSYNC = 'Requisi��o de Emiss�o da Carta de Corre��o de ' + STR_NFE + ' em modo assincrono.';
  STR_NFE_CORRECTION_ASSYNC_ERRO = 'Erro ao tentar emitir carta de corre��o da ' + STR_NFE + ' em modo assincrono.';

  STR_NFE_CORRECTION_SYNC = 'Requisi��o de Emiss�o da Carta de Corre��o de ' + STR_NFE + ' em modo sincrono.';
  STR_NFE_CORRECTION_SYNC_ERRO = 'Erro ao tentar emitir carta de corre��o da ' + STR_NFE + ' em modo sincrono.';

  STR_NFE_EVENT_CANCEL_GET = 'Requisi��o de consulta do evento de cancelamento da ' + STR_NFE + '.';
  STR_NFE_EVENT_CANCEL_GET_ERRO = 'Erro ao tentar consultar evento de cancelamento da ' + STR_NFE + '.';

  STR_NFE_EVENT_DISENABLE_GET = 'Requisi��o de consulta do evento de inutiliza��o da ' + STR_NFE + '.';
  STR_NFE_EVENT_DISENABLE_GET_ERRO = 'Erro ao tentar consultar evento de inutiliza��o da ' + STR_NFE + '.';

  STR_NFE_EVENT_CORRECTION_GET = 'Requisi��o de consulta do evento de carta de corre��o da ' + STR_NFE + '.';
  STR_NFE_EVENT_CORRECTION_GET_ERRO = 'Erro ao tentar consultar evento de carta de corre��o da ' + STR_NFE + '.';

  STR_NFE_XML_GET = 'Requisi��o de download do XML da ' + STR_NFE + '.';
  STR_NFE_XML_GET_ERRO = 'Erro ao tentar tentar baixar o XML da ' + STR_NFE + '.';

  STR_NFE_DANFE_GET = 'Requisi��o de download do DANFe da ' + STR_NFE + '.';
  STR_NFE_DANFE_GET_ERRO = 'Erro ao tentar tentar baixar o DANFe da ' + STR_NFE + '.';

  STR_NFE_GET_NFE = 'Requisi��o de consulta da ' + STR_NFE + '.';
  STR_NFE_GET_NFE_ERRO = 'Erro ao tentar consultar a ' + STR_NFE + '.';

  STR_NFE_EVENT_CANCEL_PRINT_GET = 'Requisi��o de impress�o do evento de cancelamento da ' + STR_NFE + '.';
  STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO = 'Erro ao tentar gerar pdf do evento de cancelamento da ' + STR_NFE + '.';

  STR_NFE_EVENT_DISENABLE_PRINT_GET = 'Requisi��o de impress�o do evento de inutiliza��o da ' + STR_NFE + '.';
  STR_NFE_EVENT_DISENABLE_PRINT_GET_ERRO = 'Erro ao tentar gerar pdf do evento de inutiliza��o da ' + STR_NFE + '.';

  STR_NFE_EVENT_CORRECTION_PRINT_GET = 'Requisi��o de impress�o do evento de carta de corre��o da ' + STR_NFE + '.';
  STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO = 'Erro ao tentar gerar pdf do evento de carta de corre��o da ' + STR_NFE + '.';

  STR_NFE_SERVICE_STATUS = 'Requisi��o de visualiza��o do status do servi�o da ' + STR_NFE + '.';
  STR_NFE_SERVICE_STATUS_ERRO = 'Erro ao tentar visualizar o status do servi�o da ' + STR_NFE + '.';

  // *NFCE* //
  STR_NFCE_EMISSION_ASSYNC = 'Requisi��o de Emiss�o de ' + STR_NFCE + ' em modo assincrono.';
  STR_NFCE_EMISSION_ASSYNC_ERRO = 'Erro ao tentar emitir ' + STR_NFCE + ' em modo assincrono.';

  STR_NFCE_EMISSION_SYNC = 'Requisi��o de Emiss�o de ' + STR_NFCE + ' em modo sincrono.';
  STR_NFCE_EMISSION_SYNC_ERRO = 'Erro ao tentar emitir ' + STR_NFCE + ' em modo sincrono.';

  STR_NFCE_CANCEL_ASSYNC = 'Requisi��o de cancelamento da ' + STR_NFCE + ' em modo assincrono.';
  STR_NFCE_CANCEL_ASSYNC_ERRO = 'Erro ao tentar cancelar ' + STR_NFCE + ' em modo assincrono.';

  STR_NFCE_CANCEL_SYNC = 'Requisi��o de cancelamento da ' + STR_NFCE + ' em modo sincrono.';
  STR_NFCE_CANCEL_SYNC_ERRO = 'Erro ao tentar cancelar ' + STR_NFCE + ' em modo sincrono.';

  STR_NFCE_DISENABLE_ASSYNC = 'Requisi��o de Inutiliza��o de ' + STR_NFCE + ' em modo assincrono.';
  STR_NFCE_DISENABLE_ASSYNC_ERRO = 'Erro ao tentar inutilizar ' + STR_NFCE + ' em modo assincrono.';

  STR_NFCE_DISENABLE_SYNC = 'Requisi��o de Inutiliza��o de ' + STR_NFCE + ' em modo sincrono.';
  STR_NFCE_DISENABLE_SYNC_ERRO = 'Erro ao tentar inutilizar ' + STR_NFCE + ' em modo sincrono.';

  STR_NFCE_EVENT_CANCEL_GET = 'Requisi��o de consulta do evento de cancelamento da ' + STR_NFCE + '.';
  STR_NFCE_EVENT_CANCEL_GET_ERRO = 'Erro ao tentar consultar evento de cancelamento da ' + STR_NFCE + '.';

  STR_NFCE_EVENT_DISENABLE_GET = 'Requisi��o de consulta do evento de inutiliza��o da ' + STR_NFCE + '.';
  STR_NFCE_EVENT_DISENABLE_GET_ERRO = 'Erro ao tentar consultar evento de inutiliza��o da ' + STR_NFCE + '.';

  STR_NFCE_XML_GET = 'Requisi��o de download do XML da ' + STR_NFCE + '.';
  STR_NFCE_XML_GET_ERRO = 'Erro ao tentar tentar baixar o XML da ' + STR_NFCE + '.';

  STR_NFCE_DANFCE_GET = 'Requisi��o de download do DANFCe da ' + STR_NFCE + '.';
  STR_NFCE_DANFCE_GET_ERRO = 'Erro ao tentar tentar baixar o DANFCe da ' + STR_NFCE + '.';

  STR_NFCE_GET_NFCE = 'Requisi��o de consulta da ' + STR_NFCE + '.';
  STR_NFCE_GET_NFCE_ERRO = 'Erro ao tentar consultar a ' + STR_NFCE + '.';

  STR_NFCE_EVENT_CANCEL_PRINT_GET = 'Requisi��o de impress�o do evento de cancelamento da ' + STR_NFCE + '.';
  STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO = 'Erro ao tentar gerar pdf do evento de cancelamento da ' + STR_NFCE + '.';

  STR_NFCE_EVENT_DISENABLE_PRINT_GET = 'Requisi��o de impress�o do evento de inutiliza��o da ' + STR_NFCE + '.';
  STR_NFCE_EVENT_DISENABLE_PRINT_GET_ERRO = 'Erro ao tentar gerar pdf do evento de inutiliza��o da ' + STR_NFCE + '.';

  STR_NFCE_SERVICE_STATUS = 'Requisi��o de visualiza��o do status do servi�o da ' + STR_NFCE + '.';
  STR_NFCE_SERVICE_STATUS_ERRO = 'Erro ao tentar visualizar o status do servi�o da ' + STR_NFCE + '.';

  FORMAT_DEC_02 = '0.00';
  FORMAT_DEC_03 = '0.000';
  FORMAT_DEC_04 = '0.0000';
  FORMAT_DEC_05 = '0.00000';
  FORMAT_DEC_06 = '0.000000';
  FORMAT_DEC_07 = '0.0000000';
  FORMAT_DEC_08 = '0.00000000';
  FORMAT_DEC_10 = '0.0000000000';

implementation

end.

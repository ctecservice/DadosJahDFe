unit uDadosJahDFeConsts;

interface

Const
  URLBASE = 'https://api-notas-api.jdmo92.easypanel.host/';

  STR_NFE = 'NFe (modelo 55)';
  STR_NFCE = 'NFCe (modelo 65)';

  // *AUTENTICAÇÃO* //
  STR_LOGIN_SYSTEM = 'Requisição de login: System.';
  STR_LOGIN_USER = 'Requisição de login: User.';
  STR_LOGIN_ERRO = 'Erro ao tentar realizar login.';

  STR_FORGET_SYSTEM = 'Requisição de solicitação de troca de senha: System.';
  STR_FORGET_USER = 'Requisição de solicitação de troca de senha: User.';
  STR_FORGET_ERRO = 'Erro ao solicitar troca de senha.';

  STR_RESET_SYSTEM = 'Requisição de atualização de token: System.';
  STR_RESET_USER = 'Requisição de atualização de token: User.';
  STR_RESET_ERRO = 'Erro ao tentar realizar atualizar o token.';

  STR_LOGOUT_SYSTEM = 'Requisição de logout: System.';
  STR_LOGOUT_USER = 'Requisição de logout: User.';
  STR_LOGOUT_ERRO = 'Erro ao tentar realizar logout.';

  // *SYSTEM* //
  STR_SYSTEM_MODIFY = 'Requisição de Modificação de dados do System.';
  STR_SYSTEM_MODIFY_ERRO = 'Erro ao tentar alterar dados do System.';

  STR_SYSTEM_MY_ACCOUNT = 'Requisição de dados da conta do System.';
  STR_SYSTEM_MY_ACCOUNT_ERRO = 'Erro ao consultar dados da conta do System.';

  STR_SYSTEM_RESPTECCSRT = 'Requisição de Modificação de dados do Responsável Técnico do System.';
  STR_SYSTEM_RESPTECCSRT_ERRO = 'Erro ao tentar modificar dados do Responsável Técnico do System.';

  // *USER* //
  STR_USER_MODIFY = 'Requisição de Modificação de dados do usuário.';
  STR_USER_MODIFY_ERRO = 'Erro ao tentar alterar dados do usuário. ';

  STR_USER_DELETE = 'Requisição de inativação do usuário.';
  STR_USER_DELETE_ERRO = 'Erro ao tentar inativar usuário. ';

  STR_USER_RESTORE = 'Requisição de restauração do usuário.';
  STR_USER_RESTORE_ERRO = 'Erro ao tentar restauração usuário. ';

  STR_USER_LIST = 'Requisição de listagem dos usuários.';
  STR_USER_LIST_ERRO = 'Erro ao tentar listar os usuários. ';

  STR_USER_ADD = 'Requisição de cadastro do usuário.';
  STR_USER_ADD_ERRO = 'Erro ao tentar cadastrar o usuário. ';

  STR_USER_GET = 'Requisição de pesquisa do usuário.';
  STR_USER_GET_ERRO = 'Erro ao tentar pesquisar o usuário. ';

  STR_USER_MY_ACCOUNT = 'Requisição de dados da conta do usuário.';
  STR_USER_MY_ACCOUNT_ERRO = 'Erro ao consultar dados da conta do usuário.';

  STR_NOTIFICATION_LIST = 'Requisição de listagem das notificações.';
  STR_NOTIFICATION_LIST_ERRO = 'Erro ao tentar listar as notificações.';

  STR_NOTIFICATION_ADD = 'Requisição de cadastro da notificação.';
  STR_NOTIFICATION_ADD_ERRO = 'Erro ao tentar cadastrar as notificações.';

  STR_NOTIFICATION_DELETE = 'Requisição de exclusão da notificação.';
  STR_NOTIFICATION_DELETE_ERRO = 'Erro ao tentar excluir as notificações.';

  STR_CERTIFICATE_ADD = 'Requisição de cadastro do certificado digital.';
  STR_CERTIFICATE_ADD_ERRO = 'Erro ao tentar cadastrar o certificado digital.';

  STR_CERTIFICATE_GET = 'Requisição de pesquisa do certificado digital.';
  STR_CERTIFICATE_GET_ERRO = 'Erro ao tentar pesquisar o certificado digital.';

  STR_EMIT_ADD = 'Requisição de cadastro do emitente.';
  STR_EMIT_ADD_ERRO = 'Erro ao tentar cadastrar o emitente.';

  STR_EMIT_GET = 'Requisição de pesquisa do emitente.';
  STR_EMIT_GET_ERRO = 'Erro ao tentar pesquisar o emitente.';

  STR_AUT_XML_ADD = 'Requisição de cadastro de autorização de xml.';
  STR_AUT_XML_ADD_ERRO = 'Erro ao tentar cadastrar a autorização de xml.';

  STR_AUT_XML_GET = 'Requisição de pesquisa do emitente.';
  STR_AUT_XML_GET_ERRO = 'Erro ao tentar pesquisar a autorização de xml.';

  // *NFE* //
  STR_NFE_EMISSION_ASSYNC = 'Requisição de Emissão de ' + STR_NFE + ' em modo assincrono.';
  STR_NFE_EMISSION_ASSYNC_ERRO = 'Erro ao tentar emitir ' + STR_NFE + ' em modo assincrono.';

  STR_NFE_EMISSION_SYNC = 'Requisição de Emissão de ' + STR_NFE + ' em modo sincrono.';
  STR_NFE_EMISSION_SYNC_ERRO = 'Erro ao tentar emitir ' + STR_NFE + ' em modo sincrono.';

  STR_NFE_CANCEL_ASSYNC = 'Requisição de cancelamento da ' + STR_NFE + ' em modo assincrono.';
  STR_NFE_CANCEL_ASSYNC_ERRO = 'Erro ao tentar cancelar ' + STR_NFE + ' em modo assincrono.';

  STR_NFE_CANCEL_SYNC = 'Requisição de cancelamento da ' + STR_NFE + ' em modo sincrono.';
  STR_NFE_CANCEL_SYNC_ERRO = 'Erro ao tentar cancelar ' + STR_NFE + ' em modo sincrono.';

  STR_NFE_DISENABLE_ASSYNC = 'Requisição de Inutilização de ' + STR_NFE + ' em modo assincrono.';
  STR_NFE_DISENABLE_ASSYNC_ERRO = 'Erro ao tentar inutilizar ' + STR_NFE + ' em modo assincrono.';

  STR_NFE_DISENABLE_SYNC = 'Requisição de Inutilização de ' + STR_NFE + ' em modo sincrono.';
  STR_NFE_DISENABLE_SYNC_ERRO = 'Erro ao tentar inutilizar ' + STR_NFE + ' em modo sincrono.';

  STR_NFE_CORRECTION_ASSYNC = 'Requisição de Emissão da Carta de Correção de ' + STR_NFE + ' em modo assincrono.';
  STR_NFE_CORRECTION_ASSYNC_ERRO = 'Erro ao tentar emitir carta de correção da ' + STR_NFE + ' em modo assincrono.';

  STR_NFE_CORRECTION_SYNC = 'Requisição de Emissão da Carta de Correção de ' + STR_NFE + ' em modo sincrono.';
  STR_NFE_CORRECTION_SYNC_ERRO = 'Erro ao tentar emitir carta de correção da ' + STR_NFE + ' em modo sincrono.';

  STR_NFE_EVENT_CANCEL_GET = 'Requisição de consulta do evento de cancelamento da ' + STR_NFE + '.';
  STR_NFE_EVENT_CANCEL_GET_ERRO = 'Erro ao tentar consultar evento de cancelamento da ' + STR_NFE + '.';

  STR_NFE_EVENT_DISENABLE_GET = 'Requisição de consulta do evento de inutilização da ' + STR_NFE + '.';
  STR_NFE_EVENT_DISENABLE_GET_ERRO = 'Erro ao tentar consultar evento de inutilização da ' + STR_NFE + '.';

  STR_NFE_EVENT_CORRECTION_GET = 'Requisição de consulta do evento de carta de correção da ' + STR_NFE + '.';
  STR_NFE_EVENT_CORRECTION_GET_ERRO = 'Erro ao tentar consultar evento de carta de correção da ' + STR_NFE + '.';

  STR_NFE_XML_GET = 'Requisição de download do XML da ' + STR_NFE + '.';
  STR_NFE_XML_GET_ERRO = 'Erro ao tentar tentar baixar o XML da ' + STR_NFE + '.';

  STR_NFE_DANFE_GET = 'Requisição de download do DANFe da ' + STR_NFE + '.';
  STR_NFE_DANFE_GET_ERRO = 'Erro ao tentar tentar baixar o DANFe da ' + STR_NFE + '.';

  STR_NFE_GET_NFE = 'Requisição de consulta da ' + STR_NFE + '.';
  STR_NFE_GET_NFE_ERRO = 'Erro ao tentar consultar a ' + STR_NFE + '.';

  STR_NFE_EVENT_CANCEL_PRINT_GET = 'Requisição de impressão do evento de cancelamento da ' + STR_NFE + '.';
  STR_NFE_EVENT_CANCEL_PRINT_GET_ERRO = 'Erro ao tentar gerar pdf do evento de cancelamento da ' + STR_NFE + '.';

  STR_NFE_EVENT_DISENABLE_PRINT_GET = 'Requisição de impressão do evento de inutilização da ' + STR_NFE + '.';
  STR_NFE_EVENT_DISENABLE_PRINT_GET_ERRO = 'Erro ao tentar gerar pdf do evento de inutilização da ' + STR_NFE + '.';

  STR_NFE_EVENT_CORRECTION_PRINT_GET = 'Requisição de impressão do evento de carta de correção da ' + STR_NFE + '.';
  STR_NFE_EVENT_CORRECTION_PRINT_GET_ERRO = 'Erro ao tentar gerar pdf do evento de carta de correção da ' + STR_NFE + '.';

  STR_NFE_SERVICE_STATUS = 'Requisição de visualização do status do serviço da ' + STR_NFE + '.';
  STR_NFE_SERVICE_STATUS_ERRO = 'Erro ao tentar visualizar o status do serviço da ' + STR_NFE + '.';

  // *NFCE* //
  STR_NFCE_EMISSION_ASSYNC = 'Requisição de Emissão de ' + STR_NFCE + ' em modo assincrono.';
  STR_NFCE_EMISSION_ASSYNC_ERRO = 'Erro ao tentar emitir ' + STR_NFCE + ' em modo assincrono.';

  STR_NFCE_EMISSION_SYNC = 'Requisição de Emissão de ' + STR_NFCE + ' em modo sincrono.';
  STR_NFCE_EMISSION_SYNC_ERRO = 'Erro ao tentar emitir ' + STR_NFCE + ' em modo sincrono.';

  STR_NFCE_CANCEL_ASSYNC = 'Requisição de cancelamento da ' + STR_NFCE + ' em modo assincrono.';
  STR_NFCE_CANCEL_ASSYNC_ERRO = 'Erro ao tentar cancelar ' + STR_NFCE + ' em modo assincrono.';

  STR_NFCE_CANCEL_SYNC = 'Requisição de cancelamento da ' + STR_NFCE + ' em modo sincrono.';
  STR_NFCE_CANCEL_SYNC_ERRO = 'Erro ao tentar cancelar ' + STR_NFCE + ' em modo sincrono.';

  STR_NFCE_DISENABLE_ASSYNC = 'Requisição de Inutilização de ' + STR_NFCE + ' em modo assincrono.';
  STR_NFCE_DISENABLE_ASSYNC_ERRO = 'Erro ao tentar inutilizar ' + STR_NFCE + ' em modo assincrono.';

  STR_NFCE_DISENABLE_SYNC = 'Requisição de Inutilização de ' + STR_NFCE + ' em modo sincrono.';
  STR_NFCE_DISENABLE_SYNC_ERRO = 'Erro ao tentar inutilizar ' + STR_NFCE + ' em modo sincrono.';

  STR_NFCE_EVENT_CANCEL_GET = 'Requisição de consulta do evento de cancelamento da ' + STR_NFCE + '.';
  STR_NFCE_EVENT_CANCEL_GET_ERRO = 'Erro ao tentar consultar evento de cancelamento da ' + STR_NFCE + '.';

  STR_NFCE_EVENT_DISENABLE_GET = 'Requisição de consulta do evento de inutilização da ' + STR_NFCE + '.';
  STR_NFCE_EVENT_DISENABLE_GET_ERRO = 'Erro ao tentar consultar evento de inutilização da ' + STR_NFCE + '.';

  STR_NFCE_XML_GET = 'Requisição de download do XML da ' + STR_NFCE + '.';
  STR_NFCE_XML_GET_ERRO = 'Erro ao tentar tentar baixar o XML da ' + STR_NFCE + '.';

  STR_NFCE_DANFCE_GET = 'Requisição de download do DANFCe da ' + STR_NFCE + '.';
  STR_NFCE_DANFCE_GET_ERRO = 'Erro ao tentar tentar baixar o DANFCe da ' + STR_NFCE + '.';

  STR_NFCE_GET_NFCE = 'Requisição de consulta da ' + STR_NFCE + '.';
  STR_NFCE_GET_NFCE_ERRO = 'Erro ao tentar consultar a ' + STR_NFCE + '.';

  STR_NFCE_EVENT_CANCEL_PRINT_GET = 'Requisição de impressão do evento de cancelamento da ' + STR_NFCE + '.';
  STR_NFCE_EVENT_CANCEL_PRINT_GET_ERRO = 'Erro ao tentar gerar pdf do evento de cancelamento da ' + STR_NFCE + '.';

  STR_NFCE_EVENT_DISENABLE_PRINT_GET = 'Requisição de impressão do evento de inutilização da ' + STR_NFCE + '.';
  STR_NFCE_EVENT_DISENABLE_PRINT_GET_ERRO = 'Erro ao tentar gerar pdf do evento de inutilização da ' + STR_NFCE + '.';

  STR_NFCE_SERVICE_STATUS = 'Requisição de visualização do status do serviço da ' + STR_NFCE + '.';
  STR_NFCE_SERVICE_STATUS_ERRO = 'Erro ao tentar visualizar o status do serviço da ' + STR_NFCE + '.';

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

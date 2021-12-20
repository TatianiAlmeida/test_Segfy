*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SEU_NOME}               Joao
${FIELD_NAME}             id=txtNomeCompleto
${EMAIL}                  joao123480@teste.com.br
${FIELD_EMAIL}            id=txtEmail
${TELEFONE}               41988888888
${FIELD_FONE}             id=txtTelefone
${NOME_CORRETORA0}        j00hnaaAao0000ooOcorretora
${FIELD_NAME_CORRETORA}   id=txtEmpresa
${SENHA}                  123456JOAO
${FIELD_PASSWORD}         id=txtSenha
${CHECKBOX}               id=scales
${ACESSAR_PLATAFORMA}     id=btnIniciarAvaliacao
${ACEITAR_COOKIES}        id=hs-eu-confirmation-button
${RECUSAR_PLUGIN}         xpath=//*[@id="modal-plugin___BV_modal_header_"]/button
${ASSINE_SISTEMA}         xpath=//*[@id="step1-navbar"]/div[4]/a
${BTN_CONTRATAR_AGORA}    /html/body/form/div[3]/div[3]/div[2]/div/div/div[2]/div[2]/div/div/div/div/div/div/div/div/div[2]/div/div[2]/div/a
${CPF}                    263.526.740-54
${FIELD_CPF}              id=ContentPlaceHolderMaster_CphMasterAutenticado_informacoesCobranca_txtCpf
${CEP}                    82700420
${FIELD_CEP}              id=ContentPlaceHolderMaster_CphMasterAutenticado_informacoesCobranca_txtCep
${FIELD_ASSINAR}          id=ContentPlaceHolderMaster_CphMasterAutenticado_btnAssinar
${TERMO_ACEITE}           id=cbAceiteTermo
${BTN_CONCLUIR}           id=btnModalTermoSalvar


*** Keywords ***
Abrir Site
    Open Browser  https://villa.segfybeta.com/Publico/Testes/TrialSSO/PaginaTrialSSO.aspx  chrome
    
DADO que o usuario preencha os campos obrigatorios
    input Text  ${FIELD_NAME}   ${SEU_NOME}
    input Text  ${FIELD_EMAIL}   ${EMAIL}
    input Text  ${FIELD_FONE}   ${TELEFONE}
    input Text  ${FIELD_NAME_CORRETORA}   ${NOME_CORRETORA0}
    input Text  ${FIELD_PASSWORD}   ${SENHA}

E aceite os termos
    Click Element   ${CHECKBOX}

ENTÃO deve ser possivel acessar plataforma
    Click Element   ${ACESSAR_PLATAFORMA}
    Sleep           1 minute
    Click Element   ${ACEITAR_COOKIES}
    Sleep           20 seconds
    Click Element   ${RECUSAR_PLUGIN}

DADO que o usuario inicie o processo de assinatura
    Click Element   ${ASSINE_SISTEMA}

E inicie o solicitacao para 1 usuario
    Sleep           10 seconds
    Click Element   ${BTN_CONTRATAR_AGORA}

*** Test Cases ***
Cenário 1: Acessando o site da Segfy
    Abrir Site

Cenário 2: Criar cadastro
    DADO que o usuario preencha os campos obrigatorios
    E aceite os termos
    ENTÃO deve ser possivel acessar plataforma

Cenário 3: Criar assinatura - PF
    DADO que o usuario inicie o processo de assinatura
    E inicie o solicitacao para 1 usuario

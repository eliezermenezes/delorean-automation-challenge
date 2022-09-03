*** Settings ***
Resource        setup-resources.robot

*** Keywords ***

Log in to Kanban
    Wait Until Succeeds    Input Text    ${input.USERNAME}    ${value.USER_EMAIL}
    Wait Until Succeeds    Input Password    ${input.PASSWORD}    ${value.USER_PASSWORD}
    Wait Until Succeeds    Click Button    ${button.LOGIN}

Click on the "Novo Cartão" button
    Wait Until Succeeds    Click Button    ${button.NEW_CARD}

Click on the "Confirmar" button in the create modal
    Wait Until Succeeds    Click Button    ${button.MODAL_CONFIRM}

# Enters
Enter a title for the card
    Wait Until Succeeds    Input Text    ${input.CARD_TITLE}    ${value.TITLE}

Enter a description for the card
    # Clica para abrir o modal do cartão
    ${element}    Replace String    ${label.CARD_NAME}    @title    ${value.TITLE}
    Wait Until Succeeds    Click Element    ${element}
    # Clica para permitir edição no campo de descrição
    Wait Until Succeeds    Click Element    ${kanban.EDITOR_DESCRIPTION}
    # Insere uma descrição para o cartão
    Wait Until Succeeds    Press Keys    ${input.CARD_DESCRIPTION}    ${value.DESCRIPTION}
    Wait Until Succeeds    Click Button    ${button.CONFIRM_ACTION}
    # Fecha o modal
    Wait Until Element Is Not Visible    ${button.CONFIRM_ACTION}
    Wait Until Succeeds    Click Button    ${button.MODAL_CLOSE}

# Selects
Select an option for "Tipo"
    Wait Until Succeeds    Click Element    ${select.TYPE}
    ${element}    Replace String    ${select.TYPE_OPTION}    @label    ${value.TYPE}
    Wait Until Succeeds    Click Element    ${element}

Check if the card was created successfully
    ${element}    Replace String    ${label.CARD_NAME}    @title    ${value.TITLE}
    Wait Until Succeeds    Element Should Be Visible    ${element}

Assign yourself to the card
    # Clica para abrir o menu de opções do cartão
    ${element}    Replace String    ${button.CARD_OPTIONS}    @label    ${value.TITLE}
    Wait Until Succeeds    Click Element    ${element}

    # Passa o mouse por cima da opção de usuários
    Wait Until Succeeds    Mouse Over    ${dropdown.USERS}
    Wait Until Succeeds    Click Element    ${dropdown.USER_YOURSELF}

    # Clica em uma área para fechar o menu de opções
    Wait Until Succeeds    Click Element At Coordinates    ${kanban.BOARD}    -50    -50

Move the card to "${lane_name}"
    ${element}    Replace String    ${button.CARD_OPTIONS}    @label    ${value.TITLE}
    Wait Until Succeeds    Drag And Drop    ${element}    ${lanes}[${lane_name}]
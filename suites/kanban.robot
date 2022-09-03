*** Settings ***
Documentation      Suite de teste para criar e manipular um cartão no Kanban
Resource           ../resources/kanban-resources.robot

Suite Setup        Run Keywords
...                Open Application
...                Log in to Kanban

Suite Teardown     Close Browser

*** Test Cases ***
Test 1: Criar cartão
    # Criação do cartão
    Click on the "Novo Cartão" button
    Enter a title for the card
    Select an option for "Tipo"
    Click on the "Confirmar" button in the create modal
    Check if the card was created successfully
    # Mover para "Em andamento"
    Assign yourself to the card
    Move the card to "Em andamento"
    # Mover para "Pront"
    Enter a description for the card
    Move the card to "Pronto"
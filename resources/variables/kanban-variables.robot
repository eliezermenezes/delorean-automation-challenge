*** Variables ***
${URL}        https://kanbanx.com/#/automation-challenge
${BROWSER}    Firefox

# Others
&{kanban}
...    BOARD=id:board
...    EDITOR_DESCRIPTION=css:div.editor-preview-full

# Inputs
&{input}
...    USERNAME=id:kanbanLogin_email
...    PASSWORD=id:kanbanLogin_senha
...    CARD_TITLE=id:cartaoCreateTitulo
...    CARD_DESCRIPTION=//pre[contains(@class, "CodeMirror-line") and @role="presentation"]

# Lanes
&{lanes}
...    Em andamento=//div[@id="lane-largura-16257"]//button[@id="span-final-add-cartao"]
...    Pronto=//div[@id="lane-largura-16258"]//button[@id="span-final-add-cartao"]

# Buttons
&{button}
...    CONFIRM_ACTION=css:div.confirm-action-check button.btn-confirm
...    MODAL_CLOSE=css:button.modal-close
...    LOGIN=class:btn-login-confirm
...    NEW_CARD=class:btn-sucess-add-card
...    MODAL_CONFIRM=css:button.btn-modal-add-kanban
...    CARD_OPTIONS=//div[contains(@class, "task-title") and @Title="@label"]/preceding-sibling::div[@class="card-menu"]//button[@id="options-card"]  

# Dropdown
&{dropdown}
...    USERS=(//ul[@class="menu-list-dropdown"]//li[contains(@class, "menu-item-dropdown")])[1]
...    USER_YOURSELF=(//div[@class="container-user-avatar"]//img[@alt="Eliezer Menezes"]/parent::div)[2]

# Selects
&{select}
...    TYPE=//div[@class="dropdown-out"]//p[contains(text(), "Tipo")]
...    TYPE_OPTION=//li[@class="dropdown-item"]//p[@Title="@label"]

# Labels
&{label}
...    CARD_NAME=//div[contains(@class, "task-title") and @Title="@title"]

# Values
&{value}
...    USER_EMAIL=
...    USER_PASSWORD=
...    DESCRIPTION=Olá, estou finalizando meu desafio de automação de testes com Robot Framework
...    TITLE=Desafio de automação de testes com Robot Framework
...    TYPE=Defeito
# 📚 SysteMartins_Lib

> Biblioteca base oficial dos scripts SysteMartins para servidores FiveM.

[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)]()
[![FiveM](https://img.shields.io/badge/FiveM-FF6B00?style=for-the-badge)]()
[![Status](https://img.shields.io/badge/status-active-success?style=for-the-badge)]()
[![License](https://img.shields.io/badge/license-Custom-blue?style=for-the-badge)](./LICENSE)

---

## 🤝 Responsabilidades

- Detectar automaticamente o framework do servidor  
- Fornecer interface unificada de acesso ao core  
- Centralizar funções compartilhadas  
- Reduzir duplicação de código entre recursos  
- Garantir compatibilidade e escalabilidade  
- Ser uma dependência obrigatória para os recursos SysteMartins  

---

## 🗂️ Arquitetura

```bash
SysteMartins_Lib/
│
├── client/
│   └── client.lua
│
├── server/
│   └── server.lua
│
├── config.lua
└── fxmanifest.lua
```

---

## 🧩 Frameworks suportados

- Creative v3 até v5
- vRP
- vRPEX
- QBCore
- QBX
- ESX

---

## ⚙️ Instalação

1. Baixe o resource no GitHub oficial.
2. Adicione a pasta `SysteMartins_Lib` dentro da pasta `resources` do seu servidor.
3. Adicione o resource no arquivo de configuração do servidor:

```cfg
ensure SysteMartins_Lib
```

4. Ajuste a configuração do framework caso ele não seja detectado automaticamente:

```cfg
# Auto detect (padrão)
setr SysteMartins_Framework "auto"

# Ou defina manualmente:
# setr SysteMartins_Framework "CreativeV3"
# setr SysteMartins_Framework "CreativeV5"
# setr SysteMartins_Framework "Qbcore"
# setr SysteMartins_Framework "Qbox"
```
5. ## Realize as alterações no seu `fxmanifest.cfg` para a versão de sua framework:

---

## ⚠️ Ordem de inicialização

A biblioteca **deve respeitar a hierarquia de inicialização** e ser iniciada antes de qualquer outro script da SysteMartins.

```cfg
ensure SysteMartins_Lib
ensure SysteMartins_X
ensure SysteMartins_Y
ensure SysteMartins_Z
```

---

## 🧩 Integração nos Scripts SysteMartins
No seu script, adicione `@SysteMartins_Lib/server.lua` ou `@SysteMartins_Lib/client.lua` no fxmanifest.lua:

```lua
dependency 'SysteMartins_Lib'
server_script '@SysteMartins_Lib/server.lua'
client_script '@SysteMartins_Lib/client.lua'
```

## 📜 Licença e Uso

Este projeto utiliza a SysteMartins License (MIT Modified - Non-Commercial Clause).
A **SysteMartins_Lib** é um projeto aberto para a comunidade.

Você está livre para:

* ✔️ Utilizar em seus projetos
* ✔️ Modificar e adaptar conforme sua necessidade
* ✔️ Integrar em servidores FiveM / RedM

Restrições:

* ❌ Não é permitido vender, revender ou monetizar esta biblioteca
* ❌ Não é permitido redistribuir versões modificadas com fins comerciais

Esta biblioteca foi criada para fortalecer o ecossistema e incentivar o compartilhamento entre desenvolvedores.

💡 Resumindo: use à vontade, modifique como quiser, mas não venda.

---

## 👨‍💻 Desenvolvido por

**Vanderson Azevedo**  
SysteMartins Development

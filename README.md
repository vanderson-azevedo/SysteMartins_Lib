# 📚 SysteMartins_Lib

> Biblioteca base oficial dos scripts SysteMartins para servidores FiveM.

[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)]()
[![FiveM](https://img.shields.io/badge/FiveM-FF6B00?style=for-the-badge)]()
[![Status](https://img.shields.io/badge/status-active-success?style=for-the-badge)]()
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)]()

---

## 🧠 Sobre

A **SysteMartins_Lib** é a biblioteca central que padroniza e abstrai integrações utilizadas por todos os scripts da SysteMartins.

Ela é responsável por:

- Detectar automaticamente o framework do servidor
- Fornecer interface unificada de acesso ao core
- Centralizar funções compartilhadas
- Reduzir duplicação de código entre recursos
- Garantir compatibilidade e escalabilidade

Esta lib **não é um script standalone**, mas sim uma dependência obrigatória para os recursos SysteMartins.

---

## 🏗 Arquitetura

A biblioteca segue separação modular entre client e server:

```
SysteMartins_Lib/
│
├── client/
│   └── (módulos client-side)
│
├── server/
│   └── (módulos server-side)
│
├── config.lua
└── fxmanifest.lua
```

---

## 🔌 Função Principal

### Detecção Automática de Framework

A biblioteca identifica automaticamente o framework ativo no servidor, podendo também ser configurada manualmente via `server.cfg`.

Frameworks suportados:

- Creative V3
- Creative V5
- QBCore
- QBox
- Esx
- Vrp
- Vrpex

---

## ⚙️ Instalação

1. Adicione a pasta `SysteMartins_Lib` dentro de `resources/`
2. No `server.cfg`:

```cfg
ensure SysteMartins_Lib
```

⚠️ A biblioteca deve iniciar antes de qualquer script SysteMartins.

---

## 🛠 Configuração

```cfg
# Auto detect (padrão)
setr SysteMartins_Framework "auto"

# Forçar manualmente
setr SysteMartins_Framework "CreativeV3"
# setr SysteMartins_Framework "CreativeV5"
# setr SysteMartins_Framework "QBCore"
# setr SysteMartins_Framework "QBox"
```

---

## 🧩 Integração nos Scripts SysteMartins

No `fxmanifest.lua` do recurso dependente:

```lua
dependency 'SysteMartins_Lib'

server_script '@SysteMartins_Lib/server.lua'
client_script '@SysteMartins_Lib/client.lua'
```

Uso interno:

```lua
local Core = Framework.GetCore()
print(Framework.Name)
```

---

## 🎯 Objetivo do Projeto

Centralizar a base estrutural dos scripts SysteMartins, garantindo:

- Organização
- Escalabilidade
- Compatibilidade multi-framework
- Manutenção simplificada
- Atualizações centralizadas

---

## 🔒 Uso

Esta biblioteca é destinada exclusivamente aos scripts da SysteMartins.

---

## 👨‍💻 Desenvolvido por

**Vanderson Azevedo**  
SysteMartins Development

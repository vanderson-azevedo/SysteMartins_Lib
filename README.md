# 📦 SysteMartins_Lib

> Biblioteca de detecção automática de frameworks para servidores FiveM.

[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)]()
[![FiveM](https://img.shields.io/badge/FiveM-FF6B00?style=for-the-badge)]()
[![Status](https://img.shields.io/badge/status-active-success?style=for-the-badge)]()
[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)]()

---

## 🧠 Sobre o Projeto

O **SysteMartins_Lib** é uma biblioteca desenvolvida em **Lua** para servidores **FiveM**, com foco em **detecção automática de framework**.

Ela permite que seus scripts identifiquem dinamicamente qual framework está rodando no servidor, eliminando múltiplas verificações manuais e facilitando a compatibilidade entre diferentes bases.

Ideal para desenvolvedores que criam scripts compatíveis com múltiplos frameworks.

---

## 🚀 Funcionalidades

✔ Detecção automática de framework  
✔ Suporte para múltiplos frameworks  
✔ Possibilidade de forçar framework manualmente  
✔ Interface simples para integração  
✔ Compatível com client e server  

---

## 📌 Frameworks Suportados

- Creative V3  
- Creative V5  
- QBCore  
- QBox  
- (Outros podem ser adicionados facilmente)

---

## 📂 Estrutura do Projeto

```
SysteMartins_Lib/
│
├── client.lua
├── server.lua
├── config.lua
└── fxmanifest.lua
```

---

## 🔧 Instalação

1. Clone o repositório:

```bash
git clone https://github.com/vanderson-azevedo/SysteMartins_Lib.git
```

2. Coloque a pasta dentro da sua `resources/`

3. No seu `server.cfg`, adicione:

```cfg
ensure SysteMartins_Lib
```

---

## ⚙️ Configuração

Por padrão, o sistema detecta automaticamente o framework.

Se desejar forçar manualmente, adicione no `server.cfg`:

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

## 👨‍💻 Como Usar

### 1️⃣ No seu `fxmanifest.lua`:

```lua
server_script '@SysteMartins_Lib/server.lua'
client_script '@SysteMartins_Lib/client.lua'
```

---

### 2️⃣ Dentro do seu script:

```lua
print(Framework.Name) -- Nome do framework detectado

local Core = Framework.GetCore() -- Retorna o core do framework
```

---

## 🧩 Exemplo Prático

```lua
if Framework.Name == "QBCore" then
    local Player = Framework.GetCore().Functions.GetPlayer(source)
end
```

---

## 🛠 Boas Práticas

- Sempre utilize `Framework.GetCore()` ao invés de chamar exports diretamente.
- Evite múltiplas verificações de framework no mesmo script.
- Centralize sua lógica de compatibilidade utilizando a biblioteca.

---

## 📈 Objetivo do Projeto

Reduzir:

- Código duplicado
- Verificações repetitivas
- Scripts específicos para cada framework

E aumentar:

- Compatibilidade
- Organização
- Escalabilidade

---

## 🤝 Contribuição

Contribuições são bem-vindas.

1. Faça um fork
2. Crie uma branch (`feature/minha-feature`)
3. Commit suas alterações
4. Envie um Pull Request

---

## 📜 Licença

Este projeto está sob a licença MIT.  
Sinta-se livre para usar, modificar e distribuir.

---

## ⭐ Apoie o Projeto

Se este projeto te ajudou, considere deixar uma ⭐ no repositório.

---

## 👨‍💻 Autor

Desenvolvido por **Vanderson Azevedo**

---

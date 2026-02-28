# SyteMartins_Lib

Biblioteca de detecção automática de frameworks para FiveM.

## Instalação

1. Coloque a pasta na sua pasta de resources
2. Adicione `ensure SysteMartins_Lib` no seu server.cfg

## Configuração

Adicione no seu `server.cfg`:

```
# Auto-detecta o framework
setr SysteMartins_Framework "auto"

# Ou force um framework específico:
# setr SysteMartins_Framework "CreativeV3"
# setr SysteMartins_Framework "CreativeV5"
# setr SysteMartins_Framework "Qcore"
# setr SysteMartins_Framework "Qbox"
```

## Uso

No seu script, adicione `@SysteMartins_Lib/server.lua` ou `@SysteMartins_Lib/client.lua` no fxmanifest.lua:

```lua
server_script '@SysteMartins_Lib/server.lua'
client_script '@SysteMartins_Lib/client.lua'
```

Depois use:

```lua
print(Framework.Name) -- Retorna o nome do framework
local Core = Framework.GetCore() -- Retorna o objeto do framework
```

# SyteMartins_Lib

Biblioteca de detecção automática de frameworks para FiveM.

## Instalação

1. Coloque a pasta na sua pasta de resources
2. Adicione `ensure SyteMartins_Lib` no seu server.cfg

## Configuração

Adicione no seu `server.cfg`:

```
# Auto-detecta o framework
setr framework "auto"

# Ou force um framework específico:
# setr framework "CreativeV3"
# setr framework "CreativeV5"
# setr framework "Qcore"
# setr framework "Qbox"
```

## Uso

No seu script, adicione `@SyteMartins_Lib/server.lua` ou `@SyteMartins_Lib/client.lua` no fxmanifest.lua:

```lua
server_script '@SyteMartins_Lib/server.lua'
client_script '@SyteMartins_Lib/client.lua'
```

Depois use:

```lua
print(Framework.Name) -- Retorna o nome do framework
local Core = Framework.GetCore() -- Retorna o objeto do framework
```

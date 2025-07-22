# FFXI Lua Scripts by Palmer (Zodiarchy @ Asura)

A collection of Lua addons and plugins for Final Fantasy XI, supporting both Ashita and Windower frameworks.

## Repository Structure
├── Ashita/ # Ashita v4 plugins (.lua files)

└── Windower/ # Windower addons (.lua files)

## Frameworks

**Windower** - The most common third-party framework for FFXI
- Install: Place `.lua` files in `Windower4/addons/gearswap/data/` directory
- Load: `//lua load gs, //gs load PUP.lua`

**Ashita** - Alternative framework with different API and features
- Install: Place `.lua` files in `Ashita/config/addons/luashitacast/Character_XXXXXX/` directory  
- Load: `/addon load luashitacast, /lac load PUP.lua`

## Scripts

Each script is maintained for both frameworks when possible. Some features may vary between versions due to API differences.

| Script | Description | Ashita | Windower |
|--------|-------------|--------|----------|
| PUP.lua | Puppetmaster automation tools | ✅ | ✅ |

## Installation

1. Choose your framework (Ashita or Windower)
2. Download the appropriate version from the corresponding folder
3. Place in the corresponding directory (listed above).
4. Load using the framework's command syntax

## Notes

- Scripts are tested on retail FFXI servers
- Report issues or suggestions via GitHub Issues

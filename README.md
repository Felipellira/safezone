# Safezones

this is a simple script to speed up and facilitate the creation of safezones using PolyZones

## Dependencies

* [PolyZone](https://github.com/mkafrin/PolyZone)

## Creating safezones
1. Open ```config.lua```
2. Create a new zone using this template

```lua
        [1] = {
            ["Coords"] = {vector2(0,0,0),vector2(0,0,0),}, --- Min 3 Points
            ["Options"] = {name= "teste", debugPoly = true}, -- PolyZone Config
            ["Blockers"] = { Sprint = true, Drive = true } -- Blockers
        }
```

# Blockers
Basically the blockers are a table with what you want to block when the player is inside a certain zone

### Blockers list
* Sprint (Disable the use of sprint)
* Attack (Disable all types of attacks)
* Drive  (Disable all vehicle controls)
* Weapon (Disable the player to take any weapons)
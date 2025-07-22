-- PUP GearSwap Script
-- Simple, standalone version without Mote dependencies

-- Global settings
settings = {
    PetMode = 'Tank',
    Weapon = 'Xiucoatl', 
    PupOnly = false,
    TeleportActive = false
}

-- Towns list
towns = {
    ['Bastok Markets'] = true,
    ['Windurst Waters'] = true,
    ['Southern San d\'Oria'] = true,
    ['Upper Jeuno'] = true,
    ['Bastok Mines'] = true,
    ['Windurst Woods'] = true,
    ['Northern San d\'Oria'] = true,
    ['Lower Jeuno'] = true,
    ['Port Bastok'] = true,
    ['Port Windurst'] = true,
    ['Port San d\'Oria'] = true,
    ['Ru\'Lude Gardens'] = true,
    ['Aht Urhgan Whitegate'] = true,
    ['Western Adoulin'] = true,
    ['Eastern Adoulin'] = true
}

-- Initialize sets
function get_sets()
        -- Setup commands and chat aliases
    send_command('alias pupmode gs c pupmode')
    send_command('alias dt gs c dt') 
    send_command('alias puponly gs c puponly')
    send_command('alias xiu gs c xiu')
    send_command('alias karambit gs c karambit')
    send_command('alias warpring gs c warpring')
    send_command('alias dimring gs c dimring')
    send_command('alias refresh gs c refresh')
    
    windower.add_to_chat(122, 'PUP GearSwap Profile Loaded')
    windower.add_to_chat(122, 'Commands: pupmode, dt, puponly, xiu, karambit, refresh')
    windower.add_to_chat(122, 'Teleport Commands: warpring, dimring')
    windower.add_to_chat(122, 'Default weapon: Xiucoatl | PupOnly mode for fights using Lobo only')

     --------------------------------------
     -- Start defining the sets
     --------------------------------------
     
     -- Idle sets
     sets.idle = {
         main=settings.Weapon,
         range="Animator P II +1",
         head="Heyoka Cap +1",
         body="Tali'ah Manteel +2", 
         hands="Herculean Gloves",
         legs="Heyoka Subligar +1",
         feet="Herculean Boots",
         neck="Lissome Necklace",
         waist="Moonbow Belt +1",
         left_ear="Sroda Earring",
         right_ear="Mache Earring +1",
         left_ring="Rajas Ring",
         right_ring="Epona's Ring",
         back="Visucius's Mantle",
     }

    -- Pet idle sets (when automaton is out)
    sets.idle.Pet = {}
    
         sets.idle.Pet.Tank = {
         main=settings.Weapon,
         range="Animator P II +1",
         head="Heyoka Cap +1",
         body="Tali'ah Manteel +2",
         hands="Herculean Gloves",
         legs="Heyoka Subligar +1", 
         feet="Herculean Boots",
         neck="Lissome Necklace",
         waist="Moonbow Belt +1",
         left_ear="Sroda Earring",
         right_ear="Mache Earring +1",
         left_ring="Rajas Ring",
         right_ring="Epona's Ring",
         back="Visucius's Mantle",
     }
     
     sets.idle.Pet.Melee = {
         main=settings.Weapon,
         range="Animator P II +1", 
         head="Karagoz Capello +1",
         body="Karagoz Farsetto +1",
         hands="Karagoz Guanti +1",
         legs="Karagoz Pantaloni +1",
         feet="Karagoz Scarpe +1",
         neck="Lissome Necklace",
         waist="Moonbow Belt +1",
         left_ear="Sroda Earring", 
         right_ear="Mache Earring +1",
         left_ring="Rajas Ring",
         right_ring="Epona's Ring",
         back="Visucius's Mantle",
     }
     
     sets.idle.Pet.Range = {
         main=settings.Weapon,
         range="Animator P II +1",
         head="Karagoz Capello +1",
         body="Karagoz Farsetto +1", 
         hands="Karagoz Guanti +1",
         legs="Karagoz Pantaloni +1",
         feet="Karagoz Scarpe +1",
         neck="Lissome Necklace",
         waist="Moonbow Belt +1",
         left_ear="Sroda Earring",
         right_ear="Mache Earring +1", 
         left_ring="Rajas Ring",
         right_ring="Epona's Ring",
         back="Visucius's Mantle",
     }
     
     sets.idle.Pet.Magic = {
         main=settings.Weapon,
         range="Animator P II +1",
         head="Karagoz Capello +1",
         body="Karagoz Farsetto +1",
         hands="Karagoz Guanti +1", 
         legs="Karagoz Pantaloni +1",
         feet="Karagoz Scarpe +1",
         neck="Lissome Necklace",
         waist="Moonbow Belt +1",
         left_ear="Sroda Earring",
         right_ear="Mache Earring +1",
         left_ring="Rajas Ring",
         right_ring="Varar Ring +1",
         back="Visucius's Mantle",
     }

     -- PupOnly mode (for fights where only automaton is used)
     sets.idle.PupOnly = {
         main=settings.Weapon,
         range="Animator P II +1",
         head="Tali'ah Turban +2",
         body="Pitre Tobe +1",
         hands="Foire Dastanas +2",
         legs="Karagoz Pantaloni",
         feet="Foire Babouches +2",
         neck="Pup. Collar",
         waist="Klouskap Sash +1",
         left_ear="Burana Earring",
         right_ear="Kyrene's Earring",
         left_ring="Thurandaut Ring",
         right_ring="Varar Ring +1",
         back="Visucius's Mantle",
     }

     -- Town set
     sets.idle.Town = {
         main=settings.Weapon,
         range="Animator P II +1",
         body="Councilor's Garb",
         legs="Crimson Cuisses",
         feet="Herald's Gaiters",
     }

     -- Engaged sets
     sets.engaged = {
         main=settings.Weapon,
         range="Animator P II +1",
         head="Heyoka Cap +1",
         body="Tali'ah Manteel +2",
         hands="Herculean Gloves",
         legs="Heyoka Subligar +1",
         feet="Herculean Boots",
         neck="Lissome Necklace",
         waist="Moonbow Belt +1",
         left_ear="Sroda Earring",
         right_ear="Mache Earring +1",
         left_ring="Rajas Ring",
         right_ring="Epona's Ring",
         back="Visucius's Mantle",
     }

    -- Job abilities
     sets.precast = {}
     sets.precast.JA = {}
     
     sets.precast.JA.Deploy = {
         main=settings.Weapon,
         range="Animator P II +1",
         left_ear="Burana Earring",
     }

     sets.precast.JA.Activate = {
         back="Visucius's Mantle",
     }

     sets.precast.JA.Repair = {
         main=settings.Weapon,
         range="Animator P II +1", 
         hands="Karagoz Guanti +1",
         feet="Herculean Boots",
         left_ear="Guignol Earring",
         right_ear="Mache Earring +1",
         back="Visucius's Mantle",
         ammo="Automat. Oil +3",
     }

     sets.precast.JA.Maintenance = {
         main=settings.Weapon,
         range="Animator P II +1", 
         hands="Karagoz Guanti +1",
         feet="Herculean Boots",
         left_ear="Guignol Earring",
         right_ear="Mache Earring +1",
         back="Visucius's Mantle",
         ammo="Automat. Oil +3",
     }
     
     -- Maneuver sets (all use same gear)
     local maneuver_set = {
         main=settings.Weapon,
         range="Animator P II +1",
         body="Cirque Farsetto +1",
         hands="Foire Dastanas +2",
         legs="Heyoka Subligar +1",
         feet="Tali'ah Crackows +2",
         neck="Bfn. Collar +1",
         waist="Moonbow Belt +1",
         left_ear="Burana Earring",
         right_ear="Mache Earring +1",
         back="Visucius's Mantle",
     }
     
     sets.precast.JA['Fire Maneuver'] = maneuver_set
     sets.precast.JA['Ice Maneuver'] = maneuver_set
     sets.precast.JA['Wind Maneuver'] = maneuver_set
     sets.precast.JA['Earth Maneuver'] = maneuver_set
     sets.precast.JA['Thunder Maneuver'] = maneuver_set
     sets.precast.JA['Water Maneuver'] = maneuver_set
     sets.precast.JA['Light Maneuver'] = maneuver_set
     sets.precast.JA['Dark Maneuver'] = maneuver_set

     sets.precast.JA.Ventriloquy = {
         main=settings.Weapon,
         range="Animator P II +1",
         head="Heyoka Cap +1",
         body="Passion Jacket",
         hands="Nilas Gloves",
         legs="Heyoka Subligar +1",
         feet="Tali'ah Crackows +2",
         neck="Unmoving Collar +1",
         waist="Moonbow Belt +1",
         left_ear="Sroda Earring",
         right_ear="Mache Earring +1",
         left_ring="Rajas Ring",
         right_ring="Epona's Ring",
         back="Visucius's Mantle",
     }

     sets.precast.JA.Overdrive = {
         main="Xiucoatl", -- Always use Xiucoatl for Overdrive
         range="Animator P II +1",
         head="Karagoz Capello +1",
         body="Pitre Tobe +1",
         hands="Karagoz Guanti +1",
         legs="Karagoz Pantaloni +1",
         feet="Karagoz Scarpe +1",
         neck="Pup. Collar",
         waist="Klouskap Sash +1",
         left_ear="Burana Earring",
         right_ear="Charivari Earring",
         left_ring="Tali'ah Ring",
         right_ring="Varar Ring +1",
         back="Visucius's Mantle",
     }

     -- Weapon Skills
     sets.precast.WS = {
         main=settings.Weapon,
         head="Heyoka Cap +1",
         body="Tali'ah Manteel +2",
         hands="Tali'ah Gages +2",
         legs="Tali'ah Seraweels +2",
         feet="Tali'ah Crackows +2",
         neck="Lissome Necklace",
         waist="Moonbow Belt +1",
         left_ear="Sroda Earring",
         right_ear="Mache Earring +1",
         left_ring="Rajas Ring",
         right_ring="Varar Ring +1",
         back="Visucius's Mantle",
     }

         -- Magic sets
     sets.precast.FC = {
         left_ear="Loquacious Earring",
         left_ring="Prolix Ring",
     }

    -- Utsusemi sets
     sets.precast.FC.Utsusemi = {
         main=settings.Weapon,
         range="Animator P II +1",
         head="Heyoka Cap +1",
         body="Passion Jacket",
         hands="Rawhide Gloves",
         legs="Heyoka Subligar +1",
         feet="Tali'ah Crackows +2",
         neck="Lissome Necklace",
         waist="Moonbow Belt +1",
         right_ear="Mache Earring +1",
         right_ring="Varar Ring +1",
         back="Visucius's Mantle",
     }
     
     sets.midcast = {}
     sets.midcast.Utsusemi = set_combine(sets.precast.FC.Utsusemi)

     -- Damage Taken set
     sets.dt = {
         head="Heyoka Cap +1",
         body="Tali'ah Manteel +2",
         hands="Naga Tekko",
         legs="Heyoka Subligar +1", 
         feet="Tali'ah Crackows +2",
         left_ring="Gelatinous Ring +1",
         right_ring="Shadow Ring",
         back="Shadow Mantle",
     }

     -- Waltz set
     sets.precast.Waltz = {
         body="Passion Jacket",
     }

     -- Special teleport ring sets
     sets.WarpRing = {
         left_ring="Warp Ring",
     }

     sets.DimRing = {
         left_ring="Dim. Ring (Holla)",
     }
 end

-- Function to update weapon in all sets
function update_weapon_sets()
    sets.idle.main = settings.Weapon
    sets.idle.Pet.Tank.main = settings.Weapon
    sets.idle.Pet.Melee.main = settings.Weapon
    sets.idle.Pet.Range.main = settings.Weapon
    sets.idle.Pet.Magic.main = settings.Weapon
    sets.idle.PupOnly.main = settings.Weapon
    sets.idle.Town.main = settings.Weapon
    sets.engaged.main = settings.Weapon
    sets.precast.JA.Deploy.main = settings.Weapon
    sets.precast.JA.Repair.main = settings.Weapon
    sets.precast.JA.Maintenance.main = settings.Weapon
    sets.precast.JA.Ventriloquy.main = settings.Weapon
    sets.precast.WS.main = settings.Weapon
    sets.precast.FC.Utsusemi.main = settings.Weapon
    
    -- Update all maneuver sets
    for _,maneuver in pairs({'Fire', 'Ice', 'Wind', 'Earth', 'Thunder', 'Water', 'Light', 'Dark'}) do
        if sets.precast.JA[maneuver..' Maneuver'] then
            sets.precast.JA[maneuver..' Maneuver'].main = settings.Weapon
        end
    end
end

-- Function to determine current set based on status and conditions
function determine_set()
    if settings.TeleportActive then
        return -- Don't change gear when teleporting
    end
    
    local zone = windower.ffxi.get_info().zone
    
    -- Check if in town
    if towns[zone] then
        return sets.idle.Town
    end
    
    -- Check for PupOnly mode (highest priority)
    if settings.PupOnly then
        return sets.idle.PupOnly
    end
    
    -- Check for Overdrive buff
    if buffactive['Overdrive'] then
        return sets.precast.JA.Overdrive
    end
    
    -- Check player status
    if player.status == 'Engaged' then
        return sets.engaged
    elseif pet.isvalid then
        -- Automaton is out, use pet idle gear
        return sets.idle.Pet[settings.PetMode]
    else
        -- No pet, use normal idle
        return sets.idle
    end
end

-- Status change event
function status_change(new, old)
    local set_to_equip = determine_set()
    if set_to_equip then
        equip(set_to_equip)
    end
end

-- Pet change event  
function pet_change(pet_info, gain)
    local set_to_equip = determine_set()
    if set_to_equip then
        equip(set_to_equip)
    end
end

-- Pet status change event
function pet_status_change(new, old)
    local set_to_equip = determine_set()
    if set_to_equip then
        equip(set_to_equip)
    end
end

-- Buff change event
function buff_change(name, gain)
    if name == "Overdrive" then
        local set_to_equip = determine_set()
        if set_to_equip then
            equip(set_to_equip)
        end
    end
end

-- Precast event
function precast(spell)
    -- Handle job abilities
    if sets.precast.JA[spell.english] then
        equip(sets.precast.JA[spell.english])
    elseif spell.english:find('Maneuver') then
        equip(sets.precast.JA['Fire Maneuver'])
    elseif spell.english:find('Waltz') then
        equip(sets.precast.Waltz)
    elseif spell.english == 'Utsusemi: Ichi' or spell.english == 'Utsusemi: Ni' then
        equip(sets.precast.FC.Utsusemi)
    elseif spell.type == 'WeaponSkill' then
        equip(sets.precast.WS)
    elseif sets.precast.FC then
        equip(sets.precast.FC)
    end
end

-- Midcast event
function midcast(spell)
    if spell.english == 'Utsusemi: Ichi' or spell.english == 'Utsusemi: Ni' then
        equip(sets.midcast.Utsusemi)
    end
end

-- Aftercast event
function aftercast(spell)
    local set_to_equip = determine_set()
    if set_to_equip then
        equip(set_to_equip)
    end
end

-- Self command handler
function self_command(command)
    command = command:lower()
    
    if command == 'pupmode' then
        -- Cycle pet modes
        local modes = {'Tank', 'Melee', 'Range', 'Magic'}
        local current_index = 1
        for i, mode in ipairs(modes) do
            if mode == settings.PetMode then
                current_index = i
                break
            end
        end
        local next_index = current_index % #modes + 1
        settings.PetMode = modes[next_index]
        windower.add_to_chat(122, 'Pet Mode: '..settings.PetMode)
        
    elseif command == 'dt' then
        windower.add_to_chat(122, 'DT gear equipped')
        equip(sets.dt)
        return
        
    elseif command == 'puponly' then
        settings.PupOnly = not settings.PupOnly
        windower.add_to_chat(122, 'PupOnly Mode: '..tostring(settings.PupOnly))
        
    elseif command == 'xiu' then
        settings.Weapon = 'Xiucoatl'
        update_weapon_sets()
        windower.add_to_chat(122, 'Weapon set to: Xiucoatl')
        
    elseif command == 'karambit' then
        settings.Weapon = 'Karambit'
        update_weapon_sets()
        windower.add_to_chat(122, 'Weapon set to: Karambit')
        
    elseif command == 'warpring' then
        settings.TeleportActive = true
        windower.add_to_chat(122, 'Warp Ring equipped - Use refresh to return to normal gear')
        equip(sets.WarpRing)
        return
        
    elseif command == 'dimring' then
        settings.TeleportActive = true
        windower.add_to_chat(122, 'Dimensional Ring equipped - Use refresh to return to normal gear')
        equip(sets.DimRing)
        return
        
    elseif command == 'refresh' then
        settings.TeleportActive = false
        windower.add_to_chat(122, 'Returning to normal gear')
    end
    
    -- Refresh gear for most commands
    local set_to_equip = determine_set()
    if set_to_equip then
        equip(set_to_equip)
    end
end

-- File unload cleanup
function file_unload()
    send_command('unalias pupmode')
    send_command('unalias dt')
    send_command('unalias puponly')
    send_command('unalias xiu')
    send_command('unalias karambit')
    send_command('unalias warpring')
    send_command('unalias dimring')
    send_command('unalias refresh')
end

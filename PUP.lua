require('common');

local gear = gFunc.LoadFile('common/gear.lua');
local Equip = gFunc.LoadFile('common/equip.lua');
local Status = gFunc.LoadFile('common/status.lua');
local itemHandler = gFunc.LoadFile('common/items.lua');

local profile = {}

local settings = {
    PetMode = 'Tank', -- Tank, Melee, Range, Magic
    IsTrusted = false, -- For pet trusts
    Weapon = 'Xiucoatl', -- Primary weapon: Xiucoatl (can switch to Karambit if needed)
    PupOnly = false, -- For fights where only automaton is used (Lobo, etc) - toggleable with /puponly
    TeleportActive = false, -- Prevent automatic gear changes when teleport item equipped
}

local sets = {
    -- Idle sets
    Idle = Equip.NewSet {
        Main = "Xiucoatl",
        Range = "Animator P II +1",
        Head = "Heyoka Cap +1",
        Body = "Tali'ah Manteel +2", 
        Hands = "Herculean Gloves",
        Legs = "Heyoka Subligar +1",
        Feet = "Herculean Boots",
        Neck = "Lissome Necklace",
        Waist = "Moonbow Belt +1",
        Ear1 = "Sroda Earring",
        Ear2 = "Mache Earring +1",
        Ring1 = "Rajas Ring",
        Ring2 = "Epona\'s Ring",
        Back = "Visucius\'s Mantle",
    },

    -- Pet idle sets (when automaton is out)
    PetIdle = {
        Tank = Equip.NewSet {
            Main = "Xiucoatl",
            Range = "Animator P II +1",
            Head = "Heyoka Cap +1",
            Body = "Tali'ah Manteel +2",
            Hands = "Herculean Gloves",
            Legs = "Heyoka Subligar +1", 
            Feet = "Herculean Boots",
            Neck = "Lissome Necklace",
            Waist = "Moonbow Belt +1",
            Ear1 = "Sroda Earring",
            Ear2 = "Mache Earring +1",
            Ring1 = "Rajas Ring",
            Ring2 = "Epona\'s Ring",
            Back = "Visucius\'s Mantle",
        },
        
        Melee = Equip.NewSet {
            Main = "Xiucoatl",
            Range = "Animator P II +1", 
            Head = "Karagoz Capello +1",
            Body = "Karagoz Farsetto +1",
            Hands = "Karagoz Guanti +1",
            Legs = "Karagoz Pantaloni +1",
            Feet = "Karagoz Scarpe +1",
            Neck = "Lissome Necklace",
            Waist = "Moonbow Belt +1",
            Ear1 = "Sroda Earring", 
            Ear2 = "Mache Earring +1",
            Ring1 = "Rajas Ring",
            Ring2 = "Epona\'s Ring",
            Back = "Visucius\'s Mantle",
        },
        
        Range = Equip.NewSet {
            Main = "Xiucoatl",
            Range = "Animator P II +1",
            Head = "Karagoz Capello +1",
            Body = "Karagoz Farsetto +1", 
            Hands = "Karagoz Guanti +1",
            Legs = "Karagoz Pantaloni +1",
            Feet = "Karagoz Scarpe +1",
            Neck = "Lissome Necklace",
            Waist = "Moonbow Belt +1",
            Ear1 = "Sroda Earring",
            Ear2 = "Mache Earring +1", 
            Ring1 = "Rajas Ring",
            Ring2 = "Epona\'s Ring",
            Back = "Visucius\'s Mantle",
        },
        
        Magic = Equip.NewSet {
            Main = "Xiucoatl",
            Range = "Animator P II +1",
            Head = "Karagoz Capello +1",
            Body = "Karagoz Farsetto +1",
            Hands = "Karagoz Guanti +1", 
            Legs = "Karagoz Pantaloni +1",
            Feet = "Karagoz Scarpe +1",
            Neck = "Lissome Necklace",
            Waist = "Moonbow Belt +1",
            Ear1 = "Sroda Earring",
            Ear2 = "Mache Earring +1",
            Ring1 = "Rajas Ring",
            Ring2 = "Varar Ring +1",
            Back = "Visucius\'s Mantle",
        },
    },

    -- Pup Only mode (for fights where only automaton is used)
    PupOnly = Equip.NewSet {
        Main = "Xiucoatl",
        Range = "Animator P II +1",
        Head = "Tali'ah Turban +2",
        Body = "Pitre Tobe +1",
        Hands = "Foire Dastanas +2",
        Legs = "Karagoz Pantaloni",
        Feet = "Foire Babouches +2",
        Neck = "Pup. Collar",
        Waist = "Klouskap Sash +1",
        Ear1 = "Sroda Earring",
        Ear2 = "Kyrene\'s Earring",
        Ring1 = "Thurandaut Ring",
        Ring2 = "Varar Ring +1",
        Back = "Visucius\'s Mantle",
    },

    -- Master melee sets
    Engaged = Equip.NewSet {
        Main = "Xiucoatl",
        Range = "Animator P II +1",
        Head = "Heyoka Cap +1",
        Body = "Tali'ah Manteel +2",
        Hands = "Herculean Gloves",
        Legs = "Heyoka Subligar +1",
        Feet = "Herculean Boots",
        Neck = "Lissome Necklace",
        Waist = "Moonbow Belt +1",
        Ear1 = "Sroda Earring",
        Ear2 = "Mache Earring +1    ",
        Ring1 = "Rajas Ring",
        Ring2 = "Epona\'s Ring",
        Back = "Visucius\'s Mantle",
    },

    -- Job abilities
    Deploy = Equip.NewSet {
        Main = "Xiucoatl",
        Range = "Animator P II +1",
        Ear1 = "Burana Earring",
    },

    Activate = Equip.NewSet {
        Back = "Visucius\'s Mantle",
    },

    Repair = Equip.NewSet {
        Main = "Xiucoatl",
        Range = "Animator P II +1", 
        Hands = "Karagoz Guanti +1",
        Feet = "Herculean Boots",
        Ear1 = "Guignol Earring",
        Ear2 = "Mache Earring +1",
        Back = "Visucius\'s Mantle",
        Ammo = "Automat. Oil +3",
    },

    Maintenance = Equip.NewSet {
        Main = "Xiucoatl",
        Range = "Animator P II +1", 
        Hands = "Karagoz Guanti +1",
        Feet = "Herculean Boots",
        Ear1 = "Guignol Earring",
        Ear2 = "Mache Earring +1",
        Back = "Visucius\'s Mantle",
        Ammo = "Automat. Oil +3",
    },
    
    Maneuver = Equip.NewSet {
        Main = "Xiucoatl",
        Range = "Animator P II +1",
        Body = "Cirque Farsetto +1",
        Hands = "Foire Dastanas +2",
        Legs = "Heyoka Subligar +1",
        Feet = "Tali'ah Crackows +2",
        Neck = "Bfn. Collar +1",
        Waist = "Moonbow Belt +1",
        Ear1 = "Burana Earring",
        Ear2 = "Mache Earring +1",
        Back = "Visucius\'s Mantle",
    },

    Ventriloquy = Equip.NewSet {
        -- Master-focused ventriloquy gear for enmity and survivability
        Main = "Xiucoatl",
        Range = "Animator P II +1",
        Head = "Heyoka Cap +1",
        Body = "Passion Jacket",
        Hands = "Nilas Gloves",
        Legs = "Heyoka Subligar +1",
        Feet = "Tali'ah Crackows +2",
        Neck = "Unmoving Collar +1",
        Waist = "Moonbow Belt +1",
        Ear1 = "Sroda Earring",
        Ear2 = "Mache Earring +1",
        Ring1 = "Rajas Ring",
        Ring2 = "Epona\'s Ring",
        Back = "Visucius\'s Mantle",
    },

    -- Weapon skills
    WeaponSkill = {
        -- For weapon skills like Stringing Pummel, Victory Smite
        Default = Equip.NewSet {
            Main = "Xiucoatl",
            Head = "Heyoka Cap +1",
            Body = "Tali'ah Manteel +2",
            Hands = "Tali'ah Gages +2",
            Legs = "Tali'ah Seraweels +2",
            Feet = "Tali'ah Crackows +2",
            Neck = "Lissome Necklace",
            Waist = "Moonbow Belt +1",
            Ear1 = "Sroda Earring",
            Ear2 = "Mache Earring +1",
            Ring1 = "Rajas Ring",
            Ring2 = "Varar Ring +1",
            Back = "Visucius\'s Mantle",
        },
    },

    -- Magic sets (for puppet magic)
    Precast = Equip.NewSet {
        Ear1 = "Loquacious Earring",
        Ring1 = "Prolix Ring",
    },

    -- Town/movement set
    Town = Equip.NewSet {
        Main = "Xiucoatl",
        Range = "Animator P II +1",
        Body = "Councilor's Garb",
        Legs = "Crimson Cuisses",
        Feet = "Herald's Gaiters",
    },

    -- Situational sets
    DT = Equip.NewSet {
        Head = "Heyoka Cap +1",
        Body = "Tali'ah Manteel +2",
        Hands = "Naga Tekko",
        Legs = "Heyoka Subligar +1", 
        Feet = "Tali'ah Crackows +2",
        Ring1 = "Gelatinous Ring +1",
        Ring2 = "Shadow Ring",
        Back = "Shadow Mantle",
    },

    -- Waltz set (for healing waltzes)
    Waltz = Equip.NewSet {
        Body = "Passion Jacket", -- Enhances Waltz
    },

    -- Overdrive set (for when 2-hour is active)
    Overdrive = Equip.NewSet {
        Main = "Xiucoatl",
        Range = "Animator P II +1",
        Head = "Karagoz Capello +1",
        Body = "Pitre Tobe +1",
        Hands = "Karagoz Guanti +1",
        Legs = "Karagoz Pantaloni +1",
        Feet = "Karagoz Scarpe +1",
        Neck = "Pup. Collar",
        Waist = "Klouskap Sash +1",
        Ear1 = "Burana Earring",
        Ear2 = "Charivari Earring",
        Ring1 = "Tali'ah Ring",
        Ring2 = "Varar Ring +1",
        Back = "Visucius\'s Mantle",
    },

    -- Utsusemi sets
    Utsusemi = {
        Precast = Equip.NewSet {
            Main = "Xiucoatl",
            Range = "Animator P II +1",
            Head = "Heyoka Cap +1",
            Body = "Passion Jacket",
            Hands = "Rawhide Gloves",
            Legs = "Heyoka Subligar +1",
            Feet = "Tali'ah Crackows +2",
            Neck = "Lissome Necklace",
            Waist = "Moonbow Belt +1",
            --Ear1 = "Loquacious Earring", -- Fast cast
            Ear2 = "Mache Earring +1",
            --Ring1 = "Prolix Ring", -- Fast cast
            Ring2 = "Varar Ring +1",
            Back = "Visucius\'s Mantle",
        },
        
        Midcast = Equip.NewSet {
            Main = "Xiucoatl",
            Range = "Animator P II +1",
            Head = "Heyoka Cap +1",
            Body = "Passion Jacket",
            Hands = "Rawhide Gloves",
            Legs = "Heyoka Subligar +1",
            Feet = "Tali'ah Crackows +2",
            Neck = "Lissome Necklace",
            Waist = "Moonbow Belt +1",
            --Ear1 = "Loquacious Earring", -- Fast cast
            Ear2 = "Mache Earring +1",
            --Ring1 = "Prolix Ring", -- Fast cast
            Ring2 = "Varar Ring +1",
            Back = "Visucius\'s Mantle",
        },
    },

    -- Teleportation rings
    WarpRing = Equip.NewSet {
        Ring1 = "Warp Ring",
    },

    DimRing = Equip.NewSet {
        Ring1 = "Dim. Ring (Holla)",
    },
}

-- Function to update weapon in all relevant sets
local function UpdateWeapon()
    local weapon = settings.Weapon;
    
    -- Update all sets that use Main weapon
    sets.Idle.Main = weapon;
    sets.PetIdle.Tank.Main = weapon;
    sets.PetIdle.Melee.Main = weapon;
    sets.PetIdle.Range.Main = weapon;
    sets.PetIdle.Magic.Main = weapon;
    sets.PupOnly.Main = weapon;
    sets.Engaged.Main = weapon;
    sets.Deploy.Main = weapon;
    sets.Repair.Main = weapon;
    sets.Maintenance.Main = weapon;
    sets.Maneuver.Main = weapon;
    sets.Ventriloquy.Main = weapon;
    sets.WeaponSkill.Default.Main = weapon;
    sets.Town.Main = weapon;
    sets.Utsusemi.Precast.Main = weapon;
    sets.Utsusemi.Midcast.Main = weapon;
    
    -- Overdrive set always uses Xiucoatl
    sets.Overdrive.Main = "Xiucoatl";
    
    -- Refresh current gear
    profile.HandleDefault();
end

profile.Sets = sets

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    gFunc.LockStyle(sets.Town);
    
    -- Chat aliases/commands
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /pupmode /lac fwd pupmode');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /dt /lac fwd dt');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /puponly /lac fwd puponly');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /xiu /lac fwd xiu');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /karambit /lac fwd karambit');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /warpring /lac fwd warpring');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /dimring /lac fwd dimring');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /refresh /lac fwd refresh');
    
    print('PUP Profile Loaded');
    print('Commands: /pupmode (tank/melee/range/magic), /dt, /puponly, /xiu, /karambit, /refresh');
    print('Teleport Commands: /warpring, /dimring');
    print('Default weapon: Xiucoatl | PupOnly mode for fights using Lobo only');
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/alias delete /pupmode');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias delete /dt');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias delete /puponly');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias delete /xiu');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias delete /karambit');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias delete /warpring');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias delete /dimring');
end

profile.HandleCommand = function(args)
    if (args[1] == 'pupmode') then
        if (args[2] ~= nil) then
            local mode = string.lower(args[2]);
            if (mode == 'tank' or mode == 'melee' or mode == 'range' or mode == 'magic') then
                settings.PetMode = mode:gsub("^%l", string.upper);
                print('Pet mode set to: ' .. settings.PetMode);
            else
                print('Invalid mode. Use: tank, melee, range, or magic');
            end
        else
            print('Current pet mode: ' .. settings.PetMode);
        end
        return;
    elseif (args[1] == 'dt') then
        -- Toggle damage taken mode
        print('DT gear equipped');
        gFunc.EquipSet(sets.DT);
        return;
    elseif (args[1] == 'puponly') then
        settings.PupOnly = not settings.PupOnly;
        print('PupOnly mode: ' .. (settings.PupOnly and 'On' or 'Off'));
        return;
    elseif (args[1] == 'xiu') then
        settings.Weapon = 'Xiucoatl';
        UpdateWeapon();
        print('Weapon set to: Xiucoatl');
        return;
    elseif (args[1] == 'karambit') then
        settings.Weapon = 'Karambit';
        UpdateWeapon();
        print('Weapon set to: Karambit');
        return;
    elseif (args[1] == 'warpring') then
        -- Equip warp ring directly
        settings.TeleportActive = true;
        print('Warp Ring equipped - Use /refresh to return to normal gear');
        gFunc.ForceEquip(14, "Warp Ring"); -- Slot 14 is Ring1
        return;
    elseif (args[1] == 'dimring') then
        -- Equip dimensional ring directly
        settings.TeleportActive = true;
        print('Dimensional Ring equipped - Use /refresh to return to normal gear');
        gFunc.ForceEquip(14, "Dim. Ring (Holla)"); -- Slot 14 is Ring1
        return;
    elseif (args[1] == 'refresh') then
        -- Clear teleport flag and refresh gear
        settings.TeleportActive = false;
        print('Returning to normal gear');
        profile.HandleDefault();
        return;
    end
end

profile.HandleDefault = function()
    -- Skip automatic gear changes if teleport item is active
    if (settings.TeleportActive) then
        return;
    end
    
    local player = gData.GetPlayer();
    local pet = gData.GetPet();
    
    -- Check if we're in a town
    local env = gData.GetEnvironment();
    if (env.Area == "Bastok Markets" or env.Area == "Windurst Waters" or 
        env.Area == "Southern San d'Oria" or env.Area == "Upper Jeuno") then
        Equip.Set(sets.Town);
        return;
    end
    
    -- Check for PupOnly mode (high priority)
    if (settings.PupOnly) then
        Equip.Set(sets.PupOnly);
        return;
    end
    
    -- Check for Overdrive buff first (highest priority)
    if (Status.HasStatus('Overdrive')) then
        Equip.Set(sets.Overdrive);
        return;
    end
    
    -- Handle different player states
    if (player.Status == 'Engaged') then
        Equip.Set(sets.Engaged);
    elseif (pet and pet.isvalid) then
        -- Automaton is out, use pet idle gear
        Equip.Set(sets.PetIdle[settings.PetMode]);
    else
        -- No pet, use normal idle
        Equip.Set(sets.Idle);
    end
end

profile.HandleAbility = function()
    local ability = gData.GetAction();
    
    if (ability.Name == 'Deploy') then
        Equip.Set(sets.Deploy);
    elseif (ability.Name == 'Activate') then 
        Equip.Set(sets.Activate);
    elseif (ability.Name == 'Repair') then
        Equip.Set(sets.Repair);
    elseif (ability.Name == 'Maintenance') then
        Equip.Set(sets.Maintenance);
    elseif (ability.Name == 'Ventriloquy') then
        Equip.Set(sets.Ventriloquy);
    elseif (ability.Name == 'Overdrive') then
        Equip.Set(sets.Overdrive);
    elseif (string.find(ability.Name, 'Maneuver')) then
        Equip.Set(sets.Maneuver);
    elseif (string.find(ability.Name, 'Waltz')) then
        Equip.Set(sets.Waltz);
    end
end

profile.HandleWeaponskill = function()
    local ws = gData.GetAction();
    
    -- Use default WS set for all weapon skills
    Equip.Set(sets.WeaponSkill.Default);
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    
    if (spell.Name == 'Utsusemi: Ichi' or spell.Name == 'Utsusemi: Ni') then
        Equip.Set(sets.Utsusemi.Precast);
    else
        Equip.Set(sets.Precast);
    end
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();
    
    if (spell.Name == 'Utsusemi: Ichi' or spell.Name == 'Utsusemi: Ni') then
        Equip.Set(sets.Utsusemi.Midcast);
    end
end

profile.HandleItem = function()
    itemHandler();
end

profile.HandleAftercast = function()
    -- Call HandleDefault to refresh gear after abilities finish
    profile.HandleDefault();
end

return profile

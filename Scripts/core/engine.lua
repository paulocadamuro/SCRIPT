--- Engine table to manage various engine functionalities.
Engine = {}

--- Returns if healing function is enabled
-- This function is a wrapper around the external function engineIsHealingEnabled.
function Engine.isHealingEnabled()
    return engineIsHealingEnabled()
end

--- Returns if heal friend function is enabled
-- This function is a wrapper around the external function return IsHealFriendEnabled.
function Engine.isHealFriendEnabled()
    return engineIsHealFriendEnabled()
end

--- Returns current bot version
-- This function is a wrapper around the external function engineGetBotVersion.
function Engine.getBotVersion()
    return engineGetBotVersion()
end

--- Returns if bot is enabled
-- This function is a wrapper around the external function engineIsBotEnabled.
function Engine.isBotEnabled()
    return engineIsBotEnabled()
end

--- Returns if targeting function is enabled
-- This function is a wrapper around the external function engineIsTargetingEnabled.
function Engine.isTargetingEnabled()
    return engineIsTargetingEnabled()
end

--- Returns if magic shooter function is enabled
-- This function is a wrapper around the external function engineIsMagicShooterEnabled.
function Engine.isMagicShooterEnabled()
    return engineIsMagicShooterEnabled()
end

--- Returns if cavebot function is enabled
-- This function is a wrapper around the external function engineIsCaveBotEnabled.
function Engine.isCaveBotEnabled()
    return engineIsCaveBotEnabled()
end

--- Returns if equipment function is enabled
-- This function is a wrapper around the external function engineIsEquipmentEnabled.
function Engine.isEquipmentEnabled()
    return engineIsEquipmentEnabled()
end

--- Returns if timer function is enabled
-- This function is a wrapper around the external function engineIsTimerEnabled.
function Engine.isTimerEnabled()
    return engineIsTimerEnabled()
end

--- Enables or disables the targeting system.
-- This function is a wrapper around the external function engineTargetingEnable.
-- @param enable (boolean) - A flag indicating whether to enable (true) or disable (false) the targeting system.
function Engine.enableTargeting(enable)
    engineTargetingEnable(enable)
end

--- Enables or disables the magic shooter system.
-- This function is a wrapper around the external function engineMagicShooterEnable.
-- @param enable (boolean) - A flag indicating whether to enable (true) or disable (false) the magic shooter system.
function Engine.enableMagicShooter(enable)
    engineMagicShooterEnable(enable)
end

--- Enables or disables the heal friend system.
-- This function is a wrapper around the external function engineHealFriendEnable.
-- @param enable (boolean) - A flag indicating whether to enable (true) or disable (false) the heal friend system.
function Engine.enableHealFriend(enable)
    engineHealFriendEnable(enable)
end

--- Enables or disables the healing system.
-- This function is a wrapper around the external function engineHealingEnable.
-- @param enable (boolean) - A flag indicating whether to enable (true) or disable (false) the healing system.
function Engine.enableHealing(enable)
    engineHealingEnable(enable)
end

--- Enables or disables the equipment system.
-- This function is a wrapper around the external function engineEquipmentEnable.
-- @param enable (boolean) - A flag indicating whether to enable (true) or disable (false) the equipment system.
function Engine.enableEquipment(enable)
    engineEquipmentEnable(enable)
end

--- Enables or disables the timer system.
-- This function is a wrapper around the external function engineTimerEnable.
-- @param enable (boolean) - A flag indicating whether to enable (true) or disable (false) the timer system.
function Engine.enableTimer(enable)
    engineTimerEnable(enable)
end

--- Enables or disables the cavebot system.
-- This function is a wrapper around the external function engineCaveBotEnable.
-- @param enable (boolean) - A flag indicating whether to enable (true) or disable (false) the cavebot system.
function Engine.enableCaveBot(enable)
    return engineCaveBotEnable(enable)
end

--- Enables or disables all bot functions.
-- This function is a wrapper around the external function engineBotEnable.
-- @param enable (boolean) - A flag indicating whether to enable (true) or disable (false) all bot functions.
function Engine.enableBot(enable)
    engineBotEnable(enable)
end

--- Switches the profile of magic shooter by index.
-- This function is a wrapper around the external function engineMagicShooterSwitchProfile.
-- @param profileIndex (number) - The index of the profile to switch to (from 0 to 9).
function Engine.magicShooterSwitchProfile(profileIndex)
    engineMagicShooterSwitchProfile(profileIndex)
end

--- Gets the current profile index selected on magic shooter.
-- This function is a wrapper around the external function engineMagicShooterGetProfile.
-- @return (number) - The index of current selected profile.
function Engine.magicShooterGetProfile()
    return engineMagicShooterGetProfile()
end

--- Switches the profile of targeting by index.
-- This function is a wrapper around the external function engineTargetingSwitchProfile.
-- @param profileIndex (number) - The index of the profile to switch to (from 0 to 9).
function Engine.targetingSwitchProfile(profileIndex)
    engineTargetingSwitchProfile(profileIndex)
end

--- Gets the current profile index selected on targeting.
-- This function is a wrapper around the external function engineTargetingGetProfile.
-- @return (number) - The index of current selected profile.
function Engine.targetingGetProfile()
    return engineTargetingGetProfile()
end

--- Switches the profile of equipment by index.
-- This function is a wrapper around the external function engineEquipmentSwitchProfile.
-- @param profileIndex (number) - The index of the profile to switch to (from 0 to 9).
function Engine.equipmentSwitchProfile(profileIndex)
    engineEquipmentSwitchProfile(profileIndex)
end

--- Gets the current profile index selected on equipment.
-- This function is a wrapper around the external function engineEquipmentGetProfile.
-- @return (number) - The index of current selected profile.
function Engine.equipmentGetProfile()
    return engineEquipmentGetProfile()
end

--- Gets the default scripts directory.
-- This function is a wrapper around the external function engineGetScriptsDirectory.
-- @return (string) - The path to default scripts directory.
function Engine.getScriptsDirectory()
    return engineGetScriptsDirectory()
end

--- Gets the last user ID.
-- This function is useful to identify current user. You can use engineGetUserId directly if you need to avoid hooks.
-- @return (string) - The last generated user ID, non-sensitive data.
function Engine.getUserId()
    return engineGetUserId()
end

--- Load specific script.
-- This function is a wrapper around the external function engineLoadScript.
-- This function runs asynchronously, so it may take some time to load the script, so if you will use Engine.unloadScript right after this function, you should wait for the script to be loaded, wait some delay.
-- @param scriptName (string) - The name of the script to load. This name is based on "Available Scripts" list in "Scripting" tab.
-- @return (boolean) - Returns true if the script is loaded successfully, false if the script doesn't exists.
function Engine.loadScript(scriptName)
    return engineLoadScript(scriptName)
end

--- Unload specific script.
-- This function is a wrapper around the external function engineUnloadScript.
-- @param scriptName (string) - The name of the script to unload. This name is based on "Enabled Scripts" list in "Scripting" tab.
-- @return (boolean) - Returns true if the script was unloaded successfully, false if the script doesn't exists.
function Engine.unloadScript(scriptName)
    return engineUnloadScript(scriptName)
end
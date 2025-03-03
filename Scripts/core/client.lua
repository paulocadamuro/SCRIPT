Client = {}

--- Check if the client is currently connected.
-- This function is a wrapper around the external function clientIsConnected.
-- @return true if the client is currently connected, false otherwise.
function Client.isConnected()
    return clientIsConnected()
end

--- Check if a specified hotkey is currently pressed.
-- This function is a wrapper around the external function clientIsKeyPressed.
-- @param key (number) - The key code. Example: A (0x65)
-- @param flags (string) - The flags for modifiers. Refer the parameter value as Enums.FlagModifiers, apply bit or operation for multiple flags
-- @return true if the specified key is currently pressed, false otherwise.
function Client.isKeyPressed(key, flags)
	return clientIsKeyPressed(key, flags)
end

--- Show a message on center of game screen.
-- This function is a wrapper around the external function clientShowMessage.
-- @param message (string) - The message to be shown
function Client.showMessage(message)
	clientShowMessage(message)
end

--- Disconnects the client using X-Log native function.
-- This function is a wrapper around the external function clientXLog.
function Client.XLog()
	clientXLog()
end

--- Get client game window dimensions.
-- This function is a wrapper around the external function clientGetGameWindowDimensions.
-- @return the following structure in table {x=0,y=0,width=0,height=0}
function Client.getGameWindowDimensions()
	return clientGetGameWindowDimensions()
end

--- Get the current latency from the client latency indicator UI.
-- This function is a wrapper around the external function clientGetLatency.
-- @return The current latency in milliseconds, if the information isn't available will return -1.
function Client.getLatency()
	return clientGetLatency()
end

--- Get the current latency from the server.
-- This function is a wrapper around the external function clientGetServerLatency.
-- @return The current server latency in milliseconds, if the information isn't available will return 0.
function Client.getServerLatency()
	return clientGetServerLatency()
end

--- Focus the client window.
-- This function is a wrapper around the external function clientFocus.
-- Note from Windows documentation: An application cannot force a window to the foreground while the user is working with another window. Instead, Windows flashes the taskbar button of the window to notify the user.
function Client.focus()
	clientFocus()
end

-- Send a key press event to the client.
-- This function is a wrapper around the external function clientSendHotkey.
-- You can base the key and modifier params on HotkeyManager.parseKeyCombination function returns.
-- @param key (number) - The key code.
-- @param modifier (number) - The modifier flags.
function Client.sendHotkey(key, modifier)
	clientSendHotkey(key, modifier)
end
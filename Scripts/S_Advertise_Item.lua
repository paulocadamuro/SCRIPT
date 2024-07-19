-- Developed by euLuN

local ADVERTISING_CHANNEL_ID = 5 -- CHANNEL ID
local ADVERTISE_MESSAGE = "SELL SANGUINE GALOSHES >> MARKET"
local TIME_BETWEEN_MESSAGES = 140000 -- Tempo em milisegundos (padrão é de 3 minutos)

Timer("talkAdvertiseMessage", function()
  Game.talkChannel(ADVERTISE_MESSAGE, ADVERTISING_CHANNEL_ID)
end, TIME_BETWEEN_MESSAGES)
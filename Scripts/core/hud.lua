-- Table to represent a HUD and its associated functions
HUDList = {}
HUDCount = 0
HUD = {}
HUD.__index = HUD

-- Set up the constructor call
setmetatable(HUD, {
    __call = function(cls, ...)
        return cls.new(...)
    end,
})

-- Don't touch it
function onHudClick(id)
    local hudItem = HUDList[id]
    if not hudItem then return end

    hudItem:onClick()
end

-- Don't touch it
function HUD:onClick()
    if not self.callback then return end

    self.callback()
end

--- Constructor for the HUD class
-- @param x coordinate of the game window on the x-axis
-- @param y coordinate of the game window on the y-axis
-- @param value the text or itemid to draw on the screen
-- @param newFeatures boolean to enable/disable new features
-- @return A new HUD object
-- @important Please, don't use HUDItem functions in HUDText element and vice-versa
function HUD.new(x, y, value, newFeatures)
    local self = setmetatable({}, HUD)
    self.newFeatures = newFeatures
    -- The self.id works as an index, can start from 0
	if (type(value) == 'number') then
		self.id = hudItemCreate(newFeatures or false)
        self.isItem = true
        self:setItemId(value)
	else
		self.id = hudTextCreate(newFeatures or false)
        self.isItem = false
        self:setText(value)
	end

    self:setPos(x, y)
    HUDList[self.id] = self
    HUDCount = HUDCount + 1
    if HUDCount == 1 then
        Game.registerEvent(Game.Events.HUD_CLICK, onHudClick)
    end
    return self
end

setmetatable(HUD, {__call = function(_, ...) return HUD.new(...) end})

--- Get the hud's ID.
-- @return The hud's ID
function HUD:getId()
    return self.id
end

-- Get current hud position
-- Note: this function will return the draw position X, Y on screen, shouldn't be used directly for setPos function.
-- Also this function can return x:0,y:0 until the first draw since it return the draw position on game screen.
-- @return The hud's drawn position, as table {x=0, y=0}
function HUD:getPos()
    return hudGetPos(self.id)
end

-- Set current hud position
-- Note: if you are using alignments, this function will be used as the margin offsets.
-- Also, when you set position of a HUD element it will reset the mouse dragging offsets to 0,0.
function HUD:setPos(x, y)
    hudSetPos(self.id, x, y)
end

-- Get current margins used on alignemnts
-- Can be used only if newFeatures is enabled, also remember the margins are set by setPos function if you are using alignments.
-- @return The hud's margins, as table {x=0, y=0}
function HUD:getMargins()
    if not self.newFeatures then return end
    return hudGetMargins(self.id)
end

-- Hide hud
function HUD:hide()
    hudSetVisible(self.id, false)
end

-- Show hud
function HUD:show()
    hudSetVisible(self.id, true)
end

-- Set draggable state of specific hud
function HUD:setDraggable(draggable)
    hudSetDraggable(self.id, draggable)
end

-- Set hud text, only works if hud is a text
function HUD:setText(text)
    if self.isItem then return end
    hudTextSetText(self.id, text)
end

-- Set hud text horizontal alignment. Default is Enums.HorizontalAlign.None
-- Can be used only if newFeatures is enabled
-- Remember: when using any horizontal alignment type, your X position will be the margin offset.
function HUD:setHorizontalAlignment(alignment)
    if not self.newFeatures then return end
    hudSetHorizontalAlignment(self.id, alignment)
end

-- Set hud text vertical alignment. Default is Enums.VerticalAlign.None
-- Can be used only if newFeatures is enabled
-- Remember: when using any vertical alignment type, your Y position will be the margin offset.
function HUD:setVerticalAlignment(alignment)
    if not self.newFeatures then return end
    hudSetVerticalAlignment(self.id, alignment)
end

-- Set hud text color
function HUD:setColor(r, g, b)
    if self.isItem then return end
    hudTextSetColor(self.id, r, g, b)
end

-- Set hud text font size. Default is 8.25
-- Can be used only if newFeatures is enabled
function HUD:setFontSize(fontSize)
    if self.isItem then return end
    hudTextSetFontSize(self.id, fontSize)
end

-- Set hud item id
function HUD:setItemId(id)
    if not self.isItem then return end
    hudItemSetItemId(self.id, id)
end

-- Set hud item size. The limit of size for items is based on their sprite. 
-- Example: gold coin size is 32x32, so you can't pass these values.
-- If you need to scale more the size, you can use HUD:setScale(value) function
function HUD:setSize(width, height)
    hudSetSize(self.id, width, height)
end

-- Set hud item scale. The value is a float number, where 1.0 is the default size.
-- Can be used only if newFeatures is enabled
function HUD:setScale(value)
    if not self.isItem or not self.newFeatures then return end
    hudSetScale(self.id, value)
end

-- Set hud on click callback
function HUD:setCallback(callback)
    self.callback = callback
end

-- Destroy the hud
function HUD:destroy()
    hudDestroy(self.id)
    HUDCount = HUDCount - 1
    HUDList[self.id] = nil
    if HUDCount == 0 then
        Game.unregisterEvent(Game.Events.HUD_CLICK, onHudClick)
    end
    self = nil
end
-- CaveBot table to manage the cavebot system.
CaveBot = {}

--- Goto to specific label waypoint on cavebot
-- This function is a wrapper around the external function cavebotGoto.
-- @param label (string) - The waypoint label name
function CaveBot.GoTo(labelName)
    return cavebotGoto(labelName)
end

--- Adds a waypoint to the cavebot system.
-- This function is a wrapper around the external function cavebotAddWaypoint.
-- @param waypointType (number) - The type of waypoint to add. Refer waypointType as Enums.WaypointType
-- @param x (number) - The x coordinate of the waypoint.
-- @param y (number) - The y coordinate of the waypoint.
-- @param z (number) - The z coordinate of the waypoint.
function CaveBot.addWaypoint(waypointType, x, y, z)
    cavebotAddWaypoint(waypointType, x, y, z)
end

--- Insert a waypoint before specific id on the cavebot system.
-- This function is a wrapper around the external function cavebotInsertWaypoint.
-- @param wpId (number) - The id of the waypoint to insert before.
-- @param waypointType (number) - The type of waypoint to add. Refer waypointType as Enums.WaypointType
-- @param x (number) - The x coordinate of the waypoint.
-- @param y (number) - The y coordinate of the waypoint.
-- @param z (number) - The z coordinate of the waypoint.
function CaveBot.insertWaypoint(wpId, waypointType, x, y, z)
    cavebotInsertWaypoint(wpId, waypointType, x, y, z)
end

--- Replace a waypoint by specific id on the cavebot system.
-- This function is a wrapper around the external function cavebotReplaceWaypoint.
-- @param wpId (number) - The id of the waypoint to replace.
-- @param waypointType (number) - The type of waypoint to add. Refer waypointType as Enums.WaypointType
-- @param x (number) - The x coordinate of the waypoint.
-- @param y (number) - The y coordinate of the waypoint.
-- @param z (number) - The z coordinate of the waypoint.
function CaveBot.replaceWaypoint(wpId, waypointType, x, y, z)
    cavebotReplaceWaypoint(wpId, waypointType, x, y, z)
end

--- Delete a waypoint by specific id on the cavebot system.
-- This function is a wrapper around the external function cavebotDeleteWaypoint.
-- @param wpId (number) - The id of the waypoint to delete.
function CaveBot.deleteWaypoint(wpId)
    cavebotDeleteWaypoint(wpId)
end

--- Clear all waypoints on the cavebot system.
-- This function is a wrapper around the external function cavebotClearWaypoints.
function CaveBot.clearWaypoints()
    cavebotClearWaypoints()
end

--- Select a waypoint by specific id on the cavebot system.
-- This function is a wrapper around the external function cavebotSelectWaypoint.
-- @param wpId (number) - The id of the waypoint to select.
function CaveBot.selectWaypoint(wpId)
    cavebotSelectWaypoint(wpId)
end

--- Get selected waypoint id.
-- This function is a wrapper around the external function cavebotGetSelectedWaypointId.
-- @return (number) - Returns the waypoint id if there's one selected, otherwise returns -1.
function CaveBot.getSelectedWaypointId()
    return cavebotGetSelectedWaypointId()
end

--- Pause the cavebot system for a specific time in milliseconds.
-- This function is a wrapper around the external function cavebotPause.
-- @param milliseconds (number) - The time to pause the cavebot system in milliseconds. If the specified time is 0, the cavebot will resume.
function CaveBot.pause(milliseconds)
    cavebotPause(milliseconds)
end

--- Save all waypoints to a file.
-- This function is a wrapper around the external function cavebotSaveFile.
-- @param file (string) - The file name to save the waypoints. The path is relative to the Documents/ZeroBot directory.
-- @return (boolean) - Return true if the action succeeded, or false if the file name is invalid. Remember: this function will not return the result of file saving.
function CaveBot.saveFile(fileName)
    return cavebotSave(fileName)
end

--- Load all waypoints from a file.
-- This function is a wrapper around the external function cavebotLoadFile.
-- @param file (string) - The file name to load the waypoints. The path is relative to the Documents/ZeroBot directory.
function CaveBot.loadFile(fileName)
    cavebotLoad(fileName)
end

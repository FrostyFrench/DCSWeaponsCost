Frosty_ShotEvent = {}
subtotal = 0
shooting_start = 0
local m230_rof = 620 / 60

local weaponcost = {
-- MISSILES --
['AGM_114K'] = 10000,

-- GUN -- 
['M230'] = 100

-- ROCKETS --
}

function fprint(...)
	local args = {...}
	for k,thing in pairs(args) do
		trigger.action.outText(tostring(thing), 10)
	end
end

function Frosty_ShotEvent:onEvent(event)
	if event.id == 1 then
		--subtotal = subtotal + weaponcost[event.weapon]
		fprint(event.weapon:getTypeName())
		fprint(event.initiator:getCoalition())
	end
	if event.id == 23 then
		shooting_start = event.Time
		fprint(event.weapon:getTypeName())
	end
	if event.id == 24 then
		local time_taken = event.Time - shooting_start
		fprint("Shooting Duration: " ... time_taken)
		fprint(time_taken * m230_rof)
	end
end

world.addEventHandler(Frosty_ShotEvent)

function outtoscreen()
	fprint(subtotal .. 'Dollarinos')
	timer.scheduleFunction(outotscreen, timer.getTime() + 11)
end

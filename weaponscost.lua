Frosty_ShotEvent = {}
subtotal = 0
shooting_start = 0
local m230_rof = 620 / 60

local weaponcost = {
-- MISSILES --
['AGM_114K'] = 10000,

-- GUN -- 
['M_230_new'] = 100

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
		fprint("Weapon Name: " .. event.weapon:getTypeName())
		fprint("Initiator Coalition: " .. event.initiator:getCoalition())
		subtotal = subtotal + weaponcost[event.weapon:getTypeName()]
	end
	if event.id == 23 then
		shooting_start = event.time
		fprint("shooting_start: " .. shooting_start)
		fprint("Weapon Name: " .. event.weapon_name)
	end
	if event.id == 24 then
		local time_taken = event.time - shooting_start
		fprint("Shooting Duration: " .. time_taken)
		local rounds_fired = math.modf(time_taken * m230_rof)
		fprint("Rounds Fired: " .. rounds_fired)
		subtotal = subtotal + (weaponcost[event.weapon_name] * rounds_fired)
	end
end

world.addEventHandler(Frosty_ShotEvent)

function outtoscreen()
	fprint("Total: $" .. subtotal .. ' Dollarinos')
	timer.scheduleFunction(outotscreen, {}, timer.getTime() + 11)
end

outtoscreen()

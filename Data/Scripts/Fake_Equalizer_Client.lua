local start_height = script.parent.parent:GetCustomProperty("start_height")
local max_height = script.parent.parent:GetCustomProperty("max_height")
local geo = script:GetCustomProperty("geo"):WaitForObject()

local up = {}

local childs = geo:GetChildren()
local max = #childs

function fake_it_bro()
	local up_total = math.random(max)

	for _, u in ipairs(up) do
		local pos = u:GetWorldPosition()

		pos.z = start_height
		u:SetWorldPosition(pos)
	end

	up = {}

	for i, c in ipairs(childs) do
		if(i <= up_total) then
			local pos = c:GetWorldPosition()

			pos.z = pos.z + math.random(max_height)

			c:SetWorldPosition(pos)
			up[#up + 1] = c
		end
	end
end

function Tick(dt)
	fake_it_bro()
	Task.Wait(.2)
end
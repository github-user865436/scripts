local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--the person you want to find the name of, friend of that same person
--nil, the person you want to find their friends ids
function GetListOfIds(getName, session, rev)
	local PlayerList = Players:GetFriendsAsync(session)
	if not getName then
		local ListofIds = {}
		for _, Data in PlayerList:GetCurrentPage() do
			table.insert(ListofIds, Data["Id"])
		end
		return ListofIds
	else
		for _, Data in PlayerList:GetCurrentPage() do
			if rev then
				if Data["Username"] == getName then
					return Data["Id"]
				end
			else
				if Data["Id"] == getName then
					return Data["Username"]
				end
			end
		end
	end
end

function API(rev, researched, halt)
	if not halt then print("init") end
	--code setup
	local fullList = {}
	local lastKnownUser = rev
	if type(lastKnownUser) ~= "number" then
		lastKnownUser = lastKnownUser.userId
	end
	local aliveList = {[rev] = {rev}}
	
	task.wait() -- excaustion prevention
	
	local branch = {lastKnownUser}
	local children = GetListOfIds(nil, lastKnownUser)
	
	--actual iteration code
	local function IterateGeneration(Id)
		--check if this person is new
		local halt = false
		for _, Idcheck in fullList do
			halt = halt or (Id == Idcheck)
		end
		
		if not halt then --person is new
			table.insert(fullList, Id) --accept that this person is only now being brung up

			local name = GetListOfIds(Id, lastKnownUser) --name of the focus
			if name == researched then --this is the person we are looking for
				aliveList[Id] = {false, aliveList[lastKnownUser]} --provide excess information to express a halt
			else --continue search
				aliveList[Id] = {table.move({name}, 1, 1, #branch, branch)} --put the persons name into branch
			end
		end
	end
	
	--just checking stuff and doing basics like ensuring that stuff is returned or continued
	local branches = {}
	local nlKUs = {}
	for _, Id in children do
		IterateGeneration(Id)
		
		local nlKU = aliveList[Id]
		
		table.insert(nlKUs, nlKU)
		if not nlKU then
			table.insert(branches, nlKU[2])
		end
	end 
	local continuecode = false
	
	--loop function to get all of the players in a branch til the chosen one is found
	if #branches > 0 then
		print("found")
		return branches
	else
		function reIterate(list, count)
			local returns = {{}}
			local needbe = {{}, false}
			if count then print("iteratenum", count) end
			for i, nlKU in list do
				print("copynum", i)
				if halt then
					return nlKU
				else
					local nec = nlKU[1]
					local thereturn = API(GetListOfIds(nec[#nec], lastKnownUser, true), researched, true)

					if type(thereturn) == "table" then
						needbe[2] = true
						for _, branch in branches do
							table.insert(needbe[1], branch)
						end
					else
						table.insert(returns[1], thereturn)
					end
				end
			end

			if needbe[2] then
				continuecode = true
				return needbe
			else
				continuecode = true
				return returns
			end
		end
	end
	
	print("reit")
	--turn the loop into action
	local count = 1
	local previous = reIterate(nlKUs, 0)
	while continuecode do
		task.wait()
		if previous[2] then
			return previous[1]
		end
		previous = reIterate(previous, count)
		count = count + 1
		continuecode = false
	end
end

ReplicatedStorage.UserLine.OnServerInvoke = API

--[[
local getName = function(userId)
	local http = game:GetService("HttpService")
	local full = function(h)
		local s, r = pcall(function()
			return h
		end)				

		if s then
			if r then
				return r
			end
		else
			warn(r) return
		end
	end

	local r1 = full(http:JSONEncode({["userIds"] = {userId},["excludeBannedUsers"] = true}))
	if r1 then
		local r2 = full(http:PostAsync("https://users.roproxy.com/v1/users", r1))
		if r2 then
			local r3 = full(http:JSONDecode(r2))
			if r3 then
				local data = r3.data[1]
				if data then
					return data.name
				end
			end
		end
	end
end
]]

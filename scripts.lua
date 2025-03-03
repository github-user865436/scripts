function SolveTheMath24Card(newnumbers4, lookup)
	local answers = {}
	local numbers3 = {["Add"] = {}, ["Subtract"] = {}, ["Multiply"] = {}, ["Divide"] = {}}
	local results3 = {}
	
	table.insert(numbers3["Add"], {1, 2})
	table.insert(numbers3["Multiply"], {1, 2})
	table.insert(numbers3["Subtract"], {1, 2})
	table.insert(numbers3["Divide"], {1, 2})
	table.insert(numbers3["Subtract"], {2, 1})
	table.insert(numbers3["Divide"], {2, 1})
	
	table.insert(numbers3["Add"], {1, 3})
	table.insert(numbers3["Multiply"], {1, 3})
	table.insert(numbers3["Subtract"], {1, 3})
	table.insert(numbers3["Divide"], {1, 3})
	table.insert(numbers3["Subtract"], {3, 1})
	table.insert(numbers3["Divide"], {3, 1})
	
	table.insert(numbers3["Add"], {1, 4})
	table.insert(numbers3["Multiply"], {1, 4})
	table.insert(numbers3["Subtract"], {1, 4})
	table.insert(numbers3["Divide"], {1, 4})
	table.insert(numbers3["Subtract"], {4, 1})
	table.insert(numbers3["Divide"], {4, 1})
	
	table.insert(numbers3["Add"], {2, 3})
	table.insert(numbers3["Multiply"], {2, 3})
	table.insert(numbers3["Subtract"], {2, 3})
	table.insert(numbers3["Divide"], {2, 3})
	table.insert(numbers3["Subtract"], {3, 2})
	table.insert(numbers3["Divide"], {3, 2})
	
	table.insert(numbers3["Add"], {2, 4})
	table.insert(numbers3["Multiply"], {2, 4})
	table.insert(numbers3["Subtract"], {2, 4})
	table.insert(numbers3["Divide"], {2, 4})
	table.insert(numbers3["Subtract"], {4, 2})
	table.insert(numbers3["Divide"], {4, 2})
	
	table.insert(numbers3["Add"], {3, 4})
	table.insert(numbers3["Multiply"], {3, 4})
	table.insert(numbers3["Subtract"], {3, 4})
	table.insert(numbers3["Divide"], {3, 4})
	table.insert(numbers3["Subtract"], {4, 3})
	table.insert(numbers3["Divide"], {4, 3})
	
	for _, usednumbers in ipairs(numbers3["Add"]) do
		local nonusednumbers = {1, 2, 3, 4}
		table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[1]))
		table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[2]))
		table.insert(results3, {{newnumbers4[1][nonusednumbers[1]], newnumbers4[1][nonusednumbers[2]], newnumbers4[1][usednumbers[1]] + newnumbers4[1][usednumbers[2]]}, {{"Add1", newnumbers4[1][usednumbers[1]], newnumbers4[1][usednumbers[2]]}}})
	end
	for _, usednumbers in ipairs(numbers3["Subtract"]) do
		local nonusednumbers = {1, 2, 3, 4}
		table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[1]))
		table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[2]))
		table.insert(results3, {{newnumbers4[1][nonusednumbers[1]], newnumbers4[1][nonusednumbers[2]], newnumbers4[1][usednumbers[1]] - newnumbers4[1][usednumbers[2]]}, {{"Subtract1", newnumbers4[1][usednumbers[1]], newnumbers4[1][usednumbers[2]]}}})
	end
	for _, usednumbers in ipairs(numbers3["Multiply"]) do
		local nonusednumbers = {1, 2, 3, 4}
		table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[1]))
		table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[2]))
		table.insert(results3, {{newnumbers4[1][nonusednumbers[1]], newnumbers4[1][nonusednumbers[2]], newnumbers4[1][usednumbers[1]] * newnumbers4[1][usednumbers[2]]}, {{"Multiply1", newnumbers4[1][usednumbers[1]], newnumbers4[1][usednumbers[2]]}}})
	end
	for _, usednumbers in ipairs(numbers3["Divide"]) do
		local nonusednumbers = {1, 2, 3, 4}
		table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[1]))
		table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[2]))
		table.insert(results3, {{newnumbers4[1][nonusednumbers[1]], newnumbers4[1][nonusednumbers[2]], newnumbers4[1][usednumbers[1]] / newnumbers4[1][usednumbers[2]]}, {{"Divide1", newnumbers4[1][usednumbers[1]], newnumbers4[1][usednumbers[2]]}}})
	end
	
	for _, newnumbers3 in ipairs(results3) do
		local numbers2 = {["Add"] = {}, ["Subtract"] = {}, ["Multiply"] = {}, ["Divide"] = {}}
		local results2 = {}
		
		table.insert(numbers2["Add"], {1, 2})
		table.insert(numbers2["Multiply"], {1, 2})
		table.insert(numbers2["Subtract"], {1, 2})
		table.insert(numbers2["Divide"], {1, 2})
		table.insert(numbers2["Subtract"], {2, 1})
		table.insert(numbers2["Divide"], {2, 1})

		table.insert(numbers2["Add"], {1, 3})
		table.insert(numbers2["Multiply"], {1, 3})
		table.insert(numbers2["Subtract"], {1, 3})
		table.insert(numbers2["Divide"], {1, 3})
		table.insert(numbers2["Subtract"], {3, 1})
		table.insert(numbers2["Divide"], {3, 1})

		table.insert(numbers2["Add"], {2, 3})
		table.insert(numbers2["Multiply"], {2, 3})
		table.insert(numbers2["Subtract"], {2, 3})
		table.insert(numbers2["Divide"], {2, 3})
		table.insert(numbers2["Subtract"], {3, 2})
		table.insert(numbers2["Divide"], {3, 2})

		for _, usednumbers in ipairs(numbers2["Add"]) do
			local nonusednumbers = {1, 2, 3}
			table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[1]))
			table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[2]))
			table.insert(results2, {{newnumbers3[1][nonusednumbers[1]], newnumbers3[1][usednumbers[1]] + newnumbers3[1][usednumbers[2]]}, {newnumbers3[2][1], {"Add2", newnumbers3[1][usednumbers[1]], newnumbers3[1][usednumbers[2]]}}})
		end
		for _, usednumbers in ipairs(numbers2["Subtract"]) do
			local nonusednumbers = {1, 2, 3}
			table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[1]))
			table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[2]))
			table.insert(results2, {{newnumbers3[1][nonusednumbers[1]], newnumbers3[1][usednumbers[1]] - newnumbers3[1][usednumbers[2]]}, {newnumbers3[2][1], {"Subtract2", newnumbers3[1][usednumbers[1]], newnumbers3[1][usednumbers[2]]}}})
		end
		for _, usednumbers in ipairs(numbers2["Multiply"]) do
			local nonusednumbers = {1, 2, 3}
			table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[1]))
			table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[2]))
			table.insert(results2, {{newnumbers3[1][nonusednumbers[1]], newnumbers3[1][usednumbers[1]] * newnumbers3[1][usednumbers[2]]}, {newnumbers3[2][1], {"Multiply2", newnumbers3[1][usednumbers[1]], newnumbers3[1][usednumbers[2]]}}})
		end
		for _, usednumbers in ipairs(numbers2["Divide"]) do
			local nonusednumbers = {1, 2, 3}
			table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[1]))
			table.remove(nonusednumbers, table.find(nonusednumbers, usednumbers[2]))
			table.insert(results2, {{newnumbers3[1][nonusednumbers[1]], newnumbers3[1][usednumbers[1]] / newnumbers3[1][usednumbers[2]]}, {newnumbers3[2][1], {"Divide2", newnumbers3[1][usednumbers[1]], newnumbers3[1][usednumbers[2]]}}})
		end
		
		for _, newnumbers2 in ipairs(results2) do
			local numbers1 = {["Add"] = {}, ["Subtract"] = {}, ["Multiply"] = {}, ["Divide"] = {}}
			local results1 = {}
			
			table.insert(numbers1["Add"], {1, 2})
			table.insert(numbers1["Multiply"], {1, 2})
			table.insert(numbers1["Subtract"], {1, 2})
			table.insert(numbers1["Divide"], {1, 2})
			table.insert(numbers1["Subtract"], {2, 1})
			table.insert(numbers1["Divide"], {2, 1})
			
			for _, usednumbers in ipairs(numbers1["Add"]) do
				table.insert(results1, {{newnumbers2[1][usednumbers[1]] + newnumbers2[1][usednumbers[2]]}, {newnumbers2[2][1], newnumbers2[2][2], {"Add3", newnumbers2[1][usednumbers[1]], newnumbers2[1][usednumbers[2]]}}})
			end
			for _, usednumbers in ipairs(numbers1["Subtract"]) do
				table.insert(results1, {{newnumbers2[1][usednumbers[1]] - newnumbers2[1][usednumbers[2]]}, {newnumbers2[2][1], newnumbers2[2][2], {"Subtract3", newnumbers2[1][usednumbers[1]], newnumbers2[1][usednumbers[2]]}}})
			end
			for _, usednumbers in ipairs(numbers1["Multiply"]) do
				table.insert(results1, {{newnumbers2[1][usednumbers[1]] * newnumbers2[1][usednumbers[2]]}, {newnumbers2[2][1], newnumbers2[2][2], {"Multiply3", newnumbers2[1][usednumbers[1]], newnumbers2[1][usednumbers[2]]}}})
			end
			for _, usednumbers in ipairs(numbers1["Divide"]) do
				table.insert(results1, {{newnumbers2[1][usednumbers[1]] / newnumbers2[1][usednumbers[2]]}, {newnumbers2[2][1], newnumbers2[2][2], {"Divide3", newnumbers2[1][usednumbers[1]], newnumbers2[1][usednumbers[2]]}}})
			end
			
			for _, newnumbers1 in ipairs(results1) do
				if newnumbers1[1][1] == lookup then
					table.insert(answers, newnumbers1[2])
				end
			end
		end
	end
	return answers
end

game.ReplicatedStorage.Math24.OnServerInvoke = function(player, params, lookup)
	return SolveTheMath24Card({params, {}}, lookup)
end

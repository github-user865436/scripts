local Rating = 1434
local Games = {["Count"] = 0, ["Data"] = {}}
local customKfactor = 65

function ChangeRating(RatingA, RatingB, Score, Kfactor)
	local Credits = 480
	local Scale = 10
	local Q_A = Scale ^ (RatingA / Credits)
	local Q_B = Scale ^ (RatingB / Credits)
	local ExpectedScoreRatio = Q_A / Q_B
	local QE = Q_A + Q_B
	local FactorA = Q_A / QE
	local FactorB = Q_B / QE
	return RatingA + Kfactor * ExpectedScoreRatio * (Score - FactorA)
end

function ProcessGame(OpponentRating, GameOutcome, TournamentStart, Kfactor, Update)
	if not TournamentStart then TournamentStart = 1 end
	local RatingUsageFactor = Rating
	if Games["Count"] > math.max(0, TournamentStart - 1) then
		RatingUsageFactor = Games["Data"][Games["Count"] - (TournamentStart - 1)]["After"]
	end
	
	if not Kfactor then Kfactor = customKfactor end
	local NewRating = ChangeRating(RatingUsageFactor, OpponentRating, GameOutcome, Kfactor)
	Games["Count"] = Games["Count"] + 1
	
	table.insert(
		Games["Data"],
		Games["Count"],
		{
			["After"] = NewRating,
			["Before"] = Rating, 
			["Opponent"] = OpponentRating, 
			["Outcome"] = GameOutcome, 
			["K"] = Kfactor
		}
	)
	
	local Places = 0
	if Update then
		Rating = math.round(10^Places * NewRating) / 10^Places
	end
end

ProcessGame(Rating, 0.5, 1, customKfactor, false)


--[[Tournament Start
ProcessGame(1609, 0)
ProcessGame(1477, 0.5)
ProcessGame(1388, 1)
ProcessGame(1586, 1)
ProcessGame(1720, 0, 1, customKfactor, true)
print(Rating)]]


ProcessGame(1500, 0, 1, customKfactor, true)
print(Rating)

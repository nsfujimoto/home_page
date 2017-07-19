Date.today.upto(Date.today + 50) do |date|
	BreedingRecord.create(
		date: date,
		note: "testtest" + date.to_s
	)
end
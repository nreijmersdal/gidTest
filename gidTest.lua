--
-- gidTest: Gideros Test Framework
-- Licensed under MIT
-- Copyright (c) 2012 Niels van Reijmersdal
--

gidTest = Core.class()

--
-- Function: run
-- Runs all global functions that start with the name test_
-- For running a subset of tests use the search_pattern. Example: test_class_
--
function gidTest:run(search_pattern)
	local testCount = 0
	local testCountSucceed = 0
	local testCountFailed  = 0
	local testFinalResult = "Failed"
	local testResult = false
	
	if(search_pattern==nil) then
		search_pattern = "test_"
	end
	
	-- Count all tests
	for key,value in pairs(_G) do
		if(string.find(key, search_pattern)) then
			testCount = testCount + 1
		end
	end

	print("")
	print("------[ gidTest tests: " .. testCount .. " ]------")

	-- Find and run all tests
	for key,value in pairs(_G) do
		if(string.find(key, search_pattern)) then
			testResult = _G[key]()
			if(testResult==true) then
				print(key .. " Succeeded")
				testCountSucceed = testCountSucceed + 1
			else
				print(key .. " Failed: " .. testResult)
				testCountFailed = testCountFailed + 1
			end	
		end
	end

	-- Results
	if(testCountFailed == 0) then
		testFinalResult = "Succeeded"
	end
	
	print("------[ Result: " .. testFinalResult .. " (" .. testCountSucceed .. "/" .. testCount .. ")]------")
	print("")

end

--
-- Function: assert_eq
-- Checks if the actual value equals the expected value
-- If this is not the case it returns the message
--
function gidTest:assert_eq(actual, expected, message)
	if(expected==nil) then
		expected = true
	end
	if(message==nil) then
		message = ""
	end

	if(actual == expected) then
		return true
	else
		return message
	end
end
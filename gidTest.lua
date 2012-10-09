--
-- gidTest: Gideros Test Framework
-- Licensed under MIT
-- Copyright (c) 2012 Niels van Reijmersdal
--

gidTest = Core.class()

function gidTest:init()
	self.report = ""
	self.testStatus = true
end

--
-- Function: run
-- Runs all global functions that start with the name test_
-- For running a subset of tests use the search_pattern. Example: test_class_
--
function gidTest:run(search_pattern)
	local testCount = 0
	local testCountSucceed = 0
	local testCountFailed = 0
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

	self:appendReport("\n")
	self:appendReport("gidTest tests: " .. testCount .. "\n")
	self:appendReport("----------------------------------\n")

	-- Find and run all tests
	for key,value in pairs(_G) do
		if(string.find(key, search_pattern)) then
			self:appendReport(key .. ":")
			self.testStatus = true
			_G[key]()-- run test
			if(testSuite.testStatus==true) then
				self:appendReport(" Succes\n")
				testCountSucceed = testCountSucceed + 1
			else
				self:appendReport("\n* Failed\n")
				testCountFailed = testCountFailed + 1
			end	
		end
	end

	-- Results
	if(testCountFailed == 0) then
		testFinalResult = "Succeeded"
	end
	
	self:appendReport("----------------------------------\n")
	self:appendReport("Result: " .. testFinalResult .. " (" .. testCountSucceed .. "/" .. testCount .. ")\n")
	self:appendReport("\n")
	gidTest:visualFeedback(testCountFailed == 0)

	print(self.report)

end

--
-- Function: visualFeedback
-- Gives a visual feedback on the application to show how the test suite completed
-- Draws a transparant square in the top left corner
-- Red means failed and green means succes!
--
function gidTest:visualFeedback(status)
	local square = Shape.new()
	local color = 0xff0000 -- default is red

	if(status==true) then
		color = 0x00ff00 -- change to green
	end	
	square:setFillStyle(Shape.SOLID, color, 0.7)
	 
	square:beginPath()
	square:lineTo(0, 100)
	square:lineTo(100, 100)
	square:lineTo(100, 0)
	square:lineTo(0, 0)
	square:endPath()
	 
	stage:addChild(square)
end

--
-- Function: appendReport
-- appends text to the the report
--
function gidTest:appendReport(text)
	self.report = self.report .. text
end

--
-- Function: assertEquals
-- Checks if the actual value equals the expected value
-- If this is not the case it returns the message
--
function assertEquals(expected, actual, message)
	if(message==nil) then
		message = ""
	end

	if(actual == expected) then
		return true
	else
		testSuite.testStatus = false
		testSuite:appendReport("\n* " .. message .. " (assertEquals: actual:" .. tostring(actual) .. ", expected:" .. tostring(expected) .. ")")
		return false
	end
end

--
-- Function: assertNotEquals
-- Checks if the actual value is not equal the expected value
-- If this is not the case it returns the message
--
function assertNotEquals(expected, actual, message)
	if(message==nil) then
		message = ""
	end

	if(actual == expected) then
		testSuite:appendReport("\n* " .. message .. " (assertNotEquals: actual:" .. tostring(actual) .. ", expected:" .. tostring(expected) .. ")")
		testSuite.testStatus = false
		return false
	else
		return true
	end
end


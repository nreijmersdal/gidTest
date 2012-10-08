--
-- gidTest: Gideros Test Framework
-- Licensed under MIT
-- Copyright (c) 2012 Niels van Reijmersdal
--

function test_true()
	assertEquals(true, true)
end

function test_type()
	local x = 5
	assertEquals("number", type(x), "not a number")
end

function test_not_equal()
	assertNotEquals(false, true)
end

function test_empty()
	-- function is empty
end

-- Failing tests
function test_false()
	assertEquals(false, true, "This test fails")
end

function test_multiple_asserts()
	assertEquals(false, true, "Assert one") -- this fails
	assertNotEquals(true, true, "Assert two") -- this fails
	assertNotEquals(false, true, "Assert three")
end


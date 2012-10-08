
function test_true()
	return gidTest:assertEquals(true, true)
end

function test_type()
	local x = 5
	return gidTest:assertEquals("number", type(x), "not a number")
end

function test_not_equal()
	return gidTest:assertNotEquals(false, true)
end

-- Failing tests
--[[ 
function test_false()
	return gidTest:assertEquals(false, true, "This test fails")
end

function test_empty()
	-- function is empty
end
]]--
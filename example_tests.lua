
function test_true()
	return gidTest:assert_eq(true)
end

function test_type()
	local x = 5
	return gidTest:assert_eq(type(x), "number", "not a number")
end

-- Failing tests
--[[ 
function test_false()
	return gidTest:assert_eq(false, true, "This test fails")
end

function test_empty()
	-- function is empty
end
]]--
-- This file is for use with Corona(R) SDK
--
-- This file is automatically generated with PhysicsEdtior (http://physicseditor.de). Do not edit
--
-- Usage example:
--			local scaleFactor = 1.0
--			local physicsData = (require "shapedefs").physicsData(scaleFactor)
--			local shape = display.newImage("objectname.png")
--			physics.addBody( shape, physicsData:get("objectname") )
--

-- copy needed functions to local scope
local unpack = unpack
local pairs = pairs
local ipairs = ipairs

local M = {}

function M.physicsData(scale)
	local physics = { data =
	{ 
		
		["asparagus"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor = true,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -18.5, -68.5  ,  -1, -92  ,  0, -92  ,  18.5, -58.5  ,  11, 91  ,  -9, 90  }
                    }
                    
                    
                    
		}
		
		, 
		["broccoli"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor = true,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -52.5, -61  ,  -14.5, -91  ,  16.5, -87  ,  52.5, -65  ,  65.5, -45  ,  26.5, 7  ,  -21.5, 10  ,  -65.5, -18  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor = true,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -21.5, 10  ,  26.5, 7  ,  29.5, 92  ,  15.5, 92.5  ,  -12.5, 92  }
                    }
                    
                    
                    
		}
		
		, 
		["hero"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   24, -80  ,  -12, -60  ,  -4, -110  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   23, 111  ,  19, 70  ,  48, 7  ,  52, 88  ,  44, 111  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   85, -61  ,  86, -31  ,  48, 7  ,  -36, 66  ,  24, -80  ,  40, -107  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -38, 111  ,  -36, 66  ,  -9, 88  ,  -21, 111  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -36, 66  ,  48, 7  ,  19, 70  ,  -9, 88  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -22, -29  ,  -36, 66  ,  -71, 59  ,  -96, 31  ,  -98, -22  ,  -57, -71  ,  -36, -75  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   24, -80  ,  -36, 66  ,  -22, -29  ,  -12, -60  }
                    }
                    
                    
                    
		}
		
	} }

        -- apply scale factor
        local s = scale or 1.0
        for bi,body in pairs(physics.data) do
                for fi,fixture in ipairs(body) do
                    if(fixture.shape) then
                        for ci,coordinate in ipairs(fixture.shape) do
                            fixture.shape[ci] = s * coordinate
                        end
                    else
                        fixture.radius = s * fixture.radius
                    end
                end
        end
	
	function physics:get(name)
		return unpack(self.data[name])
	end

	function physics:getFixtureId(name, index)
                return self.data[name][index].pe_fixture_id
	end
	
	return physics;
end

return M

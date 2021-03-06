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
                    shape = {   85, -61  ,  86, -31  ,  24, -80  ,  40, -107  }
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
                    shape = {   -36, 66  ,  -22, -29  ,  48, 7  ,  19, 70  ,  -9, 88  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -22, -29  ,  -12, -60  ,  24, -80  ,  86, -31  ,  48, 7  }
                    }
                    
                    
                    
		}
		
		, 
		["broccoli"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -15.5, 82  ,  -19.5, 11  ,  20.5, 46  ,  18.5, 82  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -19.5, 11  ,  -63.5, -46  ,  -52.5, -58  ,  -32.5, -64  ,  50.5, -37  ,  66, 4  ,  52.5, 28  ,  20.5, 46  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   50.5, -37  ,  -32.5, -64  ,  -16.5, -80  ,  32.5, -79  ,  56.5, -59  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -63.5, -6  ,  -63.5, -46  ,  -19.5, 11  ,  -50.5, 12  }
                    }
                    
                    
                    
		}
		
		, 
		["carrot"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -16, -50.5  ,  11, -2  ,  -6, 1.5  ,  -32, -29.5  ,  -39, -52.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   54, -63.5  ,  39, -36.5  ,  11, -2  ,  -16, -50.5  ,  43, -72.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -6, 1.5  ,  11, -2  ,  31.5, 20.5  ,  29, 72.5  ,  -23, 75.5  ,  -30, 45.5  ,  -27, 16.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   26, -66.5  ,  -16, -50.5  ,  -2, -86.5  ,  10, -90.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   53, 90.5  ,  -55, 90.5  ,  -23, 75.5  ,  29, 72.5  }
                    }
                    
                    
                    
		}
		
		, 
		["cash"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -21.5, 43.5  ,  6.5, -25.5  ,  21.5, -40.5  ,  28.5, 6.5  ,  27.5, 43.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -23.5, -1.5  ,  -21.5, 43.5  ,  -36.5, 35.5  ,  -46.5, -4.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   51.5, -29.5  ,  28.5, 6.5  ,  21.5, -40.5  ,  51.5, -42.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -5.5, -38.5  ,  6.5, -25.5  ,  -23.5, -1.5  ,  -36.5, -34.5  ,  -36.5, -46.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   6.5, -25.5  ,  -21.5, 43.5  ,  -23.5, -1.5  }
                    }
                    
                    
                    
		}
		
		, 
		["chicken"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -20, -47  ,  4, -47  ,  16.5, -37  ,  35, 39  ,  21, 49  ,  -29, -3  ,  -36, -32  }
                    }
                    
                    
                    
		}
		
		, 
		["coin"] = {
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    radius = 23.000
                    }
                    
                    
		}
		
		, 
		["fries"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   42.5, 8  ,  27, 45.5  ,  -3, 48  ,  -25, 42  ,  -42.5, -23  ,  -35, -39  ,  -19, -50.5  ,  36.5, -42  }
                    }
                    
                    
                    
		}
		
		, 
		["pizza"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   24, -35.5  ,  43, -17  ,  47, 6.5  ,  48, 33.5  ,  -50, 23.5  }
                    }
                    
                    
                    
		}
		
		, 
		["soda"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   21.5, -34.5  ,  13.5, -49  ,  37.5, -41  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   21.5, -34.5  ,  26.5, -21  ,  17.5, 44  ,  2.5, 48  ,  6.5, -28  ,  13.5, -49  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   6.5, -28  ,  2.5, 48  ,  -22.5, 46  ,  -37.5, -24  }
                    }
                    
                    
                    
		}
		
		, 
		["tomato_big"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   32, 67  ,  -41, 66.5  ,  -70, -14.5  ,  -5, -41.5  ,  40, -39.5  ,  60, -26.5  ,  73.5, -4.5  ,  68.5, 39.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1, -65.5  ,  5, -44.5  ,  -5, -41.5  ,  -10, -65.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -70, -14.5  ,  -41, 66.5  ,  -71, 29.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -5, -41.5  ,  -70, -14.5  ,  -47, -38.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   40, -39.5  ,  -5, -41.5  ,  5, -44.5  }
                    }
                    
                    
                    
		}
		
		, 
		["hamburger"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   7, 41.5  ,  -36, 35.5  ,  -45, 23.5  ,  -35, -30.5  ,  -18, -43  ,  22, -38.5  ,  49.5, -11.5  ,  45, 33.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -35, -30.5  ,  -45, 23.5  ,  -50.5, -8.5  }
                    }
                    
                    
                    
		}
		
		, 
		["tomato_small"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -20, 54  ,  -44, 35.5  ,  -3, -33.5  ,  6, -35.5  ,  30.333335876464844, -29.166664123535156  ,  46, -12.5  ,  48.5, 11.5  ,  23, 53.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3, -33.5  ,  -44, 35.5  ,  -47, -5.5  ,  -29, -31.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   6, -35.5  ,  -3, -33.5  ,  -1, -54.5  ,  6, -53.5  }
                    }
                    
                    
                    
		}
		
		, 
		["magnet"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   104, -40  ,  65, 57.5  ,  14, 102  ,  12, 18.5  ,  47, -61  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -41, 100  ,  -75, 79  ,  -15, 28.5  ,  12, 18.5  ,  14, 102  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -36.5, 8  ,  -75, 79  ,  -63, -104.5  ,  -62, -104.5  ,  -7, -82  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -104, 23  ,  -101.5, -8  ,  -63, -104.5  ,  -75, 79  ,  -97.5, 52  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -75, 79  ,  -36.5, 8  ,  -15, 28.5  }
                    }
                    
                    
                    
		}
		
		, 
		["2xmultiplier"] = {
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0, bounce = 0, isSensor=true, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    radius = 67.007
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


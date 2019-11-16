-- Essential Library.


ESLIB = {}
ESLIB.Number0To255 = function(value) return value/255 end
ESLIB.Number255To0 = function(value) return value*255 end
-- Detects if the image collides with Player
-- @param (plid) = Player ID > Number
-- @param (image) = Image ID > Number
ESLIB.ImageCollidePlayer = function(plid,imgid)
	local cur_playerX = player(plid,"x")	-- + 32
	local cur_playerY = player(plid,"y")	-- + 32
	local cur_imageX = imageparam(image,"x")
	local cur_imageX_r = imageparam(image,"x") + imageparam(image,"width")
	local cur_imageY = imageparam(image,"y")
	local cur_imageY_r = imageparam(image,"y") + imageparam(image,"height")
	if 
		cur_playerX < cur_imageX_r
	and cur_playerX + 32 > cur_imageX
	and cur_playerY < cur_imageY_r
	and cur_playerY + 32 > cur_imageY_r
	then
		return true
	else
		return false
	end
end

-- This function is similar to all images commands. but can be acessed using: ``ReturnValue``:``Command``
ESLIB.CreateDynImage(
imgpath	-- Needed  : Can be SpriteSheet:(Sprite Path)
,x		-- Optional: Position Horizontal(X)
,y	    -- Optional: Position Vertical 	(Y)
,xscale -- Optional: Width Horizontal	(XScale)
,yscale -- Optional: Height Vertical 	(YScale)
,rot	-- Optional: Rotation of Image 	(Rotation)
,mode	-- Optional: You can see in Possible modes: "http://www.cs2d.com/help.php?luacat=image&luacmd=image#cmd"
)

local _curtabl = {
ID = image(imgpath,x or -90, y or -90,),
}	

---------------- Functions as Get:
_curtabl.getX = function() imageparam(_curtabl.ID,"x") end
_curtabl.getY = function() imageparam(_curtabl.ID,"y") end
_curtabl.getRot = function() imageparam(_curtabl.ID,"rot") end
_curtabl.getAlpha = function() imageparam(_curtabl.ID,"alpha") end
_curtabl.getPath = function() imageparam(_curtabl.ID,"path") end
_curtabl.getFrame = function() imageparam(_curtabl.ID,"frame") end
_curtabl.getWidth = function() imageparam(_curtabl.ID,"width") end
_curtabl.getHeight = function() imageparam(_curtabl.ID,"height") end
_curtabl.getFrameCount = function() imageparam(_curtabl.ID,"framecount") end

---------------- Functions as Set:


_curtabl.setAlpha = function(alpha) imagealpha(_curtabl.ID,alpha) end
_curtabl.setScale = function(x,y) imagescale(_curtabl.ID,x or 0,y or 0) end
_curtabl.setBlend = function(blend) imageblend(_curtabl.ID,blend) end
_curtabl.setPos = function(x,y) imagepos(_curtabl.ID,x,y,0) end 
_curtabl.setRot = function(rot) imagepos(_curtabl.ID,imageparam(_curtabl.ID,"x"),imageparam(_curtabl.ID,"y"),rot) end _curtabl.setRotation = _curtabl.setRot
_curtabl.setColor = function(r,g,b) imagecolor(_curtabl.ID,r,g,b) end
_curtabl.setFrame = function(frame) imageframe(_curtabl.ID, frame or 1) end

---------------- Functions as Tween:

_curtabl.tw = function
end

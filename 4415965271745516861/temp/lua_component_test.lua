-- ok, testing some component stuff with lua

entity_id = EntityLoad( "data/entities/test_sprite.xml" )

entity_id = EntityCreateNew()

EntityAddComponent( entity_id, "SpriteComponent", { image_file = "data/temp/jukio_lol.png" } )
components = EntityGetComponent( entity_id, "SpriteComponent" );


-- test if we have any components
if components ~= null and next(components) ~= nil then
   
   -- get the members and print them out
   -- members = ComponentGetMembers( components[1] )
   -- for key,value in pairs(members) do print(key,value) end

   -- ComponentSetValue( components[1], "image_file", "data/temp/business.png" )
   
end

EntitySetTransform( entity_id, 10, 150 + math.random() * 40, 0.5, 2.0, 0.5 )



-- Used for dumb file load vs cache performance testing
Vector = {}
Vector.__index = Vector

local Rad = math.rad
local Sin = math.sin
local Cos = math.cos
local Sqr = math.sqrt
local Atan2 = math.atan2

function Vector.__add(a, b)
  if type(a) == "number" then
    return Vector.new(b.x + a, b.y + a)
  elseif type(b) == "number" then
    return Vector.new(a.x + b, a.y + b)
  else
    return Vector.new(a.x + b.x, a.y + b.y)
  end
end

function Vector.__sub(a, b)
  if type(a) == "number" then
    return Vector.new(b.x - a, b.y - a)
  elseif type(b) == "number" then
    return Vector.new(a.x - b, a.y - b)
  else
    return Vector.new(a.x - b.x, a.y - b.y)
  end
end

function Vector.__mul(a, b)
  if type(a) == "number" then
    return Vector.new(b.x * a, b.y * a)
  elseif type(b) == "number" then
    return Vector.new(a.x * b, a.y * b)
  else
    return Vector.new(a.x * b.x, a.y * b.y)
  end
end

function Vector.__div(a, b)
  if type(a) == "number" then
    return Vector.new(b.x / a, b.y / a)
  elseif type(b) == "number" then
    return Vector.new(a.x / b, a.y / b)
  else
    return Vector.new(a.x / b.x, a.y / b.y)
  end
end

function Vector.__eq(a, b)
  return a.x == b.x and a.y == b.y
end

function Vector.__lt(a, b)
  return a.x < b.x or (a.x == b.x and a.y < b.y)
end

function Vector.__le(a, b)
  return a.x <= b.x and a.y <= b.y
end

function Vector.__tostring(a)
  return "(" + a.x + ", " + a.y + ")"
end

function Vector.new(x, y)
  return setmetatable({ x = x or 0, y = y or 0 }, Vector)
end

function Vector.angle()
  return Atan2(self.y,self.x)
end

function Vector.newFromAngleFixed(inAngle, inVelocity)
  local vx = Cos(Rad(inAngle+90))
  local vy = Sin(Rad(inAngle+90))

  if(inVelocity ~= nil)then
    vx = vx * inVelocity
    vy = vy * inVelocity
  end
  return setmetatable({ x = vx or 0, y = vy or 0 }, Vector)
end

function Vector.newFromAngleCorona(inAngle, inVelocity)
  local vx = Cos(Rad(inAngle+180))
  local vy = Sin(Rad(inAngle+180))

  if(inVelocity ~= nil)then
    vx = vx * inVelocity
    vy = vy * inVelocity
  end
  return setmetatable({ x = vx or 0, y = vy or 0 }, Vector)
end

function Vector.newFromAngle(inAngle, inVelocity)
  local vx = Cos(Rad(inAngle-90))
  local vy = Sin(Rad(inAngle-90))

  if(inVelocity ~= nil)then
    vx = vx * inVelocity
    vy = vy * inVelocity
  end
  return setmetatable({ x = vx or 0, y = vy or 0 }, Vector)
end

function Vector.newFromObjects(inObj1, inObj2)
  local vx = inObj2.x - inObj1.x
  local vy = inObj2.y - inObj1.y
  return setmetatable({ x = vx or 0, y = vy or 0 }, Vector)
end

function Vector.newFromObjectsNormalized(inObj1, inObj2)
  tmpVec = Vector.new(inObj2.x - inObj1.x, inObj2.y - inObj1.y)
  return tmpVec:Normalize()
end
function Vector.newFromObjectsCNormalized(inObj1, inObj2)
  tmpVec = Vector.new(inObj2.centerx - inObj1.x, inObj2.centery - inObj1.y)
  return tmpVec:Normalize()
end

function Vector.distance(a, b)
  return (b - a):len()
end

function Vector:clone()
  return Vector.new(self.x, self.y)
end

function Vector.dotproduct(a, b)
  return ((a.x * b.x) + (a.y * b.y))
end

function Vector:unpack()
  return self.x, self.y
end

function Vector:len()
  return Sqr(self.x * self.x + self.y * self.y)
end

function Vector:lenSq()
  return self.x * self.x + self.y * self.y
end

function Vector:Normalize()
  local len = self:len()
  self.x = self.x / len
  self.y = self.y / len
  return self
end

function Vector:normalized()
  return self / self:len()
end

function Vector:rotate(phi)
  local c = Cos(phi)
  local s = Sin(phi)
  self.x = c * self.x - s * self.y
  self.y = s * self.x + c * self.y
  return self
end

function Vector:rotated(phi)
  return self:clone():rotate(phi)
end

function Vector:reflect(vn)
  local d = self.dotproduct(self, vn)
  self.x = self.x - 2 * d * vn.x
  self.y = self.y - 2 * d * vn.y
  return self
end

function Vector:normal()
  return Vector.new(-self.y, self.x)
end

function Vector:projectOn(other)
  return (self * other) * other / other:lenSq()
end

function Vector:cross(other)
  return self.x * other.y - self.y * other.x
end

setmetatable(Vector, { __call = function(_, ...) return Vector.new(...) end })

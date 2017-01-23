--
-- Code example of globally broadcasting custom events
-- And listening to those events and their properties
--

local myCircle = display.newCircle(400, 600, 100)

timer.performWithDelay(1000, function()
  local newRgb = { math.random(9)/10, math.random(9)/10, math.random(9)/10 }
  myCircle:setFillColor(newRgb[1], newRgb[2], newRgb[3])

  -- set object properties
  myCircle.r, myCircle.g, myCircle.b = newRgb[1], newRgb[2], newRgb[3]

  -- flag global event with event properties
  Runtime:dispatchEvent({
    name = "colorChange",
    r = newRgb[1],
    g = newRgb[2],
    b = newRgb[3]
  })
end, -1)

-- table listener fires whenever `myCircle` dispatches an event
-- or use a function listener, but you won't have access to `self` reference
myCircle.colorChange = function(self, event)
  print("Event properties  --> R: "..event.r.."  G: "..event.g.. "  B: "..event.b)
  print("Object properties --> R: "..self.r.."  G: "..self.g.. "  B: "..self.b.."\n ")
end

Runtime:addEventListener("colorChange", myCircle)
-- Runtime:removeEventListener("colorChange") -- easily remove listeners too!

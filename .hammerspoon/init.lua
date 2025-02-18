ctrlalt = {"ctrl", "alt"}
super   = {"ctrl", "alt", "cmd"}
hyper   = {"shift", "ctrl", "alt", "cmd"}


-- Circumvent paste blocking
hs.hotkey.bind(super, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)


-- Window Snapping
hs.hotkey.bind(super, "M", function()
  local win = hs.window.focusedWindow()
  win:maximize()
end)

hs.hotkey.bind(ctrlalt, "LEFT", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.w = f.w / 2
  win:setFrame(f)
end)

hs.hotkey.bind(ctrlalt, "RIGHT", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.w = f.w / 2
  f.x = f.x + f.w
  win:setFrame(f)
end)

hs.hotkey.bind(ctrlalt, "UP", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.h = f.h / 2
  win:setFrame(f)
  print("woah")
end)

hs.hotkey.bind(ctrlalt, "DOWN", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.h = f.h / 2
  f.y = f.y + f.h
  win:setFrame(f)
end)

hs.hotkey.bind(super, "LEFT", function()
  local win = hs.window.focusedWindow()
  local ws = win:screen():toWest()
  if ws then
    win:setFrame(ws:frame())
  end
end)

hs.hotkey.bind(super, "RIGHT", function()
  local win = hs.window.focusedWindow()
  local ef = win:screen():toEast()
  if ef then
    win:setFrame(ef:frame())
  end
end)

-- Window Thirds Management
hs.hotkey.bind(super, "UP", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.h = f.h / 3  -- Set height to one-third
  f.y = f.y      -- Keep at top
  win:setFrame(f)
end)

hs.hotkey.bind(super, "DOWN", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.h = (f.h / 3) * 2  -- Set height to two-thirds
  f.y = f.y + (f.h / 2) -- Move down by one-third
  win:setFrame(f)
end)

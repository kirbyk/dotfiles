--[[
Place at the top of .lua function/module files to ensure that any other files needed to run are included.
If the dependency is already imported, this function does not import it a second time.
]]
dependsOn = function(dep)
  if _G[dep] == nil then
    local reqString = "return " .. "require " .. "\"" .. dep .. "\""
    load(reqString)()
    reqString = nil
  end
end

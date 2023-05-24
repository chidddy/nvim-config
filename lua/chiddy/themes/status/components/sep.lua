local icons = require('chiddy.utils.icons')

local function generate_seps()
    local ret = {}
    for name, icon in next, icons.sep do
        ret[string.lower(name)] = {
            provider = tostring(icon),
        }
    end
    return ret
end

return generate_seps()

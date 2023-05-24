local tables = {}
function tables.includes(map, expected)
    for _ = 1, #map do
        local value = map[_]
        -- for _, value in next, map do
        if expected == value then
            return true
        end
    end
    return false
end

function tables.keyIncludes(map, expected)
    for key, _ in next, map do
        if expected == key then
            return true
        end
    end
    return false
end

function tables.keys(map)
    local result = {}
    local index = 1
    for key, _ in next, map do
        result[index] = key
        index = index + 1
    end
    return result
end

function tables.range(from, to)
    local result = {}
    for i = from, to do
        result[i] = i
    end
    return result
end

function tables.merge_list(tbl1, tbl2)
    local ret = vim.deepcopy(tbl1)
    for k = 1, #tbl2 do
        ret[#ret + 1] = tbl2[k]
    end
    return ret
end

function tables.merge(...)
    return vim.tbl_deep_extend('force', ...)
end

return tables

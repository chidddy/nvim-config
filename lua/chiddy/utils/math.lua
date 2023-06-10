local M = {}

M.tau = 2 * math.pi

M.round = function(x)
    if x == nil then
        return nil
    end
    return math.floor(x + 0.5)
end

M.clip = function(x, from, to)
    return math.min(math.max(x, from), to)
end

M.cuberoot = function(x)
    return math.pow(x, 0.333333)
end

M.dist = function(x, y)
    return math.abs(x - y)
end

M.dist_circle = function(x, y)
    -- Respect gray colors which don't have hue
    if x == nil and y == nil then
        return 0
    end
    if x == nil or y == nil then
        return math.huge
    end

    local d = M.dist(x % 360, y % 360)
    return math.min(d, 360 - d)
end

M.dist_oklab = function(x, y)
    return math.abs(x.l - y.l) + math.abs(x.a - y.a) + math.abs(x.b - y.b)
end

M.get_closest = function(x, values, dist_fun)
    local best_val, best_key, best_dist = nil, nil, math.huge
    for key, val in pairs(values) do
        local cur_dist = dist_fun(x, val)
        if cur_dist <= best_dist then
            best_val, best_key, best_dist = val, key, cur_dist
        end
    end

    return best_val, best_key
end

-- Degree in [0; 360] <-> Radian in [0; 2*pi]
M.rad2degree = function(x)
    return (x % M.tau) * 360 / M.tau
end

M.degree2rad = function(x)
    return (x % 360) * M.tau / 360
end

return M

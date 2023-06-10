local U = {}
local M = require('chiddy.utils.math')

-- Cusps for Oklch color space. These represent (c, l) points of Oklch space
-- (with **not corrected lightness**) inside a hue leaf (points with
-- `math.floor(h) = <index>`) with the highest value of chroma (`c`).
-- They are used to model the whole RGB gamut (region inside which sRGB colors
-- are converted in Oklch space). It is modelled as triangle with vertices:
-- (0, 0), (0, 100) and cusp. NOTE: this is an approximation, i.e. not all RGB
-- colors lie inside this triangle **AND** not all points inside triangle are
-- RGB colors. But both proportions are small: around 0.5% with similar modeled
-- RGB color for first one and around 2.16% for second one.
--stylua: ignore start
---@diagnostic disable start
---@private
U.cusps = {
  [0] = {26.23,64.74},
  {26.14,64.65},{26.06,64.56},{25.98,64.48},{25.91,64.39},{25.82,64.29},{25.76,64.21},{25.70,64.13},{25.65,64.06},
  {25.59,63.97},{25.55,63.90},{25.52,63.83},{25.48,63.77},{25.45,63.69},{25.43,63.63},{25.41,63.55},{25.40,63.50},
  {25.39,63.43},{25.40,63.33},{25.40,63.27},{25.42,63.22},{25.44,63.15},{25.46,63.11},{25.50,63.05},{25.53,63.00},
  {25.58,62.95},{25.63,62.90},{25.69,62.85},{25.75,62.81},{25.77,62.80},{25.34,63.25},{24.84,63.79},{24.37,64.32},
  {23.92,64.83},{23.48,65.35},{23.08,65.85},{22.65,66.38},{22.28,66.86},{21.98,67.27},{21.67,67.70},{21.36,68.14},
  {21.05,68.60},{20.74,69.08},{20.50,69.45},{20.27,69.83},{20.04,70.22},{19.82,70.62},{19.60,71.03},{19.38,71.44},
  {19.17,71.87},{19.03,72.16},{18.83,72.59},{18.71,72.89},{18.52,73.34},{18.40,73.64},{18.28,73.95},{18.17,74.26},
  {18.01,74.74},{17.91,75.05},{17.82,75.38},{17.72,75.70},{17.64,76.03},{17.56,76.36},{17.48,76.69},{17.41,77.03},
  {17.35,77.36},{17.29,77.71},{17.24,78.05},{17.19,78.39},{17.15,78.74},{17.12,79.09},{17.09,79.45},{17.07,79.80},
  {17.05,80.16},{17.04,80.52},{17.04,81.06},{17.04,81.42},{17.05,81.79},{17.07,82.16},{17.08,82.53},{17.11,82.72},
  {17.14,83.09},{17.18,83.46},{17.22,83.84},{17.27,84.22},{17.33,84.60},{17.39,84.98},{17.48,85.56},{17.56,85.94},
  {17.64,86.33},{17.73,86.72},{17.81,87.10},{17.91,87.50},{18.04,88.09},{18.16,88.48},{18.27,88.88},{18.40,89.48},
  {18.57,89.87},{18.69,90.27},{18.88,90.87},{19.03,91.48},{19.22,91.88},{19.44,92.49},{19.66,93.10},{19.85,93.71},
  {20.04,94.33},{20.33,94.94},{20.60,95.56},{20.85,96.18},{21.10,96.80},{21.19,96.48},{21.27,96.24},{21.38,95.93},
  {21.47,95.70},{21.59,95.40},{21.72,95.10},{21.86,94.80},{21.97,94.58},{22.12,94.30},{22.27,94.02},{22.43,93.74},
  {22.64,93.40},{22.81,93.14},{23.04,92.81},{23.22,92.56},{23.45,92.25},{23.68,91.95},{23.92,91.65},{24.21,91.31},
  {24.45,91.04},{24.74,90.72},{25.08,90.36},{25.37,90.07},{25.70,89.74},{26.08,89.39},{26.44,89.07},{26.87,88.69},
  {27.27,88.34},{27.72,87.98},{28.19,87.61},{28.68,87.23},{29.21,86.84},{29.48,86.64},{28.99,86.70},{28.13,86.81},
  {27.28,86.92},{26.56,87.02},{25.83,87.12},{25.18,87.22},{24.57,87.32},{24.01,87.41},{23.53,87.49},{23.03,87.58},
  {22.53,87.68},{22.10,87.76},{21.68,87.84},{21.26,87.93},{20.92,88.01},{20.58,88.08},{20.25,88.16},{19.92,88.24},
  {19.59,88.33},{19.35,88.39},{19.12,88.46},{18.81,88.55},{18.58,88.61},{18.36,88.68},{18.14,88.76},{17.93,88.83},
  {17.79,88.88},{17.59,88.95},{17.39,89.03},{17.26,89.08},{17.08,89.16},{16.96,89.21},{16.79,89.29},{16.68,89.35},
  {16.58,89.41},{16.43,89.49},{16.33,89.55},{16.24,89.60},{16.16,89.66},{16.04,89.75},{15.96,89.81},{15.89,89.87},
  {15.83,89.93},{15.77,89.99},{15.71,90.05},{15.66,90.12},{15.61,90.18},{15.57,90.24},{15.54,90.31},{15.51,90.37},
  {15.48,90.44},{15.46,90.51},{15.40,90.30},{15.30,89.83},{15.21,89.36},{15.12,88.89},{15.03,88.67},{14.99,88.18},
  {14.92,87.71},{14.85,87.24},{14.78,86.77},{14.75,86.53},{14.70,86.06},{14.65,85.59},{14.61,85.12},{14.60,84.89},
  {14.57,84.42},{14.54,83.94},{14.53,83.71},{14.52,83.24},{14.51,82.77},{14.52,82.30},{14.52,81.83},{14.53,81.60},
  {14.55,81.13},{14.58,80.66},{14.59,80.43},{14.63,79.96},{14.68,79.49},{14.70,79.26},{14.76,78.79},{14.82,78.32},
  {14.85,78.09},{14.93,77.62},{15.01,77.16},{15.10,76.69},{15.19,76.23},{15.24,76.00},{15.34,75.54},{15.45,75.07},
  {15.57,74.61},{15.69,74.15},{15.82,73.69},{15.96,73.23},{16.10,72.77},{16.24,72.31},{16.39,71.86},{16.55,71.40},
  {16.71,70.95},{16.96,70.26},{17.14,69.81},{17.32,69.36},{17.59,68.69},{17.88,68.02},{18.07,67.57},{18.37,66.90},
  {18.67,66.24},{18.99,65.58},{19.30,64.93},{19.74,64.06},{20.07,63.42},{20.51,62.57},{20.97,61.73},{21.54,60.69},
  {22.00,59.87},{22.70,58.66},{23.39,57.49},{24.19,56.16},{25.20,54.52},{26.38,52.66},{28.55,49.32},{31.32,45.20},
  {31.15,45.42},{30.99,45.64},{30.85,45.85},{30.72,46.06},{30.57,46.31},{30.47,46.50},{30.34,46.75},{30.23,46.97},
  {30.13,47.20},{30.03,47.45},{29.93,47.71},{29.86,47.91},{29.77,48.20},{29.71,48.43},{29.65,48.66},{29.58,48.98},
  {29.53,49.23},{29.48,49.48},{29.44,49.74},{29.41,50.01},{29.37,50.29},{29.35,50.57},{29.33,50.86},{29.31,51.16},
  {29.30,51.56},{29.29,51.87},{29.29,52.39},{29.30,52.72},{29.31,53.05},{29.33,53.38},{29.35,53.72},{29.37,54.06},
  {29.40,54.41},{29.43,54.76},{29.47,55.12},{29.52,55.60},{29.56,55.97},{29.61,56.34},{29.66,56.72},{29.73,57.22},
  {29.79,57.61},{29.84,57.99},{29.93,58.52},{29.99,58.91},{30.08,59.44},{30.15,59.84},{30.24,60.38},{30.34,60.93},
  {30.42,61.34},{30.52,61.90},{30.63,62.45},{30.73,63.02},{30.85,63.58},{30.96,64.15},{31.08,64.72},{31.19,65.30},
  {31.31,65.88},{31.44,66.46},{31.59,67.20},{31.72,67.79},{31.88,68.53},{32.01,69.12},{32.18,69.87},{32.25,70.17},
  {32.06,69.99},{31.76,69.70},{31.45,69.42},{31.21,69.20},{30.97,68.98},{30.68,68.71},{30.44,68.50},{30.21,68.29},
  {29.98,68.09},{29.75,67.89},{29.53,67.69},{29.31,67.50},{29.09,67.31},{28.88,67.12},{28.72,66.98},{28.52,66.80},
  {28.31,66.63},{28.16,66.50},{27.97,66.33},{27.78,66.17},{27.64,66.05},{27.49,65.94},{27.33,65.77},{27.20,65.66},
  {27.04,65.51},{26.92,65.40},{26.81,65.30},{26.66,65.16},{26.55,65.06},{26.45,64.96},{26.35,64.87},
}
--stylua: ignore end

-- HEX <-> RGB in [0; 255]
U.hex2rgb = function(hex)
    local dec = tonumber(hex:sub(2), 16)

    local b = math.fmod(dec, 256)
    local g = math.fmod((dec - b) / 256, 256)
    local r = math.floor(dec / 65536)

    return { r = r, g = g, b = b }
end

U.rgb2hex = function(rgb)
    -- Use straightforward clipping to [0; 255] here to ensure correctness.
    -- Modify `rgb` prior to this to ensure only a small distortion.
    local r = M.clip(M.round(rgb.r), 0, 255)
    local g = M.clip(M.round(rgb.g), 0, 255)
    local b = M.clip(M.round(rgb.b), 0, 255)

    return string.format('#%02x%02x%02x', r, g, b)
end

-- Sources for Oklab/Oklch:
-- https://github.com/bottosson/bottosson.github.io/blob/master/misc/colorpicker/colorconversion.js
-- https://bottosson.github.io/posts/oklab/#converting-from-linear-srgb-to-oklab
--
-- Okhsl is a local variant of Oklch with `s` for "saturation" - percent of
-- chroma relative to maximum possible chroma for this lightness and hue.
--
-- NOTEs:
-- - Coordinates ranges: `l` - [0; 100], `a`/`b` - no range, `c` - [0; 100]
--   (way less in gamut), `s` - [0; 100], `h` - [0; 360).
-- - Lightness is always assumed to be corrected

-- RGB in [0; 255] <-> Oklab
-- https://bottosson.github.io/posts/oklab/#converting-from-linear-srgb-to-oklab
U.rgb2oklch = function(rgb)
    -- Convert to linear RGB
    local r, g, b = U.correct_channel(rgb.r / 255), U.correct_channel(rgb.g / 255), U.correct_channel(rgb.b / 255)

    -- Convert to Oklab
    local l = 0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b
    local m = 0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b
    local s = 0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b

    local l_, m_, s_ = M.cuberoot(l), M.cuberoot(m), M.cuberoot(s)

    local L = 0.2104542553 * l_ + 0.7936177850 * m_ - 0.0040720468 * s_
    local A = 1.9779984951 * l_ - 2.4285922050 * m_ + 0.4505937099 * s_
    local B = 0.0259040371 * l_ + 0.7827717662 * m_ - 0.8086757660 * s_

    -- Explicitly convert for nearly achromatic colors
    if math.abs(A) < 1e-4 then
        A = 0
    end
    if math.abs(B) < 1e-4 then
        B = 0
    end

    -- convert to oklch
    local c = math.sqrt((100 * A) ^ 2 + (100 * B) ^ 2)

    local h = nil
    if c > 0 then
        h = M.rad2degree(math.atan2(100 * B, 100 * A))
    end

    -- Normalize to appropriate range
    local res = { l = U.correct_lightness(100 * L), c = c, h = h }

    -- Normalize
    res.l = M.clip(res.l, 0, 100)

    -- - Deal with grays separately
    if res.c <= 0 or res.h == nil then
        res.c, res.h = 0, nil
    else
        res.c, res.h = M.clip(res.c, 0, 100), res.h % 360
    end

    return res
end

U.oklch2rgb = function(lch, gamut_clip)
    if gamut_clip == nil then
        gamut_clip = 'chroma'
    end

    if lch.h ~= nil then
        lch = U.clip_to_gamut(lch, gamut_clip)
    end

    local lab
    if lch.c <= 0 or lch.h == nil then
        lab = { l = lch.l, a = 0, b = 0 }
    else
        local a = lch.c * math.cos(M.degree2rad(lch.h))
        local b = lch.c * math.sin(M.degree2rad(lch.h))
        lab = { l = lch.l, a = a, b = b }
    end

    local L, A, B = 0.01 * U.correct_lightness_inv(lab.l), 0.01 * lab.a, 0.01 * lab.b

    local l_ = L + 0.3963377774 * A + 0.2158037573 * B
    local m_ = L - 0.1055613458 * A - 0.0638541728 * B
    local s_ = L - 0.0894841775 * A - 1.2914855480 * B

    local l = l_ * l_ * l_
    local m = m_ * m_ * m_
    local s = s_ * s_ * s_

    local r = 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s
    local g = -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s
    local b = -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s

    return { r = 255 * U.correct_channel_inv(r), g = 255 * U.correct_channel_inv(g), b = 255 * U.correct_channel_inv(b) }
end

-- Functions for RGB channel correction. Assumes input in [0; 1] range
-- https://bottosson.github.io/posts/colorwrong/#what-can-we-do%3F
U.correct_channel = function(x)
    return 0.04045 < x and math.pow((x + 0.055) / 1.055, 2.4) or (x / 12.92)
end

U.correct_channel_inv = function(x)
    return (0.0031308 >= x) and (12.92 * x) or (1.055 * math.pow(x, 0.416666667) - 0.055)
end

-- Functions for lightness correction
-- https://bottosson.github.io/posts/colorpicker/#intermission---a-new-lightness-estimate-for-oklab
U.correct_lightness = function(x)
    x = 0.01 * x
    local k1, k2 = 0.206, 0.03
    local k3 = (1 + k1) / (1 + k2)

    local res = 0.5 * (k3 * x - k1 + math.sqrt((k3 * x - k1) ^ 2 + 4 * k2 * k3 * x))
    return 100 * res
end

U.correct_lightness_inv = function(x)
    x = 0.01 * x
    local k1, k2 = 0.206, 0.03
    local k3 = (1 + k1) / (1 + k2)
    local res = (x / k3) * (x + k1) / (x + k2)
    return 100 * res
end

-- Get gamut ranges for Lch point. They are computed for its hue leaf as
-- segments of triangle in (c, l) coordinates ((0, 0), (0, 100), cusp).
-- Equations for triangle parts:
-- - Lower segment ((0; 0) to cusp): y * c_cusp = x * L_cusp
-- - Upper segment ((0; 100) to cusp): (100 - y) * c_cusp = x * (100 - L_cusp)
-- NOTEs:
-- - It is **very important** that this triangle is computed for **not
--   corrected** lightness. But it is assumed **corrected lightness** in input.
-- - This approach is not entirely accurate and can results in ranges outside
--   of input `lch` for in-gamut point. Put it should be pretty rare: ~0.5%
--   cases for most saturated colors.
U.get_gamut_points = function(lch)
    local c, l = lch.c, M.clip(lch.l, 0, 100)
    l = U.correct_lightness_inv(l)
    local cusp = U.cusps[math.floor(lch.h % 360)]
    local c_cusp, l_cusp = cusp[1], cusp[2]

    -- Maximum allowed chroma is computed based on current lightness and depends
    -- on whether `l` is below or above cusp's `l`:
    -- - If below, then it is from lower triangle segment.
    -- - If above - from upper segment.
    local c_upper = l <= l_cusp and (c_cusp * l / l_cusp) or (c_cusp * (100 - l) / (100 - l_cusp))
    -- - Don't allow negative chroma (can happen if `l` is out of [0; 100])
    c_upper = M.clip(c_upper, 0, math.huge)

    -- Other points can be computed only in presence of actual chroma
    if c == nil then
        return { c_upper = c_upper }
    end

    -- Range of allowed lightness is computed based on current chroma:
    -- - Lower is from segment between (0, 0) and cusp.
    -- - Upper is from segment between (0, 100) and cusp.
    local l_lower, l_upper
    if c < 0 then
        l_lower, l_upper = 0, 100
    elseif c_cusp < c then
        l_lower, l_upper = l_cusp, l_cusp
    else
        local saturation = c / c_cusp
        l_lower = saturation * l_cusp
        l_upper = saturation * (l_cusp - 100) + 100
    end

    -- Intersection of segment between (c, l) and (0, l_cusp) with gamut boundary
    local c_cusp_clip, l_cusp_clip
    if c <= 0 then
        c_cusp_clip, l_cusp_clip = c, l
    elseif l <= l_cusp then
        -- Intersection with lower segment
        local prop = 1 - l / l_cusp
        c_cusp_clip = c_cusp * c / (c_cusp * prop + c)
        l_cusp_clip = l_cusp * c_cusp_clip / c_cusp
    else
        -- Intersection with upper segment
        local prop = 1 - (l - 100) / (l_cusp - 100)
        c_cusp_clip = c_cusp * c / (c_cusp * prop + c)
        l_cusp_clip = 100 + c_cusp_clip * (l_cusp - 100) / c_cusp
    end

    return {
        l_lower = U.correct_lightness(l_lower),
        l_upper = U.correct_lightness(l_upper),
        c_upper = c_upper,
        l_cusp_clip = U.correct_lightness(l_cusp_clip),
        c_cusp_clip = c_cusp_clip,
    }
end

U.clip_to_gamut = function(lch, gamut_clip)
    -- `lch` should have not corrected lightness
    local res = vim.deepcopy(lch)
    local gamut_points = U.get_gamut_points(lch)

    local is_inside_gamut = lch.c <= gamut_points.c_upper
    if is_inside_gamut then
        return res
    end

    -- Clip by going towards (0, l_cusp) until in gamut. This approach proved to
    -- be the best because of reasonable compromise between chroma and lightness.
    -- In particular when inverting lightness of dark color schemes:
    -- - Clipping by reducing chroma with constant lightness leads to a dark
    --   foreground with hardly distinguishable colors.
    -- - Clipping by adjusting lightness with constant chroma leads to very low
    --   contrast on a particularly saturated foreground colors.
    if gamut_clip == 'cusp' then
        res.l, res.c = gamut_points.l_cusp_clip, gamut_points.c_cusp_clip
    end

    -- Preserve lightness by clipping chroma
    if gamut_clip == 'chroma' then
        res.c = M.clip(res.c, 0, gamut_points.c_upper)
    end

    -- Preserve chroma by clipping lightness
    if gamut_clip == 'lightness' then
        res.l = M.clip(res.l, gamut_points.l_lower, gamut_points.l_upper)
    end

    return res
end

-- public

U.lightness = function(col, val)
    if type(col) == 'string' then
        col = U.rgb2oklch(U.hex2rgb(col))
    end
    if type(val) == 'number' then
        col.l = val
    elseif type(val) == 'function' then
        col.l = M.clip(val(col.l), 0, 100)
    end
    return U.rgb2hex(U.oklch2rgb(col))
end

U.hue = function(col, val)
    if type(col) == 'string' then
        col = U.rgb2oklch(U.hex2rgb(col))
    end
    if type(val) == 'number' then
        col.h = val % 360
    elseif type(val) == 'function' then
        col.h = val(col.h) % 360
    end
    return U.rgb2hex(U.oklch2rgb(col))
end

U.chroma = function(col, val)
    if type(col) == 'string' then
        col = U.rgb2oklch(U.hex2rgb(col))
    end
    if type(val) == 'number' then
        col.c = val
    elseif type(val) == 'function' then
        col.c = M.clip(val(col.c), 0, math.huge)
    end
    return U.rgb2hex(U.oklch2rgb(col))
end

U.saturation = U.chroma

U.modify = function(col, mods)
    if mods == nil then
        return U.rgb2hex(U.oklch2rgb(col))
    end

    if mods.l then
        col = U.lightness(col, mods.l)
    end

    if mods.c then
        col = U.chroma(col, mods.c)
    end

    if mods.h then
        col = U.hue(col, mods.h)
    end

    return col
end

U.funcs = {}

U.funcs.add = function(mod)
    return function(num)
        return num + mod
    end
end

U.funcs.minus = function(mod)
    return function(num)
        return num - mod
    end
end

U.funcs.mult = function(mod)
    return function(num)
        return num * mod
    end
end

U.funcs.div = function(mod)
    return function(num)
        return num / mod
    end
end

function U.get_hl_fg(name)
    return string.format('#%x', vim.api.nvim_get_hl(0, { name = name, link = false }).fg)
end

function U.get_hl_bg(name)
    return string.format('#%x', vim.api.nvim_get_hl(0, { name = name, link = false }).bg)
end

---@param fg string forecrust color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function U.blend(fg, bg, alpha)
    bg = U.hex2rgb(bg)
    fg = U.hex2rgb(fg)

    local blendChannel = function(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format('#%02X%02X%02X', blendChannel('r'), blendChannel('g'), blendChannel('b'))
end

return U

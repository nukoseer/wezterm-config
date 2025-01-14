local wezterm = require('wezterm')
local mux = wezterm.mux

-- Toggle fullscreen on startup
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

---@class config
---@field options table
local config = {}
config.__index = config

---Initialize config
---@return config
function config:init()
   local config = setmetatable({ options = {} }, self)
   return config
end

---Append to `config.options`
---@param new_options table new options to append
---@return config
function config:append(new_options)
   for k, v in pairs(new_options) do
      if self.options[k] ~= nil then
         wezterm.log_warn(
            'Duplicate config option detected: ',
            { old = self.options[k], new = new_options[k] }
         )
         goto continue
      end
      self.options[k] = v
      ::continue::
   end
   return self
end

return config

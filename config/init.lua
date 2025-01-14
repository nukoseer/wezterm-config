local wezterm = require('wezterm')
local mux = wezterm.mux
local colors = require('colors.custom')

-- Toggle fullscreen on startup
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local background = '#282c34' -- Default background
  local foreground = '#ffffff' -- Default foreground

  -- Customize background based on domain name
  if tab.active_pane.domain_name == 'SSH:name' then
    background = '#531ab6'
  elseif tab.active_pane.domain_name == 'SSH:name' then
    background = '#ee30a7'
  elseif tab.active_pane.domain_name == 'WSL:Debian' or tab.active_pane.domain_name == 'local' then
    background = '#6272a4'
  end

  -- Highlight active tabs
  if tab.is_active then
    background = colors.background -- Highlight active tab with a different color
  end

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = ' ' .. tab.active_pane.title .. ' ' },
  }
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

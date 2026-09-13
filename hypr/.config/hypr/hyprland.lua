-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })

local function dir_exists(path)
  -- Remove trailing slashes for consistency
  local clean_path = path:gsub("[/\\]$", "")
  local ok, _, code = os.rename(clean_path, clean_path)
  if not ok then
    if code == 13 then return true end -- Permission denied, but it exists
    return false
  end
  return true
end

if dir_exists(os.getenv("HOME") .. "/.config/omarchy/plugins/crmne.hyprmoncfg") then
  -- Added by hyprmoncfg: its generated monitor rules load last, so nothing before this can override the applied layout.
  do
    local path = os.getenv("HOME") .. "/.config/hypr/hyprmoncfg-monitors.lua"; local file = io.open(path, "r"); if file then
      file:close(); dofile(path)
    end
  end
end

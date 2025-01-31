function ya.init()
    -- Function to get macOS appearance
    local function get_macos_appearance()
        local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
        if handle then
            local result = handle:read("*a")
            handle:close()
            return result:match("Dark") and "dark" or "light"
        end
        return "light"  -- Default to light if we can't determine
    end

    -- Set the theme based on system appearance
    local appearance = get_macos_appearance()
    ya.set_theme(appearance)
end
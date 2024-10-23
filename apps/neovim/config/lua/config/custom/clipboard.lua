vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- Set wsl-clipboard for vim clipboard if running WSL
-- Check if the current linux kernal is microsoft WSL version
local function is_wsl()
    local version_file = io.open("/proc/version", "rb")
    if version_file ~= nil and string.find(version_file:read("*a"), "microsoft") then
        version_file:close()
        return true
    end
    return false
end

-- If current linux is under WSL then use clip.exe
if is_wsl() then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe"
        },
        paste = {
            ['+'] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
            ['*'] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
        },
        cache_enabled = false
    }
end

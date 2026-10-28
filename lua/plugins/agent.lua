return {
    {
        "Andy8647/pi-ide-context",
        lazy = false,
    },
    {
        "nickjvandyke/opencode.nvim",
        branch = "main", -- OpenCode v2
        cmd = { "Oc" },
        config = function()
            vim.g.opencode_opts = {
                server = {
                    -- Do not open an embedded terminal when no server is running.
                    start = function()
                        error("Start opencode in a separate pane in this project, then retry.")
                    end,
                },
            }
            vim.api.nvim_create_user_command("Oc", function(args)
                local opencode = require("opencode")
                local name = args.fargs[1]
                if not name then
                    opencode.select()
                    return
                end
                local prompts = require("opencode.config").opts.select.prompts or {}
                local prompt = assert(prompts[name], "Unknown OpenCode prompt: " .. name)
                opencode.prompt(prompt)
            end, {
                desc = "OpenCode picker or named prompt",
                nargs = "?",
                force = false,
                complete = function(prefix)
                    local items = vim.tbl_keys(require("opencode.config").opts.select.prompts or {})
                    table.sort(items)
                    return vim.tbl_filter(function(item)
                        return vim.startswith(item, prefix)
                    end, items)
                end,
            })
        end,
        keys = {
            {
                "<leader>o",
                function()
                    require("opencode").ask("@this: ")
                end,
                mode = { "n", "x" },
                desc = "Send to OpenCode",
            },
        },
    },
}

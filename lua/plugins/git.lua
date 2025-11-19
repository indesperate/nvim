return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {
        on_attach = function(buffer)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
            end

            map("n", "]c", function()
                gs.nav_hunk("next")
            end, "Next Hunk")
            map("n", "[c", function()
                gs.nav_hunk("prev")
            end, "Prev Hunk")
            map("n", "du", gs.stage_hunk, "Toggle Stage Hunk")
            map("n", "dp", gs.reset_hunk, "Reset Hunk")
            map("n", "dO", gs.preview_hunk_inline, "Preview Hunk Inline")
            map("n", "do", gs.preview_hunk, "Preview Hunk")
            map("n", "db", gs.diffthis, "Diff This")
            map({ "o", "x" }, "ic", gs.select_hunk, "GitSigns Select Hunk")
        end,
    },
}

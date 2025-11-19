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
            map({ "n", "x" }, "du", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
            map({ "n", "x" }, "dp", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
            map("n", "dU", gs.undo_stage_hunk, "Undo Stage Hunk")
            map("n", "do", gs.preview_hunk_inline, "Preview Hunk Inline")
            map("n", "db", gs.diffthis, "Diff This")
            map({ "o", "x" }, "ic", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        end,
    },
}

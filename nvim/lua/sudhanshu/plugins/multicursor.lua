return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")

		mc.setup()

		local keymap = vim.keymap

		-- Add or skip cursor above/below the main cursor.
		keymap.set({ "n", "v" }, "<up>", function()
			mc.lineAddCursor(-1)
		end, { desc = "Cursor add above" })
		keymap.set({ "n", "v" }, "<down>", function()
			mc.lineAddCursor(1)
		end, { desc = "Cursor add below" })
		keymap.set({ "n", "v" }, "<leader><up>", function()
			mc.lineSkipCursor(-1)
		end, { desc = "Cursor skip above" })
		keymap.set({ "n", "v" }, "<leader><down>", function()
			mc.lineSkipCursor(1)
		end, { desc = "Cursor skip below" })

		-- Add or skip adding a new cursor by matching word/selection
		keymap.set({ "n", "v" }, "<leader>cn", function()
			mc.matchAddCursor(1)
		end, { desc = "Add cursor for next matching word" })
		keymap.set({ "n", "v" }, "<leader>cs", function()
			mc.matchSkipCursor(1)
		end, { desc = "Skip cursor for next matching word" })
		keymap.set({ "n", "v" }, "<leader>cN", function()
			mc.matchAddCursor(-1)
		end, { desc = "Add cursor for previous matching word" })
		keymap.set({ "n", "v" }, "<leader>cS", function()
			mc.matchSkipCursor(-1)
		end, { desc = "Skip cursor for previous matching word" })

		-- Add all matches in the document
		keymap.set({ "n", "v" }, "<leader>cA", mc.matchAllAddCursors, { desc = "Add all matches in the document" })

		-- You can also add cursors with any motion you prefer:
		-- set("n", "<right>", function()
		--     mc.addCursor("w")
		-- end)
		-- set("n", "<leader><right>", function()
		--     mc.skipCursor("w")
		-- end)

		-- Rotate the main cursor.
		keymap.set({ "n", "v" }, "<left>", mc.nextCursor, { desc = "Cursor rotate next" })
		keymap.set({ "n", "v" }, "<right>", mc.prevCursor, { desc = "Cursor rotate previous" })

		-- Delete the main cursor.
		keymap.set({ "n", "v" }, "<leader>cx", mc.deleteCursor, { desc = "Delete the main cursor" })

		-- Add and remove cursors with control + left click.
		-- keymap.set("n", "<c-leftmouse>", mc.handleMouse, { desc = "" })

		-- Easy way to add and remove cursors using the main cursor.
		-- keymap.set({ "n", "v" }, "<c-q>", mc.toggleCursor, { desc = "" })

		-- Clone every cursor and disable the originals.
		-- keymap.set({ "n", "v" }, "<leader><c-q>", mc.duplicateCursors, { desc = "" })

		keymap.set("n", "<esc>", function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				-- Default <esc> handler.
			end
		end)

		-- Bring back cursors if you accidentally clear them
		keymap.set("n", "<leader>cr", mc.restoreCursors, { desc = "Restore cursors" })

		-- Align cursor columns.
		keymap.set("v", "<leader>ca", mc.alignCursors, { desc = "Align cursors" })

		-- Split visual selections by regex.
		keymap.set("v", "S", mc.splitCursors, { desc = "Split visual selections by regex" })

		-- Append/insert for each line of visual selections.
		keymap.set("v", "I", mc.insertVisual, { desc = "Insert for each line of visual selection" })
		keymap.set("v", "A", mc.appendVisual, { desc = "Append for each line of visual selection" })

		-- match new cursors within visual selections by regex.
		keymap.set("v", "M", mc.matchCursors, { desc = "" })

		-- Rotate visual selection contents.
		keymap.set("v", "<leader>ct", function()
			mc.transposeCursors(1)
		end)
		keymap.set("v", "<leader>cT", function()
			mc.transposeCursors(-1)
		end)

		-- Jumplist support
		keymap.set({ "v", "n" }, "<c-i>", mc.jumpForward, { desc = "" })
		keymap.set({ "v", "n" }, "<c-o>", mc.jumpBackward, { desc = "" })

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { link = "Cursor" })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}

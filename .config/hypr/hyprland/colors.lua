-- This file contains modifications based on:
-- https://github.com/end-4/dots-hyprland
--
-- Original author: end-4
--
-- SPDX-License-Identifier: GPL-3.0-only
--
-- This file is licensed under the GNU General Public License v3.0.
-- It is distributed separately from the Apache-2.0 licensed files
-- in this repository.

hl.config({
	general = {
		col = {
			active_border = "rgba(47464877)",
			inactive_border = "rgba(1c1b1d33)",
		},
	},
	misc = {
		background_color = "rgba(131315FF)",
	},
})

hl.window_rule({ -- not sure how to syntax "pin 1"
	match = { pin = 1 },
	border_color = "rgba(c6c5d6AA) rgba(c6c5d677)",
})
-- BORDER_VISIBLE_START
-- Border Visible: Catppuccin Blue
-- BORDER_VISIBLE_END

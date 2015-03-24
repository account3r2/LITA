#!/usr/bin/env lua5.1

--[[========================================================================\\
  ||  Copyright (C) 2015 Niko Geil.                                         ||
  ||                                                                        ||
  ||  This file is part of LITA, the Lua Interactive Text Adventure.        ||
  ||                                                                        ||
  ||  LITA is free software: you can redistribute it and/or modify          ||
  ||  it under the terms of the GNU General Public License as published by  ||
  ||  the Free Software Foundation, either version 3 of the License, or     ||
  ||  (at your option) any later version.                                   ||
  ||                                                                        ||
  ||  LITA is distributed in the hope that it will be useful,               ||
  ||  but WITHOUT ANY WARRANTY; without even the implied warranty of        ||
  ||  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the          ||
  ||  GNU General Public License for more details.                          ||
  ||                                                                        ||
  ||  You should have received a copy of the GNU General Public License     ||
  ||  along with LITA. If not, see <http://www.gnu.org/licenses/>.          ||
  \\========================================================================]]

local unix, amd64 = require("/libs/common/LOAR")

local system = (unix and (amd64 and "Linux_x86-64" or "Linux_x86") or "Windows")

local socket
local json

local function loadLibraries()
	socket = require("libs/common/" .. system .. "/socket")
	json = require("libs/common/" .. system .. "/json")
end

if not pcall(loadLibraries) then
	io.write("ERROR: Couldn't load libraries.\n")
	io.write("Ensure you have both LuaSocket and JSON4Lua installed.\n")
	os.exit()
end
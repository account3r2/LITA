--[[========================================================================\\
  ||  Lua OS and Architecture Retriever.                                    ||
  ||  Copyright (C) 2015 Niko Geil.                                         ||
  ||                                                                        ||
  ||  This program is free software: you can redistribute it and/or modify  ||
  ||  it under the terms of the GNU General Public License as published by  ||
  ||  the Free Software Foundation, either version 3 of the License, or     ||
  ||  (at your option) any later version.                                   ||
  ||                                                                        ||
  ||  This program is distributed in the hope that it will be useful,       ||
  ||  but WITHOUT ANY WARRANTY; without even the implied warranty of        ||
  ||  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the          ||
  ||  GNU General Public License for more details.                          ||
  ||                                                                        ||
  ||  You should have received a copy of the GNU General Public License     ||
  ||  along with this program. If not, see <http://www.gnu.org/licenses/>.  ||
  \\========================================================================]]

local function isUnix()
	if package.config:sub(1,1) == "/" then
		return true
	else
		return false
	end
end

local function isAMD64(isUnix)
	if isUnix then
		local handle = io.popen("uname -m")
		local arch = handle:read("*a")
		handle:close()
		return (arch:find("64") and true or false)
	else
		local handle = io.popen("reg query \"HKLM\\System\\CurrentControlSet\\Control\\Session Manager\\Environment\" /v PROCESSOR_ARCHITECTURE")
		local arch = handle:read("*a")
		handle:close()
		return (arch:find("64") and true or false)
	end
end

return isUnix(), isAMD64(isUnix())
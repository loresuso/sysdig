--[[
Copyright (C) 2013-2015 Draios inc.
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 2 as
published by the Free Software Foundation.


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

view_info = 
{
	id = "procs",
	name = "Processes",
	description = "This is the typical top/htop process list, showing usage of resources like CPU, memory, disk and network on a by process basis.",
	tips = {"This is a perfect view to start a drill down session. Click enter or double click on a process to dive into it and explore its behavior."},
	tags = {"Default"},
	view_type = "table",
	applies_to = {"", "container.id", "fd.name", "fd.sport", "evt.type", "fd.directory", "fd.type"},
	is_root = true,
	drilldown_target = "threads",
	use_defaults = true,
	columns = 
	{
		{
			name = "NA",
			field = "proc.pid",
			is_key = true
		},
		{
			name = "PID",
			description = "Process PID.",
			field = "proc.pid",
			colsize = 8,
		},
		{
			tags = {"containers"},
			name = "VPID",
			field = "proc.vpid",
			description = "PID that the process has inside the container.",
			colsize = 8,
		},
		{
			name = "CPU",
			field = "proc.cpu",
			description = "Amount of CPU used by the proccess.",
			colsize = 8,
			aggregation = "AVG",
			is_sorting = true
		},
		{
			name = "USER",
			field = "user.name",
			colsize = 12
		},
		{
			name = "TH",
			field = "proc.nthreads",
			description = "Number of threads that the process contains.",
			colsize = 5
		},
		{
			name = "VIRT",
			field = "proc.vmsize",
			colsize = 9
		},
		{
			name = "RES",
			field = "proc.vmrss",
			colsize = 9
		},
		{
			name = "FILE",
			field = "evt.buflen.file",
			description = "Total (input+output) file I/O bytes generated by the process during the sampling interval. On trace files, this is the sum for the whole file.",
			colsize = 8,
			aggregation = "SUM"
		},
		{
			name = "NET",
			field = "evt.buflen.net",
			description = "Total (input+output) network I/O bytes generated by the process during the sampling interval. On trace files, this is the sum for the whole file.",
			colsize = 8,
			aggregation = "SUM"
		},
		{
			tags = {"containers"},
			name = "Container",
			field = "container.name",
			colsize = 15
		},
		{
			name = "Command",
			description = "The full command line of the process.",
			field = "proc.exeline",
			colsize = 200
		}
	}
}

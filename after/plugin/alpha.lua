local alpha = require("alpha")
vim.keymap.set("n","<F12>",vim.cmd.Alpha)
local col = function(strlist, opts)
  -- strlist is a TABLE of TABLES, representing columns of text
  -- opts is a text display option

  -- column spacing
  local padding = 12
  -- fill lines up to the maximim length with 'fillchar'
  local fillchar = ' '
  -- columns padding char (for testing)
  local padchar = ' '

  -- define maximum string length in a table
  local maxlen = function(str)
    local max = 0 
    for i in pairs(str) do
      if #str[i] > max then
        max = #str[i]
      end
    end
    return max
  end

  -- add as much right-padding to align the text block
  local pad = function(str, max)
    local strlist = {}
    for i in pairs(str) do
      if #str[i] < max then
        local newstr = str[i] .. string.rep(fillchar, max-#str[i])
        table.insert(strlist, newstr)
      else
        table.insert(strlist, str[i])
      end
    end
    return strlist
  end

  -- this is a table for text strings
  local values = {}
  -- process all the lines
  for i=1,maxlen(strlist) do
    local str = ''
    -- process all the columns but last, because we dont wand extra padding
    -- after last column
    for column=1,#strlist-1 do
      local maxstr = maxlen(strlist[column])
      local padded = pad(strlist[column], maxstr)
      if strlist[column][i] == nil then
        str = str .. string.rep(fillchar, maxstr) .. string.rep(padchar, padding)
      else
        str = str .. padded[i] .. string.rep(padchar, padding)
      end
    end

    -- lets process the last column, no extra padding
    do
      local maxstr = maxlen(strlist[#strlist])
      local padded = pad(strlist[#strlist], maxstr)
      if strlist[#strlist][i] == nil then
        str = str .. string.rep(fillchar, maxlen(strlist[#strlist]))
      else
        str = str .. padded[i]
      end
    end

    -- insert result into output table
    table.insert(values, { type = "text", val = str, opts = opts })
  end

  return values
end

local LSP = {
  "[<Tab> ]	 Autocomplete Cycle Down", 
  "[<S-Tab>]	Autocomplete Cycle Up",
  "[<Enter>]	               Select",
  "",
"	 [gd]				  Go To Defination",
  "     [K]		   				     Hover",
  "[<leader>ws]	    Go To Workspace Symbol",
  "[<leader>d]	   		    	Diagnostic",
  "[<leader>ca]			      Code Actions",
  "[<leader>rr]				     Reference",
			}
local Telescope = {
  "                <leader>sf           Search In Open File",
  "                 <leader>ss           Search Select Telescope",
  "                 <leader>sg           Search Git",
  "                  <leader>sF           Search Files",
  "     <leader>sw           Search Current Word",
  "    <leader>sg           Search By Grep",
  "                <leader>sG           Search By Grep On GitHub",

  
}

 local CustomKeys = {
   "<leader>pv     Open File Explorer",
   "Visual-J       Move selected  Down",
   "Visual-K       Move Selected  Up",
   "<leader>Y      Copy ",
   "<leader>p      Paste",
   "<leader>s      Replace",
   "<leader>x	     Chomd +x",
   "Visula-<       Move Selected Left",
   "Visual->       Move Selected Right",
   "[F8]           ClangFormat",
 }


local head = {
    type = "text",
    val = {
       [[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
       [[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
       [[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
       [[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
       [[██   ████ ██████  ██████     ████   ██ ██      ██]]

    },
    opts = {
        position = "center",
        hl = "Type",
    },
}

local foot = {
    type = "text",
    val = "footer",
    opts = {
        position = "center",
        hl = "Number",
    },
}
 local block1 = {
     type = "group",
     val = col({LSP, Telescope},{paddings = 10}, { position = "center", hl = {{"Comment", 50, -50}, { "Title", 92, 97 }, { "Title", 137, 154 }} }),
     opts = { paddings = 40 },
         spacing = 0,
		 vcenter = true,
     }
 

local block3 = {
    type = "group",
    val = col({CustomKeys}, { position = "center", hl = {{"Comment", 50, -50}, { "Title", 89, 100 }, { "Title", 152, 159 }, {"Title", 198, 209}} }),
    opts = {
        spacing = 0
    },
}

local opts = {
    layout = {
        { type = "padding", val = 2 },
        head,
        { type = "padding", val = 2 },
        block1,
        { type = "padding", val = 2 },
        block2,
        { type = "padding", val = 2 },
        block3,
    },
    opts = {
        noautocmd = true,
        margin = 5,
    },
}

alpha.setup(opts)

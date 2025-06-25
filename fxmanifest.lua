--[[
---------------------------
  ____   ____ _____ _____ 
 |  _ \ / __ \_   _|_   _|
 | |_) | |  | || |   | |  
 |  _ <| |  | || |   | |  
 | |_) | |__| || |_ _| |_ 
 |____/ \____/_____|_____|
                                                    
---------------------------                                              
      Utility Library
          V2.1.0              
---------------------------
]]

fx_version "cerulean"
games { "gta5", "rdr3" }

name "boii_utils"
version "2.2.0"
description "Developer Utility Library."
author "boiidevelopment"
repository "https://github.com/boiidevelopment/boii_utils"
lua54 "yes"

fx_version "cerulean"
game "gta5"

server_script "@oxmysql/lib/MySQL.lua"

shared_script "init.lua"
server_script "users.lua" -- Required! user accounts handle permissions for commands etc.. dont remove.

shared_scripts {
    "lib/events/*.lua",
    "lib/modules/*.lua",
    "lib/callbacks/*lua",
    "bridges/**/impl/*.lua",
    "bridges/**/loader.lua",
}

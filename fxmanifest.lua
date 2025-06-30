--[[ 
    This file is part of BDTK (BOII Development Tool Kit) and is licensed under the MIT License.
    See the LICENSE file in the root directory for full terms.

    © 2025 Case @ BOII Development

    Support honest development — retain this credit. Don"t be that guy...
]]

--[[
#############################
#  ____   ____ _____ _____  #
# |  _ \ / __ \_   _|_   _| #
# | |_) | |  | || |   | |   #
# |  _ <| |  | || |   | |   #
# | |_) | |__| || |_ _| |_  #
# |____/ \____/_____|_____| #
#                           #                       
#############################                                         
#           BDTK            #
#          V0.1.2           #    
#############################
]]

fx_version "cerulean"
games { "gta5", "rdr3" }

name "bdtk"
version "0.1.2"
description "A developer tool kit covering bridges and common functions."
author "boiidevelopment"
repository "https://github.com/boiidevelopment/bdtk"
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

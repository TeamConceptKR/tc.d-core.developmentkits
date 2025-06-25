--[[ 
    This file is part of BDTK (BOII Development Tool Kit) and is licensed under the MIT License.
    See the LICENSE file in the root directory for full terms.

    © 2025 Case @ BOII Development

    Support honest development — retain this credit. Don"t be that guy...
]]

if bdtk.framework ~= "standalone" then return end

local bridge = {}

if bdtk.is_server then

    -- Players
    function bridge.get_players()
        print("[bdtk:standalone] get_players")
        return {}
    end

    function bridge.get_player()
        print("[bdtk:standalone] get_player")
        return false
    end

    -- Database
    function bridge.get_id_params()
        print("[bdtk:standalone] get_id_params")
        return "1=1", {}
    end

    -- Identity
    function bridge.get_identity()
        print("[bdtk:standalone] get_identity")
        return nil
    end

    -- Inventory
    function bridge.get_inventory()
        print("[bdtk:standalone] get_inventory")
        return {}
    end

    function bridge.get_item()
        print("[bdtk:standalone] get_item")
        return nil
    end

    function bridge.has_item()
        print("[bdtk:standalone] has_item")
        return false
    end

    function bridge.add_item()
        print("[bdtk:standalone] add_item")
        return false
    end

    function bridge.remove_item()
        print("[bdtk:standalone] remove_item")
        return false
    end

    function bridge.update_item_data()
        print("[bdtk:standalone] update_item_data")
        return false
    end

    -- Balances
    function bridge.get_balances()
        print("[bdtk:standalone] get_balances")
        return {}
    end

    function bridge.get_balance_by_type()
        print("[bdtk:standalone] get_balance_by_type")
        return 0
    end

    function bridge.add_balance()
        print("[bdtk:standalone] add_balance")
        return false
    end

    function bridge.remove_balance()
        print("[bdtk:standalone] remove_balance")
        return false
    end

    -- Jobs
    function bridge.get_player_jobs()
        print("[bdtk:standalone] get_player_jobs")
        return {}
    end

    function bridge.player_has_job()
        print("[bdtk:standalone] player_has_job")
        return false
    end

    function bridge.get_player_job_grade()
        print("[bdtk:standalone] get_player_job_grade")
        return nil
    end

    function bridge.count_players_by_job()
        print("[bdtk:standalone] count_players_by_job")
        return 0, 0
    end

    function bridge.get_player_job_name()
        print("[bdtk:standalone] get_player_job_name")
        return nil
    end

    -- Statuses
    function bridge.adjust_statuses()
        print("[bdtk:standalone] adjust_statuses")
        return false
    end

    -- Usable Items
    function bridge.register_item()
        print("[bdtk:standalone] register_item")
        return false
    end

else

    -- Client-side
    function bridge.get_data()
        print("[bdtk:standalone] get_data")
        return {}
    end

    function bridge.get_identity()
        print("[bdtk:standalone] get_identity")
        return nil
    end

    function bridge.get_player_id()
        print("[bdtk:standalone] get_player_id")
        return nil
    end

end

return bridge

﻿// Action script...

// [Initial MovieClip Action of sprite 720]
#initclip 15
class com.rockstargames.gtav.constants.Blips
{
    function Blips()
    {
    } // End of the function
    function getListOfBlips()
    {
        var _loc1 = new Array();
        _loc1.push("radar_higher");
        _loc1.push("radar_level");
        _loc1.push("radar_lower");
        _loc1.push("radar_police_ped");
        _loc1.push("radar_wanted_radius");
        _loc1.push("radar_area_blip");
        _loc1.push("radar_centre");
        _loc1.push("radar_north");
        _loc1.push("radar_waypoint");
        _loc1.push("radar_radius_blip");
        _loc1.push("radar_radius_outline_blip");
        _loc1.push("radar_weapon_higher");
        _loc1.push("radar_weapon_lower");
        _loc1.push("radar_higher_ai");
        _loc1.push("radar_lower_ai");
        _loc1.push("radar_police_heli_spin");
        _loc1.push("radar_police_plane_move");
        _loc1.push("radar_numbered_1");
        _loc1.push("radar_numbered_2");
        _loc1.push("radar_numbered_3");
        _loc1.push("radar_numbered_4");
        _loc1.push("radar_numbered_5");
        _loc1.push("radar_numbered_6");
        _loc1.push("radar_numbered_7");
        _loc1.push("radar_numbered_8");
        _loc1.push("radar_numbered_9");
        _loc1.push("radar_numbered_10");
        _loc1.push("radar_empty");
        _loc1.push("radar_empty");
        _loc1.push("radar_empty");
        _loc1.push("radar_empty");
        _loc1.push("radar_empty");
        _loc1.push("radar_script_objective");
        _loc1.push("radar_empty");
        _loc1.push("radar_empty");
        _loc1.push("radar_station");
        _loc1.push("radar_cable_car");
        _loc1.push("radar_activities");
        _loc1.push("radar_raceflag");
        _loc1.push("radar_fire");
        _loc1.push("radar_safehouse");
        _loc1.push("radar_police");
        _loc1.push("radar_police_chase");
        _loc1.push("radar_police_heli");
        _loc1.push("radar_bomb_a");
        _loc1.push("radar_bomb_b");
        _loc1.push("radar_bomb_c");
        _loc1.push("radar_snitch");
        _loc1.push("radar_planning_locations");
        _loc1.push("radar_crim_arrest");
        _loc1.push("radar_crim_carsteal");
        _loc1.push("radar_crim_drugs");
        _loc1.push("radar_crim_holdups");
        _loc1.push("radar_crim_pimping");
        _loc1.push("radar_crim_player");
        _loc1.push("radar_fence");
        _loc1.push("radar_cop_patrol");
        _loc1.push("radar_cop_player");
        _loc1.push("radar_crim_wanted");
        _loc1.push("radar_heist");
        _loc1.push("radar_police_station");
        _loc1.push("radar_hospital");
        _loc1.push("radar_assassins_mark");
        _loc1.push("radar_elevator");
        _loc1.push("radar_helicopter");
        _loc1.push("radar_joyriders");
        _loc1.push("radar_random_character");
        _loc1.push("radar_security_van");
        _loc1.push("radar_tow_truck");
        _loc1.push("radar_drive_thru");
        _loc1.push("radar_illegal_parking");
        _loc1.push("radar_barber");
        _loc1.push("radar_car_mod_shop");
        _loc1.push("radar_clothes_store");
        _loc1.push("radar_gym");
        _loc1.push("radar_tattoo");
        _loc1.push("radar_armenian_family");
        _loc1.push("radar_lester_family");
        _loc1.push("radar_michael_family");
        _loc1.push("radar_trevor_family");
        _loc1.push("radar_jewelry_heist");
        _loc1.push("radar_drag_race");
        _loc1.push("radar_drag_race_finish");
        _loc1.push("radar_car_carrier");
        _loc1.push("radar_rampage");
        _loc1.push("radar_vinewood_tours");
        _loc1.push("radar_lamar_family");
        _loc1.push("radar_taco_van");
        _loc1.push("radar_franklin_family");
        _loc1.push("radar_chinese_strand");
        _loc1.push("radar_flight_school");
        _loc1.push("radar_eye_sky");
        _loc1.push("radar_air_hockey");
        _loc1.push("radar_bar");
        _loc1.push("radar_base_jump");
        _loc1.push("radar_basketball");
        _loc1.push("radar_biolab_heist");
        _loc1.push("radar_bowling");
        _loc1.push("radar_burger_shot");
        _loc1.push("radar_cabaret_club");
        _loc1.push("radar_car_wash");
        _loc1.push("radar_cluckin_bell");
        _loc1.push("radar_comedy_club");
        _loc1.push("radar_darts");
        _loc1.push("radar_docks_heist");
        _loc1.push("radar_fbi_heist");
        _loc1.push("radar_fbi_officers_strand");
        _loc1.push("radar_finale_bank_heist");
        _loc1.push("radar_financier_strand");
        _loc1.push("radar_golf");
        _loc1.push("radar_gun_shop");
        _loc1.push("radar_internet_cafe");
        _loc1.push("radar_michael_family_exile");
        _loc1.push("radar_nice_house_heist");
        _loc1.push("radar_random_female");
        _loc1.push("radar_random_male");
        _loc1.push("radar_repo");
        _loc1.push("radar_restaurant");
        _loc1.push("radar_rural_bank_heist");
        _loc1.push("radar_shooting_range");
        _loc1.push("radar_solomon_strand");
        _loc1.push("radar_strip_club");
        _loc1.push("radar_tennis");
        _loc1.push("radar_trevor_family_exile");
        _loc1.push("radar_michael_trevor_family");
        _loc1.push("radar_vehicle_spawn");
        _loc1.push("radar_triathlon");
        _loc1.push("radar_off_road_racing");
        _loc1.push("radar_gang_cops");
        _loc1.push("radar_gang_mexicans");
        _loc1.push("radar_gang_bikers");
        _loc1.push("radar_gang_families");
        _loc1.push("radar_gang_professionals");
        _loc1.push("radar_snitch_red");
        _loc1.push("radar_crim_cuff_keys");
        _loc1.push("radar_cinema");
        _loc1.push("radar_music_venue");
        _loc1.push("radar_police_station_blue");
        _loc1.push("radar_airport");
        _loc1.push("radar_crim_saved_vehicle");
        _loc1.push("radar_weed_stash");
        _loc1.push("radar_hunting");
        _loc1.push("radar_pool");
        _loc1.push("radar_objective_blue");
        _loc1.push("radar_objective_green");
        _loc1.push("radar_objective_red");
        _loc1.push("radar_objective_yellow");
        _loc1.push("radar_arms_dealing");
        _loc1.push("radar_mp_friend");
        _loc1.push("radar_celebrity_theft");
        _loc1.push("radar_weapon_assault_rifle");
        _loc1.push("radar_weapon_bat");
        _loc1.push("radar_weapon_grenade");
        _loc1.push("radar_weapon_health");
        _loc1.push("radar_weapon_knife");
        _loc1.push("radar_weapon_molotov");
        _loc1.push("radar_weapon_pistol");
        _loc1.push("radar_weapon_rocket");
        _loc1.push("radar_weapon_shotgun");
        _loc1.push("radar_weapon_smg");
        _loc1.push("radar_weapon_sniper");
        _loc1.push("radar_mp_noise");
        _loc1.push("radar_poi");
        _loc1.push("radar_passive");
        _loc1.push("radar_usingmenu");
        _loc1.push("radar_friend_franklin_p");
        _loc1.push("radar_friend_franklin_x");
        _loc1.push("radar_friend_michael_p");
        _loc1.push("radar_friend_michael_x");
        _loc1.push("radar_friend_trevor_p");
        _loc1.push("radar_friend_trevor_x");
        _loc1.push("radar_gang_cops_partner");
        _loc1.push("radar_friend_lamar");
        _loc1.push("radar_weapon_minigun");
        _loc1.push("radar_weapon_grenadeLauncher");
        _loc1.push("radar_weapon_armour");
        _loc1.push("radar_property_takeover");
        _loc1.push("radar_gang_mexicans_highlight");
        _loc1.push("radar_gang_bikers_highlight");
        _loc1.push("radar_triathlon_cycling");
        _loc1.push("radar_triathlon_swimming");
        _loc1.push("radar_property_takeover_bikers");
        _loc1.push("radar_property_takeover_cops");
        _loc1.push("radar_property_takeover_vagos");
        _loc1.push("radar_camera");
        _loc1.push("radar_centre_red");
        _loc1.push("radar_handcuff_keys_bikers");
        _loc1.push("radar_handcuff_keys_vagos");
        _loc1.push("radar_handcuffs_closed_bikers");
        _loc1.push("radar_handcuffs_closed_vagos");
        _loc1.push("radar_handcuffs_open_bikers");
        _loc1.push("radar_handcuffs_open_vagos");
        _loc1.push("radar_camera_badger");
        _loc1.push("radar_camera_facade");
        _loc1.push("radar_camera_ifruit");
        _loc1.push("radar_crim_arrest_bikers");
        _loc1.push("radar_crim_arrest_vagos");
        _loc1.push("radar_yoga");
        _loc1.push("radar_taxi");
        _loc1.push("radar_numbered_11");
        _loc1.push("radar_numbered_12");
        _loc1.push("radar_numbered_13");
        _loc1.push("radar_numbered_14");
        _loc1.push("radar_numbered_15");
        _loc1.push("radar_numbered_16");
        _loc1.push("radar_shrink");
        _loc1.push("radar_epsilon");
        _loc1.push("radar_financier_strand_grey");
        _loc1.push("radar_trevor_family_grey");
        _loc1.push("radar_trevor_family_red");
        _loc1.push("radar_franklin_family_grey");
        _loc1.push("radar_franklin_family_blue");
        _loc1.push("radar_franklin_a");
        _loc1.push("radar_franklin_b");
        _loc1.push("radar_franklin_c");
        _loc1.push("radar_numbered_red_1");
        _loc1.push("radar_numbered_red_2");
        _loc1.push("radar_numbered_red_3");
        _loc1.push("radar_numbered_red_4");
        _loc1.push("radar_numbered_red_5");
        _loc1.push("radar_numbered_red_6");
        _loc1.push("radar_numbered_red_7");
        _loc1.push("radar_numbered_red_8");
        _loc1.push("radar_numbered_red_9");
        _loc1.push("radar_numbered_red_10");
        _loc1.push("radar_gang_vehicle");
        _loc1.push("radar_gang_vehicle_bikers");
        _loc1.push("radar_gang_vehicle_cops");
        _loc1.push("radar_gang_vehicle_vagos");
        _loc1.push("radar_guncar");
        _loc1.push("radar_driving_bikers");
        _loc1.push("radar_driving_cops");
        _loc1.push("radar_driving_vagos");
        _loc1.push("radar_gang_cops_highlight");
        _loc1.push("radar_shield_bikers");
        _loc1.push("radar_shield_cops");
        _loc1.push("radar_shield_vagos");
        _loc1.push("radar_custody_bikers");
        _loc1.push("radar_custody_vagos");
        _loc1.push("radar_gang_wanted_bikers");
        _loc1.push("radar_gang_wanted_bikers_1");
        _loc1.push("radar_gang_wanted_bikers_2");
        _loc1.push("radar_gang_wanted_bikers_3");
        _loc1.push("radar_gang_wanted_bikers_4");
        _loc1.push("radar_gang_wanted_bikers_5");
        _loc1.push("radar_gang_wanted_vagos");
        _loc1.push("radar_gang_wanted_vagos_1");
        _loc1.push("radar_gang_wanted_vagos_2");
        _loc1.push("radar_gang_wanted_vagos_3");
        _loc1.push("radar_gang_wanted_vagos_4");
        _loc1.push("radar_gang_wanted_vagos_5");
        _loc1.push("radar_arms_dealing_air");
        _loc1.push("radar_playerstate_arrested");
        _loc1.push("radar_playerstate_custody");
        _loc1.push("radar_playerstate_driving");
        _loc1.push("radar_playerstate_keyholder");
        _loc1.push("radar_playerstate_partner");
        _loc1.push("radar_gang_wanted_1");
        _loc1.push("radar_gang_wanted_2");
        _loc1.push("radar_gang_wanted_3");
        _loc1.push("radar_gang_wanted_4");
        _loc1.push("radar_gang_wanted_5");
        _loc1.push("radar_ztype");
        _loc1.push("radar_stinger");
        _loc1.push("radar_packer");
        _loc1.push("radar_monroe");
        _loc1.push("radar_fairground");
        _loc1.push("radar_property");
        _loc1.push("radar_gang_highlight");
        _loc1.push("radar_altruist");
        _loc1.push("radar_ai");
        _loc1.push("radar_on_mission");
        _loc1.push("radar_cash_pickup");
        _loc1.push("radar_chop");
        _loc1.push("radar_dead");
        _loc1.push("radar_territory_locked");
        _loc1.push("radar_cash_lost");
        _loc1.push("radar_cash_vagos");
        _loc1.push("radar_cash_cops");
        _loc1.push("radar_hooker");
        _loc1.push("radar_friend");
        _loc1.push("radar_mission_2to4");
        _loc1.push("radar_mission_2to8");
        _loc1.push("radar_mission_2to12");
        _loc1.push("radar_mission_2to16");
        _loc1.push("radar_custody_dropoff");
        _loc1.push("radar_onmission_cops");
        _loc1.push("radar_onmission_lost");
        _loc1.push("radar_onmission_vagos");
        _loc1.push("radar_crim_carsteal_cops");
        _loc1.push("radar_crim_carsteal_bikers");
        _loc1.push("radar_crim_carsteal_vagos");
        _loc1.push("radar_band_strand");
        _loc1.push("radar_simeon_family");
        _loc1.push("radar_mission_1");
        _loc1.push("radar_mission_2");
        _loc1.push("radar_friend_darts");
        _loc1.push("radar_friend_comedyclub");
        _loc1.push("radar_friend_cinema");
        _loc1.push("radar_friend_tennis");
        _loc1.push("radar_friend_stripclub");
        _loc1.push("radar_friend_livemusic");
        _loc1.push("radar_friend_golf");
        _loc1.push("radar_bounty_hit");
        _loc1.push("radar_ugc_mission");
        _loc1.push("radar_horde");
        _loc1.push("radar_cratedrop");
        _loc1.push("radar_plane_drop");
        _loc1.push("radar_sub");
        _loc1.push("radar_race");
        _loc1.push("radar_deathmatch");
        _loc1.push("radar_arm_wrestling");
        _loc1.push("radar_mission_1to2");
        _loc1.push("radar_shootingrange_gunshop");
        _loc1.push("radar_race_air");
        _loc1.push("radar_race_land");
        _loc1.push("radar_race_sea");
        _loc1.push("radar_tow");
        _loc1.push("radar_garbage");
        _loc1.push("radar_drill");
        _loc1.push("radar_spikes");
        _loc1.push("radar_firetruck");
        _loc1.push("radar_minigun2");
        _loc1.push("radar_bugstar");
        _loc1.push("radar_submarine");
        _loc1.push("radar_chinook");
        _loc1.push("radar_getaway_car");
        _loc1.push("radar_mission_bikers_1");
        _loc1.push("radar_mission_bikers_1to2");
        _loc1.push("radar_mission_bikers_2");
        _loc1.push("radar_mission_bikers_2to4");
        _loc1.push("radar_mission_bikers_2to8");
        _loc1.push("radar_mission_bikers_2to12");
        _loc1.push("radar_mission_bikers_2to16");
        _loc1.push("radar_mission_cops_1");
        _loc1.push("radar_mission_cops_1to2");
        _loc1.push("radar_mission_cops_2");
        _loc1.push("radar_mission_cops_2to4");
        _loc1.push("radar_mission_cops_2to8");
        _loc1.push("radar_mission_cops_2to12");
        _loc1.push("radar_mission_cops_2to16");
        _loc1.push("radar_mission_vagos_1");
        _loc1.push("radar_mission_vagos_1to2");
        _loc1.push("radar_mission_vagos_2");
        _loc1.push("radar_mission_vagos_2to4");
        _loc1.push("radar_mission_vagos_2to8");
        _loc1.push("radar_mission_vagos_2to12");
        _loc1.push("radar_mission_vagos_2to16");
        _loc1.push("radar_gang_bike");
        _loc1.push("radar_gas_grenade");
        _loc1.push("radar_property_for_sale");
        _loc1.push("radar_gang_attack_package");
        _loc1.push("radar_martin_madrazzo");
        _loc1.push("radar_enemy_heli_spin");
        _loc1.push("radar_boost");
        _loc1.push("radar_devin");
        _loc1.push("radar_dock");
        _loc1.push("radar_garage");
        _loc1.push("radar_golf_flag");
        _loc1.push("radar_hangar");
        _loc1.push("radar_helipad");
        _loc1.push("radar_jerry_can");
        _loc1.push("radar_mask");
        _loc1.push("radar_heist_prep");
        _loc1.push("radar_incapacitated");
        _loc1.push("radar_spawn_point_pickup");
        _loc1.push("radar_boilersuit");
        _loc1.push("radar_completed");
        _loc1.push("radar_rockets");
        _loc1.push("radar_garage_for_sale");
        _loc1.push("radar_helipad_for_sale");
        _loc1.push("radar_dock_for_sale");
        _loc1.push("radar_hangar_for_sale");
        _loc1.push("radar_placeholder_6");
        _loc1.push("radar_business");
        _loc1.push("radar_business_for_sale");
        _loc1.push("radar_race_bike");
        _loc1.push("radar_parachute");
        _loc1.push("radar_team_deathmatch");
        _loc1.push("radar_race_foot");
        _loc1.push("radar_vehicle_deathmatch");
        _loc1.push("radar_barry");
        _loc1.push("radar_dom");
        _loc1.push("radar_maryann");
        _loc1.push("radar_cletus");
        _loc1.push("radar_josh");
        _loc1.push("radar_minute");
        _loc1.push("radar_omega");
        _loc1.push("radar_tonya");
        _loc1.push("radar_paparazzo");
        _loc1.push("radar_aim");
        _loc1.push("radar_cratedrop_background");
        _loc1.push("radar_green_and_net_player1");
        _loc1.push("radar_green_and_net_player2");
        _loc1.push("radar_green_and_net_player3");
        _loc1.push("radar_green_and_friendly");
        _loc1.push("radar_net_player1_and_net_player2");
        _loc1.push("radar_net_player1_and_net_player3");
        _loc1.push("radar_creator");
        _loc1.push("radar_creator_direction");
        _loc1.push("radar_abigail");
        _loc1.push("radar_blimp");
        _loc1.push("radar_repair");
        _loc1.push("radar_testosterone");
        _loc1.push("radar_dinghy");
        _loc1.push("radar_fanatic");
        _loc1.push("radar_invisible");
        _loc1.push("radar_info_icon");
        return (_loc1);
    } // End of the function
} // End of Class
#endinitclip

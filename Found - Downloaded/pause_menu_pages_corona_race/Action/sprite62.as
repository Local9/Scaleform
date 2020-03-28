﻿// Action script...

// [Initial MovieClip Action of sprite 62]
#initclip 5
class com.rockstargames.gtav.constants.MPIconLabels
{
    static var _instance;
    function MPIconLabels()
    {
        HASHTABLE = new Object();
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.EMPTY[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.EMPTY;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.ICON_DATA[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.ICON_DATA;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.ICON_DRIVER[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.ICON_DRIVER;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.ICON_HACKER[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.ICON_HACKER;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.ICON_HIRED_GUN[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.ICON_HIRED_GUN;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.ICON_LEADER[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.ICON_LEADER;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.ICON_PARACHUTIST[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.ICON_PARACHUTIST;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.ICON_SNIPER[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.ICON_SNIPER;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_CASH_FROM_BANK[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_CASH_FROM_BANK;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_CASH_FROM_SAFE[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_CASH_FROM_SAFE;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_COKE_DRUGS[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_COKE_DRUGS;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_CUFF_KEYS[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_CUFF_KEYS;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_DOWNLOAD_DATA[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_DOWNLOAD_DATA;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_HEROIN[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_HEROIN;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_IF_PED_FOLLOWING[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_IF_PED_FOLLOWING;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_KEY_CARD[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_KEY_CARD;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_METH_DRUGS[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_METH_DRUGS;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_PACKAGES[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_PACKAGES;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_PICKUP_FROM_BOAT[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_PICKUP_FROM_BOAT;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_RANDOM_OBJECT[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_RANDOM_OBJECT;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_REMOTE_CONTROL[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_REMOTE_CONTROL;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_WEAPONS_PACKAGE[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_WEAPONS_PACKAGE;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INV_WEED[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INV_WEED;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_ARREST[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_ARREST;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_BAD_COP[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_BAD_COP;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_DRIVE_BY[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_DRIVE_BY;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_DRIVING[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_DRIVING;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_GANG_CASH[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_GANG_CASH;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_HACKING[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_HACKING;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED6[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED6;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED7[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED7;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED8[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED8;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.LOBBY_KILLDEATH_RATIO[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.LOBBY_KILLDEATH_RATIO;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED9[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED9;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED10[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED10;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED11[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED11;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_PED[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_PED;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_RELIABILITY[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_RELIABILITY;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.LOBBY_REPORTED[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.LOBBY_REPORTED;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED13[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED13;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED14[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED14;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED15[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED15;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_SHOOTING[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_SHOOTING;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED16[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED16;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED17[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED17;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED18[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_UNUSED18;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_TERRITORY[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_TERRITORY;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.ACTIVE_HEADSET[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.ACTIVE_HEADSET;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INACTIVE_HEADSET[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INACTIVE_HEADSET;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.MUTED_HEADSET[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.MUTED_HEADSET;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.ARRESTED[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.ARRESTED;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.HANDCUFFED[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.HANDCUFFED;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.KEYHOLDER[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.KEYHOLDER;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_SNITCH[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_SNITCH;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.GTAV[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.GTAV;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_ACCURACY[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_ACCURACY;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_CREW[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_CREW;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_MISSIONSCREATED[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_MISSIONSCREATED;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_RACE_WINS[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_RACE_WINS;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STAR[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STAR;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.RACE[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.RACE;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.GTARACE[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.GTARACE;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.DEATHMATCH[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.DEATHMATCH;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.WORLD[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.WORLD;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.KICK[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.KICK;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.RANK_FREEMODE[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.RANK_FREEMODE;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.SPECTATOR[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.SPECTATOR;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_CREW_CHALLENGES[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_CREW_CHALLENGES;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_CREW_HEAD_TO_HEAD[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_CREW_HEAD_TO_HEAD;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INVITED[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INVITED;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.INVITE_ACCEPTED[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.INVITE_ACCEPTED;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_BASE_JUMPING[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_BASE_JUMPING;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_CUSTOM_MISSION[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_CUSTOM_MISSION;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_LAPS[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_LAPS;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_LOSS[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_LOSS;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_POSITION[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_POSITION;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_SURVIVAL[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_SURVIVAL;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_TIME[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_TIME;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STATS_TROPHY[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STATS_TROPHY;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.LOBBY_DRIVER[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.LOBBY_DRIVER;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.LOBBY_CODRIVER[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.LOBBY_CODRIVER;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STAT_VEHICLE_ACCELERATION[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STAT_VEHICLE_ACCELERATION;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STAT_VEHICLE_BRAKING[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STAT_VEHICLE_BRAKING;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STAT_VEHICLE_HANDLING[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STAT_VEHICLE_HANDLING;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STAT_VEHICLE_SPEED[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STAT_VEHICLE_SPEED;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STAT_CAMERA[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STAT_CAMERA;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STAT_MOVIE[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STAT_MOVIE;
        HASHTABLE[PREFIX + com.rockstargames.gtav.constants.MPIconLabels.STAT_PIN[0].toString()] = com.rockstargames.gtav.constants.MPIconLabels.STAT_PIN;
    } // End of the function
    static function lookUp(i)
    {
        if (com.rockstargames.gtav.constants.MPIconLabels._instance == undefined)
        {
            _instance = new com.rockstargames.gtav.constants.MPIconLabels();
        } // end if
        return (com.rockstargames.gtav.constants.MPIconLabels._instance.HASHTABLE[com.rockstargames.gtav.constants.MPIconLabels._instance.PREFIX + i]);
    } // End of the function
    static var EMPTY = new Array(0, "EMPTY");
    static var ICON_DATA = new Array(1, "ICON_DATA");
    static var ICON_DRIVER = new Array(2, "ICON_DRIVER");
    static var ICON_HACKER = new Array(3, "ICON_HACKER");
    static var ICON_HIRED_GUN = new Array(4, "ICON_HIRED_GUN");
    static var ICON_LEADER = new Array(5, "ICON_LEADER");
    static var ICON_PARACHUTIST = new Array(6, "ICON_PARACHUTIST");
    static var ICON_SNIPER = new Array(7, "ICON_SNIPER");
    static var INV_CASH_FROM_BANK = new Array(8, "INV_CASH_FROM_BANK");
    static var INV_CASH_FROM_SAFE = new Array(9, "INV_CASH_FROM_SAFE");
    static var INV_COKE_DRUGS = new Array(10, "INV_COKE_DRUGS");
    static var INV_CUFF_KEYS = new Array(11, "INV_CUFF_KEYS");
    static var INV_DOWNLOAD_DATA = new Array(12, "INV_DOWNLOAD_DATA");
    static var INV_HEROIN = new Array(13, "INV_HEROIN");
    static var INV_IF_PED_FOLLOWING = new Array(14, "INV_IF_PED_FOLLOWING");
    static var INV_KEY_CARD = new Array(15, "INV_KEY_CARD");
    static var INV_METH_DRUGS = new Array(16, "INV_METH_DRUGS");
    static var INV_PACKAGES = new Array(17, "INV_PACKAGES");
    static var INV_PICKUP_FROM_BOAT = new Array(18, "INV_PICKUP_FROM_BOAT");
    static var INV_RANDOM_OBJECT = new Array(19, "INV_RANDOM_OBJECT");
    static var INV_REMOTE_CONTROL = new Array(20, "INV_REMOTE_CONTROL");
    static var INV_WEAPONS_PACKAGE = new Array(21, "INV_WEAPONS_PACKAGE");
    static var INV_WEED = new Array(22, "INV_WEED");
    static var STATS_ARREST = new Array(23, "STATS_ARREST");
    static var STATS_BAD_COP = new Array(24, "STATS_BAD_COP");
    static var STATS_DRIVE_BY = new Array(25, "STATS_DRIVE_BY");
    static var STATS_DRIVING = new Array(26, "STATS_DRIVING");
    static var STATS_GANG_CASH = new Array(27, "STATS_GANG_CASH");
    static var STATS_HACKING = new Array(28, "STATS_HACKING");
    static var STATS_UNUSED6 = new Array(29, "STATS_UNUSED6");
    static var STATS_UNUSED7 = new Array(30, "STATS_UNUSED7");
    static var STATS_UNUSED8 = new Array(31, "STATS_UNUSED8");
    static var LOBBY_KILLDEATH_RATIO = new Array(32, "LOBBY_KILLDEATH_RATIO");
    static var STATS_UNUSED9 = new Array(33, "STATS_UNUSED9");
    static var STATS_UNUSED10 = new Array(34, "STATS_UNUSED10");
    static var STATS_UNUSED11 = new Array(35, "STATS_UNUSED11");
    static var STATS_PED = new Array(36, "STATS_PED");
    static var STATS_RELIABILITY = new Array(37, "STATS_RELIABILITY");
    static var LOBBY_REPORTED = new Array(38, "LOBBY_REPORTED");
    static var STATS_UNUSED13 = new Array(39, "STATS_UNUSED13");
    static var STATS_UNUSED14 = new Array(40, "STATS_UNUSED14");
    static var STATS_UNUSED15 = new Array(41, "STATS_UNUSED15");
    static var STATS_SHOOTING = new Array(42, "STATS_SHOOTING");
    static var STATS_UNUSED16 = new Array(43, "STATS_UNUSED16");
    static var STATS_UNUSED17 = new Array(44, "STATS_UNUSED17");
    static var STATS_UNUSED18 = new Array(45, "STATS_UNUSED18");
    static var STATS_TERRITORY = new Array(46, "STATS_TERRITORY");
    static var ACTIVE_HEADSET = new Array(47, "ACTIVE_HEADSET");
    static var INACTIVE_HEADSET = new Array(48, "INACTIVE_HEADSET");
    static var MUTED_HEADSET = new Array(49, "MUTED_HEADSET");
    static var ARRESTED = new Array(50, "ARRESTED");
    static var HANDCUFFED = new Array(51, "HANDCUFFED");
    static var KEYHOLDER = new Array(52, "KEYHOLDER");
    static var STATS_SNITCH = new Array(53, "STATS_SNITCH");
    static var GTAV = new Array(54, "GTAV");
    static var STATS_ACCURACY = new Array(55, "STATS_ACCURACY");
    static var STATS_CREW = new Array(56, "STATS_CREW");
    static var STATS_MISSIONSCREATED = new Array(57, "STATS_MISSIONSCREATED");
    static var STATS_RACE_WINS = new Array(58, "STATS_RACE_WINS");
    static var STAR = new Array(59, "STAR");
    static var RACE = new Array(60, "RACE");
    static var GTARACE = new Array(61, "GTARACE");
    static var DEATHMATCH = new Array(62, "DEATHMATCH");
    static var WORLD = new Array(63, "WORLD");
    static var KICK = new Array(64, "KICK");
    static var RANK_FREEMODE = new Array(65, "RANK_FREEMODE");
    static var SPECTATOR = new Array(66, "SPECTATOR");
    static var STATS_CREW_CHALLENGES = new Array(67, "STATS_CREW_CHALLENGES");
    static var STATS_CREW_HEAD_TO_HEAD = new Array(68, "STATS_CREW_HEAD_TO_HEAD");
    static var INVITED = new Array(69, "INVITED");
    static var INVITE_ACCEPTED = new Array(70, "INVITE_ACCEPTED");
    static var STATS_BASE_JUMPING = new Array(71, "STATS_BASE_JUMPING");
    static var STATS_CUSTOM_MISSION = new Array(72, "STATS_CUSTOM_MISSION");
    static var STATS_LAPS = new Array(73, "STATS_LAPS");
    static var STATS_LOSS = new Array(74, "STATS_LOSS");
    static var STATS_POSITION = new Array(75, "STATS_POSITION");
    static var STATS_SURVIVAL = new Array(76, "STATS_SURVIVAL");
    static var STATS_TIME = new Array(77, "STATS_TIME");
    static var STATS_TROPHY = new Array(78, "STATS_TROPHY");
    static var LOBBY_DRIVER = new Array(79, "LOBBY_DRIVER");
    static var LOBBY_CODRIVER = new Array(80, "LOBBY_CODRIVER");
    static var STAT_VEHICLE_ACCELERATION = new Array(81, "STAT_VEHICLE_ACCELERATION");
    static var STAT_VEHICLE_BRAKING = new Array(82, "STAT_VEHICLE_BRAKING");
    static var STAT_VEHICLE_HANDLING = new Array(83, "STAT_VEHICLE_HANDLING");
    static var STAT_VEHICLE_SPEED = new Array(84, "STAT_VEHICLE_SPEED");
    static var STAT_CAMERA = new Array(85, "STAT_CAMERA");
    static var STAT_MOVIE = new Array(86, "STAT_MOVIE");
    static var STAT_PIN = new Array(87, "STAT_PIN");
    var HASHTABLE = new Object();
    var PREFIX = "icon";
} // End of Class
#endinitclip
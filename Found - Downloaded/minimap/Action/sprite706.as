// Action script...

// [Initial MovieClip Action of sprite 706]
#initclip 1
class com.rockstargames.gtav.minimap.MINIMAP extends MovieClip
{
    var TIMELINE, screenWidth, screenHeight, centerScreenX, centerScreenY, depthLevelForMap, worldMapWidth, worldMapHeight, gangColours, mapComponents, healthContainer, CONTENT, BOUNDING_BOX, wantedOverlayActive, colourHealth, colourArmour, colourAbility, colourAir, colourRed, HEALTH_ARMOUR_ABILITY, STALLWARNING, HEALTH_ARMOUR_BAR_MC, HEALTH, ARMOUR, ABILITY_BAR_MC, ABILITY, ABILITY_BAR_GLOW_MC, ABILITY_BAR_GLOW_POINT_MC, AIR_BAR_MC, AIR, SATNAV, flashMaxCyclesAbilityGlow, flashAbilityGlowCycleCount, isAbilityFlashing, queuedAbilityVisibility, MINIMAP_MASK, flashAbilityCycleCount, flashMaxCyclesAbility, MAP, DEPTHGUAGE;
    function MINIMAP(mc)
    {
        super();
        _global.gfxExtensions = true;
        TIMELINE = mc;
        screenWidth = 142;
        screenHeight = 142;
        centerScreenX = screenWidth / 2;
        centerScreenY = screenHeight / 2;
        depthLevelForMap = 10;
        worldMapWidth = 9216;
        worldMapHeight = 15360.002000;
        var _loc4 = [29, 100, 153];
        var _loc6 = [214, 116, 15];
        var _loc5 = [135, 125, 142];
        gangColours = new Array();
        gangColours.push(_loc4);
        gangColours.push(_loc6);
        gangColours.push(_loc5);
        mapComponents = new Array();
        mapComponents.push("component_0");
        mapComponents.push("component_1");
        mapComponents.push("component_2");
        mapComponents.push("component_3");
        mapComponents.push("component_4");
        mapComponents.push("component_5");
        this.INITIALISE();
    } // End of the function
    function REGISTER_HEALTH_ARMOUR(_healthContainer)
    {
        healthContainer = _healthContainer;
    } // End of the function
    function INITIALISE()
    {
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth());
        CONTENT.setMask(TIMELINE.mapMask);
        BOUNDING_BOX = TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX._visible = false;
        wantedOverlayActive = false;
        colourHealth = new com.rockstargames.ui.utils.HudColour();
        colourArmour = new com.rockstargames.ui.utils.HudColour();
        colourAbility = new com.rockstargames.ui.utils.HudColour();
        colourAir = new com.rockstargames.ui.utils.HudColour();
        colourRed = new com.rockstargames.ui.utils.HudColour();
        this.READY();
    } // End of the function
    function READY()
    {
    } // End of the function
    function SETUP_HEALTH_ARMOUR(healthType)
    {
        mapType = healthType;
        restarted = true;
        if (healthContainer != undefined)
        {
            if (healthType == 1)
            {
                if (HEALTH_ARMOUR_ABILITY != undefined)
                {
                    HEALTH_ARMOUR_ABILITY.removeMovieClip();
                } // end if
                HEALTH_ARMOUR_ABILITY = healthContainer.attachMovie("HEALTH_ARMOUR_ABILITY_SMALL", "HEALTH_ARMOUR_ABILITY_SMALL", 1, {_visible: false});
                if (STALLWARNING != undefined)
                {
                    STALLWARNING._visible = true;
                } // end if
            } // end if
            if (healthType == 2 || healthType == 3)
            {
                if (HEALTH_ARMOUR_ABILITY != undefined)
                {
                    HEALTH_ARMOUR_ABILITY.removeMovieClip();
                } // end if
                HEALTH_ARMOUR_ABILITY = healthContainer.attachMovie("HEALTH_ARMOUR_ABILITY_BIG", "HEALTH_ARMOUR_ABILITY_BIG", 1, {_visible: false});
                if (STALLWARNING != undefined)
                {
                    STALLWARNING._visible = false;
                } // end if
            } // end if
            if (healthType == 3)
            {
                if (HEALTH_ARMOUR_ABILITY != undefined)
                {
                    HEALTH_ARMOUR_ABILITY.removeMovieClip();
                } // end if
                HEALTH_ARMOUR_ABILITY = healthContainer.attachMovie("GOLF", "GOLF", 1, {_visible: false});
            } // end if
            if (healthType != 3)
            {
                if (wantedOverlayActive == false)
                {
                    this.STOP_FLASHING_WANTED_OVERLAY();
                }
                else
                {
                    this.FLASH_WANTED_OVERLAY();
                } // end else if
                this.SET_HEALTH_DAMAGE_VISIBLE(false);
                var _loc3 = new com.rockstargames.ui.utils.HudColour();
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_DAMAGE, _loc3);
                if (HEALTH_ARMOUR_ABILITY.healthHitMC != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(HEALTH_ARMOUR_ABILITY.healthHitMC, _loc3.r, _loc3.g, _loc3.b, 100);
                } // end if
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN, colourHealth);
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE, colourArmour);
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW, colourAbility);
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUELIGHT, colourAir);
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED, colourRed);
                HEALTH_ARMOUR_BAR_MC = HEALTH_ARMOUR_ABILITY.healthArmourMC;
                HEALTH = HEALTH_ARMOUR_BAR_MC.healthBar;
                ARMOUR = HEALTH_ARMOUR_BAR_MC.armourBar;
                ABILITY_BAR_MC = HEALTH_ARMOUR_ABILITY.abilityMC;
                ABILITY = ABILITY_BAR_MC.abilityBar;
                ABILITY_BAR_GLOW_MC = ABILITY_BAR_MC.barGlowMC;
                ABILITY_BAR_GLOW_POINT_MC = ABILITY_BAR_MC.abilityBarGlowPointMC;
                AIR_BAR_MC = HEALTH_ARMOUR_ABILITY.airMC;
                AIR = AIR_BAR_MC.airBar;
                com.rockstargames.ui.utils.Colour.Colourise(AIR, colourAir.r, colourAir.g, colourAir.b, 100);
                com.rockstargames.ui.utils.Colour.Colourise(AIR_BAR_MC.airTrough, colourAir.r, colourAir.g, colourAir.b, 100);
                AIR_BAR_MC.airBarRed._visible = false;
                com.rockstargames.ui.utils.Colour.Colourise(AIR_BAR_MC.airBarRed, colourRed.r, colourRed.g, colourRed.b, 100);
                AIR_BAR_MC.airBarRed.stop();
                AIR_BAR_MC._visible = false;
                HEALTH._visible = false;
                HEALTH_ARMOUR_BAR_MC.healthTrough._visible = false;
                HEALTH_ARMOUR_BAR_MC.healthBarRed._visible = false;
                HEALTH_ARMOUR_BAR_MC.healthBarRed.stop();
                if (HEALTH_ARMOUR_BAR_MC.healthBarRed != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(HEALTH_ARMOUR_BAR_MC.healthBarRed, colourRed.r, colourRed.g, colourRed.b, 100);
                } // end if
                if (healthLow == true)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(HEALTH, colourRed.r, colourRed.g, colourRed.b, 100);
                    com.rockstargames.ui.utils.Colour.Colourise(HEALTH_ARMOUR_BAR_MC.healthTrough, colourRed.r, colourRed.g, colourRed.b, 100);
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(HEALTH, colourHealth.r, colourHealth.g, colourHealth.b, 100);
                    com.rockstargames.ui.utils.Colour.Colourise(HEALTH_ARMOUR_BAR_MC.healthTrough, colourHealth.r, colourHealth.g, colourHealth.b, 100);
                } // end else if
                ARMOUR._visible = false;
                HEALTH_ARMOUR_BAR_MC.armourTrough._visible = false;
                com.rockstargames.ui.utils.Colour.Colourise(ARMOUR, colourArmour.r, colourArmour.g, colourArmour.b, 100);
                com.rockstargames.ui.utils.Colour.Colourise(HEALTH_ARMOUR_BAR_MC.armourTrough, colourArmour.r, colourArmour.g, colourArmour.b, 100);
                ABILITY._visible = false;
                com.rockstargames.ui.utils.Colour.Colourise(ABILITY, colourAbility.r, colourAbility.g, colourAbility.b, 100);
                com.rockstargames.ui.utils.Colour.Colourise(ABILITY_BAR_MC.abilityTrough, colourAbility.r, colourAbility.g, colourAbility.b, 100);
                ABILITY_BAR_GLOW_MC._visible = false;
                com.rockstargames.ui.utils.Colour.Colourise(ABILITY_BAR_GLOW_MC, colourAbility.r, colourAbility.g, colourAbility.b, 100);
                ABILITY_BAR_GLOW_POINT_MC._visible = false;
                com.rockstargames.ui.utils.Colour.Colourise(ABILITY_BAR_GLOW_POINT_MC, colourAbility.r, colourAbility.g, colourAbility.b, 100);
                ABILITY._width = currentAbilityValue * 0.410000;
                AIR._width = currentAirValue * 0.410000;
                currentHealthValue = previousHealthValue;
                currentArmourValue = previousArmourValue;
                currentAbilityValue = previousAbilityValue;
                currentAirValue = previousAirValue;
                this.rescaleAllBars();
                HEALTH_ARMOUR_ABILITY._visible = true;
                if (flashHealthActive == true)
                {
                    this.flashHealthBarRed();
                } // end if
                if (SATNAV != undefined)
                {
                    SATNAV.removeMovieClip();
                } // end if
                SATNAV = healthContainer.attachMovie("satnav", "satnav", 2, {_x: 10, _y: 103, _visible: false});
            } // end if
        } // end if
    } // End of the function
    function rescaleAllBars()
    {
        if (isMultiplayer == true)
        {
            ABILITY_BAR_MC._visible = false;
            if (AIR_BAR_MC._visible == false)
            {
                multiplayerScaleModifier = 2.049000;
            }
            else
            {
                multiplayerScaleModifier = 1;
            } // end else if
        }
        else
        {
            if (AIR_BAR_MC._visible == false)
            {
                ABILITY_BAR_MC._visible = true;
            } // end if
            multiplayerScaleModifier = 1;
        } // end else if
        ARMOUR._xscale = currentArmourValue * multiplayerScaleModifier;
        HEALTH_ARMOUR_BAR_MC.armourTrough._xscale = 100 * multiplayerScaleModifier;
    } // End of the function
    function SET_PLAYER_HEALTH(newHealthValue, wasAdded, capacity)
    {
        if (capacity != undefined && capacity <= 100)
        {
            var _loc3 = newHealthValue * (100 / capacity);
            newHealthValue = _loc3;
        } // end if
        if (newHealthValue > 0 && newHealthValue < 101)
        {
            HEALTH._xscale = newHealthValue;
            if (HEALTH._width < 1)
            {
                HEALTH._width = 1;
            } // end if
            HEALTH_ARMOUR_BAR_MC.healthBarRed._xscale = currentHealthValue;
            HEALTH._visible = true;
            HEALTH_ARMOUR_BAR_MC.healthTrough._visible = true;
            HEALTH_ARMOUR_BAR_MC.armourTrough._visible = true;
        }
        else if (newHealthValue == 0)
        {
            HEALTH._visible = false;
        } // end else if
        if (isMultiplayer == false)
        {
            ABILITY._visible = true;
        } // end if
        if (newHealthValue < currentHealthValue && newHealthValue != 0)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(HEALTH_ARMOUR_BAR_MC.healthBarRed);
            HEALTH_ARMOUR_BAR_MC.healthBarRed._alpha = 85;
            HEALTH_ARMOUR_BAR_MC.healthBarRed._visible = true;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(HEALTH_ARMOUR_BAR_MC.healthBarRed, 0.500000, {_alpha: 0, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [HEALTH_ARMOUR_BAR_MC.healthBarRed]});
            if (healthContainer._visible == true)
            {
                this.SET_HEALTH_DAMAGE_VISIBLE(true);
            } // end if
        }
        else if (newHealthValue > currentHealthValue)
        {
            if (HEALTH_ARMOUR_BAR_MC.healthBarRed._visible == true)
            {
                HEALTH_ARMOUR_BAR_MC.healthBarRed._visible = false;
                HEALTH_ARMOUR_BAR_MC.healthBarRed._alpha = 85;
            } // end if
            this.SET_HEALTH_DAMAGE_VISIBLE(false);
        } // end else if
        if (newHealthValue <= 25)
        {
            if (healthLow == false)
            {
                healthLow = true;
            } // end if
            if (flashHealthActive == false)
            {
                if (HEALTH_ARMOUR_BAR_MC.healthTrough != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(HEALTH_ARMOUR_BAR_MC.healthTrough, colourRed.r, colourRed.g, colourRed.b, 100);
                } // end if
                if (HEALTH != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(HEALTH, colourRed.r, colourRed.g, colourRed.b, 100);
                } // end if
            } // end if
        }
        else if (newHealthValue > 25)
        {
            if (healthLow == true)
            {
                healthLow = false;
            } // end if
            if (flashHealthActive == false)
            {
                if (HEALTH != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(HEALTH, colourHealth.r, colourHealth.g, colourHealth.b, 100);
                } // end if
                if (HEALTH_ARMOUR_BAR_MC.healthTrough != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(HEALTH_ARMOUR_BAR_MC.healthTrough, colourHealth.r, colourHealth.g, colourHealth.b, 100);
                } // end if
            } // end if
        } // end else if
        currentHealthValue = newHealthValue;
        previousHealthValue = currentHealthValue;
    } // End of the function
    function FLASH_HEALTH_BAR(vis)
    {
        if (vis == true)
        {
            if (flashHealthActive == false)
            {
                flashHealthActive = true;
                this.flashHealthBarRed();
            } // end if
        }
        else if (vis == false)
        {
            if (flashHealthActive == true)
            {
                flashHealthActive = false;
                this.removeRedHealthBar();
            } // end if
        } // end else if
    } // End of the function
    function flashHealthBarRed()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(HEALTH);
        if (HEALTH != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(HEALTH, colourRed.r, colourRed.g, colourRed.b, 100);
        } // end if
        if (HEALTH_ARMOUR_BAR_MC.healthTrough != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(HEALTH_ARMOUR_BAR_MC.healthTrough, colourRed.r, colourRed.g, colourRed.b, 100);
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.to(HEALTH, 0.500000, {_alpha: 0, delay: 0.250000, onCompleteScope: this, onComplete: flashHealthBarRed});
    } // End of the function
    function removeRedHealthBar()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(HEALTH);
        HEALTH._alpha = 100;
        if (healthLow == false)
        {
            if (HEALTH != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(HEALTH, colourHealth.r, colourHealth.g, colourHealth.b, 100);
            } // end if
            if (HEALTH_ARMOUR_BAR_MC.healthTrough != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(HEALTH_ARMOUR_BAR_MC.healthTrough, colourHealth.r, colourHealth.g, colourHealth.b, 100);
            } // end if
        } // end if
    } // End of the function
    function SET_PLAYER_ARMOUR(newArmourValue, wasAdded, capacity)
    {
        if (capacity != undefined && capacity <= 100)
        {
            var _loc4 = newArmourValue * (100 / capacity);
            newArmourValue = _loc4;
        }
        else
        {
            capacity = 100;
        } // end else if
        if (newArmourValue > 0 && newArmourValue < 101)
        {
            ARMOUR._xscale = newArmourValue * multiplayerScaleModifier;
            if (ARMOUR._width < 1)
            {
                ARMOUR._width = 1;
            } // end if
        } // end if
        if (newArmourValue == 0)
        {
            ARMOUR._visible = false;
        }
        else
        {
            ARMOUR._visible = true;
            HEALTH_ARMOUR_BAR_MC.armourTrough._visible = true;
        } // end else if
        currentArmourValue = newArmourValue;
        previousArmourValue = currentArmourValue;
    } // End of the function
    function SET_AIR_BAR(newAirValue)
    {
        if (newAirValue >= 0 && newAirValue <= 100)
        {
            AIR._width = newAirValue * 0.410000;
            AIR_BAR_MC.airBarRed._width = AIR._width;
            AIR_BAR_MC._visible = true;
            ABILITY_BAR_MC._visible = false;
            if (newAirValue == 0)
            {
                if (AIR_BAR_MC._visible != false)
                {
                    if (AIR_BAR_MC != undefined)
                    {
                        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(AIR_BAR_MC);
                        com.rockstargames.ui.tweenStar.TweenStarLite.to(AIR_BAR_MC, 0.500000, {_alpha: 0, delay: 20, onCompleteScope: this, onComplete: HIDE_AIR_BAR});
                    } // end if
                } // end if
            }
            else if (newAirValue < 33)
            {
                AIR_BAR_MC.airBarRed._visible = true;
                AIR_BAR_MC.airBarRed.play();
            }
            else
            {
                AIR_BAR_MC.airBarRed._visible = false;
                AIR_BAR_MC.airBarRed.stop();
            } // end else if
            this.SET_PLAYER_ARMOUR(currentArmourValue);
        }
        else
        {
            this.HIDE_AIR_BAR();
        } // end else if
        currentAirValue = newAirValue;
        previousAirValue = currentAirValue;
        this.rescaleAllBars();
    } // End of the function
    function HIDE_AIR_BAR()
    {
        if (AIR_BAR_MC != undefined)
        {
            AIR_BAR_MC._visible = false;
            AIR_BAR_MC.airBarRed._visible = false;
            AIR_BAR_MC.airBarRed.stop();
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(AIR_BAR_MC);
            AIR_BAR_MC._alpha = 100;
        } // end if
        this.rescaleAllBars();
    } // End of the function
    function SET_ABILITY_BAR(newAbilityValue, wasAdded, capacity)
    {
        if (isMultiplayer == false)
        {
            if (capacity != undefined && capacity <= 100)
            {
                var _loc4 = newAbilityValue * (100 / capacity);
                newAbilityValue = _loc4;
                if (newAbilityValue > 100)
                {
                    newAbilityValue = 100;
                } // end if
            } // end if
            if (AIR_BAR_MC._visible == true)
            {
                this.HIDE_AIR_BAR();
            } // end if
            if (newAbilityValue > 0)
            {
                ABILITY._width = newAbilityValue * 0.410000;
                ABILITY._visible = true;
            }
            else if (newAbilityValue == 0)
            {
                ABILITY._width = newAbilityValue * 0.410000;
                ABILITY._visible = false;
            } // end else if
            ABILITY_BAR_GLOW_POINT_MC._x = ABILITY._x + ABILITY._width;
            if (newAbilityValue < currentAbilityValue)
            {
                this.SET_ABILITY_BAR_GLOW_POINT(true);
                if (ABILITY_BAR_GLOW_MC._visible == true)
                {
                    this.STOP_FLASHING_ABILITYGLOW();
                } // end if
            }
            else
            {
                this.SET_ABILITY_BAR_GLOW_POINT(false);
            } // end else if
            if (newAbilityValue > currentAbilityValue && newAbilityValue > 0)
            {
                ABILITY_BAR_GLOW_MC.abilityBarGlowMC._width = ABILITY._width;
                ABILITY_BAR_GLOW_MC.abilityBarGlowRightMC._x = ABILITY_BAR_GLOW_MC.abilityBarGlowMC._x + ABILITY_BAR_GLOW_MC.abilityBarGlowMC._width;
                this.SET_ABILITY_BAR_GLOW(true);
                if (newAbilityValue == 100)
                {
                    this.SET_ABILITY_BAR_GLOW_POINT(false);
                } // end if
            }
            else if (newAbilityValue <= currentAbilityValue)
            {
                this.SET_ABILITY_BAR_GLOW(false);
            } // end else if
            currentAbilityValue = newAbilityValue;
            previousAbilityValue = currentAbilityValue;
        }
        else
        {
            ABILITY._visible = false;
        } // end else if
    } // End of the function
    function SET_ABILITY_BAR_GLOW(isVisible)
    {
        flashMaxCyclesAbilityGlow = 6;
        if (isVisible == true)
        {
            if (ABILITY_BAR_GLOW_MC._visible == true)
            {
                flashAbilityGlowCycleCount = 0;
            }
            else
            {
                flashAbilityGlowCycleCount = 0;
                this.flashAbilityGlowOn(0.500000);
                ABILITY_BAR_GLOW_MC._visible = true;
            } // end else if
        }
        else
        {
            flashAbilityGlowCycleCount = 6;
            this.flashAbilityGlowOff(0.500000);
        } // end else if
    } // End of the function
    function SET_ABILITY_BAR_GLOW_POINT(isVisible, isMax)
    {
        if (ABILITY_BAR_GLOW_POINT_MC != undefined)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(ABILITY_BAR_GLOW_POINT_MC);
        } // end if
        var _loc2 = 0.250000;
        if (isVisible == true)
        {
            if (restarted == false)
            {
                ABILITY_BAR_GLOW_POINT_MC._visible = true;
                ABILITY_BAR_GLOW_POINT_MC.play();
                this.STOP_FLASHING_ABILITYGLOW();
                if (ABILITY_BAR_GLOW_POINT_MC != undefined)
                {
                    com.rockstargames.ui.tweenStar.TweenStarLite.to(ABILITY_BAR_GLOW_POINT_MC, 0.250000, {_alpha: 0, delay: _loc2, onCompleteScope: this, onComplete: SET_ABILITY_BAR_GLOW_POINT, onCompleteArgs: [false]});
                } // end if
            }
            else
            {
                restarted = false;
            } // end else if
        }
        else
        {
            ABILITY_BAR_GLOW_POINT_MC._visible = false;
            ABILITY_BAR_GLOW_POINT_MC._alpha = 100;
            ABILITY_BAR_GLOW_POINT_MC.stop();
        } // end else if
    } // End of the function
    function SET_ABILITY_BAR_VISIBLE(isVisible)
    {
        if (ABILITY_BAR_MC != undefined)
        {
            if (isAbilityFlashing)
            {
                queuedAbilityVisibility = isVisible;
            }
            else if (isVisible == true)
            {
                ABILITY_BAR_MC._visible = true;
                if (ABILITY_BAR_MC._alpha == 0)
                {
                    if (typeof(ABILITY_BAR_MC) == "movieclip")
                    {
                        com.rockstargames.ui.tweenStar.TweenStarLite.to(ABILITY_BAR_MC, 0.500000, {_alpha: 100, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [ABILITY_BAR_MC]});
                    } // end if
                } // end if
            }
            else if (typeof(ABILITY_BAR_MC) == "movieclip")
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(ABILITY_BAR_MC, 0.500000, {_alpha: 0, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [ABILITY_BAR_MC]});
            } // end else if
            return (true);
        }
        else
        {
            return (false);
        } // end else if
    } // End of the function
    function MULTIPLAYER_IS_ACTIVE(isMP)
    {
        if (isMP != undefined)
        {
            isMultiplayer = isMP;
        } // end if
        this.rescaleAllBars();
    } // End of the function
    function SET_HEALTH_DAMAGE_VISIBLE(vis, fadeTime)
    {
        if (healthContainer != undefined)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(HEALTH_ARMOUR_ABILITY.healthHitMC);
            if (vis == true)
            {
                if (fadeTime == undefined)
                {
                    fadeTime = 1.500000;
                } // end if
                HEALTH_ARMOUR_ABILITY.healthHitMC._alpha = 75;
                com.rockstargames.ui.tweenStar.TweenStarLite.to(HEALTH_ARMOUR_ABILITY.healthHitMC, fadeTime, {_alpha: 0, delay: 0.200000, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [HEALTH_ARMOUR_ABILITY.healthHitMC]});
            } // end if
            HEALTH_ARMOUR_ABILITY.healthHitMC._visible = vis;
        } // end if
    } // End of the function
    function FLASH_MINIMAP()
    {
        if (healthContainer != undefined)
        {
            HEALTH_ARMOUR_ABILITY.minimapFlashMC._alpha = 100;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(HEALTH_ARMOUR_ABILITY.minimapFlashMC, 0.300000, {_alpha: 0, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [HEALTH_ARMOUR_ABILITY.minimapFlashMC]});
        } // end if
    } // End of the function
    function SET_MASK(maskMC)
    {
        MINIMAP_MASK = maskMC;
    } // End of the function
    function MOVE_MAPMASKSQUARE(isVisible)
    {
    } // End of the function
    function SET_COLOUR(mc, r, g, b, a)
    {
        if (typeof(mc) == "movieclip")
        {
            com.rockstargames.ui.utils.Colour.Colourise(mc, r, g, b, a);
        } // end if
    } // End of the function
    function SET_RADIUS_BLIP_COLOUR(mc, r, g, b, a)
    {
        if (typeof(mc) == "movieclip")
        {
            if (a == 0)
            {
                mc._visible = false;
            }
            else
            {
                mc._visible = true;
                com.rockstargames.ui.utils.Colour.Colourise(mc, r, g, b);
                mc.blipCenter._alpha = a;
            } // end if
        } // end else if
    } // End of the function
    function SHOW_CROSSHAIR(vis)
    {
        var _loc1 = Boolean(vis);
        if (_level0.asRootContainer.asCrosshair != undefined)
        {
            _level0.asRootContainer.asCrosshair._visible = _loc1;
        } // end if
    } // End of the function
    function TOGGLE_BLIP_LABEL(mc, str)
    {
        var _loc2 = false;
        if (mc.textLabel != undefined)
        {
            this.REMOVE_BLIP_LABEL(mc);
            _loc2 = false;
        }
        else
        {
            this.SET_BLIP_LABEL(mc, str);
            _loc2 = true;
        } // end else if
        return (_loc2);
    } // End of the function
    function SET_BLIP_DEATH(mc, isDead)
    {
        var _loc2;
        if (mc.blip_mp_death != undefined)
        {
            _loc2 = mc.deathBlip;
        }
        else
        {
            _loc2 = mc.attachMovie("blip_mp_death", "blip_mp_death", mc.getNextHighestDepth());
        } // end else if
        if (isDead)
        {
            _loc2._alpha = 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2, BLIP_DEATH_DURATION, {_alpha: 100, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [_loc2]});
        }
        else
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2, BLIP_DEATH_DURATION, {_alpha: 0, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [_loc2]});
        } // end else if
    } // End of the function
    function SET_BLIP_LABEL(mc, str)
    {
        var _loc1 = new MovieClip();
        var _loc4;
        _loc1 = mc.attachMovie("blipLabel", "textLabel", mc.getNextHighestDepth(), {_x: 0, _y: 0});
        var _loc3 = -mc._rotation;
        _loc1._rotation = _loc3;
        _loc4 = _loc1.blipLabel;
        _loc4.htmlText = str;
    } // End of the function
    function REMOVE_BLIP_LABEL(mc)
    {
        mc.textLabel.removeMovieClip();
    } // End of the function
    function START_BLIP_FLASHING(mc, blinkSpeed)
    {
        this.flashOff(mc, blinkSpeed);
    } // End of the function
    function STOP_BLIP_FLASHING(mc)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
        mc._visible = true;
    } // End of the function
    function REMOVE_BLIP(mc)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
        if (mc.blip_mp_death != undefined)
        {
            var _loc2;
            _loc2 = mc.deathBlip;
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2);
        } // end if
        mc.removeMovieClip();
    } // End of the function
    function BLINK_ABILITY_BAR(millisecondsToFlash)
    {
        if (millisecondsToFlash > 0)
        {
            queuedAbilityVisibility = ABILITY_BAR_MC._visible;
            this.blinkOff(0.500000, millisecondsToFlash / 1000);
            isAbilityFlashing = true;
        }
        else
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(ABILITY_BAR_MC);
            ABILITY_BAR_MC._visible = queuedAbilityVisibility;
            isAbilityFlashing = false;
        } // end else if
    } // End of the function
    function blinkOn(blinkRate, blinkRemaining)
    {
        if (blinkRemaining)
        {
            ABILITY_BAR_MC._visible = true;
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(ABILITY_BAR_MC, blinkRate, {onComplete: blinkOff, onCompleteScope: this, onCompleteArgs: [blinkRate, blinkRemaining]});
        }
        else
        {
            ABILITY_BAR_MC._visible = queuedAbilityVisibility;
        } // end else if
    } // End of the function
    function blinkOff(blinkRate, blinkRemaining)
    {
        ABILITY_BAR_MC._visible = false;
        if (blinkRemaining)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(ABILITY_BAR_MC, blinkRate, {onComplete: blinkOn, onCompleteScope: this, onCompleteArgs: [blinkRate, blinkRemaining - 1]});
        } // end if
    } // End of the function
    function FLASH_ABILITY_BAR(params)
    {
        var _loc3 = params[0];
        var _loc2 = params[1];
        flashAbilityCycleCount = 0;
        _loc2 = Math.floor(_loc2 * 2);
        flashMaxCyclesAbility = _loc2;
        this.START_FLASHING_ABILITY(_loc3 / 1000);
    } // End of the function
    function flashAbilityOn(blinkSpeed)
    {
        ++flashAbilityCycleCount;
        if (flashAbilityCycleCount < flashMaxCyclesAbility)
        {
            ABILITY._visible = true;
            var _loc2 = ABILITY._alpha;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(ABILITY, 0, {_alpha: _loc2, delay: blinkSpeed, onCompleteScope: this, onComplete: flashAbilityOff, onCompleteArgs: [blinkSpeed]});
        }
        else
        {
            this.STOP_FLASHING_ABILITY();
        } // end else if
    } // End of the function
    function flashAbilityOff(blinkSpeed)
    {
        ++flashAbilityCycleCount;
        if (flashAbilityCycleCount < flashMaxCyclesAbility)
        {
            ABILITY._visible = false;
            var _loc2 = ABILITY._alpha;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(ABILITY, 0, {_alpha: _loc2, delay: blinkSpeed, onCompleteScope: this, onComplete: flashAbilityOn, onCompleteArgs: [blinkSpeed]});
        }
        else
        {
            this.STOP_FLASHING_ABILITY();
        } // end else if
    } // End of the function
    function START_FLASHING_ABILITY(blinkSpeed)
    {
        this.flashAbilityOff(blinkSpeed);
    } // End of the function
    function STOP_FLASHING_ABILITY()
    {
        if (typeof(ABILITY) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(ABILITY);
        } // end if
        ABILITY._visible = true;
    } // End of the function
    function flashAbilityGlowOn(blinkSpeed)
    {
        ++flashAbilityGlowCycleCount;
        if (flashAbilityGlowCycleCount < flashMaxCyclesAbilityGlow)
        {
            ABILITY_BAR_GLOW_MC._alpha = 0;
            if (ABILITY_BAR_GLOW_MC != undefined)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(ABILITY_BAR_GLOW_MC, blinkSpeed, {_alpha: 100, delay: blinkSpeed / 2, onCompleteScope: this, onComplete: flashAbilityGlowOff, onCompleteArgs: [blinkSpeed]});
            } // end if
        }
        else
        {
            this.STOP_FLASHING_ABILITYGLOW();
        } // end else if
    } // End of the function
    function flashAbilityGlowOff(blinkSpeed)
    {
        ++flashAbilityGlowCycleCount;
        if (flashAbilityGlowCycleCount < flashMaxCyclesAbilityGlow)
        {
            ABILITY_BAR_GLOW_MC._alpha = 100;
            if (ABILITY_BAR_GLOW_MC != undefined)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(ABILITY_BAR_GLOW_MC, blinkSpeed, {_alpha: 0, delay: blinkSpeed / 2, onCompleteScope: this, onComplete: flashAbilityGlowOn, onCompleteArgs: [blinkSpeed]});
            } // end if
        }
        else if (ABILITY_BAR_GLOW_MC != undefined)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(ABILITY_BAR_GLOW_MC, blinkSpeed, {_alpha: 0, delay: blinkSpeed / 2, onCompleteScope: this, onComplete: STOP_FLASHING_ABILITYGLOW});
        } // end else if
    } // End of the function
    function STOP_FLASHING_ABILITYGLOW()
    {
        if (ABILITY_BAR_GLOW_MC != undefined)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(ABILITY_BAR_GLOW_MC);
        } // end if
        ABILITY_BAR_GLOW_MC._visible = false;
    } // End of the function
    function flashOn(mc, blinkSpeed)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
        mc._visible = true;
        var _loc3 = mc._alpha;
        if (mc != undefined)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mc, blinkSpeed, {_alpha: _loc3, onCompleteScope: this, onComplete: flashOff, onCompleteArgs: [mc, blinkSpeed]});
        } // end if
    } // End of the function
    function flashOff(mc, blinkSpeed)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
        mc._visible = false;
        var _loc3 = mc._alpha;
        if (mc != undefined)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mc, blinkSpeed, {_alpha: _loc3, onCompleteScope: this, onComplete: flashOn, onCompleteArgs: [mc, blinkSpeed]});
        } // end if
    } // End of the function
    function SET_WANTED_LEVEL(circle, wantedLevel, radius)
    {
        circle.clear();
        circle.blipCenter.removeMovieClip();
        circle.outline.removeMovieClip();
        var _loc12 = "PoliceNetStars" + wantedLevel;
        var _loc13 = flash.display.BitmapData.loadBitmap(_loc12);
        var _loc2 = radius;
        var _loc6 = 0;
        var _loc5 = 0;
        var _loc7 = 0.414214;
        var _loc3;
        var _loc4;
        var _loc9;
        var _loc8;
        var _loc11 = new flash.geom.Matrix();
        circle.beginBitmapFill(_loc13, _loc11, true, true);
        circle.moveTo(_loc6 + _loc2, _loc5);
        for (var _loc1 = 45; _loc1 <= 360; _loc1 = _loc1 + 45)
        {
            _loc3 = _loc2 * Math.cos(_loc1 * 3.141593 / 180);
            _loc4 = _loc2 * Math.sin(_loc1 * 3.141593 / 180);
            _loc9 = _loc3 + _loc2 * _loc7 * Math.cos((_loc1 - 90) * 3.141593 / 180);
            _loc8 = _loc4 + _loc2 * _loc7 * Math.sin((_loc1 - 90) * 3.141593 / 180);
            circle.curveTo(_loc9 + _loc6, _loc8 + _loc5, _loc3 + _loc6, _loc4 + _loc5);
        } // end of for
        circle.endFill();
    } // End of the function
    function GET_ASSET_ARRAY()
    {
        var _loc1 = new Array();
        var _loc2 = new com.rockstargames.gtav.constants.Blips();
        _loc1 = _loc2.getListOfBlips();
        return (_loc1);
    } // End of the function
    function GET_SIZE(mc)
    {
        var _loc1 = new Array();
        _loc1.push(mc._x);
        _loc1.push(mc._y);
        return (_loc1);
    } // End of the function
    function SET_MP_PROPERTY_OWNER(propertyID, owner, owner2, owner3)
    {
        var _loc5 = 0;
        var _loc3 = new Array();
        var _loc2 = MAP.main_map.gang_areas["gang_area_" + propertyID];
        if (_loc2 != undefined)
        {
            if (typeof(_loc2) == "movieclip")
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2);
            } // end if
            if (owner == -1)
            {
                _loc2._visible = false;
            }
            else
            {
                _loc3.push(owner);
                if (owner2 == undefined)
                {
                    owner2 = -1;
                }
                else
                {
                    _loc5 = 1;
                    _loc3.push(owner2);
                } // end else if
                if (owner3 == undefined)
                {
                    owner3 = -1;
                }
                else
                {
                    _loc5 = 2;
                    _loc3.push(owner3);
                } // end else if
                _loc2._alpha = 0;
                _loc2._visible = true;
                if (_loc3.length > 1)
                {
                    this.CYCLE_GANG_COLOURS(_loc2, propertyID, _loc5, _loc3);
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(_loc2, gangColours[owner][0], gangColours[owner][1], gangColours[owner][2], 65);
                } // end if
            } // end else if
        } // end else if
    } // End of the function
    function CYCLE_GANG_COLOURS(mc, propertyID, currentOwner, ownerArray)
    {
        if (typeof(mc) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
        } // end if
        var _loc3 = ownerArray[currentOwner];
        com.rockstargames.ui.utils.Colour.Colourise(mc, gangColours[_loc3][0], gangColours[_loc3][1], gangColours[_loc3][2], 65);
        ++currentOwner;
        if (currentOwner + 1 > ownerArray.length)
        {
            currentOwner = 0;
        } // end if
        var _loc6 = mc._alpha;
        if (typeof(mc) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(mc, 0, {_alpha: _loc6, delay: gangCycleDelay, onCompleteScope: this, onComplete: CYCLE_GANG_COLOURS, onCompleteArgs: [mc, propertyID, currentOwner, ownerArray]});
        } // end if
    } // End of the function
    function SET_HEALTH_ARMOUR_BAR_VISIBLE(_vis)
    {
        var _loc2 = false;
        if (HEALTH_ARMOUR_BAR_MC != undefined)
        {
            HEALTH_ARMOUR_BAR_MC._visible = Boolean(_vis);
            _loc2 = true;
        } // end if
        if (ABILITY_BAR_MC != undefined)
        {
            if (isMultiplayer == false)
            {
                if (_vis == true)
                {
                    ABILITY_BAR_MC._visible = Boolean(_vis);
                } // end if
            } // end if
            _loc2 = true;
        } // end if
        return (_loc2);
    } // End of the function
    function SET_SATNAV_DIRECTION(iconEnum)
    {
        if (SATNAV != undefined)
        {
            if (isNaN(iconEnum))
            {
                SATNAV.satNavDirection.gotoAndStop("BLANK");
                SATNAV.satNavDirection._alpha = 0;
            }
            else
            {
                var _loc2 = com.rockstargames.gtav.constants.SatNavIconsLUT.lookUp(iconEnum);
                SATNAV.satNavDirection.gotoAndStop(_loc2[1]);
            } // end else if
            if (SATNAV.satNavDirection._alpha == 0)
            {
                if (SATNAV.satNavDirection != undefined)
                {
                    com.rockstargames.ui.tweenStar.TweenStarLite.to(SATNAV.satNavDirection, 0.500000, {_alpha: 100, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [SATNAV.satNavDirection]});
                } // end if
            } // end if
            this.SHOW_SATNAV();
        } // end if
    } // End of the function
    function SET_SATNAV_DISTANCE(distance, isMetric)
    {
        if (SATNAV != undefined)
        {
            if (isNaN(distance))
            {
            } // end if
            SATNAV.distanceTF.text = this.formatDistance(distance, isMetric);
            this.SHOW_SATNAV();
        } // end if
    } // End of the function
    function HIDE_SATNAV()
    {
        if (SATNAV._visible == true)
        {
            SATNAV._visible = false;
        } // end if
    } // End of the function
    function SHOW_SATNAV()
    {
        if (HEALTH_ARMOUR_ABILITY._name != "HEALTH_ARMOUR_ABILITY_BIG")
        {
            if (SATNAV._visible == false)
            {
                SATNAV._visible = true;
            } // end if
        } // end if
    } // End of the function
    function SET_DEPTH(distanceToSurface, distanceToFloor, isMetric, warning)
    {
        if (DEPTHGUAGE == undefined)
        {
            this.SHOW_DEPTH();
        } // end if
        if (DEPTHGUAGE != undefined)
        {
            if (isNaN(distanceToSurface) || isNaN(distanceToFloor))
            {
            } // end if
            DEPTHGUAGE.distanceToSurfaceTF.text = this.formatDistance(distanceToSurface, isMetric);
            DEPTHGUAGE.distanceToFloorTF.text = this.formatDistance(distanceToFloor, isMetric);
            if (warning)
            {
                DEPTHGUAGE.depgthRedBG._visible = true;
                DEPTHGUAGE.depgthBlackBG._visible = false;
            }
            else
            {
                DEPTHGUAGE.depgthRedBG._visible = false;
                DEPTHGUAGE.depgthBlackBG._visible = true;
            } // end if
        } // end else if
    } // End of the function
    function HIDE_DEPTH()
    {
        if (DEPTHGUAGE != undefined)
        {
            DEPTHGUAGE.removeMovieClip();
            DEPTHGUAGE = undefined;
        } // end if
    } // End of the function
    function SHOW_DEPTH()
    {
        if (HEALTH_ARMOUR_ABILITY._name != "HEALTH_ARMOUR_ABILITY_BIG")
        {
            if (DEPTHGUAGE == undefined)
            {
                DEPTHGUAGE = healthContainer.attachMovie("depth_bar", "depth_bar", 3, {_x: 10, _y: 103});
                DEPTHGUAGE.depgthRedBG._visible = false;
            } // end if
        } // end if
    } // End of the function
    function formatDistance(distance, isMetric)
    {
        var _loc3;
        if (isMetric == true)
        {
            var _loc4 = distance / 1000;
            if (_loc4 >= 1)
            {
                _loc4 = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(_loc4, 2);
                var _loc2 = _loc4.toString();
                var _loc7 = _loc2.lastIndexOf(".");
                if (_loc7 == -1)
                {
                    _loc2 = _loc2 + ".00";
                }
                else if (_loc2.length - _loc7 == 2)
                {
                    _loc2 = _loc2 + "0";
                } // end else if
                _loc3 = _loc2 + "km";
            }
            else
            {
                var _loc8 = Math.round(distance);
                _loc3 = _loc8 + "m";
            } // end else if
        }
        else
        {
            var _loc5 = distance * 0.000621;
            if (_loc5 > 0.100000)
            {
                _loc5 = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(_loc5, 2);
                var _loc1 = _loc5.toString();
                _loc7 = _loc1.lastIndexOf(".");
                if (_loc7 == -1)
                {
                    _loc1 = _loc1 + ".00";
                }
                else if (_loc1.length - _loc7 == 2)
                {
                    _loc1 = _loc1 + "0";
                } // end else if
                _loc3 = _loc1 + "mi";
            }
            else
            {
                var _loc9 = Math.round(distance * 3.280840);
                _loc3 = _loc9 + "ft";
            } // end else if
        } // end else if
        return (_loc3);
    } // End of the function
    function HIDE_HEALTH_ARMOUR()
    {
        if (HEALTH_ARMOUR_BAR_MC._visible == true)
        {
            HEALTH_ARMOUR_BAR_MC._visible = false;
        } // end if
    } // End of the function
    function SHOW_HEALTH_ARMOUR()
    {
        if (HEALTH_ARMOUR_BAR_MC._visible == false)
        {
            HEALTH_ARMOUR_BAR_MC._visible = true;
        } // end if
    } // End of the function
    function SHOW_STALL_WARNING(_vis)
    {
        if (_vis == true)
        {
            if (STALLWARNING == undefined)
            {
                STALLWARNING = healthContainer.attachMovie("stallwarning", "stallwarning", 3, {_x: 10, _y: 103});
            } // end if
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "STALL_WARNING", STALLWARNING.stallTF, false);
            if (mapType == 1)
            {
                STALLWARNING._visible = true;
            } // end if
        }
        else if (_vis == false)
        {
            if (STALLWARNING != undefined)
            {
                STALLWARNING.stallTF.text = "";
                STALLWARNING.removeMovieClip();
                STALLWARNING = undefined;
            } // end if
        } // end else if
    } // End of the function
    function FLASH_WANTED_OVERLAY()
    {
        if (HEALTH_ARMOUR_ABILITY != undefined)
        {
            HEALTH_ARMOUR_ABILITY.wantedOverlaySP.gotoAndPlay(1);
            HEALTH_ARMOUR_ABILITY.wantedOverlaySP._visible = true;
        } // end if
        wantedOverlayActive = true;
    } // End of the function
    function STOP_FLASHING_WANTED_OVERLAY()
    {
        if (HEALTH_ARMOUR_ABILITY != undefined)
        {
            HEALTH_ARMOUR_ABILITY.wantedOverlaySP._visible = false;
        } // end if
        wantedOverlayActive = false;
    } // End of the function
    var MINIMAP_FILENAME = "MINIMAP";
    var BLIP_DEATH_DURATION = 1;
    var currentHealthValue = 0;
    var currentArmourValue = 0;
    var currentAbilityValue = 0;
    var currentAirValue = 0;
    var previousHealthValue = 0;
    var previousArmourValue = 0;
    var previousAbilityValue = 0;
    var previousAirValue = 0;
    var restarted = false;
    var isMultiplayer = false;
    var mapType = 0;
    var multiplayerScaleModifier = 1;
    var currentHour = 0;
    var currentMinute = 0;
    var FLASH_RATE = 50;
    var gangCycleDelay = 1.500000;
    var flashHealthActive = false;
    var healthLow = false;
} // End of Class
#endinitclip

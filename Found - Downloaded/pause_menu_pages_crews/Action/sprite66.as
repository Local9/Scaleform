// Action script...

// [Initial MovieClip Action of sprite 66]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var labelMC, itemTextLeft, type, notificationMC, tickBoxMC, initialIndex, getNextHighestDepth, attachMovie, __get__data, _highlighted, __set__highlighted, isSelectable, bgMC, __get__highlighted, __set__data;
    function PauseMenuCrewListItem()
    {
        super();
        itemTextLeft = labelMC.titleTF;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        switch (type)
        {
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_REGULAR:
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED:
            {
                if (notificationMC != undefined)
                {
                    notificationMC.removeMovieClip();
                    notificationMC = null;
                } // end if
                if (tickBoxMC)
                {
                    tickBoxMC.removeMovieClip();
                    tickBoxMC = null;
                } // end if
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_NOTIFICATION:
            {
                if (tickBoxMC)
                {
                    tickBoxMC.removeMovieClip();
                    tickBoxMC = null;
                } // end if
                if (initialIndex != 0)
                {
                    if (notificationMC == undefined)
                    {
                        notificationMC = this.attachMovie("crewsNotification", "myNotice", this.getNextHighestDepth(), {_x: 265, _y: 4});
                    } // end if
                    notificationMC.numTF.text = initialIndex;
                    notificationMC.numTF.autoSize = "left";
                    notificationMC.numTF.multiline = false;
                    notificationMC.numTF.wordWrap = false;
                    notificationMC.bgMC._width = notificationMC.numTF._width + 4;
                    notificationMC._x = 288 - notificationMC.bgMC._width - 5;
                }
                else if (notificationMC != undefined)
                {
                    notificationMC.removeMovieClip();
                    notificationMC = null;
                } // end else if
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_CHECKBOX:
            {
                if (notificationMC != undefined)
                {
                    notificationMC.removeMovieClip();
                    notificationMC = null;
                } // end if
                if (Boolean(this.__get__data()[1]))
                {
                    if (!tickBoxMC)
                    {
                        tickBoxMC = this.attachMovie("tickBox", "myTickBox", this.getNextHighestDepth(), {_x: 273.500000, _y: 12.500000});
                    } // end if
                    tickBoxMC.tickMC._visible = Boolean(this.__get__data()[2]);
                }
                else if (tickBoxMC)
                {
                    tickBoxMC.removeMovieClip();
                    tickBoxMC = null;
                } // end else if
                break;
            } 
        } // End of switch
        this.__set__highlighted(_highlighted);
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        if (_h)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc2);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
            com.rockstargames.ui.utils.Colour.setHudColour(isSelectable || type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED ? (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE) : (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY), _loc2);
        } // end else if
        if (bgMC)
        {
            if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED)
            {
                _loc3.a = 20;
            } // end if
            com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        } // end if
        if (labelMC)
        {
            if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED)
            {
                _loc2.a = 50;
            } // end if
            com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
        } // end if
        if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_CHECKBOX && tickBoxMC)
        {
            com.rockstargames.ui.utils.Colour.Colourise(tickBoxMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
        } // end if
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    static var AS_REGULAR = 0;
    static var AS_NOTIFICATION = 1;
    static var AS_CHECKBOX = 2;
    static var AS_DISABLED = 3;
} // End of Class
#endinitclip

// Action script...

// [Initial MovieClip Action of sprite 42]
#initclip 22
class com.rockstargames.gtav.hud.hudComponents.HUD_PLAYER_SWITCH_ALERT extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var CHAR_LIST, slicesOfPie, CONTENT, BOUNDING_BOX, TIMELINE;
    function HUD_PLAYER_SWITCH_ALERT()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        count = 0;
        CHAR_LIST = [];
        super.INITIALISE(mc);
        slicesOfPie = ["topSlice", "rightSlice", "bottomSlice", "leftSlice"];
    } // End of the function
    function CLEANUP_PLAYER_SWITCH_ALERT()
    {
        this.DESTROY();
        if (CONTENT != undefined)
        {
            CONTENT.removeMovieClip();
        } // end if
        if (BOUNDING_BOX != undefined)
        {
            BOUNDING_BOX.removeMovieClip();
        } // end if
        this.INITIALISE(TIMELINE);
    } // End of the function
    function ADD_PLAYER_TO_SWITCH(params)
    {
        var _loc6 = params[0];
        var _loc5 = params[1];
        var _loc4 = params[2];
        var _loc7 = params[3];
        var _loc3 = params[4];
        CHAR_LIST.push([_loc6, _loc5, _loc4, _loc7, _loc3]);
    } // End of the function
    function SET_PLAYER_SWITCH_WITH_HINT_AND_CHARACTER(params)
    {
        var _loc3 = params[0];
        var _loc6 = params[1];
        var _loc5 = params[2];
        var _loc7 = params[3];
        var _loc4 = params[4];
        this.ADD_PLAYER_TO_SWITCH(params);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.topSlice, 255, 255, 255, 30);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.rightSlice, 255, 255, 255, 30);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bottomSlice, 255, 255, 255, 30);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.leftSlice, 255, 255, 255, 30);
        if (CONTENT[slicesOfPie[_loc3]] != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT[slicesOfPie[_loc3]], _loc5, _loc7, _loc4);
        } // end if
        CONTENT.characters.gotoAndStop(_loc6 + 2);
        CONTENT.characters._alpha = 0;
        this.FLASH_ON();
    } // End of the function
    function START_PLAYER_SWITCH_LOOP()
    {
        this.FLASH_OFF();
    } // End of the function
    function SET_PLAYER_SWITCH_VISIBLE_STATE(params)
    {
        var _loc2 = params[0];
        CONTENT._visible = _loc2;
        this.DESTROY();
    } // End of the function
    function FLASH_ON()
    {
        var _loc2 = CHAR_LIST[count][1] + 2;
        CONTENT.characters.gotoAndStop(_loc2);
        if (typeof(CONTENT) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.characters, 1.500000, {_alpha: 100, delay: 0.500000, onComplete: FLASH_OFF, onCompleteScope: this});
        } // end if
        if (CHAR_LIST.length > 1)
        {
            if (CHAR_LIST.length < count)
            {
                count = 0;
            }
            else
            {
                ++count;
            } // end if
        } // end else if
    } // End of the function
    function FLASH_OFF()
    {
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.topSlice, 255, 255, 255, 30);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.rightSlice, 255, 255, 255, 30);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bottomSlice, 255, 255, 255, 30);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.leftSlice, 255, 255, 255, 30);
        var _loc2 = CHAR_LIST[count][0];
        if (CONTENT[slicesOfPie[_loc2]] != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT[slicesOfPie[_loc2]], CHAR_LIST[count][2], CHAR_LIST[count][3], CHAR_LIST[count][4]);
        } // end if
        if (typeof(CONTENT.characters) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.characters, 1.500000, {_alpha: 0, delay: 0.500000, onComplete: FLASH_ON, onCompleteScope: this});
        } // end if
    } // End of the function
    function BLINK_ON()
    {
        ++BLINKS;
        if (BLINKS > I_LOVE_BLINKING_THIS_MANY_TIMES)
        {
            BLINKS = 0;
            if (typeof(CONTENT) == "movieclip")
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, 0.100000, {_alpha: 100, delay: 0.200000, onComplete: STAY_ON, onCompleteScope: this});
            } // end if
        }
        else if (typeof(CONTENT) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, 0.100000, {_alpha: 100, delay: 0.200000, onComplete: BLINK_OFF, onCompleteScope: this});
        } // end else if
    } // End of the function
    function STAY_ON()
    {
        if (typeof(CONTENT) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, 0.100000, {_alpha: 100, delay: 3, onComplete: BLINK_OFF, onCompleteScope: this});
        } // end if
    } // End of the function
    function BLINK_OFF()
    {
        if (typeof(CONTENT) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, 0.100000, {_alpha: 0, delay: 0.200000, onComplete: BLINK_ON, onCompleteScope: this});
        } // end if
    } // End of the function
    function DESTROY()
    {
        if (typeof(CONTENT) == "movieclip")
        {
            if (typeof(CONTENT.characters) == "movieclip")
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.characters);
            } // end if
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        } // end if
    } // End of the function
    function debug()
    {
    } // End of the function
    var I_LOVE_BLINKING_THIS_MANY_TIMES = 2;
    var BLINKS = 0;
    var count = 0;
} // End of Class
#endinitclip

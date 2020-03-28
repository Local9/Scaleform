// Action script...

// [Initial MovieClip Action of sprite 47]
#initclip 22
class com.rockstargames.gtav.hud.hudComponents.HUD_SAVING extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var CONTENT, FADE_DURATION, ON_SCREEN_DURATION, _enumID, _HUD;
    function HUD_SAVING()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.READY();
    } // End of the function
    function READY(id)
    {
        super.READY(id);
        CONTENT._alpha = 0;
        hidden = true;
    } // End of the function
    function SET_SAVING_TEXT_STANDALONE(iconEnum, saveStr)
    {
        this.READY(com.rockstargames.gtav.constants.HudComponentConstants.HUD_SAVING_GAME);
        this.SET_SAVING_TEXT([iconEnum, saveStr]);
    } // End of the function
    function SET_SAVING_TEXT(params)
    {
        var _loc3 = params[0];
        var _loc2 = params[1];
        CONTENT.dialogMC.iconMC.spinnerMC._visible = false;
        CONTENT.dialogMC.iconMC.starMC._visible = false;
        CONTENT.dialogMC.iconMC.SAVING._visible = false;
        if (_loc3 == SAVEGAME_ICON_STYLE_WORKING)
        {
            CONTENT.dialogMC.iconMC.SAVING._visible = true;
        } // end if
        if (_loc3 == SAVEGAME_ICON_STYLE_CLOUD_WORKING)
        {
            CONTENT.dialogMC.iconMC.starMC._visible = true;
        } // end if
        if (_loc3 == LOADING)
        {
            CONTENT.dialogMC.iconMC.spinnerMC._visible = true;
        } // end if
        if (_loc2 != undefined && _loc2 != "" && _loc2 != null)
        {
            CONTENT.dialogMC.saveTF.htmlText = _loc2;
            CONTENT.dialogMC.saveTF.autoSize = "right";
            CONTENT.dialogMC.saveTF._x = 369 - (CONTENT.dialogMC.saveTF.htmlText._width + textPadding);
            CONTENT.dialogMC.background._width = 400 - CONTENT.dialogMC.saveTF._x + textPadding;
            CONTENT.dialogMC.background._x = 400 - CONTENT.dialogMC.background._width;
        }
        else
        {
            CONTENT.dialogMC.saveTF.htmlText = "";
            CONTENT.dialogMC.background._x = 369;
            CONTENT.dialogMC.background._width = 31;
        } // end else if
        this.SHOW();
    } // End of the function
    function SHOW()
    {
        if (hidden)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 2000, {_alpha: 100});
            hidden = false;
        } // end if
    } // End of the function
    function STAY_ON_SCREEN()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, ON_SCREEN_DURATION / 1000, {onComplete: HIDE_SAVING, onCompleteScope: this});
    } // End of the function
    function HIDE_SAVING()
    {
        CONTENT._alpha = 0;
        hidden = true;
        this.REMOVE();
    } // End of the function
    function REMOVE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    var hidden = true;
    var SAVEGAME_ICON_STYLE_NONE = 0;
    var SAVEGAME_ICON_STYLE_WORKING = 1;
    var SAVEGAME_ICON_STYLE_SUCCESS = 2;
    var SAVEGAME_ICON_STYLE_FAILED = 3;
    var SAVEGAME_ICON_STYLE_CLOUD_WORKING = 4;
    var LOADING = 5;
    var textPadding = 5;
} // End of Class
#endinitclip

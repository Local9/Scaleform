// Action script...

// [Initial MovieClip Action of sprite 42]
#initclip 12
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var highlightMC, labelMC, awardsbarMC, bar, __get__data, colour, lockMC, initialIndex, imageMC, _alpha, imgLoader, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function PauseMPMenuAwardsItem()
    {
        super();
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(highlightMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        labelMC._visible = false;
        highlightMC._visible = false;
        awardsbarMC._visible = false;
        bar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(awardsbarMC);
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        textureDict = this.__get__data()[2];
        textureFilename = this.__get__data()[3];
        colour = this.__get__data()[4];
        var _loc4 = this.__get__data()[5];
        lockMC._visible = initialIndex == 1;
        if (textureDict != undefined && textureFilename != undefined)
        {
            this.ADD_TXD_REF(textureDict, textureFilename);
        } // end if
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        if (colour != undefined)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(colour, _loc3);
            bar.init(colour);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE, _loc3);
            bar.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE);
        } // end else if
        if (imageMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(imageMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        } // end if
        if (_loc4 == undefined || _loc4 == -1)
        {
            awardsbarMC._visible = false;
        }
        else if (_loc4 >= 100)
        {
            awardsbarMC._visible = false;
            labelMC._visible = true;
            com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(labelMC.completionTF, "AWARD_COMPLETE", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, false);
        }
        else
        {
            bar.percent(_loc4);
            awardsbarMC._visible = true;
            labelMC._visible = false;
        } // end else if
        var _loc5 = 0.400000;
        _alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(this, _loc5, {_alpha: 100});
        //return (this.data());
        null;
    } // End of the function
    function ADD_TXD_REF(txd, txn)
    {
        if (imgLoader == undefined)
        {
            imgLoader = (com.rockstargames.ui.media.ImageLoaderMC)(imageMC.attachMovie("GenericImageLoader", "gMC", imageMC.getNextHighestDepth()));
        } // end if
        this.REMOVE_TXD_REF();
        imgLoader.init("PAUSE_MENU_SP_CONTENT", txd, txn);
        var _loc3 = 5;
        var _loc2 = String(imgLoader).split(".");
        var _loc4 = _loc2.slice(_loc2.length - _loc3).join(".");
        imgLoader.addTxdRef(_loc4, TXD_LOADED, this);
    } // End of the function
    function TXD_LOADED()
    {
        imgLoader._xscale = imgLoader._yscale = 65;
        imgLoader._x = 71.500000 - imgLoader._width / 2;
        imgLoader._y = 45 - imgLoader._height / 2;
    } // End of the function
    function ON_DESTROY()
    {
        this.REMOVE_TXD_REF();
    } // End of the function
    function REMOVE_TXD_REF()
    {
        if (imgLoader.isLoaded)
        {
            imgLoader.removeTxdRef();
        } // end if
    } // End of the function
    function set highlighted(_h)
    {
        highlightMC._visible = _h;
        if (initialIndex == 1)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(lockMC, _h ? (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK) : (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE));
        } // end if
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    var textureDict = "";
    var textureFilename = "";
} // End of Class
#endinitclip

// Action script...

// [Initial MovieClip Action of sprite 191]
#initclip 25
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var sizeText, labelMC, bgMC, blipLayer, itemTextLeft, _data, __get__data, charImage, getNextHighestDepth, attachMovie, __set__data;
    function PauseMenuDialogueItem()
    {
        super();
        sizeText = false;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        bgMC._visible = false;
        if (blipLayer != undefined)
        {
            blipLayer.removeMovieClip();
        } // end if
        blipLayer = labelMC.createEmptyMovieClip("blipLayer", 1000);
        itemTextLeft.autoSize = true;
        var _loc6 = new com.rockstargames.ui.utils.Text();
        _loc6.setTextWithIcons(_data[0], blipLayer, itemTextLeft, 0, 13, 4.500000, false);
        var _loc3 = this.__get__data()[1];
        var _loc4 = this.__get__data()[2];
        if (_loc3 == undefined && _loc4 == undefined || _loc3 == "" && _loc4 == "")
        {
            if (charImage)
            {
                charImage.removeTxdRef();
            } // end if
            labelMC._x = 5;
        }
        else
        {
            if (charImage == undefined)
            {
                charImage = (com.rockstargames.ui.media.ImageLoaderMC)(this.attachMovie("GenericImageLoader", "dMC", this.getNextHighestDepth(), {_x: com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_X, _y: com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_Y}));
            } // end if
            if (charImage.textureDict == _loc3)
            {
                if (charImage.isLoaded)
                {
                    charImage.init("PAUSE_MENU_SP_CONTENT", _loc3, _loc4, com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_W, com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_H);
                    charImage.displayTxdResponse(_loc3);
                    this.fadeImgIn();
                } // end if
            }
            else
            {
                if (charImage.isLoaded)
                {
                    charImage.removeTxdRef();
                } // end if
                charImage.init("PAUSE_MENU_SP_CONTENT", _loc3, _loc4, com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_W, com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_H);
                var _loc5 = charImage.splitPath(String(charImage), 5);
                charImage.requestTxdRef(_loc5, true, fadeImgIn, this);
            } // end else if
        } // end else if
        //return (this.data());
        null;
    } // End of the function
    function fadeImgIn()
    {
        charImage._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(charImage, com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION, {_alpha: 100});
    } // End of the function
    function getHeight()
    {
        return (Math.max(com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.DEFAULT_ITEM_HEIGHT, labelMC._y + labelMC.titleTF.textHeight));
    } // End of the function
    function onDestroy()
    {
        if (charImage.isLoaded)
        {
            charImage.removeTxdRef();
        } // end if
    } // End of the function
    static var DEFAULT_ITEM_HEIGHT = 52;
    static var IMAGE_X = 8;
    static var IMAGE_Y = 6;
    static var IMAGE_W = 40;
    static var IMAGE_H = 40;
} // End of Class
#endinitclip

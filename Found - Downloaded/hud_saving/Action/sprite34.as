// Action script...

// [Initial MovieClip Action of sprite 34]
#initclip 9
class com.rockstargames.gtav.hud.hudComponents.HUD_RADIO_STATIONS_WHEEL extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var TIMELINE, CONTENT, BOUNDING_BOX, m_bQuickSelectMode, stationDisplayMC, stationNameTF, artistMC, trackMC, shareTF, sharedTF, blipLayer, stationList, stationRingMC, playingOutlineMC, _HUD, _enumID;
    function HUD_RADIO_STATIONS_WHEEL()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
        m_bQuickSelectMode = false;
        stationDisplayMC = CONTENT.attachMovie("shareWindow", "shareWindowMC", 0, {_x: BOUNDING_BOX._width * 0.500000, _y: BOUNDING_BOX._height * 0.500000});
        stationNameTF = stationDisplayMC.stationTF;
        artistMC = stationDisplayMC.artistMC;
        trackMC = stationDisplayMC.trackMC;
        shareTF = stationDisplayMC.shareTF;
        shareTF.autoSize = "left";
        sharedTF = stationDisplayMC.sharedTF;
        if (blipLayer)
        {
            blipLayer.removeMovieClip();
        } // end if
        blipLayer = stationDisplayMC.createEmptyMovieClip("blipLayer", 1000);
        var _loc2 = new com.rockstargames.ui.utils.Text();
        _loc2.setTextWithIcons("RADIO_SHARE", blipLayer, shareTF, 0, 14, 2, false);
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(sharedTF, "RADIO_SHARED", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, true);
        shareTF._x = (shareTF._width + blipLayer._width * 0.500000) * -0.500000;
        blipLayer._x = shareTF._x + shareTF._width + 140;
        blipLayer._y = blipLayer._y + 8;
        shareTF._visible = blipLayer._visible = false;
        sharedTF._visible = false;
        this.HIDE_CURRENTLY_PLAYING();
        stationList = [];
    } // End of the function
    function clearStations()
    {
        if (stationRingMC != undefined)
        {
            stationRingMC.removeMovieClip();
        } // end if
    } // End of the function
    function drawStations()
    {
        if (stationList.length > 0)
        {
            this.clearStations();
            var _loc6 = 360 / stationList.length;
            var _loc4 = stationList.length > 18 ? (95) : (100);
            stationRingMC = CONTENT.createEmptyMovieClip("stationRingMC", 1);
            stationRingMC._x = stationRingMC._y = bounds * 0.500000;
            playingOutlineMC = stationRingMC.attachMovie("highlightRing", "stationRing", 100, {_xscale: _loc4, _yscale: _loc4});
            if (_HUD.charColourEnum)
            {
                com.rockstargames.ui.utils.Colour.ApplyHudColour(playingOutlineMC, _HUD.charColourEnum);
            } // end if
            for (var _loc2 = 0; _loc2 < stationList.length; ++_loc2)
            {
                if (stationList[_loc2] == "MO_RADOFF")
                {
                    baseOffset = _loc2 * _loc6 - 180;
                    break;
                } // end if
            } // end of for
            var _loc3 = 0;
            var _loc5 = 190;
            var _loc9 = 0;
            var _loc8 = 0;
            var _loc7 = 0.017453;
            for (var _loc2 = 0; _loc2 < stationList.length; ++_loc2)
            {
                _loc3 = _loc6 * _loc2 - baseOffset;
                _loc9 = Math.sin(_loc3 * _loc7) * _loc5;
                _loc8 = -Math.cos(_loc3 * _loc7) * _loc5;
                stationRingMC.attachMovie(stationList[_loc2], stationList[_loc2], _loc2 + 2, {_x: _loc9, _y: _loc8, _xscale: _loc4, _yscale: _loc4});
            } // end of for
        } // end if
    } // End of the function
    function SET_RADIO_STATIONS(params)
    {
        stationList = params;
        this.drawStations();
        var _loc2 = 90;
        artistMC.setDelayTimeout(_loc2);
        trackMC.setDelayTimeout(_loc2);
    } // End of the function
    function QUICK_SELECT_RADIO_STATION(params)
    {
        var _loc6 = 386;
        stationRingMC._y = _loc6;
        stationDisplayMC._y = 280;
        m_bQuickSelectMode = true;
        var _loc3 = params[0];
        var _loc4 = stationRingMC[stationList[_loc3]];
        if (_loc3 != undefined && _loc3 >= 0)
        {
            for (var _loc2 = 0; _loc2 < stationList.length; ++_loc2)
            {
                stationRingMC[stationList[_loc2]]._visible = false;
                stationRingMC[stationList[_loc2]]._alpha = 30;
            } // end of for
            playingOutlineMC._visible = true;
            playingOutlineMC._x = _loc4._x;
            playingOutlineMC._y = _loc4._y;
            _loc4._visible = true;
            _loc4._alpha = 100;
            var _loc5 = _loc3 * (360 / stationList.length) - baseOffset;
            stationRingMC._rotation = -_loc5;
            _loc4._rotation = _loc5;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(stationNameTF, stationList[_loc3]);
            com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, -50, 0.080000, 200);
        }
        else
        {
            playingOutlineMC._visible = false;
        } // end else if
        this.SHOW();
    } // End of the function
    function SELECT_RADIO_STATION(params)
    {
        var _loc3 = params[0];
        if (m_bQuickSelectMode)
        {
            stationRingMC._rotation = 0;
            stationRingMC._y = bounds * 0.500000;
            for (var _loc2 = 0; _loc2 < stationList.length; ++_loc2)
            {
                stationRingMC[stationList[_loc2]]._rotation = 0;
                stationRingMC[stationList[_loc2]]._visible = true;
            } // end of for
            m_bQuickSelectMode = false;
            stationDisplayMC._y = BOUNDING_BOX._height * 0.500000;
        } // end if
        if (_loc3 != undefined)
        {
            if (_loc3 >= 0)
            {
                var _loc4 = stationRingMC[stationList[_loc3]];
                playingOutlineMC._x = _loc4._x;
                playingOutlineMC._y = _loc4._y;
                playingOutlineMC._visible = true;
                for (var _loc2 = 0; _loc2 < stationList.length; ++_loc2)
                {
                    stationRingMC[stationList[_loc2]]._alpha = 30;
                } // end of for
                _loc4._alpha = 100;
                com.rockstargames.ui.utils.Localisation.setTextWithTranslation(stationNameTF, stationList[_loc3]);
                com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, -50, 0.080000, 200);
            }
            else
            {
                playingOutlineMC._visible = false;
            } // end if
        } // end else if
        this.SHOW();
    } // End of the function
    function SET_CURRENTLY_PLAYING(params)
    {
        var _loc3 = params[0];
        var _loc2 = params[1];
        var _loc4 = params[2];
        stationDisplayMC._visible = true;
        sharedTF._visible = false;
        shareTF._visible = blipLayer._visible = _loc4;
        if (_loc3 != undefined)
        {
            artistMC.txtString.text = _loc3;
            artistMC._visible = true;
        } // end if
        if (_loc2 != undefined)
        {
            trackMC.txtString.text = _loc2;
            trackMC._visible = true;
        } // end if
    } // End of the function
    function SET_AS_SHARED()
    {
        sharedTF._visible = true;
        shareTF._visible = blipLayer._visible = false;
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, 2, {onComplete: hideShared, onCompleteScope: this});
    } // End of the function
    function hideShared()
    {
        sharedTF._visible = false;
    } // End of the function
    function HIDE_CURRENTLY_PLAYING()
    {
        artistMC._visible = false;
        trackMC._visible = false;
    } // End of the function
    function SHOW()
    {
        CONTENT._visible = true;
    } // End of the function
    function HIDE()
    {
        CONTENT._visible = false;
        this.REMOVE();
    } // End of the function
    function HIDE_RADIO_STATIONS()
    {
        this.HIDE();
    } // End of the function
    function REMOVE()
    {
        this.clearStations();
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    var baseOffset = 0;
    var bounds = 720;
} // End of Class
#endinitclip

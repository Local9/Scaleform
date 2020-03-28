// Action script...

// [Initial MovieClip Action of sprite 227]
#initclip 15
class com.rockstargames.gtav.levelDesign.BaseGameStreamComponent extends MovieClip
{
    var CONTENT, _width, intervalId;
    function BaseGameStreamComponent()
    {
        super();
    } // End of the function
    function INITIALISE(bgR, bgG, bgB, _flashAlpha, _flashRate, _bIsWideScreen, _bIsAsianLanguage)
    {
        CONTENT = this;
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG, _loc2);
        defaultAlpha = _loc2.a;
        CONTENT.BackgroundFlash._visible = false;
        CONTENT.BackgroundHighlight._visible = false;
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.Background, 0, 0, 0, defaultAlpha);
        flashAlpha = _flashAlpha;
        timerDuration = _flashRate * 500;
        bgColour[0] = bgR;
        bgColour[1] = bgG;
        bgColour[2] = bgB;
        bgColourChecksum = bgR + bgG + bgB;
        bIsWideScreen = _bIsWideScreen;
        bIsAsianLanguage = _bIsAsianLanguage;
    } // End of the function
    function SET_FEED_COMPONENT()
    {
    } // End of the function
    function parseForFonts(str)
    {
        str = str.split("<C>").join("<FONT FACE=\'$Font2_cond\' SIZE=\'15\'>");
        str = str.split("</C>").join("<FONT FACE=\'$Font2\' SIZE=\'12\'>");
        return (str);
    } // End of the function
    function parseForTitleFonts(str)
    {
        str = str.split("<C>").join("<FONT FACE=\'$Font2_cond\' SIZE=\'17\'>");
        str = str.split("</C>").join("<FONT FACE=\'$Font2\' SIZE=\'14\'>");
        return (str);
    } // End of the function
    function parseForGamerTagTitleFonts(tf, str, stdPtSize)
    {
        var _loc3 = str.split("<C>");
        if (_loc3.length > 1)
        {
            for (var _loc2 = 1; _loc2 < _loc3.length; _loc2 = _loc2 + 2)
            {
                var _loc6 = String(_loc3[_loc2]).split("</C>");
                var _loc4;
                var _loc5 = _loc6[0].split("<");
                if (_loc5.length > 1)
                {
                    _loc4 = _loc5[1].split(">")[1];
                }
                else
                {
                    _loc4 = _loc6[0];
                } // end else if
                var _loc7 = this.getFontSizeFit(_loc4, stdPtSize + 3, tf._width);
                _loc3[_loc2] = "<FONT FACE=\'$Font2_cond\' SIZE=\'" + _loc7 + "\'>" + _loc3[_loc2];
            } // end of for
            str = _loc3.join("");
            str = str.split("</C>").join("<FONT FACE=\'$Font2\' SIZE=\'" + stdPtSize + "\'>");
        } // end if
        return (str);
    } // End of the function
    function getFontSizeFit(gamerName, fontSize, widthToFit)
    {
        var _loc2 = new TextFormat("$Font2_cond");
        do
        {
            _loc2.size = fontSize;
            var tfExtent = _loc2.getTextExtent(gamerName, _width);
        } while (tfExtent.textFieldWidth > widthToFit && --fontSize)
        return (fontSize);
    } // End of the function
    function TXD_HAS_LOADED()
    {
    } // End of the function
    function TXD_ALREADY_LOADED()
    {
    } // End of the function
    function CLEAR_TXD()
    {
    } // End of the function
    function OVERRIDE_LOAD(_baseClassStrID, _returnPathLvl)
    {
        baseClassStrID = _baseClassStrID;
        returnPathLvl = _returnPathLvl;
    } // End of the function
    function STREAM_COMP_READY()
    {
        if (important && !isAnimating)
        {
            isAnimating = true;
            animateCounter = animateCounterMax;
            CONTENT.ref = this;
            CONTENT.BackgroundFlash._visible = false;
            this.flashOn();
            clearInterval(intervalId);
            intervalId = setInterval(this, "stopFlash", timerDuration);
        } // end if
    } // End of the function
    function stopFlash()
    {
        clearInterval(intervalId);
        this.resetBackground();
        isAnimating = false;
    } // End of the function
    function resetBackground()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.Background);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.Background, 0, 0, 0, defaultAlpha);
        CONTENT.BackgroundFlash._visible = false;
    } // End of the function
    function flashOn()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.Background);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.Background, bgColour[0], bgColour[1], bgColour[2], flashAlpha);
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.Background, 0.250000, {onCompleteScope: this, onComplete: flashOff});
    } // End of the function
    function flashOff()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.Background);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.Background, 0, 0, 0, defaultAlpha);
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.Background, 0.250000, {onCompleteScope: this, onComplete: flashOn});
    } // End of the function
    function REMOVE()
    {
    } // End of the function
    function checkNameAndSubstitute(charTxd, nameTF)
    {
        var _loc1 = new Array();
        _loc1.push(new Array("CHAR_MICHAEL", "CELL_101"));
        _loc1.push(new Array("CHAR_TREVOR", "CELL_102"));
        _loc1.push(new Array("CHAR_FRANKLIN", "CELL_103"));
        _loc1.push(new Array("CHAR_LESTER", "CELL_111"));
        _loc1.push(new Array("CHAR_LESTER_DEATHWISH", "CELL_E_211"));
        _loc1.push(new Array("CHAR_JIMMY", "CELL_124"));
        _loc1.push(new Array("CHAR_TRACEY", "CELL_125"));
        _loc1.push(new Array("CHAR_ABIGAIL", "CELL_E_240"));
        _loc1.push(new Array("CHAR_AMANDA", "CELL_126"));
        _loc1.push(new Array("CHAR_SIMEON", "CELL_127"));
        _loc1.push(new Array("CHAR_LAMAR", "CELL_128"));
        _loc1.push(new Array("CHAR_RON", "CELL_129"));
        _loc1.push(new Array("CHAR_CHENG", "CELL_133"));
        _loc1.push(new Array("CHAR_STEVE", "CELL_134"));
        _loc1.push(new Array("CHAR_WADE", "CELL_135"));
        _loc1.push(new Array("CHAR_TENNIS_COACH", "CELL_136"));
        _loc1.push(new Array("CHAR_SOLOMON", "CELL_137"));
        _loc1.push(new Array("CHAR_LAZLOW", "CELL_138"));
        _loc1.push(new Array("CHAR_ESTATE_AGENT", "CELL_139"));
        _loc1.push(new Array("CHAR_DEVIN", "CELL_142"));
        _loc1.push(new Array("CHAR_DAVE", "CELL_143"));
        _loc1.push(new Array("CHAR_MARTIN", "CELL_144"));
        _loc1.push(new Array("CHAR_FLOYD", "CELL_145"));
        _loc1.push(new Array("CHAR_GAYMILITARY", "CELL_146"));
        _loc1.push(new Array("CHAR_OSCAR", "CELL_164"));
        _loc1.push(new Array("CHAR_CHENGSR", "CELL_200"));
        _loc1.push(new Array("CHAR_DR_FRIEDLANDER", "CELL_121"));
        _loc1.push(new Array("CHAR_STRETCH", "CELL_122"));
        _loc1.push(new Array("CHAR_ORTEGA", "CELL_123"));
        _loc1.push(new Array("CHAR_ONEIL", "CELL_E_208"));
        _loc1.push(new Array("CHAR_PATRICIA", "CELL_E_210"));
        _loc1.push(new Array("CHAR_PEGASUS_DELIVERY", "CELL_E_247"));
        _loc1.push(new Array("CHAR_LIFEINVADER", "CELL_E_276"));
        _loc1.push(new Array("CHAR_TANISHA", "CELL_E_218"));
        _loc1.push(new Array("CHAR_DENISE", "CELL_E_226"));
        _loc1.push(new Array("CHAR_MOLLY", "CELL_E_227"));
        _loc1.push(new Array("CHAR_RICKIE", "CELL_E_217"));
        _loc1.push(new Array("CHAR_CHEF", "CELL_E_224"));
        _loc1.push(new Array("CHAR_BARRY", "CELL_147"));
        _loc1.push(new Array("CHAR_BEVERLY", "CELL_148"));
        _loc1.push(new Array("CHAR_CRIS", "CELL_166"));
        _loc1.push(new Array("CHAR_DOM", "CELL_150"));
        _loc1.push(new Array("CHAR_HAO", "CELL_E_246"));
        _loc1.push(new Array("CHAR_HUNTER", "CELL_167"));
        _loc1.push(new Array("CHAR_JIMMY_BOSTON", "CELL_151"));
        _loc1.push(new Array("CHAR_JOE", "CELL_152"));
        _loc1.push(new Array("CHAR_JOSEF", "CELL_153"));
        _loc1.push(new Array("CHAR_JOSH", "CELL_154"));
        _loc1.push(new Array("CHAR_MANUEL", "CELL_156"));
        _loc1.push(new Array("CHAR_MARNIE", "CELL_157"));
        _loc1.push(new Array("CHAR_MARY_ANN", "CELL_158"));
        _loc1.push(new Array("CHAR_MAUDE", "CELL_E_244"));
        _loc1.push(new Array("CHAR_MRS_THORNHILL", "CELL_161"));
        _loc1.push(new Array("CHAR_NIGEL", "CELL_162"));
        _loc1.push(new Array("CHAR_SASQUATCH", "CELL_367"));
        _loc1.push(new Array("CHAR_ASHLEY", "CELL_E_202"));
        _loc1.push(new Array("CHAR_ANDREAS", "CELL_E_205"));
        _loc1.push(new Array("CHAR_DREYFUSS", "CELL_E_206"));
        _loc1.push(new Array("CHAR_OMEGA", "CELL_E_207"));
        _loc1.push(new Array("CHAR_GUN1", "CELL_404"));
        _loc1.push(new Array("CHAR_GUN2", "CELL_405"));
        _loc1.push(new Array("CHAR_GUN3", "CELL_406"));
        _loc1.push(new Array("CHAR_IT1", "CELL_407"));
        _loc1.push(new Array("CHAR_IT2", "CELL_408"));
        _loc1.push(new Array("CHAR_DOMESTIC_GIRL", "CELL_140"));
        _loc1.push(new Array("CHAR_HITCHER_GIRL", "CELL_141"));
        _loc1.push(new Array("CHAR_BROKEN_DOWN_GIRL", "CELL_420"));
        _loc1.push(new Array("CHAR_LS_CUSTOMS", "CELL_E_209"));
        _loc1.push(new Array("CHAR_AMMUNATION", "CELL_E_220"));
        _loc1.push(new Array("CHAR_SOCIAL_CLUB", "CELL_179"));
        _loc1.push(new Array("CHAR_LS_TOURIST_BOARD", "CELL_E_245"));
        _loc1.push(new Array("CHAR_MECHANIC", "CELL_180"));
        _loc1.push(new Array("CHAR_DIAL_A_SUB", "CELL_E_212"));
        _loc1.push(new Array("CHAR_CHOP", "CELL_E_225"));
        _loc1.push(new Array("CHAR_TOW_TONYA", "CELL_470"));
        _loc1.push(new Array("CHAR_STRIPPER_JULIET", "CELL_112"));
        _loc1.push(new Array("CHAR_STRIPPER_NIKKI", "CELL_113"));
        _loc1.push(new Array("CHAR_STRIPPER_CHASTITY", "CELL_114"));
        _loc1.push(new Array("CHAR_STRIPPER_CHEETAH", "CELL_115"));
        _loc1.push(new Array("CHAR_STRIPPER_SAPPHIRE", "CELL_116"));
        _loc1.push(new Array("CHAR_STRIPPER_INFERNUS", "CELL_117"));
        _loc1.push(new Array("CHAR_STRIPPER_FUFU", "CELL_118"));
        _loc1.push(new Array("CHAR_STRIPPER_PEACH", "CELL_119"));
        _loc1.push(new Array("CHAR_TAXI_LIZ", "CELL_421"));
        _loc1.push(new Array("CHAR_PROPERTY_TAXI_LOT", "CELL_E_248"));
        _loc1.push(new Array("CHAR_PROPERTY_CINEMA_VINEWOOD", "CELL_E_249"));
        _loc1.push(new Array("CHAR_PROPERTY_CINEMA_DOWNTOWN", "CELL_E_250"));
        _loc1.push(new Array("CHAR_PROPERTY_CINEMA_MORNINGWOOD", "CELL_E_251"));
        _loc1.push(new Array("CHAR_PROPERTY_CAR_SCRAP_YARD", "CELL_E_252"));
        _loc1.push(new Array("CHAR_PROPERTY_PLANE_SCRAP_YARD", "CELL_E_253"));
        _loc1.push(new Array("CHAR_PROPERTY_WEED_SHOP", "CELL_E_254"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_TEQUILALA", "CELL_E_255"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_PITCHERS", "CELL_E_256"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_SINGLETONS", "CELL_E_257"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_ECLIPSE", "CELL_E_258"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_HI_MEN", "CELL_E_259"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_HEN_HOUSE", "CELL_E_260"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_BAYVIEW", "CELL_E_261"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_HOOKIES", "CELL_E_262"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_UNBRANDED", "CELL_E_263"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_IRISH", "CELL_E_264"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_AIRPORT", "CELL_E_265"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_LES_BIANCO", "CELL_E_266"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_FES", "CELL_E_267"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_CAFE_ROJO", "CELL_E_268"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_MIRROR_PARK", "CELL_E_269"));
        _loc1.push(new Array("CHAR_PROPERTY_BAR_COCKOTOOS", "CELL_E_270"));
        _loc1.push(new Array("CHAR_DETONATEBOMB", "CELL_130"));
        _loc1.push(new Array("CHAR_DETONATEPHONE", "CELL_130"));
        _loc1.push(new Array("CHAR_CALL911", "CELL_131"));
        _loc1.push(new Array("CHAR_TAXI", "CELL_163"));
        _loc1.push(new Array("CHAR_CHAT_CALL", "CELL_E_219"));
        _loc1.push(new Array("CHAR_CASTRO", "CELL_409"));
        _loc1.push(new Array("CHAR_ARTHUR", "CELL_410"));
        _loc1.push(new Array("CHAR_BLOCKED", "CELL_231"));
        _loc1.push(new Array("CHAR_CARSITE", "CELL_E_271"));
        _loc1.push(new Array("CHAR_BOATSITE", "CELL_E_274"));
        _loc1.push(new Array("CHAR_MILSITE", "CELL_E_273"));
        _loc1.push(new Array("CHAR_PLANESITE", "CELL_E_272"));
        for (var _loc2 = 0; _loc2 < _loc1.length; ++_loc2)
        {
            if (_loc1[_loc2][0] == charTxd)
            {
                com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, _loc1[_loc2][1], nameTF);
                break;
            } // end if
        } // end of for
    } // End of the function
    var important = false;
    var isAnimating = false;
    var animateCounter = 0;
    var animateCounterMax = 90;
    var baseClassStrID = "GAME_STREAM";
    var returnPath1 = "";
    var returnPath2 = "";
    var returnPathLvl = 3;
    var timerDuration = 3000;
    var defaultAlpha = 60;
    var flashAlpha = 80;
    var bgColour = [0, 0, 0];
    var bgColourChecksum = 0;
    var bIsWideScreen = false;
    var bIsAsianLanguage = false;
} // End of Class
#endinitclip

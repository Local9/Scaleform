// Action script...

// [Initial MovieClip Action of sprite 49]
#initclip 2
class com.rockstargames.gtav.levelDesign.PLAYER_SWITCH extends com.rockstargames.ui.core.BaseScriptUI
{
    var dataList, loaderObject, switchMCList, CONTENT, switchContainerMC, hotswapchar0, hotswapchar1, hotswapchar2, hotswapchar3, thisObj;
    function PLAYER_SWITCH()
    {
        super();
        _global.gfxExtensions = true;
        dataList = [];
        dataList[0] = [];
        dataList[1] = [];
        dataList[2] = [];
        dataList[3] = [];
        loaderObject = new Object();
    } // End of the function
    function INITIALISE(mc, fileName)
    {
        FILE_NAME = fileName;
        super.INITIALISE(mc);
        switchMCList = [];
        this.addDisplay();
    } // End of the function
    function addDisplay()
    {
        var _loc2 = CONTENT.getNextHighestDepth();
        switchContainerMC = CONTENT.attachMovie("display", "display", 10);
        this.SET_SWITCH_VISIBLE(false);
        hotswapchar0 = (com.rockstargames.gtav.levelDesign.PlayerSwitchChar)(switchContainerMC.attachMovie("hotswapchar", "hotswapchar0", 100, {_x: 63, _y: 63}));
        hotswapchar1 = (com.rockstargames.gtav.levelDesign.PlayerSwitchChar)(switchContainerMC.attachMovie("hotswapchar", "hotswapchar1", 200, {_x: 63, _y: 63}));
        hotswapchar2 = (com.rockstargames.gtav.levelDesign.PlayerSwitchChar)(switchContainerMC.attachMovie("hotswapchar", "hotswapchar2", 300, {_x: 63, _y: 63}));
        hotswapchar3 = (com.rockstargames.gtav.levelDesign.PlayerSwitchChar)(switchContainerMC.attachMovie("hotswapchar", "hotswapchar3", 400, {_x: 63, _y: 63}));
        switchMCList = [hotswapchar0, hotswapchar1, hotswapchar2, hotswapchar3];
        hotswapchar0.init(0);
        hotswapchar1.init(1);
        hotswapchar2.init(2);
        hotswapchar3.init(3);
    } // End of the function
    function renderDisplay(index)
    {
        if (index == undefined)
        {
            hotswapchar0.setSlot(dataList[0]);
            hotswapchar1.setSlot(dataList[1]);
            hotswapchar2.setSlot(dataList[2]);
            hotswapchar3.setSlot(dataList[3]);
        }
        else
        {
            var _loc3 = switchMCList[index];
            _loc3.setSlot(dataList[index]);
        } // end else if
    } // End of the function
    function SET_SWITCH_VISIBLE(bool)
    {
        switchContainerMC._visible = Boolean(bool);
    } // End of the function
    function SET_SWITCH_SLOT(index, stateEnum, charEnum, selected, pedheadshot_txt_string)
    {
        dataList[index][0] = charEnum;
        dataList[index][1] = stateEnum;
        dataList[index][2] = selected;
        if (index == 2)
        {
            if (dataList[index][5] != undefined)
            {
                dataList[index][5] = pedheadshot_txt_string;
            } // end if
        } // end if
        this.renderDisplay(index);
        var _loc4 = switchMCList[index];
        var _loc3 = ["", "AVAILABLE", "UNAVAILABLE", "NOTMET"];
        _loc4.stateMC.gotoAndStop(_loc3[stateEnum]);
    } // End of the function
    function SET_MULTIPLAYER_HEAD(_newTXD)
    {
        var _loc2;
        if (_newTXD == undefined)
        {
            _loc2 = dataList[2][5];
        }
        else
        {
            _loc2 = _newTXD;
        } // end else if
        if (FILE_NAME != "")
        {
            if (_loc2 != "")
            {
                com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, FILE_NAME, _loc2, "");
            } // end if
        } // end if
    } // End of the function
    function SET_SWITCH_HINTED(index, hinted)
    {
        dataList[index][3] = hinted;
        this.renderDisplay(index);
    } // End of the function
    function SET_SWITCH_HINTED_ALL(hinted0, hinted1, hinted2, hinted3)
    {
        dataList[0][3] = hinted0;
        dataList[1][3] = hinted1;
        dataList[2][3] = hinted2;
        dataList[3][3] = hinted3;
        this.renderDisplay();
    } // End of the function
    function SET_PLAYER_DAMAGE(index, bVisible, bFlash)
    {
        com.rockstargames.ui.utils.Debug.log("SET_PLAYER_DAMAGE: " + arguments);
        if (bFlash == undefined)
        {
            bFlash = true;
        } // end if
        var _loc4 = switchMCList[index];
        _loc4.showDamageIndicator(bVisible, bFlash);
    } // End of the function
    function SET_SWITCH_COUNTER_ALL(count0, count1, count2, count3)
    {
        this.setMissionText(hotswapchar0, count0);
        this.setMissionText(hotswapchar1, count1);
        this.setMissionText(hotswapchar2, count2);
        this.setMissionText(hotswapchar3, count3);
    } // End of the function
    function setMissionText(mc, count)
    {
        if (count < 1)
        {
            mc.counterMC._visible = false;
        }
        else
        {
            mc.counterMC._visible = true;
            mc.counterMC.labelTF.text = String(count);
        } // end else if
    } // End of the function
    function SET_PLAYER_SELECTED(sindex)
    {
        selectedIndex = sindex;
        if (selectedIndex != oldselectedIndex)
        {
            hotswapchar0.highlighted(false);
            hotswapchar1.highlighted(false);
            hotswapchar2.highlighted(false);
            hotswapchar3.highlighted(false);
            if (sindex != -1)
            {
                switchMCList[selectedIndex].highlighted(true);
                com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, -75, 0.080000, 200);
            } // end if
        } // end if
        oldselectedIndex = selectedIndex;
    } // End of the function
    function SET_MP_LABEL(str)
    {
        if (str == "")
        {
            switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.multiplayerTF._visible = false;
            switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mp_background._visible = false;
        }
        else
        {
            switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.multiplayerTF.text = str;
            switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.multiplayerTF._visible = true;
            switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mp_background._visible = true;
        } // end else if
    } // End of the function
    function GET_SWITCH_SELECTED()
    {
        return (selectedIndex);
    } // End of the function
    function ADD_TXD_REF_RESPONSE(txd, uniqueStr, success)
    {
        if (success)
        {
            this.loadComponent(txd, switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC);
        } // end if
    } // End of the function
    function loadComponent(txd, target)
    {
        var thisObj = this;
        loaderObject._depth = 100;
        loaderObject._mc = target;
        loaderObject._loader = new MovieClipLoader();
        loaderObject._listener = new Object();
        loaderObject._loader.addListener(loaderObject._listener);
        loaderObject._listener.thisObj = thisObj;
        loaderObject._listener.onLoadInit = function (target_mc)
        {
            var _loc2 = thisObj.loaderObject;
            thisObj.setupMasking();
            var _loc3 = thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow, com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION, {_alpha: 0});
            com.rockstargames.ui.tweenStar.TweenStarLite.to(thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC, com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION, {_alpha: 100});
            _loc3._width = 80;
            _loc3._height = 80;
            _loc2._loader.removeListener(_loc2._listener);
            _loc2._loader = null;
        };
        var _loc4 = "img://" + txd + "/" + txd;
        loaderObject._loader.loadClip(_loc4, loaderObject._mc);
    } // End of the function
    function setupMasking()
    {
        hotswapchar2.mc.imagesMC.stateMC.mpMC.setMask(switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMaskMC);
    } // End of the function
    function debug()
    {
        this.SET_SWITCH_VISIBLE(false);
        this.SET_PLAYER_SELECTED(-1);
        this.SET_SWITCH_SLOT(0, 1, 2, true);
        this.SET_SWITCH_SLOT(1, 3, 1, false);
        this.SET_SWITCH_SLOT(2, 2, 3, false);
        this.SET_SWITCH_SLOT(3, 3, 0, false);
        this.SET_SWITCH_HINTED_ALL(false, false, false, false);
        this.SET_SWITCH_COUNTER_ALL(0, 0, 0, 0);
        this.SET_SWITCH_VISIBLE(true);
    } // End of the function
    var FILE_NAME = "";
    var selectedIndex = 0;
    var oldselectedIndex = -1;
    var _isVisible = false;
    var debugMPpedheadshot = false;
} // End of Class
#endinitclip

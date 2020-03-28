// Action script...

// [Initial MovieClip Action of sprite 153]
#initclip 25
class com.rockstargames.gtav.levelDesign.heists.HEIST_PALETO extends com.rockstargames.gtav.levelDesign.heists.HeistControllerBase
{
    var model, CONTENT, SET_DATA_SLOT, DISPLAY_VIEW, FOCUS_VIEW, SET_INPUT_EVENT, SET_DATA_SLOT_EMPTY;
    function HEIST_PALETO()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        model = new com.rockstargames.gtav.levelDesign.heists.HeistModel();
        heistAssetList = [];
        this.RegisterHeistAsset(0, CONTENT.boardMC.weaponsAmmoMC);
        this.RegisterHeistAsset(1, CONTENT.boardMC.escapeMapMC);
        this.RegisterHeistAsset(2, CONTENT.boardMC.speedBoatMC);
        this.RegisterHeistAsset(3, CONTENT.boardMC.noteCopsMC);
        this.RegisterHeistAsset(4, CONTENT.boardMC.noteCopCarsMC);
        this.RegisterHeistAsset(5, CONTENT.boardMC.noteTimeMC);
        this.RegisterHeistAsset(6, CONTENT.boardMC.notePlanAMC);
        this.RegisterHeistAsset(7, CONTENT.boardMC.notePlanBMC);
        this.RegisterHeistAsset(8, CONTENT.boardMC.vanMC);
        this.RegisterHeistAsset(9, CONTENT.boardMC.bankAlarmMC);
        this.RegisterHeistAsset(10, CONTENT.boardMC.bankMC);
        this.RegisterHeistAsset(11, CONTENT.boardMC.lifeinvaderMC);
        this.RegisterHeistAsset(12, CONTENT.boardMC.cityMapMC);
        this.RegisterHeistAsset(13, CONTENT.boardMC.noteLifeinvaderMC);
        this.RegisterHeistAsset(14, CONTENT.boardMC.dollarMC);
        this.RegisterHeistAsset(15, CONTENT.boardMC.hardwareMC);
        this.RegisterHeistAsset(16, CONTENT.boardMC.hoursMC);
    } // End of the function
    function debug()
    {
        this.CREATE_VIEW(0, 0);
        this.CREATE_VIEW(1, 1);
        this.CREATE_VIEW(2, 2);
        this.SET_LABELS("SKILL", "ACCURRACY", "CUT", "*heist title", "*crew", "*todo", "*planAText", "*planBText", "*timeText", "*cops", "*copCars", "*bankw", "*dollar", "*notes", "*smash", "*mil", "*hours23", "bateu");
        this.SET_DATA_SLOT(0, 0, 1, "name here1", "skill here1", "Skilled1", "750", "250");
        this.SET_DATA_SLOT(0, 1, 2, "name here2", "skill here2", "Skilled2", "75", "25");
        this.SET_DATA_SLOT(0, 2, 3, "name here3", "skill here3", "Skilled2", "75", "25");
        this.SET_DATA_SLOT(0, 3, 4, "name here4", "skill here4", "Skilled2", "75", "25");
        this.SET_DATA_SLOT(0, 4, 5, "name here5", "skill here5", "Skilled2", "75", "25");
        this.SET_DATA_SLOT(1, 0, 8);
        this.SET_DATA_SLOT(1, 1, 9);
        this.SET_DATA_SLOT(2, 0, 1, "Crew");
        this.SET_DATA_SLOT(2, 1, 0, "Van Route");
        this.SET_DATA_SLOT(2, 2, 1, "Armour & weapons");
        this.SET_DATA_SLOT(2, 3, 1, "Bank scouted");
        this.SET_DATA_SLOT(2, 4, 1, "Safe schematics");
        this.DISPLAY_VIEW(0);
        this.DISPLAY_VIEW(1);
        this.DISPLAY_VIEW(2);
        this.FOCUS_VIEW(1);
        this.SHOW_HEIST_ASSET(0, 1);
        this.SHOW_HEIST_ASSET(1, 1);
        this.SHOW_HEIST_ASSET(2, 1);
        this.SHOW_HEIST_ASSET(3, 1);
        this.SHOW_HEIST_ASSET(4, 1);
        this.SHOW_HEIST_ASSET(5, 1);
        this.SHOW_HEIST_ASSET(6, 1);
        this.SHOW_HEIST_ASSET(7, 1);
        this.SHOW_HEIST_ASSET(8, 1);
        this.SHOW_HEIST_ASSET(9, 1);
        this.SHOW_HEIST_ASSET(10, 1);
        this.SHOW_HEIST_ASSET(11, 1);
        this.SHOW_HEIST_ASSET(12, 1);
        this.SHOW_HEIST_ASSET(13, 1);
        this.SHOW_HEIST_ASSET(14, 1);
        this.SHOW_HEIST_ASSET(15, 1);
        this.SHOW_HEIST_ASSET(16, 1);
        var _loc3 = new Object();
        _loc3.onKeyDown = mx.utils.Delegate.create(this, getKeys);
        Key.addListener(_loc3);
        for (var _loc2 in CONTENT.boardMC)
        {
            trace (_loc2 + " " + CONTENT.boardMC[_loc2]);
        } // end of for...in
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(38))
        {
            this.SET_INPUT_EVENT(8);
        }
        else if (Key.isDown(39))
        {
            this.SET_INPUT_EVENT(11);
        }
        else if (Key.isDown(40))
        {
            this.SET_INPUT_EVENT(9);
        }
        else if (Key.isDown(37))
        {
            this.SET_INPUT_EVENT(10);
        }
        else if (Key.isDown(32))
        {
            this.FOCUS_VIEW(99);
        }
        else if (Key.isDown(16))
        {
            this.SET_DATA_SLOT_EMPTY(0);
            this.CREATE_VIEW(0, 0);
            this.SET_DATA_SLOT(0, 0, 1);
            this.SET_DATA_SLOT(0, 1, 2);
            this.SET_DATA_SLOT(0, 2, 3);
            this.DISPLAY_VIEW(0);
        } // end else if
    } // End of the function
    function CREATE_VIEW(viewIndex, viewType, xp, yp)
    {
        var _loc6 = [116, 660, 665];
        var _loc5 = [420, 284, 140];
        var _loc12 = arguments[2];
        var _loc11 = arguments[3];
        if (_loc12 == undefined)
        {
            _loc12 = _loc6[viewIndex];
        } // end if
        if (_loc11 == undefined)
        {
            _loc11 = _loc5[viewIndex];
        } // end if
        switch (viewType)
        {
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
            {
                model.createView(viewIndex, {id: viewType, x: _loc12, y: _loc11, rowSpacing: 2, columnSpacing: 2, container: CONTENT.containerMC, visibleItems: 1, selectstyle: com.rockstargames.ui.components.GUIView.LOCKED_SELECTSTYLE, linkage: ["crewmemberSelection"]});
                break;
            } 
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            {
                model.createView(viewIndex, {id: viewType, x: _loc12, y: _loc11, rowSpacing: 100, columnSpacing: 0, container: CONTENT.containerMC, visibleItems: 1, selectstyle: 0, linkage: ["gameplaySelection"]});
                break;
            } 
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
            {
                model.createView(viewIndex, {id: viewType, x: _loc12, y: _loc11, rowSpacing: 10, columnSpacing: 10, container: CONTENT.containerMC, visibleItems: 1, selectstyle: 0, linkage: ["todolistSelection"]});
                break;
            } 
        } // End of switch
    } // End of the function
    function REPOSITION_VIEW(viewIndex, xp, yp)
    {
        var _loc2 = (com.rockstargames.gtav.levelDesign.heists.HeistModel)(model).getCurrentView(viewIndex);
        if (xp != undefined)
        {
            _loc2.viewContainer._x = _loc2.viewContainerX = xp;
        } // end if
        if (yp != undefined)
        {
            _loc2.viewContainer._y = _loc2.viewContainerY = yp;
        } // end if
    } // End of the function
    function SET_LABELS(_weaponname, _jobcut, _accuracy)
    {
        (com.rockstargames.gtav.levelDesign.heists.HeistModel)(model).setLabel(_weaponname, _jobcut, _accuracy);
        var _loc16 = arguments[3];
        var _loc7 = arguments[4];
        var _loc10 = arguments[5];
        var _loc3 = CONTENT.boardMC;
        if (_loc16 != undefined)
        {
            _loc3.tape01.headingTF.text = _loc16;
        } // end if
        if (_loc7 != undefined)
        {
            _loc3.tape04.headingTF.text = _loc7;
        } // end if
        if (_loc10 != undefined)
        {
            _loc3.tape02.headingTF.text = _loc10;
        } // end if
        var _loc17 = arguments[6];
        var _loc14 = arguments[7];
        var _loc13 = arguments[8];
        var _loc15 = arguments[9];
        var _loc8 = arguments[10];
        var _loc9 = arguments[11];
        var _loc11 = arguments[12];
        var _loc4 = arguments[13];
        var _loc5 = arguments[14];
        var _loc6 = arguments[15];
        var _loc18 = arguments[16];
        var _loc12 = arguments[17];
        if (_loc17 != undefined)
        {
            _loc3.notePlanAMC.labelTF.text = _loc17;
        } // end if
        if (_loc14 != undefined)
        {
            _loc3.notePlanBMC.labelTF.text = _loc14;
        } // end if
        if (_loc13 != undefined)
        {
            _loc3.noteTimeMC.labelTF.text = _loc13;
        } // end if
        if (_loc15 != undefined)
        {
            _loc3.noteCopsMC.labelTF.text = _loc15;
        } // end if
        if (_loc8 != undefined)
        {
            _loc3.noteCopCarsMC.labelTF.text = _loc8;
        } // end if
        if (_loc9 != undefined)
        {
            _loc3.noteLifeinvaderMC.labelTF.text = _loc9;
        } // end if
        if (_loc11 != undefined)
        {
            _loc3.dollarMC.labelTF.text = _loc11;
        } // end if
        if (_loc4 != undefined)
        {
            _loc3.weaponsAmmoMC.labelTF.text = _loc4;
        } // end if
        if (_loc5 != undefined)
        {
            _loc3.lifeinvaderMC.labelTF.text = _loc5;
        } // end if
        if (_loc6 != undefined)
        {
            _loc3.hardwareMC.labelTF.text = _loc6;
        } // end if
        if (_loc18 != undefined)
        {
            _loc3.hoursMC.labelTF.text = _loc18;
        } // end if
        if (_loc12 != undefined)
        {
            _loc3.escapeMapMC.labelTF.text = _loc12;
        } // end if
    } // End of the function
    function SHOW_VIEW(_viewIndex, _show)
    {
        var _loc2 = model.getCurrentView(_viewIndex);
        (com.rockstargames.gtav.levelDesign.heists.HeistView)(_loc2).show(Boolean(_show));
    } // End of the function
    function SET_TODO(_viewIndex, _itemIndex, _checked)
    {
        var _loc2 = (com.rockstargames.gtav.levelDesign.heists.HeistModel)(model).getCurrentView(_viewIndex).dataList[_itemIndex];
        _loc2[0] = _checked;
        var _loc3 = (com.rockstargames.gtav.levelDesign.heists.HeistModel)(model).getCurrentView(_viewIndex);
        _loc3.addItem(_itemIndex, _loc2);
        _loc3.itemList[_itemIndex].data = _loc2;
    } // End of the function
    function RegisterHeistAsset(enum, mc)
    {
        heistAssetList["hi" + enum] = mc;
        mc._visible = false;
    } // End of the function
    function SHOW_HEIST_ASSET(enum, visible, frame, x, y)
    {
        var _loc2 = heistAssetList["hi" + enum];
        if (_loc2 != undefined)
        {
            _loc2._visible = Boolean(visible);
            if (frame != undefined)
            {
                _loc2.gotoAndStop(frame);
            } // end if
            if (x != undefined)
            {
                _loc2._x = x;
            } // end if
            if (y != undefined)
            {
                _loc2._y = y;
            } // end if
        } // end if
    } // End of the function
    var heistAssetList = new Array();
} // End of Class
#endinitclip

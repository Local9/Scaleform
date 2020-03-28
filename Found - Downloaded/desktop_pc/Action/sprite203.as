// Action script...

// [Initial MovieClip Action of sprite 203]
#initclip 23
class com.rockstargames.gtav.pc.applications.App_Sub extends com.rockstargames.gtav.pc.applications.App_Base
{
    var accessSwitchesMC, _subRef, securityLayoutMC, safeRight, sluiceGateMC, warningMC;
    function App_Sub()
    {
        super();
    } // End of the function
    function ready()
    {
        var _loc4 = new com.rockstargames.gtav.pc.PCButtonBase();
        _loc4.init(accessSwitchesMC.openSluiceBtnMC, com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_OPEN_SLUICE[0], {depth: 50});
        var _loc3 = new com.rockstargames.gtav.pc.PCButtonBase();
        _loc3.init(accessSwitchesMC.releaseSubBtnMC, com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_RELEASE_SUB[0], {depth: 50});
        buttonList = [];
        buttonList[com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_OPEN_SLUICE[0]] = _loc4;
        buttonList[com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_RELEASE_SUB[0]] = _loc3;
        _subRef.ADD_BUTTONS(_loc4);
        _subRef.ADD_BUTTONS(_loc3);
        securityLayoutMC._x = safeRight - securityLayoutMC._width - 10;
        accessSwitchesMC._x = safeRight - accessSwitchesMC._width - 20;
        for (var _loc2 = 0; _loc2 < 10; ++_loc2)
        {
            row1Ar.push(this.getRndNum());
            row2Ar.push(this.getRndNum());
        } // end of for
        securityLayoutMC.row1TF.text = this.outputStr(row1Ar);
        warningBlips = [];
        function onEnterFrame()
        {
            this.update();
        } // End of the function
    } // End of the function
    function getRndNum()
    {
        return (Math.ceil(Math.random() * 99999999));
    } // End of the function
    function outputStr(ar)
    {
        var _loc3 = "";
        for (var _loc1 = 0; _loc1 < ar.length; ++_loc1)
        {
            _loc3 = _loc3 + (ar[_loc1] + "\n");
        } // end of for
        return (_loc3);
    } // End of the function
    function adjustAr(ar)
    {
        ar.shift();
        ar.push(this.getRndNum());
        return (this.outputStr(ar));
    } // End of the function
    function update()
    {
        --textTimer;
        if (textTimer <= 0)
        {
            securityLayoutMC.row1TF.text = this.adjustAr(row1Ar);
            securityLayoutMC.row2TF.text = this.adjustAr(row2Ar);
            textTimer = 60 + Math.ceil(Math.random() * 30);
        } // end if
    } // End of the function
    function setButtonActive(buttonEnum, isActive)
    {
        var _loc2 = buttonList[buttonEnum];
        _subRef.ACTIVATE_BUTTONS(_loc2, Boolean(isActive));
    } // End of the function
    function setLabels(sluiceLbl, techLbl, securityLbl, accessLbl)
    {
        sluiceGateMC.labelTF.text = sluiceLbl;
        securityLayoutMC.labelTF.text = securityLbl;
        accessSwitchesMC.labelTF.text = accessLbl;
    } // End of the function
    function setDate(days, months, years)
    {
        var _loc3 = days > 9 ? (String(days)) : ("0" + days);
        var _loc5 = months > 9 ? (String(months)) : ("0" + months);
        var _loc7 = years > 9 ? (String(years)) : ("0" + years);
        sluiceGateMC.dateMC.dayTF.text = _loc3;
        sluiceGateMC.dateMC.monthTF.text = _loc5;
        sluiceGateMC.dateMC.yearTF.text = _loc7;
    } // End of the function
    function setTime(hours, mins)
    {
        var _loc4 = hours > 9 ? (String(hours)) : ("0" + hours);
        var _loc2 = mins > 9 ? (String(mins)) : ("0" + mins);
        sluiceGateMC.timeMC.hoursTF.text = _loc4;
        sluiceGateMC.timeMC.minsTF.text = _loc2;
    } // End of the function
    function setSection(section, cam, action1Lbl, action2Lbl)
    {
        sluiceGateMC.sectionMC.labelTF.text = section;
        sluiceGateMC.camMC.labelTF.text = cam;
        accessSwitchesMC.openSluiceBtnMC.highlightMC.titleMC.labelTF.text = action1Lbl;
        accessSwitchesMC.releaseSubBtnMC.highlightMC.titleMC.labelTF.text = action2Lbl;
    } // End of the function
    function triggerFlash()
    {
        sluiceGateMC.noiseMC.gotoAndPlay("in");
    } // End of the function
    function triggerWarning(num)
    {
        warningMC.gotoAndPlay("in");
        securityLayoutMC.mapMC.gotoAndStop(2);
    } // End of the function
    var warningBlips = new Array();
    var buttonList = new Array();
    var textTimer = 30;
    var row1Ar = new Array();
    var row2Ar = new Array();
} // End of Class
#endinitclip

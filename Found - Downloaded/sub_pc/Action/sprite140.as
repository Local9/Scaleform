// Action script...

// [Initial MovieClip Action of sprite 140]
#initclip 27
class com.rockstargames.gtav.pc.applications.App_Antivirus extends com.rockstargames.gtav.pc.applications.App_Base
{
    var _visible, instructionMC, continueMC, debugMC, actionBtn, __get__desktopRef, windowBtn, bgMC, scanbarMC, logoMC, debugList, ref;
    function App_Antivirus()
    {
        super();
        _visible = isWindowOpen = false;
    } // End of the function
    function ready(fText)
    {
        delete instructionMC.onEnterFrame;
        this.flashText(fText);
        if (!isWindowOpen)
        {
            this.localizeContinueButton("LES1A_ANTVI_SCAN");
            continueMC._visible = true;
            debugMC._visible = false;
            actionBtn = new com.rockstargames.gtav.pc.PCButtonBase();
            actionBtn.init(continueMC, com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_START[0], {depth: 5000});
            this.__get__desktopRef().addButtons(actionBtn, true);
            _visible = isWindowOpen = true;
            windowBtn = new com.rockstargames.gtav.pc.PCButtonBase();
            windowBtn.init(bgMC, com.rockstargames.gtav.constants.PCAppLUT.PC_WINDOW[0], {depth: 4999});
            this.__get__desktopRef().addButtons(windowBtn, true);
        } // end if
    } // End of the function
    function notReady(fText)
    {
        delete instructionMC.onEnterFrame;
        this.flashText(fText);
        if (isRepairing == false && isRepaired == false)
        {
            this.localizeContinueButton("LES1A_ANTVI_CLOSE");
            continueMC._visible = true;
            debugMC._visible = false;
            actionBtn = new com.rockstargames.gtav.pc.PCButtonBase();
            actionBtn.init(continueMC, com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_CLOSE[0], {depth: 5000});
            this.__get__desktopRef().addButtons(actionBtn, true);
            _visible = isWindowOpen = true;
            windowBtn = new com.rockstargames.gtav.pc.PCButtonBase();
            windowBtn.init(bgMC, com.rockstargames.gtav.constants.PCAppLUT.PC_WINDOW[0], {depth: 4999});
            this.__get__desktopRef().addButtons(windowBtn, true);
        } // end if
    } // End of the function
    function setScanBar(num)
    {
        scanbarMC.barMC._xscale = num;
    } // End of the function
    function playScanAnim(bool)
    {
        if (bool)
        {
            scanbarMC.frameMC.play();
        }
        else
        {
            scanbarMC.frameMC.stop();
        } // end else if
        isAnimating = Boolean(bool);
    } // End of the function
    function scanAntiVirus(secs)
    {
        this.__get__desktopRef().removeButtons(actionBtn);
        this.__get__desktopRef().resetUnderCursor();
        continueMC._visible = false;
        logoMC._visible = false;
        debugMC._visible = true;
        scanbarMC.barMC._alpha = 100;
        scanbarMC.barMC._xscale = 1;
        instructionMC._alpha = 0;
        scanbarMC._alpha = 100;
        isRepairing = isAnimating = true;
        this.startDebug();
    } // End of the function
    function scanComplete()
    {
        this.flashText("");
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(instructionMC.labelTF, "LES1A_ANTVI_COMP");
        scanbarMC._alpha = 0;
        instructionMC._alpha = 100;
        logoMC._visible = true;
        debugMC._visible = false;
        isRepairing = isAnimating = false;
        isRepaired = true;
        this.stopDebug();
        continueMC._visible = true;
        this.localizeContinueButton("LES1A_ANTVI_EXTER");
        actionBtn.init(continueMC, com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_CLEAN[0], {depth: 5050});
        this.__get__desktopRef().addButtons(actionBtn, true);
        this.__get__desktopRef().checkUnderCursor();
    } // End of the function
    function closeButtons()
    {
        this.__get__desktopRef().removeButtons(actionBtn);
        this.__get__desktopRef().removeButtons(windowBtn);
        this.__get__desktopRef().resetUnderCursor();
        _visible = isWindowOpen = false;
    } // End of the function
    function startDebug()
    {
        debugList = ["Sixfiguretemps.exe", "Internet eyeFind 6", "G235Virus", "ActualizeYourself.exe", "Ring Worm A23", "T44Virus", "Virtiga714", "MonetaryScience.us", "iFruit Park X", "Lifeinvader.exe", "Cashfordeaddreams.exe", "Epsilon Program", "Rav Mon.exe"];
        debugMC.ref = this;
        debugMC.onEnterFrame = function ()
        {
            ref.updateDebug();
        };
    } // End of the function
    function stopDebug()
    {
        delete debugMC.onEnterFrame;
    } // End of the function
    function updateDebug()
    {
        if (isAnimating)
        {
            if (Math.random() * 100 > 50)
            {
                var _loc2 = debugList[Math.floor(Math.random() * debugList.length)];
                debugMC.labelTF.text = "";
                debugMC.labelTF.text = _loc2;
            } // end if
        } // end if
    } // End of the function
    function flashText(str)
    {
        t = 100;
        instructionMC.labelTF.text = str;
        instructionMC.ref = this;
        instructionMC.onEnterFrame = function ()
        {
            ref.update();
        };
    } // End of the function
    function update()
    {
        --t;
        if (t < 0)
        {
            instructionMC._visible = true;
            delete instructionMC.onEnterFrame;
        }
        else if (t > 20 && t < 40 || t > 60 && t < 80 || t > 100 && t < 120)
        {
            instructionMC._visible = false;
        }
        else
        {
            instructionMC._visible = true;
        } // end else if
    } // End of the function
    function localizeContinueButton(stringTable)
    {
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(continueMC.labelTF, stringTable);
    } // End of the function
    var isWindowOpen = false;
    var isRepairing = false;
    var isRepaired = false;
    var isAnimating = false;
    var t = 100;
} // End of Class
#endinitclip

// Action script...

// [Initial MovieClip Action of sprite 13]
#initclip 2
class com.rockstargames.gtav.levelDesign.JEWEL_HEIST_COUNTER extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, ref;
    function JEWEL_HEIST_COUNTER()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.SET_COLOUR(1, 238, 140, 27);
        this.SET_COLOUR(2, 178, 83, 0);
    } // End of the function
    function animateText(d)
    {
        diff = d / maxSteps;
        animSteps = 0;
        CONTENT.ref = this;
        CONTENT.onEnterFrame = function ()
        {
            ref.update();
        };
    } // End of the function
    function update()
    {
        ++animSteps;
        var _loc2 = Math.round(diff * animSteps);
        var _loc3 = cash + _loc2;
        CONTENT.stolenMC.labelTF.text = "$" + _loc3;
        if (animSteps >= maxSteps)
        {
            cash = targetcash;
            delete CONTENT.onEnterFrame;
        } // end if
    } // End of the function
    function SET_CASH(stolenValue, totalValue)
    {
        if (stolenValue != undefined)
        {
            targetcash = stolenValue;
            this.animateText(targetcash - cash);
        } // end if
        if (totalValue != undefined)
        {
            CONTENT.totalMC.labelTF.text = "$" + totalValue;
        } // end if
    } // End of the function
    function SET_LABELS(stolenLabel, totalLabel)
    {
        if (totalLabel != undefined)
        {
            CONTENT.totalTF.text = totalLabel;
            CONTENT.totalTF.autoSize = true;
        } // end if
        if (stolenLabel != undefined)
        {
            CONTENT.stolenTF.text = stolenLabel;
            CONTENT.stolenTF.autoSize = true;
        } // end if
    } // End of the function
    function SET_COLOUR(enum, r, g, b)
    {
        switch (enum)
        {
            case 1:
            {
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.stolenMC, r, g, b);
                break;
            } 
            case 2:
            {
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.totalMC, r, g, b);
                break;
            } 
        } // End of switch
    } // End of the function
    var animSteps = 10;
    var maxSteps = 10;
    var targetcash = 0;
    var cash = 0;
    var diff = 0;
} // End of Class
#endinitclip

// Action script...

// [Initial MovieClip Action of sprite 215]
#initclip 19
class com.rockstargames.gtav.store.STORE_DETAILS_LIST extends com.rockstargames.gtav.store.EcommerceStoreBaseClass
{
    var data, COLUMN, menuBgCol, blackCol, whiteCol, textTF, statusMC, PriceItemMC, PriceItemMCbgMC, blankImage, bg, scrollIndicator, scrollIndicatorbgMC, bgCol, textCol, currentColumn;
    function STORE_DETAILS_LIST()
    {
        super();
        data = new Array();
    } // End of the function
    function SETUP_COLUMN(mc, _menuBgCol, _blackCol, _whiteCol)
    {
        COLUMN = mc;
        menuBgCol = _menuBgCol;
        blackCol = _blackCol;
        whiteCol = _whiteCol;
        textTF = COLUMN.textMC.textTF;
        statusMC = COLUMN.statusMC;
        PriceItemMC = COLUMN.PriceItemMC;
        PriceItemMCbgMC = COLUMN.PriceItemMC.bgMC;
        blankImage = COLUMN.blankImage;
        bg = COLUMN.bgMC;
        scrollIndicator = COLUMN.scrollIndicatorMC;
        scrollIndicator._visible = false;
        scrollIndicatorbgMC = scrollIndicator.bgMC;
        if (scrollIndicatorbgMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollIndicatorbgMC, menuBgCol[0], menuBgCol[1], menuBgCol[2], menuBgCol[3]);
        } // end if
        if (COLUMN.textMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(COLUMN.textMC, whiteCol[0], whiteCol[1], whiteCol[2], 100);
        } // end if
        PriceItemMC = COLUMN.PriceItemMC;
        if (PriceItemMCbgMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(PriceItemMCbgMC, menuBgCol[0], menuBgCol[1], menuBgCol[2], menuBgCol[3]);
        } // end if
        if (bg != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(bg, menuBgCol[0], menuBgCol[1], menuBgCol[2], menuBgCol[3]);
        } // end if
    } // End of the function
    function SET_DATA(_slot, _data)
    {
        data[_slot] = _data;
    } // End of the function
    function SET_DATA_EMPTY(_slot)
    {
        if (_slot == undefined)
        {
            data = [];
        }
        else
        {
            data[_slot] = [];
        } // end else if
        textTF.text = "";
        this.REDRAW();
    } // End of the function
    function highlightItem(_slot)
    {
    } // End of the function
    function SET_DESCRIPTION(priceTitle, itemPrice, numPlayers, statusText, statusColour, priceVis, playersVis, statusVis)
    {
        data[2] = priceTitle;
        data[3] = itemPrice;
        data[4] = numPlayers;
        data[5] = statusText;
        data[6] = statusColour;
        data[7] = priceVis;
        data[8] = playersVis;
        data[9] = statusVis;
        this.REDRAW();
    } // End of the function
    function REDRAW()
    {
        var _loc2 = false;
        textTF.html = true;
        if (data[0] != undefined)
        {
            textTF.htmlText = "<font size=\'16\'>" + this.parseLinebreaks(data[0].toString()) + "</font><BR><BR>";
            _loc2 = false;
        }
        else
        {
            _loc2 = true;
        } // end else if
        if (data[1] != undefined)
        {
            textTF.htmlText = textTF.htmlText + this.parseLinebreaks(data[1].toString());
            _loc2 = false;
        }
        else
        {
            _loc2 = true;
        } // end else if
        if (_loc2 == true)
        {
            textTF.htmlText = "";
        } // end if
        this.updateScrollIndicator();
        var _loc8 = data[2];
        var _loc4 = data[3];
        var _loc3 = data[4];
        var _loc5 = data[5];
        var _loc9 = data[6];
        var _loc7 = data[7];
        var _loc10 = data[8];
        var _loc6 = data[9];
        if (_loc8 == undefined || _loc8 == "")
        {
            PriceItemMC.labelMC.titleTF.htmlText = "";
        }
        else
        {
            PriceItemMC.labelMC.titleTF.html = true;
            PriceItemMC.labelMC.titleTF.autoSize = true;
            PriceItemMC.labelMC.titleTF.htmlText = _loc8;
        } // end else if
        if (_loc4 == undefined || _loc4 == "")
        {
            PriceItemMC.labelMC.priceTF.htmlText = "";
            _loc7 = false;
        }
        else
        {
            _loc4 = _loc4.split("MSP").join("<img src=\'points_icon\' height=\'16\' width=\'16\'>");
            PriceItemMC.labelMC.priceTF.html = true;
            PriceItemMC.labelMC.priceTF.autoSize = true;
            PriceItemMC.labelMC.priceTF.htmlText = _loc4;
            _loc7 = true;
        } // end else if
        if (_loc3 == undefined || _loc3 == 0 || _loc3 == "0" || _loc3 == "")
        {
            PriceItemMC.playersMC.playersTF.text = "";
            PriceItemMC.playersMC._visible = false;
        }
        else
        {
            PriceItemMC.playersMC.playersTF.autoSize = true;
            PriceItemMC.playersMC.playersTF.text = _loc3;
            PriceItemMC.playersMC._x = 278 - PriceItemMC.playersMC._width + 1;
            PriceItemMC.playersMC._visible = true;
        } // end else if
        this.COLOUR_STATUS_BAR();
        if (_loc5 == undefined || _loc5 == "")
        {
            statusMC.labelMC._visible = false;
            statusMC.bgMC._visible = false;
            _loc6 = false;
        }
        else
        {
            statusMC.labelMC.statusTF.autoSize = true;
            statusMC.labelMC.statusTF.text = _loc5;
            statusMC.bgMC._width = statusMC.labelMC._width + 4;
            statusMC._x = 276 - statusMC.labelMC._width;
            statusMC.labelMC._visible = true;
            statusMC.bgMC._visible = true;
            _loc6 = true;
        } // end else if
        currentSelection = 0;
        if (_loc2 == true)
        {
            blankImage._visible = true;
            bg._visible = false;
        }
        else
        {
            blankImage._visible = false;
            bg._visible = true;
        } // end else if
        PriceItemMC.labelMC._visible = _loc7;
        statusMC._visible = _loc6;
    } // End of the function
    function COLOUR_STATUS_BAR()
    {
        var _loc2 = statusMC.bgMC;
        if (_loc2 != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc2, bgCol[0], bgCol[1], bgCol[2], 100);
        } // end if
        var _loc3 = statusMC.labelMC;
        if (_loc3 != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc3, textCol[0], textCol[1], textCol[2], 100);
        } // end if
    } // End of the function
    function UPDATE_STATUS_COLOURS(_bgCol, _textCol)
    {
        bgCol = _bgCol;
        textCol = _textCol;
        this.COLOUR_STATUS_BAR();
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                --textTF.scroll;
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                ++textTF.scroll;
                break;
            } 
        } // End of switch
        this.updateScrollIndicator();
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        return (0);
    } // End of the function
    function updateScrollIndicator()
    {
        if (textTF.maxscroll > 1)
        {
            if (textTF.scroll > 1)
            {
                scrollIndicator.scrollArrowUp._alpha = 100;
            }
            else
            {
                scrollIndicator.scrollArrowUp._alpha = 50;
            } // end else if
            if (textTF.scroll < textTF.maxscroll)
            {
                scrollIndicator.scrollArrowDown._alpha = 100;
            }
            else
            {
                scrollIndicator.scrollArrowDown._alpha = 50;
            } // end else if
            scrollIndicator._visible = true;
        }
        else
        {
            scrollIndicator._visible = false;
        } // end else if
    } // End of the function
    function highlight(_h)
    {
        if (_h)
        {
            textTF.scroll = 0;
            this.updateScrollIndicator();
            
        } // end if
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        var _loc2;
        if (isFocused)
        {
            _loc2 = 1;
            if (PriceItemMCbgMC != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(PriceItemMCbgMC, blackCol[0], blackCol[1], blackCol[2], blackCol[3]);
            } // end if
        }
        else
        {
            _loc2 = 0.300000;
            if (PriceItemMCbgMC != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(PriceItemMCbgMC, menuBgCol[0], menuBgCol[1], menuBgCol[2], menuBgCol[3]);
            } // end if
        } // end else if
        var _loc3 = new flash.geom.Transform(COLUMN);
        var _loc4 = new flash.geom.ColorTransform(_loc2, _loc2, _loc2, 1, 1, 1, 1, 0);
        _loc3.colorTransform = _loc4;
        this.highlight(isFocused);
    } // End of the function
    function CURRENT_COLUMN(_column)
    {
        currentColumn = _column;
    } // End of the function
    function parseLinebreaks(str)
    {
        return (str.split("\\n").join("<br>"));
    } // End of the function
    var scrollPos = 0;
    var currentSelection = 0;
} // End of Class
#endinitclip

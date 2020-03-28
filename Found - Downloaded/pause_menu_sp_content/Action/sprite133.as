// Action script...

// [Initial MovieClip Action of sprite 133]
#initclip 12
class com.rockstargames.ui.utils.UIText
{
    function UIText()
    {
    } // End of the function
    static function setSizedText(tf, str, autoShrink, autoSize, sizeOffset, sizeOverride)
    {
        tf.wordWrap = false;
        tf.multiline = false;
        tf.html = true;
        var _loc3 = 0;
        if (sizeOffset != undefined)
        {
            _loc3 = sizeOffset;
        } // end if
        var _loc2 = com.rockstargames.ui.utils.UIText.SIZE - _loc3;
        if (sizeOverride != undefined)
        {
            _loc2 = sizeOverride;
        } // end if
        tf.htmlText = "<FONT SIZE=\'" + _loc2 + "\'>" + str + "</FONT>";
        tf.verticalAlign = "center";
        if (autoShrink)
        {
            tf.textAutoSize = "shrink";
        }
        else if (autoSize)
        {
            tf.autoSize = true;
        } // end else if
    } // End of the function
    static function setDescText(tf, str, autoSize)
    {
        tf.wordWrap = true;
        tf.multiline = true;
        tf.html = true;
        tf.htmlText = "<FONT SIZE=\'" + com.rockstargames.ui.utils.UIText.SIZE + "\'>" + str + "</FONT>";
        if (autoSize != undefined && autoSize == true)
        {
            tf.autoSize = true;
        } // end if
    } // End of the function
    static var SIZE = 13;
    static var SIZE_GTAG = 18;
} // End of Class
#endinitclip

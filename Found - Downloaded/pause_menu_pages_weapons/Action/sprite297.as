// Action script...

// [Initial MovieClip Action of sprite 297]
#initclip 6
class com.rockstargames.ui.media.ImageLoader
{
    var textureContainer;
    function ImageLoader()
    {
    } // End of the function
    function init(_gfxName, _texDict, _texFilename, _texContainer, _texMethod)
    {
        gfxFileName = _gfxName;
        textureDict = _texDict;
        textureFilename = _texFilename;
        if (_texContainer != undefined)
        {
            textureContainer = _texContainer;
        } // end if
        if (_texMethod != undefined)
        {
            textureMethod = _texMethod;
        } // end if
    } // End of the function
    function loadImage()
    {
        isLoaded = false;
        if (gfxFileName != "" && textureDict != "")
        {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict, textureFilename);
        } // end if
    } // End of the function
    function getImage(imageTextField)
    {
        isLoaded = false;
        if (gfxFileName != "" && textureDict != "")
        {
            com.rockstargames.ui.game.GameInterface.call("GET_TXD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict);
            this.setImage(imageTextField);
        } // end if
    } // End of the function
    function setImage(imageTextField, w, h)
    {
        var _loc4 = "%d";
        var _loc2 = "%d";
        if (w != undefined)
        {
            _loc4 = w.toString();
        } // end if
        if (h != undefined)
        {
            _loc2 = h.toString();
        } // end if
        if (textureContainer != undefined)
        {
            imageTextField = textureContainer;
        } // end if
        if (imageTextField != undefined)
        {
            var _loc5 = "img://" + textureDict + "/" + textureFilename;
            var _loc6 = "<img src=\'" + _loc5 + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc4 + "\' height=\'" + _loc2 + "\'/>";
            imageTextField.htmlText = _loc6;
            imageTextField.autoSize = true;
        } // end if
    } // End of the function
    function setImageInMemory(imageTextField, w, h)
    {
        var _loc3 = "%d";
        var _loc2 = "%d";
        if (w != undefined)
        {
            _loc3 = w.toString();
        } // end if
        if (h != undefined)
        {
            _loc2 = h.toString();
        } // end if
        var _loc4 = textureFilename;
        var _loc5 = "<img src=\'" + _loc4 + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc3 + "\' height=\'" + _loc2 + "\'/>";
        imageTextField.htmlText = _loc5;
        imageTextField.autoSize = true;
    } // End of the function
    function deleteImage()
    {
        if (gfxFileName != "" && textureDict != "")
        {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict);
        } // end if
    } // End of the function
    var gfxFileName = "";
    var textureDict = "";
    var textureFilename = "";
    var textureMethod = 0;
    var isLoaded = false;
} // End of Class
#endinitclip

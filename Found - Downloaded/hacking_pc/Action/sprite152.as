// Action script...

// [Initial MovieClip Action of sprite 152]
#initclip 36
class com.rockstargames.gtav.pc.applications.hacking.BFColumn extends MovieClip
{
    var passwordLetter, containerMC, __get__highlighted, __set__highlighted;
    function BFColumn()
    {
        super();
        speed = (1 + Math.ceil(Math.random() * 19)) / 2;
        speed = Math.max(0, Math.min(speed, 10));
    } // End of the function
    function init(gridMC, columnIndex, _rows, _passwordLetter)
    {
        rows = _rows;
        index = columnIndex;
        passwordLetter = _passwordLetter;
        containerMC = gridMC.createEmptyMovieClip("dummy" + index, index);
        this.reset();
        letterPosY = this.gridToY(letterIndex);
        hitAreaY = this.gridToY(hitIndex);
        hitUpper = hitAreaY - spacingY - letterPadding - com.rockstargames.gtav.pc.applications.App_Hacking.hitBuffer;
        hitLower = hitAreaY - spacingY + barHeight - letterPadding - (itemHeight - 2 * letterPadding) + com.rockstargames.gtav.pc.applications.App_Hacking.hitBuffer;
        wrapOffsetY = itemHeight + spacingY;
        containerMC._x = index * (itemWidth + spacingX);
    } // End of the function
    function setLetter(_passwordLetter)
    {
        passwordLetter = _passwordLetter;
        var _loc2 = items[letterIndex];
        _loc2.numTF.text = passwordLetter;
        letters[letterIndex] = passwordLetter;
    } // End of the function
    function setColumnSpeed(columnSpeed)
    {
        var _loc2 = columnSpeed / 10;
        _loc2 = Math.max(0, Math.min(_loc2, 10));
        speed = _loc2;
    } // End of the function
    function reset()
    {
        var _loc6 = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
        letterIndex = Math.floor(Math.random() * rows);
        letters = [];
        items = [];
        var _loc9 = rows + 1;
        for (var _loc3 = 0; _loc3 < _loc9; ++_loc3)
        {
            var _loc2 = items[_loc3];
            if (_loc2 == undefined)
            {
                var _loc7 = index * _loc9 + _loc3;
                _loc2 = containerMC.attachMovie("gridnum", "gridnumMC" + _loc7, _loc7);
                _loc2._y = _loc3 * (_loc2._height + spacingY);
            } // end if
            var _loc5 = Math.floor(Math.random() * _loc6.length);
            var _loc4 = _loc6[_loc5];
            if (_loc4 == passwordLetter)
            {
                var _loc8 = _loc6.length - 1;
                _loc5 = Math.floor(Math.random() * _loc8);
                if (_loc5 > _loc6.length - 1)
                {
                    _loc5 = _loc5 - _loc6.length;
                } // end if
                _loc4 = _loc6[_loc5];
            } // end if
            if (letterIndex == _loc3)
            {
                _loc4 = passwordLetter;
                com.rockstargames.ui.utils.Colour.Colourise(_loc2, 255, 0, 0);
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc2, 255, 255, 255);
            } // end else if
            _loc2.numTF.text = _loc4;
            letters[_loc3] = _loc4;
            items[_loc3] = _loc2;
        } // end of for
        success = false;
        itemHeight = _loc2._height;
        itemWidth = _loc2._width;
    } // End of the function
    function gridToY(i)
    {
        return (i * (itemHeight + spacingY));
    } // End of the function
    function update()
    {
        if (success == false)
        {
            this.refresh();
        } // end if
    } // End of the function
    function refresh()
    {
        containerMC._y = containerMC._y + speed;
        letterPosY = letterIndex * wrapOffsetY + (wrapOffsetY - Math.abs(containerMC._y));
        if (containerMC._y > 0)
        {
            var _loc5 = String(letters.pop());
            letters.splice(0, 0, _loc5);
            ++letterIndex;
            if (letterIndex > items.length - 1)
            {
                letterIndex = 0;
            } // end if
            for (var _loc2 = 0; _loc2 < items.length; ++_loc2)
            {
                var _loc3 = items[_loc2];
                var _loc4 = letters[_loc2];
                _loc3.numTF.text = _loc4;
                if (letterIndex == _loc2)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(_loc3, 255, 0, 0);
                    continue;
                } // end if
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, 255, 255, 255);
            } // end of for
            containerMC._y = containerMC._y + -wrapOffsetY;
        } // end if
    } // End of the function
    function set highlighted(h)
    {
        _highlighted = h;
        //return (this.highlighted());
        null;
    } // End of the function
    function get highlighted()
    {
        return (_highlighted);
    } // End of the function
    function testHit()
    {
        if (letterPosY >= hitUpper && letterPosY < hitLower)
        {
            success = true;
            if (letterIndex < hitIndex)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(containerMC, 0.200000, {_y: -this.gridToY(0)});
                com.rockstargames.ui.utils.Colour.Colourise(items[3], 0, 255, 0);
            }
            else if (letterIndex >= hitIndex)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(containerMC, 0.200000, {_y: -this.gridToY(1)});
                com.rockstargames.ui.utils.Colour.Colourise(items[4], 0, 255, 0);
            } // end else if
            return (true);
        }
        else
        {
            return (false);
        } // end else if
    } // End of the function
    var index = 0;
    var items = new Array();
    var letters = new Array();
    var itemHeight = 46;
    var itemWidth = 46;
    var letterIndex = 0;
    var letterPosY = 0;
    var letterPadding = 11;
    var wrapOffsetY = 20;
    var hitIndex = 4;
    var hitAreaY = 300;
    var hitUpper = 100;
    var hitLower = 200;
    var barHeight = 40;
    var speed = 10;
    var maxspeed = 10;
    var success = false;
    var spacingX = 12;
    var spacingY = -12;
    var rows = 8;
    var _highlighted = false;
} // End of Class
#endinitclip

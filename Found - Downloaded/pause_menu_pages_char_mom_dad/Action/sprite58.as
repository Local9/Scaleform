// Action script...

// [Initial MovieClip Action of sprite 58]
#initclip 15
class com.rockstargames.ui.utils.BitMask
{
    var _bitField, __get__bitfield, __set__bitfield;
    function BitMask(value)
    {
        if (value != undefined)
        {
            _bitField = value;
        }
        else
        {
            _bitField = 0;
        } // end else if
    } // End of the function
    static function BIT(value)
    {
        return (Math.pow(2, value));
    } // End of the function
    function set bitfield(value)
    {
        _bitField = value;
        //return (this.bitfield());
        null;
    } // End of the function
    function get bitfield()
    {
        return (_bitField);
    } // End of the function
    function setBit(bitmask)
    {
        _bitField = _bitField | bitmask;
    } // End of the function
    function clearBit(bitmask)
    {
        _bitField = _bitField - (_bitField & bitmask);
    } // End of the function
    function isBitSet(bitmask)
    {
        return ((_bitField & bitmask) != 0);
    } // End of the function
    function isBitSetAt(i)
    {
        return (this.isBitSet(com.rockstargames.ui.utils.BitMask.BIT(i)));
    } // End of the function
} // End of Class
#endinitclip

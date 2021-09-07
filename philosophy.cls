Class Password.Philosophy Extends %Persistent
{

Property password As %ArrayOfDataTypes;

ClassMethod Import(dir As %String = "/usr/local/day2.txt") As %Status
{
    // Open my text file and check it exists
    IF ##class(%File).Exists(dir) '=1 {
    write !, "Unable to Open: "_dir
    QUIT}
    ELSE { write "File: "_dir_" is open"
    }

    // instantiate a new class called file
    set file = ##class(%Stream.FileCharacter).%New()
    // create a new variable called sc
    set sc = file.LinkToFile(dir)
    set count=1
    /// loop to go through the day3 txt file 
    WHILE ('file.AtEnd) 
    {
        set delim="^"
        set line = file.ReadLine()
        write !, "Loop started"
        write *32
        write line,!

        
        // Extract each tree position and assign to a new array called map
        set password(count)=$PIECE(line, delim)
        set countdown=$LENGTH(line,delim)
        set count=$INCREMENT(count)        
    }
        write !,*32
        write !, "Double checking to see if the map array is set"
        write !,*32
        
        write !, "1st element of map array ", password(1)
        write !, "2nd element of map array ", password(2)
        write !, "2nd element of map array ", password(3)
        write !, "Import process complete"
        write *32
        
        //do ..Setup(.map,.right)
}

/// Description
ClassMethod Test() As %Status
{
    WRITE $MATCH("4567683285759","([0-9])+"),!
    //set min =$MATCH("1^23^456^789","([0-9]+\^?)+")
    //write "Min is ",min ,!
}

Storage Default
{
<Data name="PhilosophyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>map</Value>
</Value>
<Value name="3">
<Value>lines</Value>
</Value>
<Value name="4">
<Value>password</Value>
</Value>
</Data>
<DataLocation>^Password.PhilosophyD</DataLocation>
<DefaultData>PhilosophyDefaultData</DefaultData>
<IdLocation>^Password.PhilosophyD</IdLocation>
<IndexLocation>^Password.PhilosophyI</IndexLocation>
<StreamLocation>^Password.PhilosophyS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

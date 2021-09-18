Class Password.Philosophy Extends %Persistent
{

Property password As %ArrayOfDataTypes;

/// Holds the contents of policy string
Property policy1 As %String;

// Holds the contents of policy string

Property policy2 As %String;

// Holds the contents of policy string

Property policy3 As %String;

/// Description
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

        
        // Uses $Piece to extract password parts and assign them to an array called password
        set password(count)=$PIECE(line, delim)
        set countdown=$LENGTH(line,delim)
        set count=$INCREMENT(count)        
    }
        write !,*32
        write !, "Double checking to see if the password array is set"
        write !,*32
        
        // We will assign the first, second and third extractions to policy strings
        set policy1 = password(1)
        set policy2 = password(2)
        set policy3 = password(3)
        write !, "1st element of policy string ", policy1
        write !, "2nd element of policy string ", policy2
        write !, "2nd element of policy string ", policy3
        write !, "End of loop import process complete"
        write *32
        
        // We will pass the policy strings by value to the extract function
        do ..Extract(.policy1,.policy2,.policy3)
}

/// Extracts each password and password policy and then puts them through the regex method to see if they meet the password requirements
ClassMethod Extract(ByRef policy1 As %String, ByRef policy2 As %String, ByRef policy3 As %String) As %Status
{
    
   
    // Uses the extract to extract the passwords and their policies and strips the punctuation and then assigns the output to password strings
    set delim=""
    write policy1 ,!
    set first=$EXTRACT(policy1,1,3)
    set second=$EXTRACT(policy1,5,6)
    set password1=$EXTRACT(policy1,8,12)
    set password1= $ZSTRIP(password1,"*P")

    // The parts of the password components are written to the screen
    write "First: ",first ,!
    write "Second: ",second ,!
    write "Password1: ", password1,!


    // Uses the extract to extract the passwords and their policies and strips the punctuation and then assigns the output to password strings
    set fourth=$EXTRACT(policy2,1,3)
    set fifth=$EXTRACT(policy2,5,6)
    set password2=$EXTRACT(policy2,8,12)
    set password2= $ZSTRIP(password2,"*P")

     // The parts of the password components are written to the screen
    write "Fourth: ",fourth ,!
    write "Fifth: ",fifth ,!
    write "Password2: ", password2,!


     // Uses the extract to extract the passwords and their policies and strips the punctuation and then assigns the output to password strings
    set fourth=$EXTRACT(policy2,1,3)
    set seventh=$EXTRACT(policy3,1,3)
    set eighth=$EXTRACT(policy3,5,6)
    set password3=$EXTRACT(policy3,8,16)
    set password3= $ZSTRIP(password3,"*P")

    write "Seventh: ",seventh ,!
    write "Eighth: ",eighth ,!
    write "Password3: ", password3,!

    // And finally the password strings are passed to the regex methods
    do ..RegEx(.password1,.password2,.password3)
}

/// Outputs the results of the regex expressions to determine if the passwords match
ClassMethod RegEx(ByRef password1 As %String, ByRef password2 As %String, ByRef password3 As %String) As %Status
{
    write *32 ,!
    write "Does this meet password policy ? 0 = No & 1 = Yes" ,!
    write *32 ,!
    write "Answer: "
    write *32 ,!
    write $LOCATE(password1,"[a{1,3}]")
    write *32 ,!
    write "Does this meet password policy ? 0 = No & 1 = Yes" ,!
    write *32 ,!
    write "Answer: "
    write *32 ,!
    write $LOCATE(password2,"[b{1,3}]")
    write *32 ,!
    write "Does this meet password policy ? 0 = No & 1 = Yes" ,!
    write *32 ,!
    write "Answer: "
    write *32 ,!
    write $LOCATE(password3,"[c{2,9}]")
}

Storage Default
{
<Data name="PhilosophyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>password</Value>
</Value>
<Value name="3">
<Value>PropertyName</Value>
</Value>
<Value name="4">
<Value>policy1</Value>
</Value>
<Value name="5">
<Value>policy2</Value>
</Value>
<Value name="6">
<Value>policy3</Value>
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

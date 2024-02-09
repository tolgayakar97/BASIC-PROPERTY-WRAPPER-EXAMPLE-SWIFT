
//Let's say we want to add Togi at the end of each text by default which user typed.
//This feature can be provided by property wrappers.
//In order to create a property wrapper, the struct must be annotated with @propertyWrapper declaration attribute.

@propertyWrapper
struct TailProp
{
    var trailString: String
    
    init(wrappedValue: String) {
        self.trailString = wrappedValue
    }
    
    //The existence of a property named wrappedValue is a requirement for property wrappers.
    var wrappedValue: String {
        get {
            trailString + "Togi"
        }
        set {
            trailString = newValue
        }
    }
}

struct DUMMY_STRUCT
{
    //When @TailProp is applied to dummyText, dummyText essentially becomes the 'wrappedValue' property of 'TailProp'
    @TailProp var dummyText: String = ""
    
    mutating func PrintDummy(_ newText: String?)
    {
        dummyText = newText ?? "Default_"
        
        print(dummyText)
    }
}

var dummyStruct = DUMMY_STRUCT()

dummyStruct.PrintDummy(nil) //Prints Default_Togi
dummyStruct.PrintDummy("newDummyText_")//Prints newDummyText_Togi



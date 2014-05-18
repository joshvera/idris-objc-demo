module UIKit


data Alert = MkAlert Ptr

alert : String -> IO Ptr
alert s = mkForeign (FFun "UIAlertView.alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles_(%0, null, null, null, null)" [FString] FPtr) s

show : Ptr -> IO ()
show a = mkForeign (FFun "%0.show()" [FPtr] FUnit) a

module UIKit

mkAlert : String -> IO ()
mkAlert a = mkForeign (FFun "UIAlertView.alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles_(%0, null, null, null, null).show()" [FString] FUnit) a

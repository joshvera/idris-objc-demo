module Main
import UIKit

main : IO ()
main = do show !(alert "hello from idris")

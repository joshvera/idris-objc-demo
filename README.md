## A Idris -> Objective-C demo via JavascriptCore

Yeah I know its JavascriptCore, but until one of us write `mkDynamicForeign` or
relaxes `mkForeigns` literal string argument restriction during the type provider phase, we're stuck with
this.

# Install
1. Clone the repo
2. Run `script/bootstrap`
3. Since the Javascript Idris backend assumes a `document` or `window` object exists in the JS execution context and JavaScriptCore has neither, we need to modify the generated `main` function from:

	```js
	var main = function(){
	if (document.readyState == "complete" || document.readyState == "loaded") {
	__IDRRT__tailcall(function(){
	return __IDR__mrunMain0()
	});
	} else {
	window.addEventListener("DOMContentLoaded",function(){
	__IDRRT__tailcall(function(){
	return __IDR__mrunMain0()
	})
	},false);
	}
	}

	// To:

	var main = function(){
	__IDRRT__tailcall(function(){
	return __IDR__mrunMain0()
	});
	}
	```
4. Run it.

Pull Requests Welcome! :smile:

## A Idris -> Objective-C demo via JavascriptCore

Yeah I know JavascriptCore, but until one of us write `mkDynamicForeign` or
relaxes `mkForeigns` literal string argument restriction during the type provider phase, we're stuck with
it.

# Install
1. Clone the repo
2. cd src/
3. Run `idris --codegen javascript Main.idr -o src/main.js`
4. Since the Javascript Idris backend assumes a `document` or `window` object exists in the JS execution context and JavaScriptCore has neither, we need to modify the generated `main` function from:

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
```

to:

```js
var main = function(){
__IDRRT__tailcall(function(){
return __IDR__mrunMain0()
});
}
```
5. Run it.

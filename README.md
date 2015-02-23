# Cordova Go2Native Plugin
## Description
This plugin allows external page redirect the WebView back to cordova local page.

It is not a good practice to navigate inside Cordova's WebView. The best practice of Cordova app is single page application.

For some reason, if you have an existing mobile web site and only wants to add a few native features, this plugin is helping to navigate to local page from external website.

You also may need to identify the Cordova webview and system browser, refer to my recent work in cordova-ios: https://github.com/sinofool/cordova-ios

## Usage
```
$cordova plugin add com.sinofool.cordova.plugins.go2native
```
In your onDeviceReady function:
```
function onDeviceReady() {
  Go2Native.initSchema("mylocal");
}
```
In your server page want to go back to native page:
```
<a href="mylocal:///index.html">Go back to local</a>
```

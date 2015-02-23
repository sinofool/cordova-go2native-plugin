# Cordova Go2Native Plugin
## Description
This plugin allows external page redirect the WebView back to cordova local page.

It is not a good practice to navigate inside Cordova's WebView. The best practice of Cordova app is single page application.

For some reason, if you have an existing mobile web site and only wants to add a few native feature, this plugin is helpful.

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

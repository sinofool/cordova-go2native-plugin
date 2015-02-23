# Cordova Go2Native Plugin
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

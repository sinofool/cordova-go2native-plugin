package com.sinofool.cordova.plugins.go2native;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;

public class Go2NativePlugin extends CordovaPlugin {

    private static CordovaWebView appView;
    private static String localSchema;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        appView = webView;
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("initSchema")) {
            localSchema = args.getString(0) + "://";
            callbackContext.success();
            return true;
        }
        callbackContext.error("Unknown action " + action);
        return false;
    }

    @Override
    public boolean onOverrideUrlLoading(String url) {
        if (localSchema == null || !url.startsWith(localSchema)) {
            return false;
        }
        String override = "file:///android_asset/www" + url.substring(localSchema.length());
        appView.loadUrl(override);
        return true;
    }
}

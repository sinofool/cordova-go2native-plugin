//
//  Go2NativePlugin.m
//
//  Created by Bochun Bai on 2/22/15.
//
//

#import "Go2NativePlugin.h"

@implementation Go2NativePlugin

@synthesize localSchema;

- (BOOL) shouldOverrideLoadWithRequest:(NSURLRequest *) request navigationType:(UIWebViewNavigationType)navigationType {
    if ([request.URL.scheme isEqualToString:localSchema]) {
        if (request.URL.query != nil) {
            NSString* url = [NSString stringWithFormat:@"%@%@?%@", self.nativeBase, request.URL.path, request.URL.query];
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
        } else {
            NSString* url = [NSString stringWithFormat:@"%@%@", self.nativeBase, request.URL.path];
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
        }
        return YES;
    } else {
        return NO;
    }
}

- (void) initSchema:(CDVInvokedUrlCommand*) command {
    CDVPluginResult* pluginResult = nil;
    NSString* schema = [command.arguments objectAtIndex:0];
    
    if (schema != nil) {
        NSString* baseurl = [self.webView.request.URL.path stringByDeletingLastPathComponent];
        [self setNativeBase:baseurl];
        [self setLocalSchema:schema];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@end


//
//  Go2NativePlugin.m
//  1001YE
//
//  Created by Bochun Bai on 2/22/15.
//
//

#import "Go2NativePlugin.h"

@implementation Go2NativePlugin

@synthesize localSchema;

- (BOOL) shouldOverrideLoadWithRequest:(NSURLRequest *) request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"schema %@ and %@", request.URL.scheme, localSchema);
    if ([request.URL.scheme isEqualToString:localSchema]) {
        NSLog(@"view local schema: %@", request.URL.absoluteString);
        NSString* url = [NSString stringWithFormat:@"%@%@", self.nativeBase, request.URL.path];
        NSLog(@"local url loading %@", url);
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
        return YES;
    } else {
        NSLog(@"view normal schema: %@", request.URL.absoluteString);
        return NO;
    }
}

- (void) initSchema:(CDVInvokedUrlCommand*) command {
    CDVPluginResult* pluginResult = nil;
    NSString* schema = [command.arguments objectAtIndex:0];
    
    if (schema != nil) {
        NSLog(@"initSchema %@ at url %@", schema, self.webView.request.URL.path);
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

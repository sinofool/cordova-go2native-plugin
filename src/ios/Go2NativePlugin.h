//
//  Go2NativePlugin.h
//  1001YE
//
//  Created by Bochun Bai on 2/22/15.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface Go2NativePlugin : CDVPlugin
{
    NSString* _localSchema;
    NSString* _nativeBase;
    UIViewController* _view;
}

@property (nonatomic, strong) NSString* localSchema;
@property (nonatomic, strong) NSString* nativeBase;
@property (nonatomic, strong) UIViewController* view;

- (void) initSchema:(CDVInvokedUrlCommand*) command;
- (BOOL) shouldOverrideLoadWithRequest:(NSURLRequest *) request navigationType:(UIWebViewNavigationType)navigationType;
@end

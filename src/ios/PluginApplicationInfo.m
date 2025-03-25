#import <Cordova/CDVPluginResult.h>

@implementation PluginApplicationInfo

- (void)getApplicationInfo:(CDVInvokedUrlCommand *)command
{
    NSString* callbackId = command.callbackId;
    NSDictionary *result = [[NSDictionary alloc] init];
    NSString* localizedAppName = [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"];
    NSString* displayName = [[[NSBundle mainBundle] infoDictionary]objectForKey :@"CFBundleDisplayName"];
    NSString* appName = (localizedAppName != nil) ? localizedAppName : displayName;
    NSString* packageName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSString* versionName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString* versionCode = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];

    result = @{@"appName": appName, @"packageName": packageName, @"versionName": versionName, @"versionCode": versionCode};

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

@end
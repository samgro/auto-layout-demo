//
//  ALDAppDelegate.m
//  Auto Layout Demo
//
//  Created by Samuel Grossberg on 7/30/14.
//
//

#import "ALDAppDelegate.h"
#import "ALDRootViewController.h"

@implementation ALDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ALDRootViewController new]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

//
//  MMAppDelegate.m
//  MMTutorial
//
//  Created by ankye on 10/08/2015.
//  Copyright (c) 2015 ankye. All rights reserved.
//

#import "MMAppDelegate.h"

#import "MMTutorialViewController.h"
#import "MMPageFactory.h"

#import "MMViewController.h"
#import "MMStyle.h"

@implementation MMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSLog(@"HEIGHT is %f",SCREEN_HEIGHT);
    
    NSString* string = @"<b>bold</b>,<i>italic</i> and <u>underlined</u> text, and <font face='HelveticaNeue-CondensedBold' size=20 color='#CCFF00'>text with custom font and color</font>";
    
    MMTutorialPage* layer1 = [MMPageFactory createPageWithType:TYPE_IMAGE_IMGTITLE withBg:@"tutorial_image1" withfixBg4s:@"tutorial_image1_4s" withTitle:@"tutorial_title1" withDesc:string];
    MMTutorialPage* layer2 = [MMPageFactory createPageWithType:TYPE_IMAGE_TEXTTITLE withBg:@"tutorial_image2" withfixBg4s:@"tutorial_image2_4s" withTitle:@"tutorial_title2" withDesc:string];
    MMTutorialPage* layer3 = [MMPageFactory createPageWithType:TYPE_IMAGE withBg:@"tutorial_image3" withfixBg4s:@"tutorial_image3_4s" withTitle:@"tutorial_title3" withDesc:string];
    
    
    NSArray* _tutorialLayers = [[NSMutableArray alloc] initWithArray:@[layer1,layer2,layer3]];
    
    //
    [MMStyle sharedStyle].pageIndicatorTintColor = [UIColor whiteColor];
    [MMStyle sharedStyle].currentPageIndicatorTintColor = [UIColor greenColor];
    
    
    MMTutorialViewController* viewController = [[MMTutorialViewController alloc] initWithPages:_tutorialLayers];
    
 
    self.window.rootViewController = viewController;
    
    [viewController updateSingleButtonName:@"进入应用"];
    
    [viewController startScrolling];
    
    viewController.didSelectedEnters[0] = ^() {
            self.window.rootViewController = [[MMViewController alloc] init];
    };
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

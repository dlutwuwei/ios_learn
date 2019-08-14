//
//  AppDelegate.m
//  test
//
//  Created by wuwei on 2019/8/4.
//  Copyright © 2019 wuwei. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "GTVideoViewController.h"
#import "./NewsController/GTRecommendViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    ViewController *controller1 = [[ViewController alloc] init];
    UINavigationController *natvigatorController = [[UINavigationController alloc] initWithRootViewController:controller1];
    natvigatorController.tabBarItem.title = @"新闻";
    natvigatorController.tabBarItem.image = [UIImage imageNamed:@"./icon.bundle/page@2x.png"];
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];

//    UIViewController *controller1 = [[UIViewController alloc] init];
//    controller1.view.backgroundColor = [UIColor redColor];

    GTVideoViewController *videoController = [[GTVideoViewController alloc] init];
    videoController.tabBarItem.title= @"视频";
    videoController.view.backgroundColor = [UIColor redColor];

//    UIViewController *controller2 = [[UIViewController alloc] init];
    
    
    GTRecommendViewController *recoController3 = [[GTRecommendViewController alloc] init];
    recoController3.view.backgroundColor = [UIColor blueColor];
    recoController3.tabBarItem.title = @"推荐";

    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor greenColor];
    controller4.tabBarItem.title = @"我的";

    [tabbarController setViewControllers:@[natvigatorController, videoController, recoController3, controller4]];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

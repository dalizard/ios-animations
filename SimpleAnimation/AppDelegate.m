//
//  AppDelegate.m
//  SimpleAnimation
//
//  Created by Dimitar Haralanov on 8/26/14.
//  Copyright (c) 2014 Dimitar Haralanov. All rights reserved.
//

#import "AppDelegate.h"
#import <JNWSpringAnimation.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    UIView *redBall = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    redBall.backgroundColor = [UIColor redColor];
    //redBall.layer.cornerRadius = 50;

    [self.window addSubview:redBall];

    /*
    [UIView animateWithDuration:3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         redBall.backgroundColor = [UIColor greenColor];
                         redBall.transform = CGAffineTransformConcat(
                             CGAffineTransformMakeScale(2.0, 2.0),
                             CGAffineTransformMakeTranslation(75, 0));
                     }
                     completion:NULL];

    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:0 options:0 animations:^{
        redBall.transform = CGAffineTransformMakeTranslation(150, 0);
    } completion:NULL];
    */

    JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
    scale.damping = 9;
    scale.stiffness = 9;
    scale.mass = 1;
    scale.fromValue = @(1);
    scale.toValue = @(4.0);

    [redBall.layer addAnimation:scale forKey:scale.keyPath];
    redBall.transform = CGAffineTransformScale(redBall.transform, 4.0, 4.0);

    JNWSpringAnimation *rotation = [JNWSpringAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.damping = 9;
    rotation.stiffness = 9;
    rotation.mass = 1;
    rotation.fromValue = @(0);
    rotation.toValue = @(M_PI);

    [redBall.layer addAnimation:rotation forKey:rotation.keyPath];
    redBall.transform = CGAffineTransformRotate(redBall.transform, M_PI);

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

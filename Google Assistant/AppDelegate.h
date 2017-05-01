//
//  AppDelegate.h
//  Google Home
//
//  Created by Mohammad Abu-Garbeyyeh on 29/4/17.
//  Copyright © 2017 Mohammad Abu-Garbeyyeh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OIDAuthorizationService+IOS.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * _Nullable window;
@property (nonatomic, nullable) id<OIDAuthorizationFlowSession> currentAuthorizationFlow;

@end


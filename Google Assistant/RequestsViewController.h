//
//  RequestsViewController.h
//  Google Home
//
//  Created by Mohammad Abu-Garbeyyeh on 30/4/17.
//  Copyright © 2017 Mohammad Abu-Garbeyyeh. All rights reserved.
//

#import <JSQMessagesViewController/JSQMessagesViewController.h>

@interface RequestsViewController : JSQMessagesViewController

@property (nonatomic) id<UILayoutSupport> correctLayoutGuide;

- (void)addMessage:(NSString *)message;
- (void)addResponseWithMP3Data:(NSData *)data;

@end

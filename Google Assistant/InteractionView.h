//
//  InteractionView.h
//  Google Home
//
//  Created by Mohammad Abu-Garbeyyeh on 30/4/17.
//  Copyright © 2017 Mohammad Abu-Garbeyyeh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InteractionView : UIView

typedef NS_ENUM(NSUInteger, InteractionState) {
    Listening,
    Speaking,
    Thinking,
    Idle
};

@property (nonatomic) InteractionState interactionState;

@end

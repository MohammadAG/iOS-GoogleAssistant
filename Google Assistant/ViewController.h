//
//  ViewController.h
//  Google Home
//
//  Created by Mohammad Abu-Garbeyyeh on 29/4/17.
//  Copyright © 2017 Mohammad Abu-Garbeyyeh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InteractionView.h"

@import AVFoundation;

@interface ViewController : UIViewController <AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet InteractionView *interactionView;

@end


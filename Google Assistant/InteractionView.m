//
//  InteractionView.m
//  Google Home
//
//  Created by Mohammad Abu-Garbeyyeh on 30/4/17.
//  Copyright © 2017 Mohammad Abu-Garbeyyeh. All rights reserved.
//

#import "InteractionView.h"

static int const kMaxBlur = 20;
static int const kMinBlur = 10;

@interface InteractionView() {
    CADisplayLink *_displayLink;
    CGFloat _shadowBlur;
    BOOL _increasing;
    CGFloat _currentAngle;
}
@end

@implementation InteractionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialize];
}

- (void)initialize {
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = YES;
    
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(redrawView:)];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    _interactionState = Idle;
}

- (void)dealloc {
    [_displayLink invalidate];
    [_displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    _displayLink = nil;
}

- (void)setInteractionState:(InteractionState)interactionState {
    if (_interactionState == Idle && interactionState != Idle) {
        _displayLink.paused = NO;
    }
    
    _interactionState = interactionState;
}

- (void)redrawView:(CADisplayLink *)displayLink {
    if (_interactionState == Listening || _interactionState == Speaking) {
        double mod = fabs(fmod(_currentAngle, 360));
        int range = 360.0 / displayLink.preferredFramesPerSecond * 2;
        if (mod > range) {
            _currentAngle -= 360.0 / displayLink.preferredFramesPerSecond * 2;
            self.transform = CGAffineTransformMakeRotation(_currentAngle * M_PI/180);
        } else if (mod <= range) {
            _currentAngle = 0;
            self.transform = CGAffineTransformMakeRotation(_currentAngle * M_PI/180);
        }
        
        if (_increasing) {
            _shadowBlur += 10.0 / displayLink.preferredFramesPerSecond * 2;
        } else {
            _shadowBlur -= 10.0 / displayLink.preferredFramesPerSecond * 2;
        }
        
        if (_shadowBlur <= kMinBlur && !_increasing) {
            _shadowBlur = kMinBlur;
            _increasing = YES;
        } else if (_shadowBlur >= kMaxBlur) {
            _shadowBlur = kMaxBlur;
            _increasing = NO;
        }
    } else if (_interactionState == Thinking) {
        _currentAngle -= 360.0 / displayLink.preferredFramesPerSecond * 2;
        self.transform = CGAffineTransformMakeRotation(_currentAngle * M_PI/180);
        return;
    } else if (_interactionState == Idle) {
        if (_currentAngle != 0) {
            _currentAngle = 0;
            self.transform = CGAffineTransformMakeRotation(_currentAngle * M_PI/180);
        }
        
        _shadowBlur -= 10.0 / displayLink.preferredFramesPerSecond * 2;
        if (_shadowBlur <= 0) {
            _shadowBlur = 0;
            _increasing = YES;
        }
    }
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)frame {
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 74.0/255.0 green: 143.0/255.0 blue: 245.0/255.0 alpha: 1.0];
    UIColor* color2 = [UIColor colorWithRed: 59.0/255.0 green: 177.0/255.0 blue: 92.0/255.0 alpha: 1.0];
    UIColor* color3 = [UIColor colorWithRed: 236.0/255.0 green: 76.0/255.0 blue: 60.0/255.0 alpha: 1.0];
    UIColor* color4 = [UIColor colorWithRed: 252.0/255.0 green: 195.0/255.0 blue: 6.0/255.0 alpha: 1.0];
    
    //// Shadow Declarations
    NSShadow* shadow = [[NSShadow alloc] init];
    [shadow setShadowColor: _shadowBlur == 0 ? [UIColor clearColor] : UIColor.whiteColor];
    [shadow setShadowOffset: CGSizeMake(0, 0)];
    [shadow setShadowBlurRadius:_shadowBlur];
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + 55, 40, 40)];
    [color2 setFill];
    [ovalPath fill];
    
    ////// Oval Inner Shadow
    CGContextSaveGState(context);
    UIRectClip(ovalPath.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([shadow.shadowColor CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [shadow.shadowColor colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [ovalPath fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 55, CGRectGetMinY(frame), 40, 40)];
    [color setFill];
    [oval2Path fill];
    
    ////// Oval 2 Inner Shadow
    CGContextSaveGState(context);
    UIRectClip(oval2Path.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([shadow.shadowColor CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [shadow.shadowColor colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [oval2Path fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    
    
    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 55, CGRectGetMinY(frame) + CGRectGetHeight(frame) - 40, 40, 40)];
    [color4 setFill];
    [oval3Path fill];
    
    ////// Oval 3 Inner Shadow
    CGContextSaveGState(context);
    UIRectClip(oval3Path.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([shadow.shadowColor CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [shadow.shadowColor colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [oval3Path fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    
    
    //// Oval 4 Drawing
    UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + CGRectGetWidth(frame) - 40, CGRectGetMinY(frame) + 55, 40, 40)];
    [color3 setFill];
    [oval4Path fill];
    
    ////// Oval 4 Inner Shadow
    CGContextSaveGState(context);
    UIRectClip(oval4Path.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([shadow.shadowColor CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [shadow.shadowColor colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [oval4Path fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);}

@end

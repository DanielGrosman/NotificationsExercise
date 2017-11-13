//
//  CustomView.m
//  NotificationExercise
//
//  Created by Daniel Grosman on 2017-11-12.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property (nonatomic) UIPanGestureRecognizer *panGesture;

@end

@implementation CustomView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewPanned:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:self.panGesture];
}

- (IBAction)viewPanned:(UIPanGestureRecognizer *)sender {
    self.point = [sender translationInView:nil];
    [sender setTranslation:CGPointZero inView:self];
}

@end

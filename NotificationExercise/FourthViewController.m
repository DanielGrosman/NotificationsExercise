//
//  FourthViewController.m
//  NotificationExercise
//
//  Created by Daniel Grosman on 2017-11-12.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "FourthViewController.h"
#import "CustomView.h"

@interface FourthViewController ()
@property (strong, nonatomic) IBOutlet CustomView *whiteView;
@property (strong, nonatomic) IBOutlet UIView *yellowView;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.whiteView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"point"]) {
        id value = change[NSKeyValueChangeNewKey];
        NSValue *valueCast = (NSValue *) value;
        CGPoint point = valueCast.CGPointValue;
        
        CGFloat yellowX = self.yellowView.center.x;
        CGFloat yellowY = self.yellowView.center.y;
        
        yellowX += point.x;
        yellowY += point.y;
        
        CGPoint newCenter = CGPointMake(yellowX,yellowY);
        self.yellowView.center=newCenter;
    }
}

@end

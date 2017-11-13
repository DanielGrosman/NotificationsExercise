//
//  FirstViewController.m
//  NotificationExercise
//
//  Created by Daniel Grosman on 2017-11-12.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (nonatomic) NSNumber *convertedStepperValue;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void) convertStepperValue: (double) stepperValue {
    NSNumber *convertedStepperValue = [NSNumber numberWithDouble:self.stepper.value];
    self.convertedStepperValue = convertedStepperValue;
}

- (IBAction)stepperTapped:(UIStepper *)sender {
    [self convertStepperValue:self.stepper.value];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *stepperNotification = [[NSNotification alloc] initWithName:@"FirstViewControllerStepperChanged" object:self userInfo:@{@"stepperValue": self.convertedStepperValue}];
    [notificationCenter postNotification:stepperNotification];


    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end

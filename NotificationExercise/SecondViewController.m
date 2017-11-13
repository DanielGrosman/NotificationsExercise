//
//  SecondViewController.m
//  NotificationExercise
//
//  Created by Daniel Grosman on 2017-11-12.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"

@interface SecondViewController ()

@property (strong, nonatomic) IBOutlet UILabel *counterLabel;
@property (nonatomic) NSString *counterLabelValue;

@end

@implementation SecondViewController

-(instancetype)initWithCoder:(NSCoder *) Coder {
    if(self =[super initWithCoder:Coder]){
        _counterLabelValue = [[NSString alloc]init];
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTextDisplay:) name:@"FirstViewControllerStepperChanged" object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)updateTextDisplay:(NSNotification *)notification{
    self.counterLabelValue = [notification.userInfo[@"stepperValue"] stringValue];
}

-(void)viewWillAppear:(BOOL)animated{
    self.counterLabel.text = self.counterLabelValue;
}

//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}


@end

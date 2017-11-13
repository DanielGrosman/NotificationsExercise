//
//  ThirdViewController.m
//  NotificationExercise
//
//  Created by Daniel Grosman on 2017-11-12.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.textField becomeFirstResponder];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void) keyboardWillHide: (NSNotification *) sender {
    CGRect viewFrame = CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view setFrame:viewFrame];
}

- (void) keyboardWillShow: (NSNotification *) sender {
    CGSize keyboardSize = [[[sender userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGRect viewFrame = CGRectMake(0, -keyboardSize.height, self.view.frame.size.width, self.view.frame.size.height);
    [self.view setFrame:viewFrame];
}
- (IBAction)screenTapped:(UITapGestureRecognizer *)sender {
    [self.textField resignFirstResponder];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

//
//  HypnosisterViewController.m
//  Hypnosister
//
//  Created by Michael on 9/12/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import "HypnosisterViewController.h"
#import "HypnosisterView.h"

@interface HypnosisterViewController () <UITextFieldDelegate>

@end

@implementation HypnosisterViewController

#pragma mark - lifecycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        self.tabBarItem.image = [UIImage imageNamed:@"Time"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView {
    HypnosisterView *backgroundView = [[HypnosisterView alloc] init];
    
    CGRect textFieldRect = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/2-120, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    self.view = backgroundView;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - eventhandlers
- (void)drawHypnoticMessage:(NSString *)message {
    for (NSInteger i = 0; i < 20; i ++) {
        UILabel *messageLabel = [[UILabel alloc] init];
    
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor grayColor];
        messageLabel.text = message;
        
        [messageLabel sizeToFit];
        
        NSInteger width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        NSInteger x = arc4random() % width;
        
        NSInteger height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        NSInteger y = arc4random() % height;
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
        
        //add motion effects
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}

@end

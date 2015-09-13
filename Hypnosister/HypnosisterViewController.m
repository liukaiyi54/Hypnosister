//
//  HypnosisterViewController.m
//  Hypnosister
//
//  Created by Michael on 9/12/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import "HypnosisterViewController.h"
#import "HypnosisterView.h"

@interface HypnosisterViewController ()

@end

@implementation HypnosisterViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView {
    HypnosisterView *backgroundView = [[HypnosisterView alloc] init];
    self.view = backgroundView;
}
@end

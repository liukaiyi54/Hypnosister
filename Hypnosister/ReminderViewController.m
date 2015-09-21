//
//  ReminderViewController.m
//  Hypnosister
//
//  Created by Michael on 9/12/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation ReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *item = self.tabBarItem;
        item.title = @"Reminder";
        item.image = [UIImage imageNamed:@"Hypno"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    NSString *alertDate = [formatter stringFromDate:date];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reminder" message:[NSString stringWithFormat:@"Setting an alert at %@", alertDate] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

    [alert show];
}

@end

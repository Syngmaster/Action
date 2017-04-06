//
//  ViewController.m
//  ActionController
//
//  Created by Syngmaster on 04/04/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () {
    
    ActionSheetVC *view;
    
}

@end

@implementation ViewController

-(void) viewDidLoad {
    
    [super viewDidLoad];
    
    view = [[ActionSheetVC alloc] initWithDatePicker];
    view.delegate = self;
    
}



- (IBAction)getTheView:(UIButton *)sender {
    
    [self setPopOver];
    [self presentViewController:view animated:false completion:nil];
    
}

-(void) setPopOver {
    
    UIPopoverPresentationController *pc = [view popoverPresentationController];
    pc.sourceRect = CGRectMake(0, self.view.frame.size.height, 0.0, 0.0);
    pc.delegate = self;
    pc.sourceView = [super view];
    pc.permittedArrowDirections = 0;
}

-(void) updateLabelWhenControllerDismissed:(NSString *)formattedDate {
    
    _dateLabel.text = formattedDate;
    
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    
    return UIModalPresentationNone;
}



@end

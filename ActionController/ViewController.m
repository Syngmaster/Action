//
//  ViewController.m
//  ActionController
//
//  Created by Syngmaster on 04/04/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ActionSheetVC.h"

@interface ViewController () {
    
    ActionSheetVC *view;
    
}

@end

@implementation ViewController



- (IBAction)getTheView:(UIButton *)sender {
    
    view = [[ActionSheetVC alloc] initWithDatePicker];
    [self presentViewController:view animated:false completion:nil];
    
}



@end

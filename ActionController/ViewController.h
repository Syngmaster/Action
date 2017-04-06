//
//  ViewController.h
//  ActionController
//
//  Created by Syngmaster on 04/04/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionSheetVC.h"


@interface ViewController : UIViewController <UIPopoverPresentationControllerDelegate,UpdateDateLabelDelegate>

- (IBAction)getTheView:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end


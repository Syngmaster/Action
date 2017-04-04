//
//  ActionSheetVC.h
//  ActionController
//
//  Created by Syngmaster on 04/04/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionSheetVC : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource,UIPopoverPresentationControllerDelegate>

- (instancetype)initWithDatePicker;
- (instancetype)initWithPicker;

@property UILabel* titleLabel;
@property (strong, nonatomic) UIButton* submitButton;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIPickerView *pickView;
@property (strong, nonatomic) UIView *toolView;
@property (strong, nonatomic) NSMutableArray *dateArray;

@end

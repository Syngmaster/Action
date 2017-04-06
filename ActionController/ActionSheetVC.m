//
//  ActionSheetVC.m
//  ActionController
//
//  Created by Syngmaster on 04/04/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "ActionSheetVC.h"

@interface ActionSheetVC ()

@end

@implementation ActionSheetVC

//create an instance of DatePicker for choosing a date or time

- (instancetype)initWithDatePicker;
{
    self = [super init];
    
    if (self) {
        
        _toolView = [UIView new];
        _toolView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_toolView];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_toolView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_toolView)]];
        
        _titleLabel = [UILabel new];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
        [_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_titleLabel setText:@"The title"];
        [_toolView addSubview:_titleLabel];
        
        _submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_submitButton setTitle:@"Dismiss" forState:UIControlStateNormal];
        [_submitButton addTarget:self action:@selector(submitButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        _submitButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        [_submitButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_toolView addSubview:_submitButton];
        
        [_toolView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_titleLabel]-<=200-[_submitButton]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel,_submitButton)]];
        [_toolView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_titleLabel]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel)]];
        [_toolView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_submitButton]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_submitButton)]];
        
        _datePicker = [UIDatePicker new];
        _datePicker.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_datePicker];
        
        
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_toolView(50)]-5-[_datePicker]-<=50-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(_toolView,_datePicker)]];
        
    }
    
    self.modalPresentationStyle = UIModalPresentationPopover;
    self.preferredContentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height/2);
    
    UIPopoverPresentationController *pc = [self popoverPresentationController];
    pc.sourceRect = CGRectMake(self.view.frame.size.width, self.view.frame.size.height*2, 0.0, 0.0);
    pc.delegate = self;
    pc.sourceView = [super view];
    pc.permittedArrowDirections = 0;
    
    return self;
}


// create an instance of PickerView to choose a value from a custom component

-(instancetype) initWithPicker {
    
    self = [super init];
    
    if (self) {
        
        _toolView = [UIView new];
        _toolView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_toolView];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_toolView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_toolView)]];
        
        _titleLabel = [UILabel new];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
        [_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_titleLabel setText:@"The title"];
        [_toolView addSubview:_titleLabel];
        
        _submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_submitButton setTitle:@"Dismiss" forState:UIControlStateNormal];
        [_submitButton addTarget:self action:@selector(submitButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        _submitButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        [_submitButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        //[self.view addSubview:_submitButton];
        [_toolView addSubview:_submitButton];
        
        [_toolView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_titleLabel]-<=200-[_submitButton]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel,_submitButton)]];
        [_toolView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_titleLabel]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel)]];
        [_toolView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_submitButton]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_submitButton)]];
        
        _pickView = [UIPickerView new];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        _pickView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_pickView];
        
        _dateArray = [[NSMutableArray alloc] init];
        
        [_dateArray addObject:@"1 hour"];
        int i = 2;
        do {
            
            [_dateArray addObject:[NSString stringWithFormat:@"%i hours",i]];
            i++;
            
        } while (i<=24);
        
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_toolView(50)]-5-[_pickView]-<=50-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(_toolView,_pickView)]];
        
    }
    
    //settings of the popoverVC size and presentation style
    
    self.modalPresentationStyle = UIModalPresentationPopover;
    self.preferredContentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height/2);
    
    return self;
}




-(void) viewDidAppear:(BOOL)animated {
    
    [_datePicker addTarget:self action:@selector(labelChange) forControlEvents:UIControlEventValueChanged];
    
}

-(void) labelChange {
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MM-yyyy"];
    _dateChosen = [NSString stringWithFormat:@"%@",
                       [df stringFromDate:_datePicker.date]];
    [self.delegate updateLabelWhenControllerDismissed:_dateChosen];
}


//required methods in UIPickerViewDelegate and UIPickerViewDataSource protocols


-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return _dateArray.count;
    
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return _dateArray[row];
    
}




- (void)submitButtonTouched:(id)sender;
{
    [self dismissViewControllerAnimated:NO completion:^{
        
        
    }];
}



@end

//
//  SettingsViewController.h
//  TipCalculator3
//
//  Created by David Tong on 1/2/15.
//  Copyright (c) 2015 David Tong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *defaultTipPicker;

@end

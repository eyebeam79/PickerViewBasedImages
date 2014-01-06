//
//  ViewController.m
//  PickerViewBasedImages
//
//  Created by SDT1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ViewController.h"

#define MAX_NUM 10

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation ViewController

- (IBAction)selectRandom:(id)sender
{
    int r = arc4random() % MAX_NUM;
    [self.picker selectRow:r inComponent:0 animated:YES];
}

// 컴포넌트개수
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return MAX_NUM;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 64;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSString *imagePath = [NSString stringWithFormat:@"flag%d.png", row];
    UIImage *image = [UIImage imageNamed:imagePath];
    UIImageView *imageView;
    
    if (view == nil)
    {
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(0, 0, 100, 60);
    }
    else
    {
        imageView = (UIImageView *)view;
        imageView.image = image;
    }
    
    return imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  RootViewController.m
//  Simplr
//
//  Created by Jordan Nelson on 5/17/12.
//  Copyright (c) 2012 __Short Shorts Interactive__. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

// Private Properties
@property (strong) UIButton             *settingsBarButtonItem;
@property (strong) UIButton             *composeBarButtonItem;

// Private Methods
- (void)setBackgroundImageForNavigationBar;
- (void)createNavigationBarButtons;
- (UIButton *)makeBarButtonItemWithImage:(UIImage *)image andFrame:(CGRect)frame;
- (void)buttonWasTouched:(id)sender;

@end

@implementation RootViewController

@synthesize settingsBarButtonItem       = _settingsBarButtonItem;
@synthesize composeBarButtonItem        = _composeBarButtonItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    // Set the background color of the view
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
	// Do any additional setup after loading the view.
    [self setBackgroundImageForNavigationBar];
    [self createNavigationBarButtons];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma Navigation Bar Customization

// Set the graphics for the navigation bar
- (void)setBackgroundImageForNavigationBar
{
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"topBarSimplr"] forBarMetrics:UIBarMetricsDefault];
}

- (void)createNavigationBarButtons
{
    // Create the custom buttons
    self.settingsBarButtonItem = [self makeBarButtonItemWithImage:[UIImage imageNamed:@"settingsButton"] andFrame:CGRectMake(4.0f, 24.0f, 34.0f, 34.0f)];
    self.composeBarButtonItem  = [self makeBarButtonItemWithImage:[UIImage imageNamed:@"createButton"] andFrame:CGRectMake(282.0f, 24.0f, 34.0f, 34.0f)]; 
    
    // Add custom buttons to the view
    [self.view addSubview:self.settingsBarButtonItem];
    [self.view addSubview:self.composeBarButtonItem];
}

- (UIButton *)makeBarButtonItemWithImage:(UIImage *)image andFrame:(CGRect)frame
{
    UIButton *customButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton setImage:image forState:UIControlStateNormal];
    [customButton setFrame:frame];
    [customButton addTarget:self action:@selector(buttonWasTouched:) forControlEvents:UIControlEventTouchUpInside];

    return customButton;
}

#pragma Button Touch Detection methods

- (void)buttonWasTouched:(id)sender
{
    if (sender == self.settingsBarButtonItem) {
        NSLog(@"\nSettings button touched\n");
    } else if (sender == self.composeBarButtonItem) {
        NSLog(@"\nCompose button touched\n");
    }
}

@end

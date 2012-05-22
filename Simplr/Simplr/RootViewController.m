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
@property (strong) UIBarButtonItem      *settingsBarButtonItem;
@property (strong) UIBarButtonItem      *composeBarButtonItem;

// Private Methods
- (void)setBackgroundImageForNavigationBar;
- (void)createNavigationBarButtons;
- (UIBarButtonItem *)makeBarButtonItemWithImage:(UIImage *)image;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the background color of the view
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background@2x"]];

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
    // Temporarily set the background of the bar to a placeholding yeller
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
}

- (void)createNavigationBarButtons
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    
    self.settingsBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationController.navigationItem.leftBarButtonItem = self.settingsBarButtonItem;
}

- (UIBarButtonItem *)makeBarButtonItemWithImage:(UIImage *)image
{
    
}

@end

//
//  SettingsViewController.m
//  Simplr
//
//  Created by Jordan Nelson on 5/22/12.
//  Copyright (c) 2012 __Short Shorts Interactive__. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

// Private properties
@property (strong) UINavigationBar      *navigationBar;
@property (strong) UIButton             *closeButton;
@property (strong) UIImageView          *backgroundImageView;
@property (strong) UITableView          *tableView;
@property (strong) UIImageView          *backgroundImageViewShadow;

// Private Methods
- (void)createNavigationBarForUI;
- (void)createCloseButton;
- (UIButton *)makeBarButtonItemWithImage:(UIImage *)image andFrame:(CGRect)frame;
- (void)buttonWasTouched:(id)sender;
- (void)createCustomBackgroundForTableView;

@end

@implementation SettingsViewController

@synthesize navigationBar               = _navigationBar;
@synthesize closeButton                 = _closeButton;
@synthesize backgroundImageView         = _backgroundImageView;
@synthesize tableView                   = _tableView;
@synthesize backgroundImageViewShadow   = _backgroundImageViewShadow;

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

    // Create the nav bar, close button, custom background, and table view
    [self createNavigationBarForUI];
    [self createCloseButton];
    [self createCustomBackgroundForTableView];
    
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

#pragma Custom Creation

- (void)createNavigationBarForUI
{
    // Add a navigation bar for UI
    self.navigationBar = [[UINavigationBar alloc] init];
    self.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"settingsTopBar"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.frame = CGRectMake(0, 0, 320, 44);
    
    [self.view addSubview:self.navigationBar];
}

- (void)createCloseButton
{
    self.closeButton = [self makeBarButtonItemWithImage:[UIImage imageNamed:@"backButton"] andFrame:CGRectMake(4.0f, 4.0f, 34.0f, 34.0f)];
    [self.view addSubview:self.closeButton];
}

- (UIButton *)makeBarButtonItemWithImage:(UIImage *)image andFrame:(CGRect)frame
{
    UIButton *customButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton setImage:image forState:UIControlStateNormal];
    [customButton setFrame:frame];
    [customButton addTarget:self action:@selector(buttonWasTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    return customButton;
}

- (void)createCustomBackgroundForTableView
{
    // Create a custom background view to be visible behind the table view but not interfering with modal transitions
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    self.backgroundImageView.frame  = CGRectMake(0, 44, 320, 414);
    [self.view addSubview:self.backgroundImageView];
    
    // Custom shadow
    self.backgroundImageViewShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topBarShadow"]];
    self.backgroundImageViewShadow.frame  = CGRectMake(0, 65, 320, 1);
    [self.view addSubview:self.backgroundImageViewShadow];
    
    // Create the table view
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 436) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
}

#pragma Button Methods

- (void)buttonWasTouched:(id)sender
{
    if (sender == self.closeButton) {
        [self dismissModalViewControllerAnimated:YES];
    }
}

@end

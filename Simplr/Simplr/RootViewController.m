//
//  RootViewController.m
//  Simplr
//
//  Created by Jordan Nelson on 5/17/12.
//  Copyright (c) 2012 __Short Shorts Interactive__. All rights reserved.
//

#import "RootViewController.h"
#import "SettingsViewController.h"

@interface RootViewController ()

// Private Properties
@property (strong) UIButton             *settingsBarButtonItem;
@property (strong) UIButton             *composeBarButtonItem;
@property (strong) UITableView          *tableView;
@property (strong) UIImageView          *backgroundImageView;
@property (strong) UIImageView          *backgroundImageViewShadow;

// Private Methods
- (void)setBackgroundImageForNavigationBar;
- (void)createNavigationBarButtons;
- (UIButton *)makeBarButtonItemWithImage:(UIImage *)image andFrame:(CGRect)frame;
- (void)buttonWasTouched:(id)sender;
- (void)createTableView;

@end

@implementation RootViewController

@synthesize settingsBarButtonItem       = _settingsBarButtonItem;
@synthesize composeBarButtonItem        = _composeBarButtonItem;
@synthesize tableView                   = _tableView;
@synthesize backgroundImageView         = _backgroundImageView;
@synthesize backgroundImageViewShadow   = _backgroundImageViewShadow;

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
    
	// Create the custom nav bar, buttons, custom background, and table view
    [self setBackgroundImageForNavigationBar];
    [self createNavigationBarButtons];
    [self createTableView];
    
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
    self.settingsBarButtonItem = [self makeBarButtonItemWithImage:[UIImage imageNamed:@"settingsButton"] andFrame:CGRectMake(5.0f, 24.0f, 34.0f, 34.0f)];
    self.composeBarButtonItem  = [self makeBarButtonItemWithImage:[UIImage imageNamed:@"createButton"] andFrame:CGRectMake(281.0f, 24.0f, 34.0f, 34.0f)]; 
    
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

#pragma Table View Methods

- (void)createTableView
{
    // Create a custom background view to be visible behind the table view but not interfering with modal transitions
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    self.backgroundImageView.frame  = CGRectMake(0, 64, 320, 414);
    [self.view addSubview:self.backgroundImageView];
    
    // Custom shadow
    self.backgroundImageViewShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topBarShadow"]];
    self.backgroundImageViewShadow.frame  = CGRectMake(0, 64, 320, 1);
    [self.view addSubview:self.backgroundImageViewShadow];
    
    // Create the table view
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, 320, 436) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
}

#pragma Button Touch Detection methods

- (void)buttonWasTouched:(id)sender
{
    if (sender == self.settingsBarButtonItem) {
        
        // Create the view controller and make the transition flip horizontally
        SettingsViewController *settingsViewController = [[SettingsViewController alloc] init];
        settingsViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        [self presentModalViewController:settingsViewController animated:YES];
        
    } else if (sender == self.composeBarButtonItem) {
        NSLog(@"\nCompose button touched\n");
    }
}

@end

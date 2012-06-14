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

- (void)loadView
{
    [super loadView];

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
    self.closeButton = [self makeBarButtonItemWithImage:[UIImage imageNamed:@"buttonX"] andFrame:CGRectMake(8.0f, 7.0f, 31.0f, 31.0f)];
    
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
    self.backgroundImageViewShadow.frame  = CGRectMake(0, 44, 320, 1);
    [self.view addSubview:self.backgroundImageViewShadow];
    
    // Create the table view
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 45.0f, 320.0f, 436.0f) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
}

#pragma Table View Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:  return @"Connect to your favorite networks";
        case 1:  return @"About Simplr";
        default: return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0  : return 4;
//        case 1  : return 4;
        default : return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CELL_IDENTIFIER";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"Facebook";
                break;
            case 1:
                cell.textLabel.text = @"Twitter";
                break;
            case 2:
                cell.textLabel.text = @"Tumblr";
                break;
            case 3:
                cell.textLabel.text = @"Instagram";
                break;
            default:
                break;
        }
        
        // Add a switch to allow the user to turn the netorks on (login) or off (logout)
        UISwitch *useNetworkSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(200.0f, 11.0f, 50.0f, 10.0f)];
        useNetworkSwitch.onTintColor = [UIColor grayColor];
        [cell.contentView addSubview:useNetworkSwitch];
        
        // Customize the cell selection style
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Deselect the cell immediately
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
    }

}

#pragma Button Methods

- (void)buttonWasTouched:(id)sender
{
    if (sender == self.closeButton) {
        [self dismissModalViewControllerAnimated:YES];
    }
}

@end

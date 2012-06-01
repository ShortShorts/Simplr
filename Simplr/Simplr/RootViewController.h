//
//  RootViewController.h
//  Simplr
//
//  Created by Jordan Nelson on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRSlidingTableViewCell.h"

@interface RootViewController : UINavigationController
    <UITableViewDelegate,
     UITableViewDataSource,
     LRSlidingTableViewCellDelegate>

@end

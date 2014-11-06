//
//  ListViewController.h
//  Coredata Sample
//
//  Created by ravi kumar on 05/11/14.
//  Copyright (c) 2014 Venki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface ListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
}
@property(nonatomic,retain)NSMutableArray *devices;
@end

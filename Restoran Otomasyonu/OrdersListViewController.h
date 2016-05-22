//
//  OrdersListViewController.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 22/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "OrderObject.h"
#import "OrderHelper.h"
#import "ListObject.h"
#import "DailyListServer.h"
#import "OrderServer.h"

@interface OrdersListViewController : BaseViewController < UITableViewDelegate, UITableViewDataSource, OrderHelperDelegate, DailyListServerDelegate, OrderServerDelegate >

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)ordersDoneButtonPressed:(UIButton *)sender;

@property (nonatomic) int deskNumber;

-(instancetype)initWithhDeskNumber:(int)deskNumber;

@end

//
//  OrdersTableViewCell.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 22/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderObject.h"
#import "OrderHelper.h"

@interface OrdersTableViewCell : UITableViewCell <OrderHelperDelegate>

+(OrdersTableViewCell*)cellForTableView:(UITableView*)tableView;
@property (weak, nonatomic) IBOutlet UILabel *orderNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderPriceLabel;
@property (strong, nonatomic) OrderObject *deletingObject;
- (IBAction)orderCancelButtonPressed:(UIButton *)sender;
-(void)setupCellWithUsingOrderObject:(OrderObject*)order;
@end

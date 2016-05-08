//
//  DailyListTableViewCell.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 07/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListObject.h"

@interface DailyListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *deskNumber;
@property (weak, nonatomic) IBOutlet UILabel *priceNumber;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;

+(DailyListTableViewCell*)cellForTableView:(UITableView*)tableView;

-(void)setupCellWithListObject:(ListObject*)listObject;

@end

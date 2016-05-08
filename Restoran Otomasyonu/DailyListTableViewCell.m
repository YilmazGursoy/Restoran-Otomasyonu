//
//  DailyListTableViewCell.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 07/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "DailyListTableViewCell.h"

@implementation DailyListTableViewCell

+(DailyListTableViewCell*)cellForTableView:(UITableView*)tableView {

    DailyListTableViewCell *cell = (DailyListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"DailyCell"];
    
    if( cell == nil ) {
    
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DailyListTableViewCell" owner:self options:nil];
        
        cell = (DailyListTableViewCell*)[nib objectAtIndex:0];
    
    }
    
    return cell;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setupCellWithListObject:(ListObject*)listObject{
    
    self.deskNumber.text = [NSString stringWithFormat:@"%d",listObject.deskID];
    
    self.priceNumber.text = [NSString stringWithFormat:@"%.2f",listObject.totalPrice];

    self.dateLabel.text = listObject.date;
    
    self.hourLabel.text = listObject.hour;
    
}


@end

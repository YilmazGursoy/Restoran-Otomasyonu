//
//  OrdersTableViewCell.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 22/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "OrdersTableViewCell.h"

@implementation OrdersTableViewCell

+(OrdersTableViewCell*)cellForTableView:(UITableView*)tableView {
    
    OrdersTableViewCell *cell = (OrdersTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"OrdersListCellIdentifier"];
    
    if( cell == nil ) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OrdersTableViewCell" owner:self options:nil];
        
        cell = (OrdersTableViewCell*)[nib objectAtIndex:0];
        
    }
    
    return cell;
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setupCellWithUsingOrderObject:(OrderObject*)order {

    [self.orderNameLabel setText:order.productName];

    [self.orderPriceLabel setText:[NSString stringWithFormat:@"%.2f",order.totalPrice]];
    
    self.deletingObject = order;

}



- (IBAction)orderCancelButtonPressed:(UIButton *)sender {

    OrderHelper *sendRequest = [[OrderHelper alloc] initWithDelegate:self];
    
    [sendRequest orderDeleteWithOrderObject:self.deletingObject];
    
}

#pragma mark - OrderHelperDelegate

-(void)isSucceeded:(BOOL)isSucceeded{

    if( isSucceeded ) {
    
        NSLog(@"Deleting succeeded");
    
    } else {
    
        NSLog(@"There is an error deleting object");
    
    }

}

@end

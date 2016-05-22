//
//  DeskInsideTableViewCell.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 20/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "DeskInsideTableViewCell.h"
#import "OrderObject.h"
#import "Helper.h"

@interface DeskInsideTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *insideMeatNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *insideMeatPriceLabel;
@property (weak, nonatomic) IBOutlet UITextField *insideMeatCountTextField;
@property (weak, nonatomic) IBOutlet UIButton *insideMearAddButton;
@property (weak, nonatomic) ProductObject *productObject;
@property (nonatomic) int deskNumber;


- (IBAction)textFieldAction:(UITextField *)sender;
@end

@implementation DeskInsideTableViewCell

+(DeskInsideTableViewCell*)cellForTableView:(UITableView*)tableView {
    
    DeskInsideTableViewCell *cell = (DeskInsideTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"DeskInsideMeatCell"];
    
    if( cell == nil ) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DeskInsideTableViewCell" owner:self options:nil];
        
        cell = (DeskInsideTableViewCell*)[nib objectAtIndex:0];
        
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
- (IBAction)insideMeatAddButtonPressed:(UIButton *)sender {
    
    if( self.insideMeatCountTextField.text.length > 0 && ( self.insideMeatCountTextField.text.intValue > 0 && self.insideMeatCountTextField.text.intValue < 99)) {
        
        OrderObject *orderObject = [Helper changeProductObjectToOrderObject:self.productObject andDeskNumber:self.deskNumber andTextFieldCount:self.insideMeatCountTextField.text];
        
        OrderHelper *orderHelper = [[OrderHelper alloc] initWithDelegate:self];
        
        [orderHelper sendOrderDataFromClintToParseServer:orderObject];
        
    }
}

#pragma mark - SetupCell

-(void)setupCellWithProductObject:(ProductObject*)productObject andDeskNumber:(int)deskNumber {
    
    self.insideMeatCountTextField.delegate = self;
    
    [self.insideMeatNameLabel setText:productObject.productName];
    
    [self.insideMeatPriceLabel setText:[NSString stringWithFormat:@"%.2f",productObject.price]];
    
    self.productObject = productObject;
    
    self.deskNumber = deskNumber;
    
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [self.insideMeatCountTextField resignFirstResponder];
    
    return true;
}



- (IBAction)textFieldAction:(UITextField *)sender {
    
}

#pragma mark - OrderHelperDelegate

-(void)isSucceeded:(BOOL)isSucceeded{

    if( isSucceeded ) {
    
        self.insideMeatCountTextField.text = @"";
        [self.insideMeatCountTextField resignFirstResponder];
        
    
    } else {
    
        NSLog(@"Eklenilmesi Başarısızlık ile sonuçlandı");
    
    }

}


@end

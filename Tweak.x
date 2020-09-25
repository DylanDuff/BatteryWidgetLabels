@interface BCUIChargeRing : UIView
@property(nonatomic, assign, readwrite) NSInteger *percentCharge;
@property(nonatomic, retain) UILabel *chargeLabel;
@end

%hook BCUIChargeRing
%property (nonatomic, retain) UILabel *chargeLabel;
-(void)setGlyph:(id)arg1{
	%orig;
	if(!self.chargeLabel){
		if ([[self superview] superview].frame.size.width < 150){
			self.chargeLabel = [[UILabel alloc] initWithFrame:CGRectMake(14,33,30,30)];
		    [self addSubview:self.chargeLabel];
		}    
	}
	self.chargeLabel.layer.shadowOpacity = 0.9;
	self.chargeLabel.layer.shadowColor = [UIColor blackColor].CGColor;
	self.chargeLabel.layer.shadowOffset = CGSizeMake(0.5, 1.0);
	[self.chargeLabel setFont:[UIFont boldSystemFontOfSize:14]];
	self.chargeLabel.text = [NSString stringWithFormat:@"%d", (int)self.percentCharge];
    	self.chargeLabel.textAlignment = NSTextAlignmentCenter;

}
-(void)setPercentageCharge:(int)arg1{
	%orig;
	self.chargeLabel.text = [NSString stringWithFormat:@"%d", arg1];
}
%end

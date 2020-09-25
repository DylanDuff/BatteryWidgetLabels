@interface BCUIChargeRing : UIView
@property(nonatomic, assign, readwrite) NSInteger *percentCharge;
@property(nonatomic, retain) UILabel *nameLabel;
@end

%hook BCUIChargeRing
%property (nonatomic, retain) UILabel *nameLabel;
-(void)setGlyph:(id)arg1{
	%orig;
	if(!self.nameLabel){
		if ([[self superview] superview].frame.size.width < 150){
			self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(14,33,30,30)];
		    [self addSubview:self.nameLabel];
		}    
	}
	self.nameLabel.layer.shadowOpacity = 0.9;
	self.nameLabel.layer.shadowColor = [UIColor blackColor].CGColor;
	self.nameLabel.layer.shadowOffset = CGSizeMake(0.5, 1.0);
	[self.nameLabel setFont:[UIFont boldSystemFontOfSize:14]];
	self.nameLabel.text = [NSString stringWithFormat:@"%d", (int)self.percentCharge];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;

}
-(void)setPercentageCharge:(int)arg1{
	%orig;
	self.nameLabel.text = [NSString stringWithFormat:@"%d", arg1];
}
%end
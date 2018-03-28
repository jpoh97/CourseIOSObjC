//
//  FoodTableViewCell.m
//  CursoAcamica
//
//  Created by Juan Pablo Ospina Herrera on 3/27/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

#import "FoodTableViewCell.h"

@interface FoodTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;

@end

@implementation FoodTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setTitle:(NSString*) title description:(NSString*) description andImageName:(NSString*) imageName {
    [self.titleLabel setText:title];
    [self.descriptionLabel setText:description];
    [self.foodImageView setImage:[UIImage imageNamed:imageName]];
}

@end

//
//  FoodCollectionViewCell.m
//  CursoAcamica
//
//  Created by Juan Pablo Ospina Herrera on 3/27/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

#import "FoodCollectionViewCell.h"

@interface FoodCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *foodImageName;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation FoodCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) setTitle:(NSString*) title andImageName:(NSString*) imageName {
    [self.titleLabel setText:title];
    [self.foodImageName setImage:[UIImage imageNamed:imageName]];
}

@end

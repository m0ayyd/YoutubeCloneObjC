//
//  VideoCell.m
//  YoutubeCloneObjC
//
//  Created by the Luckiest on 7/13/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

#import "VideoCell.h"
#import "Video.h"
@interface VideoCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImg;
@property (weak, nonatomic) IBOutlet UIView *cellView;

@end
@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.cellView.layer.cornerRadius = 2.0;
    self.cellView.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor;
    self.cellView.layer.shadowOpacity = 0.8;
    self.cellView.layer.shadowRadius = 5.0;
    self.cellView.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configure:(nonnull Video *)video {
    self.titleLbl.text = video.title;
    self.descriptionLbl.text = video.videoDescription;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnailURL]]];
    self.thumbnailImg.image = image;
}

@end

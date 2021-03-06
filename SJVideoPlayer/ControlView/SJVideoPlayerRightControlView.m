//
//  SJVideoPlayerRightControlView.m
//  SJVideoPlayerProject
//
//  Created by BlueDancer on 2018/3/8.
//  Copyright © 2018年 SanJiang. All rights reserved.
//

#import "SJVideoPlayerRightControlView.h"
#import <Masonry/Masonry.h>
#import <SJUIFactory/SJUIFactory.h>


@interface SJVideoPlayerRightControlView ()

@property (nonatomic, strong, readonly) UIButton *editingBtn;

@end

@implementation SJVideoPlayerRightControlView

@synthesize editingBtn = _editingBtn;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( !self ) return nil;
    [self _rightSetupView];
    return self;
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(49, 49);
}

- (void)setFilmEditingBtnImage:(UIImage *)filmEditingBtnImage {
    _filmEditingBtnImage = filmEditingBtnImage;
    [self.editingBtn setImage:filmEditingBtnImage forState:UIControlStateNormal];
}

- (void)clickedBtn:(UIButton *)btn {
    if ( ![_delegate respondsToSelector:@selector(rightControlView:clickedBtnTag:)] ) return;
    [_delegate rightControlView:self clickedBtnTag:btn.tag];
}

- (void)_rightSetupView {
    [self addSubview:self.editingBtn];
    
    [_editingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self->_editingBtn.superview);
    }];
}

- (UIButton *)editingBtn {
    if ( _editingBtn ) return _editingBtn;
    _editingBtn = [SJUIButtonFactory buttonWithImageName:nil target:self sel:@selector(clickedBtn:) tag:SJVideoPlayerRightViewTag_FilmEditing];
    return _editingBtn;
}
@end

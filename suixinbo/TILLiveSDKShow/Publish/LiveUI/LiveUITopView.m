//
//  LiveUITopView.m
//  TILLiveSDKShow
//
//  Created by wilderliao on 16/11/9.
//  Copyright © 2016年 Tencent. All rights reserved.
//

#import "LiveUITopView.h"
#import "LiveViewController.h"

@implementation LiveUITopView

- (instancetype)initWith:(TCShowLiveListItem *)item isHost:(BOOL)isHost
{
    if (self = [super init])
    {
        _isHost = isHost;
        _liveItem = item;
        self.backgroundColor = [kColorBlack colorWithAlphaComponent:0.5];
        self.layer.cornerRadius = 25;
        [self addTopSubViews];
        [self addNotification];
    }
    return self;
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onParisePlus) name:kUserParise_Notification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAudiencePlus) name:kUserJoinRoom_Notification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAudienceLess) name:kUserExitRoom_Notification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onFreshAudience) name:kUserMemChange_Notification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(switchRoomRefresh:) name:kUserSwitchRoom_Notification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTopPure:) name:kPureDelete_Notification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTopNoPure:) name:kNoPureDelete_Notification object:nil];
}

- (void)onTopPure:(NSNotification *)noti
{
    self.hidden = YES;
}
- (void)onTopNoPure:(NSNotification *)noti
{
    self.hidden = NO;
}

- (void)switchRoomRefresh:(NSNotification *)noti
{
    _liveItem = (TCShowLiveListItem *)noti.object;
    _isHost = NO;
    _roomId.text = [NSString stringWithFormat:@"%ld",(long)_liveItem.info.roomnum];
    _timeLabel.text = _liveItem.uid;
    [self onFreshAudience];
}

- (void)addTopSubViews
{
    //top view
    _avatarView = [[UIImageView alloc] initWithImage:kDefaultUserIcon];
    _avatarView.layer.cornerRadius = 22;
    _avatarView.layer.masksToBounds = YES;
    [self addSubview:_avatarView];
    
    _netStatusBtn = [[UIButton alloc] init];
    [_netStatusBtn setBackgroundImage:[UIImage imageNamed:@"net3"] forState:UIControlStateNormal];
    [self addSubview:_netStatusBtn];
    
    _liveStatusBtn = [[UIButton alloc] init];
    _liveStatusBtn.layer.cornerRadius = 5;
    _liveStatusBtn.backgroundColor = kColorGreen;
    [self addSubview:_liveStatusBtn];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.adjustsFontSizeToFitWidth = YES;
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _timeLabel.text = _isHost ? @"00:00" : _liveItem.uid;
    [self addSubview:_timeLabel];
    _liveTime = 0;
    
    if (_isHost)
    {   
        [_liveTimer invalidate];
        _liveTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onLiveTimer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_liveTimer forMode:NSRunLoopCommonModes];
    }
    
    _liveAudienceBtn = [[UIButton alloc] init];
    [_liveAudienceBtn setTitle:[NSString stringWithFormat:@"%d",_liveItem.info.memsize] forState:UIControlStateNormal];//[NSString stringWithFormat:@"%ld",(long)_liveItem.admireCount]
    [_liveAudienceBtn setImage:[UIImage imageNamed:@"visitor_white"] forState:UIControlStateNormal];
    _liveAudienceBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    _liveAudienceBtn.titleLabel.font = kAppSmallTextFont;
    [_liveAudienceBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [self addSubview:_liveAudienceBtn];
    
    _livePraiseBtn = [[UIButton alloc] init];
    [_livePraiseBtn setTitle:[NSString stringWithFormat:@"%d",_liveItem.info.thumbup] forState:UIControlStateNormal];//[NSString stringWithFormat:@"%ld",(long)_liveItem.watchCount]
    [_livePraiseBtn setImage:[UIImage imageNamed:@"like_white"] forState:UIControlStateNormal];
    _livePraiseBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    _livePraiseBtn.titleLabel.font = kAppSmallTextFont;
    [_livePraiseBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [self addSubview:_livePraiseBtn];
    
    _roomId = [[UILabel alloc] init];
    _roomId.text = [NSString stringWithFormat:@"%ld",(long)_liveItem.info.roomnum];
    _roomId.textColor = kColorWhite;
    [self addSubview:_roomId];
}

- (void)onLiveTimer
{
    _liveTime++;
    NSString *durStr = nil;
    if (_liveTime > 3600)
    {
        int h = (int)_liveTime/3600;
        int m = (int)(_liveTime - h *3600)/60;
        int s = (int)_liveTime%60;
        durStr = [NSString stringWithFormat:@"%02d:%02d:%02d", h, m, s];
    }
    else
    {
        int m = (int)_liveTime/60;
        int s = (int)_liveTime%60;
        durStr = [NSString stringWithFormat:@"%02d:%02d", m, s];
    }
    _timeLabel.text = durStr;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_avatarView sizeWith:CGSizeMake(44, 44)];
    [_avatarView layoutParentVerticalCenter];
    [_avatarView alignParentLeftWithMargin:3];
    
    [_netStatusBtn sizeWith:CGSizeMake(20, 20)];
    [_netStatusBtn layoutToRightOf:_avatarView margin:5];
    [_netStatusBtn alignParentTopWithMargin:kDefaultMargin];
    
    [_liveStatusBtn sizeWith:CGSizeMake(22, 10)];
    [_liveStatusBtn layoutToRightOf:_avatarView margin:5];
    [_liveStatusBtn alignParentBottomWithMargin:kDefaultMargin];
    
    [_timeLabel sizeWith:CGSizeMake(15, 15)];
    [_timeLabel alignTop:_avatarView];
    [_timeLabel layoutToRightOf:_netStatusBtn margin:3];
    [_timeLabel scaleToParentRightWithMargin:10];

    [_liveAudienceBtn sizeWith:CGSizeMake(_timeLabel.bounds.size.width/2, _timeLabel.bounds.size.height)];
    [_liveAudienceBtn alignLeft:_timeLabel];
    [_liveAudienceBtn alignBottom:_avatarView];
    
    if (_isHost)
    {
        [_livePraiseBtn sameWith:_liveAudienceBtn];
        [_livePraiseBtn layoutToRightOf:_liveAudienceBtn];
    }
    
    [_roomId sizeWith:CGSizeMake(150, 30)];
    [_roomId layoutToRightOf:_timeLabel margin:20];
    [_roomId layoutParentVerticalCenter];
}

- (void)onParisePlus
{
    if (_isHost)
    {
        _liveItem.info.thumbup++;
        [_livePraiseBtn setTitle:[NSString stringWithFormat:@"%d",_liveItem.info.thumbup] forState:UIControlStateNormal];
        
//        NSString *info = [NSString stringWithFormat:@"%d",_liveItem.info.thumbup];
//        UIFont *font = kAppMiddleTextFont;
//        NSMutableAttributedString *thumbStr = [[NSMutableAttributedString alloc] initWithString:info];
//        [thumbStr addAttribute:NSForegroundColorAttributeName value:kColorWhite range:NSMakeRange(0, info.length)];
//        [thumbStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, info.length)];
//        
//        CGSize maxSize = CGSizeMake(100, _livePraiseBtn.titleLabel.frame.size.height);
//        CGSize size = [thumbStr boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;
//        [_livePraiseBtn.titleLabel setFrame:CGRectMake(_livePraiseBtn.frame.origin.x, _livePraiseBtn.frame.origin.y, size.width, size.height)];
    }
}

- (void)onAudiencePlus
{
    int curAudience = [_liveAudienceBtn.titleLabel.text intValue];
    curAudience++;
    [_liveAudienceBtn setTitle:[NSString stringWithFormat:@"%d",curAudience] forState:UIControlStateNormal];
}

//- (void)onAudienceLess
//{
//    int curAudience = [_liveAudienceBtn.titleLabel.text intValue];
//    curAudience--;
//    [_liveAudienceBtn setTitle:[NSString stringWithFormat:@"%d",curAudience] forState:UIControlStateNormal];
//}

- (void)onFreshAudience
{
    NSLog(@"audience2----->%d", _liveItem.info.memsize);
    [_liveAudienceBtn setTitle:[NSString stringWithFormat:@"%d",_liveItem.info.memsize] forState:UIControlStateNormal];
}
@end

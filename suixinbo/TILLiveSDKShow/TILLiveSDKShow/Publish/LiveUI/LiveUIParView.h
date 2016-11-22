//
//  LiveUIParView.h
//  TILLiveSDKShow
//
//  Created by wilderliao on 16/11/9.
//  Copyright © 2016年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InviteInteractDelegate <NSObject>

- (void)onInteract;

@end

@interface LiveUIParView : UIView
{
    UIButton    *_interactBtn;       //互动连线
    UIButton    *_parBtn;            //avsdk参数信息
    UIButton    *_pushStreamBtn;     //推流
    UIButton    *_recBtn;            //录制
    UIButton    *_speedBtn;          //测速
    
    UITextView  *_paramTextView;     //参数展示
}

@property (nonatomic, assign) BOOL isHost;
@property (nonatomic, weak) id<InviteInteractDelegate> delegate;

@end

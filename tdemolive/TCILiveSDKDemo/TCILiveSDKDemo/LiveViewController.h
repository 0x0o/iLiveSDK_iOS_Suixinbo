//
//  LiveViewController.h
//  TCILiveSDKDemo
//
//  Created by kennethmiao on 16/10/26.
//  Copyright © 2016年 kennethmiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILiveGLBaseView.h"

@interface LiveViewController : UIViewController
@property (nonatomic, assign) int roomId;
@property (nonatomic, strong) NSString *host;

- (IBAction)exitLive:(id)sender;
- (IBAction)sendMsg:(id)sender;
- (IBAction)inviteToVideo:(id)sender;
- (IBAction)cancelInvite:(id)sender;
- (IBAction)cancelToVideo:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *errLabel;
@property (weak, nonatomic) IBOutlet UITextField *textTextField;
@property (weak, nonatomic) IBOutlet UITextView *msgTextView;
@property (weak, nonatomic) IBOutlet UITextField *upVideoTextField;
@property (weak, nonatomic) IBOutlet UITextField *downVideoTextField;
@property (weak, nonatomic) IBOutlet UITextField *cancelVideoTextField;

@end

# ILiveSDK
ILiveSDK 提供了账号登录，音视频互动，文本互动等基础功能，顺利的话一天之内即可集成音视频能力。

支持以下场景     
>* [视频直播类]
类似now直播,映客 一人直播,多人观看,发文本消息,赞,送礼物。[具体参考TILLiveSDK](https://github.com/zhaoyang21cn/ILiveSDK_iOS_Demos/blob/master/TILLiveSDK-README.md)
>* [视频聊天类]
     类似微信视频通话功能呢,支持多人同时上麦(最多4路)。[具体参考TILCallSDK](https://github.com/zhaoyang21cn/CallSDK_iOS_Demo)

## SDK下载
1、[ILiveSDK1.5.0.1、TILLiveSDK1.1.2、IMSDK_2.5.4、QAVSDK_1.9.1.17下载(不带美颜)](	http://dldir1.qq.com/hudongzhibo/ILiveSDK/Frameworks(ILiveSDK1.5.0.1,TILLiveSDK1.1.2,IMSDK_2.5.4,QAVSDK_1.9.1.17).zip)

2、[内置美颜包QAVEffect下载](
http://dldir1.qq.com/hudongzhibo/ILiveSDK/QAVEffect.zip)

3、[美颜滤镜SDK(TILFilterSDK_1.2.3)下载](https://github.com/zhaoyang21cn/ILiveSDK_iOS_Suixinbo/blob/master/TILFilterSDK-README.md)

## SDK最近更新说明

###### V1.5.0(2017－6-5)
* 1、更新QAVSDK到1.9.1，实现美颜模块插件化(不需要美颜模块，则不添加QAVEffect即可；需要内置美颜，则导入QAVEffect里面所有内容，并添加系统库AssetsLibrary.framework)
* 2、修复频繁进退房间，crash问题
* 3、修复频繁进退房间，报1003错误问题
* 4、连麦画面，从4路增加到10路
* 5、修复切换分辨率会闪绿的问题
* 6、修复使用系统语音识别之后，观众端听不到声音的问题
* 7、优化日志打印模块

[更多版本更新信息](https://github.com/zhaoyang21cn/ILiveSDK_iOS_Demos/blob/master/doc/ILiveSDK_ChangeList.md)

## ILiveSDK导入

[ILiveSDK导入参考在这里](https://github.com/zhaoyang21cn/ILiveSDK_iOS_Demos/blob/master/ILiveSDK-README.md)

## DEMO
有两个示例 <br />
1 随心播 ：基于ILiveSDK接口重构的随心播   
2 简单直播 ：直播主线流程示例  <br />

## API文档
[API文档](https://zhaoyang21cn.github.io/iLiveSDK_Help/ios_help/)

## 错误码
[错误码表](https://github.com/zhaoyang21cn/ILiveSDK_Android_Demos/blob/master/doc/ILiveSDK/error.md)

## 直播外延

[美颜滤镜](https://github.com/zhaoyang21cn/ILiveSDK_iOS_Demos/blob/master/TILFilterSDK-README.md)

[大咖模式](https://github.com/zhaoyang21cn/suixinbo_doc/blob/master/%E5%A4%A7%E5%92%96%E6%A8%A1%E5%BC%8F.md)

[跨房连麦](https://github.com/zhaoyang21cn/ILiveSDK_iOS_Demos/blob/master/doc/%E8%B7%A8%E6%88%BF%E8%BF%9E%E9%BA%A6.md)

[滤镜，挂件，变声等](https://github.com/zhaoyang21cn/ILiveSDK_iOS_Demos/blob/master/doc/%E7%89%B9%E8%89%B2%E5%8A%9F%E8%83%BD.md)

## 已知问题

## 关键路径LOG
[关键路径LOG 请遇到问题先自行对比](https://github.com/zhaoyang21cn/suixinbo_doc/blob/master/doc2/log.md)

## 联系我们
技术支持QQ群：594923937 207177891

技术需求反馈：https://github.com/zhaoyang21cn/ILiveSDK_iOS_Demos/issues 

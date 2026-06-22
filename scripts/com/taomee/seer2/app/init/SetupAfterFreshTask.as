package com.taomee.seer2.app.init
{
   import com.taomee.seer2.app.actives.BingyiteSuperAct;
   import com.taomee.seer2.app.actives.DiamondTaskNewManager;
   import com.taomee.seer2.app.actives.LihuaAct;
   import com.taomee.seer2.app.actives.SkyFightManager;
   import com.taomee.seer2.app.actives.WaitNewYearSetup;
   import com.taomee.seer2.app.actives.WorshipPhenixAct;
   import com.taomee.seer2.app.actives.WorshipStoneCupAct;
   import com.taomee.seer2.app.activity.ActivityManager;
   import com.taomee.seer2.app.activity.processor.PetTeamActivity;
   import com.taomee.seer2.app.actor.ActorManager;
   import com.taomee.seer2.app.actor.data.CookieUserInfo;
   import com.taomee.seer2.app.common.RubbishCommon;
   import com.taomee.seer2.app.controller.MolecularPasswordController;
   import com.taomee.seer2.app.dream.DreamMapManager;
   import com.taomee.seer2.app.inventory.ItemManager;
   import com.taomee.seer2.app.manager.LocalMsgManager;
   import com.taomee.seer2.app.manager.LoginAwardManager;
   import com.taomee.seer2.app.manager.MeshBeastReviveManager;
   import com.taomee.seer2.app.manager.StatisticsManager;
   import com.taomee.seer2.app.morphSystem.MorphUpdate;
   import com.taomee.seer2.app.net.CommandSet;
   import com.taomee.seer2.app.net.Connection;
   import com.taomee.seer2.app.net.parser.Parser_1521;
   import com.taomee.seer2.app.net.parser.baseData.RankServerInfo;
   import com.taomee.seer2.app.offLineExp.OffLineExpSystem;
   import com.taomee.seer2.app.pet.MysteryNpcManager;
   import com.taomee.seer2.app.pet.PetItemUpdate;
   import com.taomee.seer2.app.popup.AlertManager;
   import com.taomee.seer2.app.processor.activity.anniversaryParade.ActivityAnniversaryParade;
   import com.taomee.seer2.app.processor.activity.deliciousFood.DeliciousFoodOnePickup;
   import com.taomee.seer2.app.processor.activity.diluControl.DiluManager;
   import com.taomee.seer2.app.processor.activity.evilBodyAct.EvilBodyAct;
   import com.taomee.seer2.app.processor.activity.fightPrev.FightPrevManager;
   import com.taomee.seer2.app.processor.activity.fishingMatch.FishingMatchManager;
   import com.taomee.seer2.app.processor.activity.leiYiWingFirstComeAct.LeiYiWingFirstComeAct;
   import com.taomee.seer2.app.processor.activity.miKaAndContractAct.MiKaAndContractAct;
   import com.taomee.seer2.app.processor.activity.npcPosHandle.NpcPosHandle;
   import com.taomee.seer2.app.processor.activity.pkKingCallAct.PkKingCallAct;
   import com.taomee.seer2.app.processor.activity.planet.PlanetManager;
   import com.taomee.seer2.app.processor.activity.sLianYuAct.SLianYuAct;
   import com.taomee.seer2.app.processor.activity.xegg.XeggHome;
   import com.taomee.seer2.app.processor.activity.yiXingFindAndFightAct.YiXingFindAndFightAct;
   import com.taomee.seer2.app.processor.activity.yiteFigthPve.YiTeEndingGetInfo;
   import com.taomee.seer2.app.processor.quest.Quest1InitNono;
   import com.taomee.seer2.app.rarePet.RarePetManager;
   import com.taomee.seer2.app.rightToolbar.RightToolbarConter;
   import com.taomee.seer2.core.cookie.SharedObjectManager;
   import com.taomee.seer2.core.log.Logger;
   import com.taomee.seer2.core.module.ModuleManager;
   import com.taomee.seer2.core.net.LittleEndianByteArray;
   import com.taomee.seer2.core.net.MessageEvent;
   import com.taomee.seer2.core.scene.LayerManager;
   import com.taomee.seer2.core.utils.URLUtil;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.SyncEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import flash.net.FileReference;
   import flash.net.SharedObject;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.utils.IDataInput;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import org.taomee.bean.BaseBean;
   
   public class SetupAfterFreshTask extends BaseBean
   {
      
      private static var _rankBtn:Sprite;
      
      private static var _rankPanel:Sprite;
      
      private static var _rankInpId:TextField;
      
      private static var _rankInpMin:TextField;
      
      private static var _rankInpMax:TextField;
      
      private static var _rankResultTxt:TextField;
      
      private static var _rankLogTxt:TextField;
      
      private static var _rankStatusTxt:TextField;
      
      private static var _rankResultScrollTrack:Sprite;
      
      private static var _rankResultScrollThumb:Sprite;
      
      private static var _replaceBtn:Sprite;
      
      private static var _replacePanel:Sprite;
      
      private static var _replaceInput:TextField;
      
      private static var _replaceCurrentTxt:TextField;
      
      private static var _replaceStatusTxt:TextField;
      
      private static var _replaceLogTxt:TextField;
      
      private static var _replaceLineTxt:TextField;
      
      private static var _replaceFileRef:FileReference;
      
      private static var _replaceProbeToggleBtn:Sprite;
      
      private static var _unifiedBtn:Sprite;
      
      private static var _unifiedPanel:Sprite;
      
      private static var _unifiedTargetInput:TextField;
      
      private static var _unifiedInpMin:TextField;
      
      private static var _unifiedInpMax:TextField;
      
      private static var _unifiedStatusTxt:TextField;
      
      private static var _unifiedLogTxt:TextField;
      
      private static var _unifiedLogScrollTrack:Sprite;
      
      private static var _unifiedLogScrollThumb:Sprite;
      
      private static var _unifiedFilterPanel:Sprite;
      
      private static var _unifiedFilterTxt:TextField;
      
      private static var _unifiedFilterScrollTrack:Sprite;
      
      private static var _unifiedFilterScrollThumb:Sprite;
      
      private static var _unifiedPauseBtn:Sprite;
      
      private static var _unifiedFileRef:FileReference;
      
      private static var _rankToolMounted:Boolean = false;
      
      private static var _rankRetryCount:int = 0;
      
      private static const RANK_MAX_RETRIES:int = 20;
      
      private static var _rankPanelMounted:Boolean = false;
      
      private static var _rankBusy:Boolean = false;
      
      private static var _rankLastClickMs:Number = 0;
      
      private static var _rankT0:int = 0;
      
      private static var _rankTimeoutId:uint = 0;
      
      private static var _rankLastResultText:String = "";
      
      private static var _rankLastUserIds:String = "";
      
      private static var _rankLastRankId:int = 9;
      
      private static var _rankLastMin:int = 0;
      
      private static var _rankLastMax:int = 100;
      
      private static var _rankImportToReplaceAfterResp:Boolean = false;
      
      private static var _rankImportToReplaceLabel:String = "";
      
      private static var _rankImportToReplaceFilterAfterResp:Boolean = false;
      
      private static var _rankImportToUnifiedAfterResp:Boolean = false;
      
      private static var _rankImportToUnifiedLabel:String = "";
      
      private static const RANK_COOLDOWN_MS:int = 1000;
      
      private static const RANK_TIMEOUT_MS:int = 8000;
      
      private static const RANK_MAX_BATCH:int = 1000;
      
      private static const RANK_PANEL_W:int = 640;
      
      private static const RANK_PANEL_H:int = 540;
      
      private static const RES_SB_W:int = 8;
      
      private static const RES_SB_GAP:int = 4;
      
      private static var _rankSbDragging:Boolean = false;
      
      private static var _rankSbDragOffsetY:Number = 0;
      
      private static var _rankBtnDownX:Number = 0;
      
      private static var _rankBtnDownY:Number = 0;
      
      private static var _rankBtnDownTime:int = 0;
      
      private static var _rankBtnDragging:Boolean = false;
      
      private static const RANK_BTN_CLICK_DIST:Number = 4;
      
      private static const RANK_BTN_CLICK_MS:int = 250;
      
      private static var _gmailDebounceTimer:uint = 0;
      
      private static var _gmailOpenTimer:uint = 0;
      
      private static var _gmailReplyTimer:uint = 0;
      
      private static var _gmailWaitingReply:Boolean = false;
      
      private static var _gmailFailureShown:Boolean = false;
      
      private static var _gmailRequestSeq:int = 0;
      
      private static var _gmailActiveRequestId:int = 0;
      
      private static var _gmailOpenUserId:int = 0;
      
      private static const GMAIL_OPEN_DELAY_MS:int = 100;
      
      private static const GMAIL_REFRESH_TIMEOUT_MS:int = 6000;
      
      private static const REPLACE_DEFAULT_VALUE:int = 80003212;
      
      private static var _currentReplaceValue:int = REPLACE_DEFAULT_VALUE;
      
      private static var _replaceTimer:uint = 0;
      
      private static var _replacePendingValue:int = REPLACE_DEFAULT_VALUE;
      
      private static var _replaceValues:Array = [REPLACE_DEFAULT_VALUE];
      
      private static var _replaceCurrentIndex:int = 0;
      
      private static var _replaceBtnDownX:Number = 0;
      
      private static var _replaceBtnDownY:Number = 0;
      
      private static var _replaceBtnDownTime:int = 0;
      
      private static var _replaceAutoOpened:Boolean = false;
      
      private static var _replaceProbeFilterEnabled:Boolean = false;
      
      private static const REPLACE_PANEL_W:int = 420;
      
      private static const REPLACE_PANEL_H:int = 390;
      
      private static const REPLACE_DEBOUNCE_MS:int = 160;
      
      private static var _replaceProbeQueue:Array = [];
      
      private static var _replaceProbePassed:Array = [];
      
      private static var _replaceProbeIndex:int = 0;
      
      private static var _replaceProbeSeq:int = 0;
      
      private static var _replaceProbeActiveSeq:int = 0;
      
      private static var _replaceProbeTimer:uint = 0;
      
      private static var _replaceProbeLabel:String = "";
      
      private static var _replaceProbeOriginalValue:int = REPLACE_DEFAULT_VALUE;
      
      private static const REPLACE_PROBE_TIMEOUT_MS:int = 4200;
      
      private static const REPLACE_PROBE_GAP_MS:int = 80;
      
      private static var _unifiedBtnDownX:Number = 0;
      
      private static var _unifiedBtnDownY:Number = 0;
      
      private static var _unifiedBtnDownTime:int = 0;
      
      private static var _unifiedAutoOpened:Boolean = false;
      
      private static var _unifiedLogSbDragging:Boolean = false;
      
      private static var _unifiedLogSbDragOffsetY:Number = 0;
      
      private static var _unifiedFilterSbDragging:Boolean = false;
      
      private static var _unifiedFilterSbDragOffsetY:Number = 0;
      
      private static var _unifiedCategoryBtns:Array = [];
      
      private static var _syncingRankRange:Boolean = false;
      
      private static var _unifiedIds:Array = [];
      
      private static var _unifiedAllRows:Array = [];
      
      private static var _unifiedRows:Array = [];
      
      private static var _unifiedEmptyRows:Array = [];
      
      private static var _unifiedMailList:Array = [];
      
      private static var _unifiedAccountIndex:int = 0;
      
      private static var _unifiedMailIndex:int = 0;
      
      private static var _unifiedTotal:int = 0;
      
      private static var _unifiedMailCount:int = 0;
      
      private static var _unifiedTarget:int = 0;
      
      private static var _unifiedStopAtTarget:Boolean = false;
      
      private static var _unifiedRunning:Boolean = false;
      
      private static var _unifiedPaused:Boolean = false;
      
      private static var _unifiedPhase:String = "";
      
      private static var _unifiedCategory:String = "diamond";
      
      private static var _unifiedTimer:uint = 0;
      
      private static var _unifiedOpRows:Array = [];
      
      private static var _unifiedOpIndex:int = 0;
      
      private static var _unifiedOpDeleteAfter:Boolean = false;
      
      private static var _unifiedOpMode:String = "";
      
      private static var _unifiedProbeQueue:Array = [];
      
      private static var _unifiedProbePassed:Array = [];
      
      private static var _unifiedProbeIndex:int = 0;
      
      private static var _unifiedProbeTimer:uint = 0;
      
      private static var _unifiedProbeLabel:String = "";
      
      private static var _unifiedRankScanActive:Boolean = false;
      
      private static var _unifiedRankScanQueue:Array = [];
      
      private static var _unifiedRankScanIndex:int = 0;
      
      private static var _unifiedRankScanSeen:Object = {};
      
      private static var _unifiedRankScanFilterEnabled:Boolean = false;
      
      private static var _unifiedFilteredRows:Array = [];
      
      private static const UNIFIED_MODE_DIAMOND:String = "diamond";
      
      private static const UNIFIED_MODE_SCAN_ALL:String = "scanAll";
      
      private static const UNIFIED_MODE_FEATHER:String = "feather";
      
      private static const UNIFIED_MODE_GOLD_BOX:String = "goldBox";
      
      private static const UNIFIED_MODE_SILVER_BOX:String = "silverBox";
      
      private static const UNIFIED_MODE_BRONZE_BOX:String = "bronzeBox";
      
      private static const UNIFIED_MODE_EMPTY:String = "empty";
      
      private static const UNIFIED_MODE_ALL:String = "all";
      
      private static const UNIFIED_MODE_CONTENT:String = "content";
      
      private static const UNIFIED_PANEL_W:int = 760;
      
      private static const UNIFIED_PANEL_H:int = 560;
      
      private static const UNIFIED_TIMEOUT_MS:int = 5000;
      
      private static const UNIFIED_GAP_MS:int = 90;
      
      public function SetupAfterFreshTask()
      {
         super();
      }
      
      public static function getReplaceTestValue() : int
      {
         return _currentReplaceValue;
      }
      
      private static function _scheduleGmailPanelRefresh(targetUserId:int = 0) : void
      {
         try
         {
            _cleanupGmailRefreshWatch();
            ++_gmailRequestSeq;
            _gmailActiveRequestId = _gmailRequestSeq;
            _gmailOpenUserId = targetUserId > 0 ? targetUserId : _currentReplaceValue;
            _gmailFailureShown = false;
            _replaceLog("[邮箱] 请求 #" + _gmailActiveRequestId + " 使用米米号 " + _gmailOpenUserId + "，准备打开邮箱");
            try
            {
               ModuleManager.closeForName("GmailPanel");
            }
            catch(eClose:Error)
            {
            }
            _gmailOpenTimer = setTimeout(_openScheduledGmailPanel,GMAIL_OPEN_DELAY_MS);
         }
         catch(e:Error)
         {
            _replaceLog("[邮箱] 打开 GmailPanel 失败：" + e.message);
         }
      }
      
      private static function _doRefreshGmailPanel() : void
      {
         try
         {
            _replaceLog("[邮箱] 执行原始 showModule");
            _openGmailPanel();
         }
         catch(e:Error)
         {
            _replaceLog("[邮箱] 打开 GmailPanel 失败：" + e.message);
         }
      }
      
      private static function _openGmailPanel() : void
      {
         try
         {
            _gmailOpenTimer = 0;
            ModuleManager.showModule(URLUtil.getAppModule("GmailPanel"),"");
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _openScheduledGmailPanel() : void
      {
         var reqId:int = _gmailActiveRequestId;
         var targetId:int = _gmailOpenUserId;
         try
         {
            _gmailOpenTimer = 0;
            if(targetId > 0 && _currentReplaceValue != targetId)
            {
               _replaceLog("[邮箱] 忽略过期请求 #" + reqId + "，目标=" + targetId + " 当前=" + _currentReplaceValue);
               return;
            }
            _syncRuntimeUserIdForGmail(targetId);
            _replaceLog("[邮箱] 请求 #" + reqId + " 使用米米号 " + targetId + " 打开邮箱");
            _openGmailPanel();
         }
         catch(e:Error)
         {
            _replaceLog("[邮箱] 请求 #" + reqId + " 打开失败：" + e.message);
         }
      }
      
      private static function _syncRuntimeUserIdForGmail(userId:int) : void
      {
         if(userId <= 0)
         {
            return;
         }
         try
         {
            if(LoginInfo.userInfo != null)
            {
               LoginInfo.userInfo.id = userId;
            }
         }
         catch(eLogin:Error)
         {
         }
         try
         {
            if(ActorManager.actorInfo != null)
            {
               ActorManager.actorInfo.id = userId;
            }
         }
         catch(eInfo:Error)
         {
         }
         try
         {
            if(ActorManager.getActor() != null)
            {
               ActorManager.getActor().id = userId;
            }
         }
         catch(eActor:Error)
         {
         }
         try
         {
            if(ActorManager.getActor() != null && ActorManager.getActor().getInfo() != null)
            {
               ActorManager.getActor().getInfo().id = userId;
            }
         }
         catch(eActorInfo:Error)
         {
         }
      }
      
      private static function _onGmailRefreshReply(e:MessageEvent = null) : void
      {
         var reqId:int;
         if(!_gmailWaitingReply)
         {
            _replaceLog("[邮箱] 忽略过期回包");
            return;
         }
         reqId = _gmailActiveRequestId;
         _gmailWaitingReply = false;
         _cleanupGmailRefreshWatch(false);
         _replaceLog("[邮箱] 请求 #" + reqId + " 成功，收到邮箱回包");
         try
         {
            if(ModuleManager.getModuleStatus("GmailPanel") == "show")
            {
               _replaceLog("[邮箱] 请求 #" + reqId + "：GmailPanel 已打开");
            }
            else
            {
               _replaceLog("[邮箱] 请求 #" + reqId + "：等待 GmailPanel 原始 showPanel");
               _gmailOpenTimer = setTimeout(_ensureGmailPanelVisible,500);
            }
         }
         catch(e:Error)
         {
            _replaceLog("[邮箱] 请求 #" + reqId + "：GmailPanel 状态未知，稍后确认");
            _gmailOpenTimer = setTimeout(_ensureGmailPanelVisible,500);
         }
      }
      
      private static function _onGmailRefreshTimeout() : void
      {
         _gmailReplyTimer = 0;
         if(!_gmailWaitingReply)
         {
            return;
         }
         var reqId:int = _gmailActiveRequestId;
         _gmailWaitingReply = false;
         _cleanupGmailRefreshWatch(false);
         _replaceLog("[邮箱] 请求 #" + reqId + " 超时");
         _showGmailRefreshFailed();
      }
      
      private static function _onGmailRefreshError(e:MessageEvent) : void
      {
         if(!_gmailWaitingReply)
         {
            return;
         }
         var reqId:int = _gmailActiveRequestId;
         _gmailWaitingReply = false;
         _cleanupGmailRefreshWatch(false);
         _replaceLog("[邮箱] 请求 #" + reqId + " 失败");
         _showGmailRefreshFailed();
      }
      
      private static function _showGmailRefreshFailed() : void
      {
         try
         {
            if(_gmailFailureShown)
            {
               return;
            }
            _gmailFailureShown = true;
            AlertManager.showAlert("无法打开邮箱，请更换账号或重新尝试");
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _ensureGmailPanelVisible() : void
      {
         try
         {
            _gmailOpenTimer = 0;
            if(ModuleManager.getModuleStatus("GmailPanel") == "show")
            {
               _replaceLog("[邮箱] GmailPanel 已打开");
               return;
            }
            _replaceLog("[邮箱] GmailPanel 未打开，执行 showModule");
            _openGmailPanel();
         }
         catch(e:Error)
         {
            _openGmailPanel();
         }
      }
      
      private static function _cleanupGmailRefreshWatch(resetWaiting:Boolean = true) : void
      {
         try
         {
            if(_gmailDebounceTimer != 0)
            {
               try
               {
                  clearTimeout(_gmailDebounceTimer);
               }
               catch(eDebounce:Error)
               {
               }
               _gmailDebounceTimer = 0;
            }
            if(_gmailReplyTimer != 0)
            {
               try
               {
                  clearTimeout(_gmailReplyTimer);
               }
               catch(eTimer:Error)
               {
               }
               _gmailReplyTimer = 0;
            }
            if(_gmailOpenTimer != 0)
            {
               try
               {
                  clearTimeout(_gmailOpenTimer);
               }
               catch(eOpenTimer:Error)
               {
               }
               _gmailOpenTimer = 0;
            }
            try
            {
               Connection.removeCommandListener(CommandSet.GET_MAIL_LIST_DATA,_onGmailRefreshReply);
            }
            catch(eRemoveCmd:Error)
            {
            }
            try
            {
               Connection.removeErrorHandler(CommandSet.GET_MAIL_LIST_DATA,_onGmailRefreshError);
            }
            catch(eRemove:Error)
            {
            }
            if(resetWaiting)
            {
               _gmailWaitingReply = false;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _tryMountRankTool() : void
      {
         var parent:DisplayObjectContainer;
         try
         {
            parent = _pickRankParent();
            if(parent == null)
            {
               if(_rankRetryCount < RANK_MAX_RETRIES)
               {
                  _rankRetryCount += 1;
                  try
                  {
                     setTimeout(_tryMountRankTool,500);
                  }
                  catch(eR:Error)
                  {
                  }
               }
               return;
            }
            if(_rankBtn == null)
            {
               _rankBtn = _createRankEntryButton();
            }
            if(_rankBtn.parent == null)
            {
               parent.addChild(_rankBtn);
            }
            if(_replaceBtn == null)
            {
               _replaceBtn = _createReplaceEntryButton();
            }
            if(_replaceBtn.parent == null)
            {
               parent.addChild(_replaceBtn);
            }
            if(_unifiedBtn == null)
            {
               _unifiedBtn = _createUnifiedEntryButton();
            }
            if(_unifiedBtn.parent == null)
            {
               parent.addChild(_unifiedBtn);
            }
            try
            {
               parent.setChildIndex(_rankBtn,parent.numChildren - 1);
            }
            catch(eTop:Error)
            {
            }
            try
            {
               parent.setChildIndex(_replaceBtn,parent.numChildren - 1);
            }
            catch(eTop2:Error)
            {
            }
            try
            {
               parent.setChildIndex(_unifiedBtn,parent.numChildren - 1);
            }
            catch(eTop3:Error)
            {
            }
            _layoutRankBtn();
            _layoutReplaceBtn();
            _layoutUnifiedBtn();
            if(!_unifiedAutoOpened)
            {
               _unifiedAutoOpened = true;
               try
               {
                  setTimeout(_openUnifiedPanel,250);
               }
               catch(eOpen:Error)
               {
               }
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _pickRankParent() : DisplayObjectContainer
      {
         var c:DisplayObjectContainer;
         try
         {
            c = LayerManager.topLayer;
            if(c != null)
            {
               return c;
            }
         }
         catch(e1:Error)
         {
         }
         try
         {
            c = LayerManager.dialogLayer;
            if(c != null)
            {
               return c;
            }
         }
         catch(e2:Error)
         {
         }
         try
         {
            c = LayerManager.uiLayer;
            if(c != null)
            {
               return c;
            }
         }
         catch(e3:Error)
         {
         }
         try
         {
            c = LayerManager.stage;
            if(c != null)
            {
               return c;
            }
         }
         catch(e4:Error)
         {
         }
         return null;
      }
      
      private static function _layoutRankBtn() : void
      {
         var sw:Number;
         try
         {
            sw = 0;
            try
            {
               if(LayerManager.stage != null)
               {
                  sw = LayerManager.stage.stageWidth;
               }
            }
            catch(eS:Error)
            {
            }
            if(sw <= 0)
            {
               _rankBtn.x = 1000;
               _rankBtn.y = 100;
               return;
            }
            _rankBtn.x = _rankReadNumber("btnX",sw - 70);
            _rankBtn.y = _rankReadNumber("btnY",100);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _layoutReplaceBtn() : void
      {
         var sw:Number;
         try
         {
            sw = 0;
            try
            {
               if(LayerManager.stage != null)
               {
                  sw = LayerManager.stage.stageWidth;
               }
            }
            catch(eS:Error)
            {
            }
            if(sw <= 0)
            {
               _replaceBtn.x = 1000;
               _replaceBtn.y = 130;
               return;
            }
            _replaceBtn.x = _replaceReadNumber("btnX",sw - 70);
            _replaceBtn.y = _replaceReadNumber("btnY",130);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _layoutUnifiedBtn() : void
      {
         var sw:Number;
         try
         {
            sw = 0;
            try
            {
               if(LayerManager.stage != null)
               {
                  sw = LayerManager.stage.stageWidth;
               }
            }
            catch(eS:Error)
            {
            }
            if(sw <= 0)
            {
               _unifiedBtn.x = 1000;
               _unifiedBtn.y = 160;
               return;
            }
            _unifiedBtn.x = _unifiedReadNumber("btnX",sw - 78);
            _unifiedBtn.y = _unifiedReadNumber("btnY",160);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _createRankEntryButton() : Sprite
      {
         var bg:Shape;
         var lbl:TextField;
         var f:TextFormat;
         var btn:Sprite = new Sprite();
         try
         {
            btn.mouseEnabled = true;
            btn.mouseChildren = false;
            btn.buttonMode = true;
            btn.useHandCursor = true;
            btn.tabEnabled = false;
            bg = new Shape();
            bg.graphics.beginFill(658970,0.92);
            bg.graphics.lineStyle(1,2282478,0.85);
            bg.graphics.drawRoundRect(0,0,56,24,8,8);
            bg.graphics.endFill();
            btn.addChild(bg);
            lbl = new TextField();
            lbl.x = 0;
            lbl.y = 3;
            lbl.width = 56;
            lbl.height = 20;
            lbl.selectable = false;
            lbl.mouseEnabled = false;
            lbl.background = false;
            lbl.border = false;
            f = new TextFormat();
            f.size = 12;
            f.color = 2282478;
            f.bold = true;
            f.align = "center";
            f.font = "_sans";
            lbl.defaultTextFormat = f;
            lbl.text = "1521";
            btn.addChild(lbl);
            btn.addEventListener(MouseEvent.MOUSE_DOWN,_onRankBtnMouseDown,false,0,true);
            btn.addEventListener(MouseEvent.MOUSE_UP,_onRankBtnMouseUp,false,0,true);
         }
         catch(e:Error)
         {
         }
         return btn;
      }
      
      private static function _createReplaceEntryButton() : Sprite
      {
         var bg:Shape;
         var lbl:TextField;
         var f:TextFormat;
         var btn:Sprite = new Sprite();
         try
         {
            btn.mouseEnabled = true;
            btn.mouseChildren = false;
            btn.buttonMode = true;
            btn.useHandCursor = true;
            btn.tabEnabled = false;
            bg = new Shape();
            bg.graphics.beginFill(1120295,0.92);
            bg.graphics.lineStyle(1,16096779,0.85);
            bg.graphics.drawRoundRect(0,0,56,24,8,8);
            bg.graphics.endFill();
            btn.addChild(bg);
            lbl = new TextField();
            lbl.x = 0;
            lbl.y = 3;
            lbl.width = 56;
            lbl.height = 20;
            lbl.selectable = false;
            lbl.mouseEnabled = false;
            f = new TextFormat();
            f.size = 12;
            f.color = 16498468;
            f.bold = true;
            f.align = "center";
            f.font = "_sans";
            lbl.defaultTextFormat = f;
            lbl.text = "替换";
            btn.addChild(lbl);
            btn.addEventListener(MouseEvent.MOUSE_DOWN,_onReplaceBtnMouseDown,false,0,true);
            btn.addEventListener(MouseEvent.MOUSE_UP,_onReplaceBtnMouseUp,false,0,true);
         }
         catch(e:Error)
         {
         }
         return btn;
      }
      
      private static function _createUnifiedEntryButton() : Sprite
      {
         var bg:Shape;
         var lbl:TextField;
         var f:TextFormat;
         var btn:Sprite = new Sprite();
         try
         {
            btn.mouseEnabled = true;
            btn.mouseChildren = false;
            btn.buttonMode = true;
            btn.useHandCursor = true;
            btn.tabEnabled = false;
            bg = new Shape();
            bg.graphics.beginFill(658970,0.92);
            bg.graphics.lineStyle(1,2278750,0.85);
            bg.graphics.drawRoundRect(0,0,68,24,8,8);
            bg.graphics.endFill();
            btn.addChild(bg);
            lbl = new TextField();
            lbl.x = 0;
            lbl.y = 3;
            lbl.width = 68;
            lbl.height = 20;
            lbl.selectable = false;
            lbl.mouseEnabled = false;
            lbl.background = false;
            lbl.border = false;
            f = new TextFormat();
            f.size = 12;
            f.color = 2278750;
            f.bold = true;
            f.align = "center";
            f.font = "_sans";
            lbl.defaultTextFormat = f;
            lbl.text = "大一统";
            btn.addChild(lbl);
            btn.addEventListener(MouseEvent.MOUSE_DOWN,_onUnifiedBtnMouseDown,false,0,true);
            btn.addEventListener(MouseEvent.MOUSE_UP,_onUnifiedBtnMouseUp,false,0,true);
         }
         catch(e:Error)
         {
         }
         return btn;
      }
      
      private static function _onRankBtnClick(e:MouseEvent) : void
      {
         try
         {
            if(_rankPanel != null && _rankPanel.parent != null)
            {
               _closeRankPanel();
            }
            else
            {
               _openRankPanel();
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onReplaceEntryClick(e:MouseEvent) : void
      {
         try
         {
            if(_replacePanel != null && _replacePanel.parent != null)
            {
               _closeReplacePanel();
            }
            else
            {
               _openReplacePanel();
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onUnifiedEntryClick(e:MouseEvent) : void
      {
         try
         {
            if(_unifiedPanel != null && _unifiedPanel.parent != null)
            {
               _closeUnifiedPanel();
            }
            else
            {
               _openUnifiedPanel();
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _openReplacePanel() : void
      {
         var parent:DisplayObjectContainer;
         var wasAttached:Boolean;
         var sw:Number;
         var sh:Number;
         try
         {
            parent = _pickRankParent();
            if(parent == null)
            {
               return;
            }
            wasAttached = _replacePanel != null && _replacePanel.parent != null;
            if(_replacePanel == null)
            {
               _replacePanel = _buildReplacePanel();
            }
            if(_replacePanel.parent == null)
            {
               parent.addChild(_replacePanel);
            }
            try
            {
               parent.setChildIndex(_replacePanel,parent.numChildren - 1);
            }
            catch(eT:Error)
            {
            }
            if(!wasAttached)
            {
               try
               {
                  sw = LayerManager.stage != null ? LayerManager.stage.stageWidth : 1280;
                  sh = LayerManager.stage != null ? LayerManager.stage.stageHeight : 720;
                  _replacePanel.x = _replaceReadNumber("panelX",(sw - REPLACE_PANEL_W) / 2);
                  _replacePanel.y = _replaceReadNumber("panelY",(sh - REPLACE_PANEL_H) / 2);
               }
               catch(eP:Error)
               {
               }
            }
            _syncReplacePanel();
            if(!wasAttached)
            {
               _replaceLog("面板已初始化");
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _closeReplacePanel() : void
      {
         try
         {
            if(_replacePanel != null && _replacePanel.parent != null)
            {
               _replacePanel.parent.removeChild(_replacePanel);
            }
         }
         catch(e:Error)
         {
         }
         try
         {
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onReplacePanelDragEnd);
            }
            if(_replacePanel != null)
            {
               _replacePanel.stopDrag();
            }
         }
         catch(_:Error)
         {
         }
      }
      
      private static function _buildReplacePanel() : Sprite
      {
         var bg:Shape;
         var dragHandle:Sprite;
         var lbg:Shape;
         var lf:TextFormat;
         var p:Sprite = new Sprite();
         try
         {
            p.name = "replacePanel";
            p.mouseEnabled = true;
            p.addEventListener(MouseEvent.MOUSE_DOWN,_onReplacePanelMouseDown,false,0,true);
            bg = new Shape();
            bg.name = "replaceDragBg";
            bg.graphics.beginFill(658970,0.96);
            bg.graphics.lineStyle(1,16096779,0.65);
            bg.graphics.drawRoundRect(0,0,REPLACE_PANEL_W,REPLACE_PANEL_H,8,8);
            bg.graphics.endFill();
            bg.graphics.beginFill(16096779,0.08);
            bg.graphics.drawRect(1,1,REPLACE_PANEL_W - 2,28);
            bg.graphics.endFill();
            p.addChild(bg);
            dragHandle = new Sprite();
            dragHandle.name = "replaceDragHandle";
            dragHandle.graphics.beginFill(16777215,0);
            dragHandle.graphics.drawRect(0,0,REPLACE_PANEL_W - 32,28);
            dragHandle.graphics.endFill();
            p.addChild(dragHandle);
            p.addChild(_rankMakeLabel("80003212 实时替换",10,6,REPLACE_PANEL_W - 60,18,16498468,12,true));
            p.addChild(_rankMakeBtn(REPLACE_PANEL_W - 28,4,22,22,"X",15680580,_onReplaceCloseClick));
            p.addChild(_rankMakeLabel("当前值:",14,44,70,18,9741240,11));
            _replaceCurrentTxt = _rankMakeLabel("",86,44,190,18,14870768,11,true);
            p.addChild(_replaceCurrentTxt);
            _replaceLineTxt = _rankMakeLabel("",286,44,120,18,16498468,11,true);
            p.addChild(_replaceLineTxt);
            p.addChild(_rankMakeLabel("新数值:",14,74,80,18,9741240,11));
            _replaceInput = _rankMakeInput(96,70,170,24);
            _replaceInput.height = 110;
            _replaceInput.multiline = true;
            _replaceInput.wordWrap = false;
            _replaceInput.mouseWheelEnabled = true;
            _replaceInput.restrict = null;
            _replaceInput.borderColor = 2282478;
            _replaceInput.text = _replaceSerializeValues();
            p.addChild(_replaceInput);
            p.addChild(_rankMakeBtn(278,70,30,24,"<",2282478,_onReplacePrevClick));
            p.addChild(_rankMakeBtn(314,70,30,24,">",2282478,_onReplaceNextClick));
            p.addChild(_rankMakeBtn(350,70,56,24,"导入",16096779,_onReplaceImportClick));
            p.addChild(_rankMakeBtn(278,104,62,24,"替换",16096779,_onReplaceApplyClick));
            p.addChild(_rankMakeBtn(346,104,60,24,"默认",16096779,_onReplaceRestoreClick));
            p.addChild(_rankMakeBtn(278,138,128,24,"导出TXT",16096779,_onReplaceExportClick));
            p.addChild(_rankMakeLabel("快速榜单:",14,202,70,18,9741240,10));
            p.addChild(_rankMakeBtn(84,200,64,22,"大乱斗",2282478,_onReplaceRank9));
            p.addChild(_rankMakeBtn(154,200,64,22,"神魔榜",2282478,_onReplaceRank71));
            p.addChild(_rankMakeBtn(224,200,48,22,"十字",2282478,_onReplaceRank131));
            p.addChild(_rankMakeBtn(278,200,48,22,"天空",16096779,_onReplaceRankSky));
            p.addChild(_rankMakeBtn(332,200,48,22,"勇者",16096779,_onReplaceRankBrave));
            p.addChild(_rankMakeBtn(84,228,48,22,"王者",16096779,_onReplaceRankKing));
            p.addChild(_rankMakeBtn(138,228,48,22,"巅峰",16096779,_onReplaceRankPeak));
            p.addChild(_rankMakeBtn(192,228,48,22,"无擒",16096779,_onReplaceRankQin));
            p.addChild(_rankMakeBtn(246,228,48,22,"御风",16096779,_onReplaceRankYufeng));
            _replaceProbeToggleBtn = _rankMakeBtn(300,228,106,22,"过滤邮箱:关",9741240,_onReplaceProbeToggleClick);
            p.addChild(_replaceProbeToggleBtn);
            p.addChild(_rankMakeBtn(278,166,128,24,"大一统",2278750,_onUnifiedOpenClick));
            _replaceStatusTxt = _rankMakeLabel("状态：待命",14,262,REPLACE_PANEL_W - 28,18,9741240,10);
            p.addChild(_replaceStatusTxt);
            lbg = new Shape();
            lbg.graphics.beginFill(0,0.45);
            lbg.graphics.lineStyle(1,16096779,0.22);
            lbg.graphics.drawRoundRect(10,284,REPLACE_PANEL_W - 20,88,4,4);
            lbg.graphics.endFill();
            p.addChild(lbg);
            _replaceLogTxt = new TextField();
            _replaceLogTxt.x = 14;
            _replaceLogTxt.y = 288;
            _replaceLogTxt.width = REPLACE_PANEL_W - 28;
            _replaceLogTxt.height = 80;
            _replaceLogTxt.multiline = true;
            _replaceLogTxt.wordWrap = true;
            _replaceLogTxt.background = false;
            _replaceLogTxt.border = false;
            _replaceLogTxt.type = TextFieldType.DYNAMIC;
            _replaceLogTxt.selectable = true;
            lf = new TextFormat();
            lf.font = "Consolas";
            lf.size = 10;
            lf.color = 13358561;
            _replaceLogTxt.defaultTextFormat = lf;
            _replaceLogTxt.text = "[日志] 默认值 = 80003212\n";
            p.addChild(_replaceLogTxt);
         }
         catch(e:Error)
         {
         }
         return p;
      }
      
      private static function _onReplaceBtnMouseDown(e:MouseEvent) : void
      {
         var sw:Number;
         var sh:Number;
         try
         {
            if(_replaceBtn == null)
            {
               return;
            }
            _replaceBtnDownX = _replaceBtn.x;
            _replaceBtnDownY = _replaceBtn.y;
            _replaceBtnDownTime = getTimer();
            sw = LayerManager.stage != null ? LayerManager.stage.stageWidth : 1280;
            sh = LayerManager.stage != null ? LayerManager.stage.stageHeight : 720;
            _replaceBtn.startDrag(false,new Rectangle(0,0,Math.max(0,sw - 56),Math.max(0,sh - 24)));
            if(LayerManager.stage != null)
            {
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP,_onReplaceBtnStageMouseUp,false,0,true);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onReplaceBtnMouseUp(e:MouseEvent) : void
      {
         _finishReplaceBtnGesture();
      }
      
      private static function _onReplaceBtnStageMouseUp(e:MouseEvent) : void
      {
         _finishReplaceBtnGesture();
      }
      
      private static function _finishReplaceBtnGesture() : void
      {
         var dx:Number;
         var dy:Number;
         var dist:Number;
         var dt:int;
         try
         {
            if(_replaceBtn == null)
            {
               return;
            }
            if(_replaceBtnDownTime == 0)
            {
               return;
            }
            try
            {
               _replaceBtn.stopDrag();
            }
            catch(e1:Error)
            {
            }
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onReplaceBtnStageMouseUp);
            }
            dx = _replaceBtn.x - _replaceBtnDownX;
            dy = _replaceBtn.y - _replaceBtnDownY;
            dist = Math.sqrt(dx * dx + dy * dy);
            dt = getTimer() - _replaceBtnDownTime;
            _replaceSaveNumber("btnX",_replaceBtn.x);
            _replaceSaveNumber("btnY",_replaceBtn.y);
            _replaceBtnDownTime = 0;
            if(dist < RANK_BTN_CLICK_DIST && dt < RANK_BTN_CLICK_MS)
            {
               _onReplaceEntryClick(null);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onUnifiedBtnMouseDown(e:MouseEvent) : void
      {
         var sw:Number;
         var sh:Number;
         try
         {
            if(_unifiedBtn == null)
            {
               return;
            }
            _unifiedBtnDownX = _unifiedBtn.x;
            _unifiedBtnDownY = _unifiedBtn.y;
            _unifiedBtnDownTime = getTimer();
            sw = LayerManager.stage != null ? LayerManager.stage.stageWidth : 1280;
            sh = LayerManager.stage != null ? LayerManager.stage.stageHeight : 720;
            _unifiedBtn.startDrag(false,new Rectangle(0,0,Math.max(0,sw - 68),Math.max(0,sh - 24)));
            if(LayerManager.stage != null)
            {
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP,_onUnifiedBtnStageMouseUp,false,0,true);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onUnifiedBtnMouseUp(e:MouseEvent) : void
      {
         _finishUnifiedBtnGesture();
      }
      
      private static function _onUnifiedBtnStageMouseUp(e:MouseEvent) : void
      {
         _finishUnifiedBtnGesture();
      }
      
      private static function _finishUnifiedBtnGesture() : void
      {
         var dx:Number;
         var dy:Number;
         var dist:Number;
         var dt:int;
         try
         {
            if(_unifiedBtn == null)
            {
               return;
            }
            if(_unifiedBtnDownTime == 0)
            {
               return;
            }
            try
            {
               _unifiedBtn.stopDrag();
            }
            catch(e1:Error)
            {
            }
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onUnifiedBtnStageMouseUp);
            }
            dx = _unifiedBtn.x - _unifiedBtnDownX;
            dy = _unifiedBtn.y - _unifiedBtnDownY;
            dist = Math.sqrt(dx * dx + dy * dy);
            dt = getTimer() - _unifiedBtnDownTime;
            _unifiedSaveNumber("btnX",_unifiedBtn.x);
            _unifiedSaveNumber("btnY",_unifiedBtn.y);
            _unifiedBtnDownTime = 0;
            if(dist < RANK_BTN_CLICK_DIST && dt < RANK_BTN_CLICK_MS)
            {
               _onUnifiedEntryClick(null);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onReplaceCloseClick(e:MouseEvent) : void
      {
         _closeReplacePanel();
      }
      
      private static function _onReplaceApplyClick(e:MouseEvent) : void
      {
         try
         {
            if(!_replaceParseInputValues(true))
            {
               return;
            }
            _scheduleReplaceTestValue(int(_replaceValues[_replaceCurrentIndex]));
         }
         catch(err:Error)
         {
            _replaceStatus("输入无效");
            _replaceLog("[错误] 输入无效");
         }
      }
      
      private static function _onReplaceRestoreClick(e:MouseEvent) : void
      {
         try
         {
            _replaceValues = [REPLACE_DEFAULT_VALUE];
            _replaceCurrentIndex = 0;
            if(_replaceInput != null)
            {
               _replaceInput.text = _replaceSerializeValues();
            }
            _syncReplacePanel();
            _scheduleReplaceTestValue(REPLACE_DEFAULT_VALUE);
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onReplacePrevClick(e:MouseEvent) : void
      {
         try
         {
            if(!_replaceParseInputValues(false))
            {
               return;
            }
            if(_replaceValues.length <= 0)
            {
               return;
            }
            --_replaceCurrentIndex;
            if(_replaceCurrentIndex < 0)
            {
               _replaceCurrentIndex = _replaceValues.length - 1;
            }
            _syncReplacePanel();
            _replaceStatus("已切换到第 " + (_replaceCurrentIndex + 1) + " 行");
            _replaceLog("[切换] 第 " + (_replaceCurrentIndex + 1) + " 行 = " + _replaceValues[_replaceCurrentIndex] + "，自动替换");
            _scheduleReplaceTestValue(int(_replaceValues[_replaceCurrentIndex]));
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onReplaceNextClick(e:MouseEvent) : void
      {
         try
         {
            if(!_replaceParseInputValues(false))
            {
               return;
            }
            if(_replaceValues.length <= 0)
            {
               return;
            }
            ++_replaceCurrentIndex;
            if(_replaceCurrentIndex >= _replaceValues.length)
            {
               _replaceCurrentIndex = 0;
            }
            _syncReplacePanel();
            _replaceStatus("已切换到第 " + (_replaceCurrentIndex + 1) + " 行");
            _replaceLog("[切换] 第 " + (_replaceCurrentIndex + 1) + " 行 = " + _replaceValues[_replaceCurrentIndex] + "，自动替换");
            _scheduleReplaceTestValue(int(_replaceValues[_replaceCurrentIndex]));
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onReplaceImportClick(e:MouseEvent) : void
      {
         try
         {
            _replaceFileRef = new FileReference();
            _replaceFileRef.addEventListener(Event.SELECT,_onReplaceFileSelected,false,0,true);
            _replaceFileRef.addEventListener(Event.COMPLETE,_onReplaceFileLoaded,false,0,true);
            _replaceFileRef.browse();
            _replaceStatus("请选择 TXT 文件");
         }
         catch(err:Error)
         {
            _replaceStatus("导入失败");
            _replaceLog("[错误] 无法打开文件选择：" + err.message);
         }
      }
      
      private static function _onReplaceExportClick(e:MouseEvent) : void
      {
         var name:String;
         var fr:FileReference;
         try
         {
            if(!_replaceParseInputValues(true))
            {
               return;
            }
            name = "replace_values_" + _rankExportTimestamp() + ".txt";
            fr = new FileReference();
            fr.save(_replaceSerializeValues(),name);
            _replaceStatus("已弹出保存对话框");
            _replaceLog("[导出] 替换列表 " + _replaceValues.length + " 行 -> " + name);
         }
         catch(err:Error)
         {
            _replaceStatus("导出失败");
            _replaceLog("[错误] 导出失败：" + err.message);
         }
      }
      
      private static function _onReplaceFileSelected(e:Event) : void
      {
         try
         {
            if(_replaceFileRef != null)
            {
               _replaceFileRef.load();
               _replaceStatus("正在导入 TXT");
            }
         }
         catch(err:Error)
         {
            _replaceStatus("导入失败");
            _replaceLog("[错误] 文件读取失败：" + err.message);
         }
      }
      
      private static function _onReplaceFileLoaded(e:Event) : void
      {
         var text:String;
         try
         {
            text = "";
            if(_replaceFileRef != null && _replaceFileRef.data != null)
            {
               _replaceFileRef.data.position = 0;
               text = _replaceFileRef.data.readUTFBytes(_replaceFileRef.data.length);
            }
            if(_replaceInput != null)
            {
               _replaceInput.text = text;
            }
            _replaceCurrentIndex = 0;
            if(_replaceParseInputValues(true))
            {
               if(_replaceInput != null)
               {
                  _replaceInput.text = _replaceSerializeValues();
               }
               _syncReplacePanel();
               _replaceStatus("已导入 " + _replaceValues.length + " 行，自动替换第一行");
               _replaceLog("[导入] TXT 行数=" + _replaceValues.length + "，自动替换第一行");
               _scheduleReplaceTestValue(int(_replaceValues[_replaceCurrentIndex]));
            }
         }
         catch(err:Error)
         {
            _replaceStatus("导入失败");
            _replaceLog("[错误] 导入解析失败：" + err.message);
         }
      }
      
      private static function _scheduleReplaceTestValue(newValue:int) : void
      {
         try
         {
            if(newValue <= 0)
            {
               _replaceStatus("请输入正整数");
               _replaceLog("[错误] 数值无效：" + newValue);
               return;
            }
            _replacePendingValue = newValue;
            if(_replaceTimer != 0)
            {
               try
               {
                  clearTimeout(_replaceTimer);
               }
               catch(e1:Error)
               {
               }
               _replaceTimer = 0;
            }
            _replaceTimer = setTimeout(_applyPendingReplaceValue,REPLACE_DEBOUNCE_MS);
            _replaceStatus("已加入防抖队列");
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _applyPendingReplaceValue() : void
      {
         try
         {
            _replaceTimer = 0;
            _applyReplaceTestValue(_replacePendingValue);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _applyReplaceTestValue(newValue:int) : void
      {
         var oldValue:int = _currentReplaceValue;
         var count:int = 0;
         try
         {
            _currentReplaceValue = newValue;
            try
            {
               if(LoginInfo.userInfo != null)
               {
                  LoginInfo.userInfo.id = newValue;
                  count++;
               }
            }
            catch(eLogin:Error)
            {
            }
            try
            {
               if(ActorManager.actorInfo != null)
               {
                  ActorManager.actorInfo.id = newValue;
                  count++;
               }
            }
            catch(eInfo:Error)
            {
            }
            try
            {
               if(ActorManager.getActor() != null)
               {
                  ActorManager.getActor().id = newValue;
                  count++;
               }
            }
            catch(eActor:Error)
            {
            }
            try
            {
               if(ActorManager.getActor() != null && ActorManager.getActor().getInfo() != null)
               {
                  ActorManager.getActor().getInfo().id = newValue;
                  count++;
               }
            }
            catch(eActorInfo:Error)
            {
            }
            try
            {
               SharedObjectManager.setUserId(uint(newValue));
               count++;
            }
            catch(eSo:Error)
            {
            }
            try
            {
               if(LoginInfo.userInfo != null)
               {
                  CookieUserInfo.serialize(LoginInfo.userInfo);
                  count++;
               }
            }
            catch(eCookie:Error)
            {
            }
            try
            {
               if(_replaceValues != null && _replaceValues.length > 0 && _replaceCurrentIndex >= 0 && _replaceCurrentIndex < _replaceValues.length)
               {
                  _replaceValues[_replaceCurrentIndex] = newValue;
               }
            }
            catch(eVals:Error)
            {
            }
            _syncReplacePanel();
            _replaceStatus("已替换 " + count + " 个运行时位置");
            _replaceLog("[替换] 第 " + (_replaceCurrentIndex + 1) + " 行：" + oldValue + " -> " + newValue + "，位置=" + count);
            _replaceLog("[邮箱] 已安排使用米米号 " + newValue + " 打开邮箱");
            _scheduleGmailPanelRefresh(newValue);
         }
         catch(e:Error)
         {
            _replaceStatus("替换失败");
            _replaceLog("[错误] " + e.message);
         }
      }
      
      private static function _replaceLoadValuesFromText(text:String, source:String, autoApply:Boolean) : Boolean
      {
         try
         {
            if(_replaceInput != null)
            {
               _replaceInput.text = text;
            }
            _replaceCurrentIndex = 0;
            if(!_replaceParseInputValues(true))
            {
               return false;
            }
            if(_replaceInput != null)
            {
               _replaceInput.text = _replaceSerializeValues();
            }
            _syncReplacePanel();
            _replaceStatus(source + " 已导入 " + _replaceValues.length + " 行");
            _replaceLog("[" + source + "] " + _replaceValues.length + " 行数据已导入");
            if(autoApply && _replaceValues.length > 0)
            {
               _scheduleReplaceTestValue(int(_replaceValues[0]));
            }
            return true;
         }
         catch(e:Error)
         {
            _replaceStatus(source + " 导入失败");
            _replaceLog("[错误] " + source + " 导入失败：" + e.message);
         }
         return false;
      }
      
      private static function _replaceApplyCurrentNow(reason:String) : Boolean
      {
         try
         {
            if(!_replaceParseInputValues(true))
            {
               return false;
            }
            if(_replaceValues.length <= 0)
            {
               return false;
            }
            _syncReplacePanel();
            _replaceLog("[" + reason + "] 第 " + (_replaceCurrentIndex + 1) + " 行立即替换");
            _applyReplaceTestValue(int(_replaceValues[_replaceCurrentIndex]));
            return true;
         }
         catch(e:Error)
         {
            _replaceStatus(reason + " 失败");
            _replaceLog("[错误] " + reason + " 失败：" + e.message);
         }
         return false;
      }
      
      private static function _syncReplacePanel() : void
      {
         try
         {
            if(_replaceCurrentTxt != null)
            {
               _replaceCurrentTxt.text = _currentReplaceValue;
            }
         }
         catch(e1:Error)
         {
         }
         try
         {
            if(_replaceValues == null || _replaceValues.length == 0)
            {
               _replaceValues = [REPLACE_DEFAULT_VALUE];
            }
            if(_replaceCurrentIndex < 0)
            {
               _replaceCurrentIndex = 0;
            }
            if(_replaceCurrentIndex >= _replaceValues.length)
            {
               _replaceCurrentIndex = _replaceValues.length - 1;
            }
            if(_replaceLineTxt != null)
            {
               _replaceLineTxt.text = "第 " + (_replaceCurrentIndex + 1) + " / " + _replaceValues.length + " 行";
            }
            if(_replaceInput != null && _replaceInput.text == "")
            {
               _replaceInput.text = _replaceSerializeValues();
            }
            _replaceHighlightCurrentLine();
         }
         catch(e2:Error)
         {
         }
      }
      
      private static function _replaceSerializeValues() : String
      {
         var out:Array = [];
         var i:int = 0;
         try
         {
            if(_replaceValues == null || _replaceValues.length == 0)
            {
               _replaceValues = [REPLACE_DEFAULT_VALUE];
            }
            while(i < _replaceValues.length)
            {
               out.push(_replaceValues[i]);
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return out.join("\n");
      }
      
      private static function _replaceParseInputValues(showLog:Boolean) : Boolean
      {
         var text:String;
         var lines:Array;
         var vals:Array;
         var i:int;
         var s:String;
         var n:Number;
         try
         {
            text = _replaceInput != null ? _replaceInput.text : "";
            lines = text.split(/\r\n|\r|\n/);
            vals = [];
            i = 0;
            while(i < lines.length)
            {
               s = lines[i].replace(/^\s+|\s+$/g,"");
               if(s.length > 0)
               {
                  n = Number(s);
                  if(isNaN(n) || Math.floor(n) != n || n <= 0 || n > 2147483647)
                  {
                     if(showLog)
                     {
                        _replaceLog("[错误] 第 " + (i + 1) + " 行无效：" + s);
                     }
                     _replaceStatus("第 " + (i + 1) + " 行无效");
                     return false;
                  }
                  vals.push(int(n));
               }
               i++;
            }
            if(vals.length == 0)
            {
               _replaceStatus("没有可用数值");
               if(showLog)
               {
                  _replaceLog("[错误] 没有可用数值");
               }
               return false;
            }
            _replaceValues = vals;
            if(_replaceCurrentIndex < 0)
            {
               _replaceCurrentIndex = 0;
            }
            if(_replaceCurrentIndex >= _replaceValues.length)
            {
               _replaceCurrentIndex = _replaceValues.length - 1;
            }
            return true;
         }
         catch(e:Error)
         {
            _replaceStatus("解析失败");
            if(showLog)
            {
               _replaceLog("[错误] 解析失败：" + e.message);
            }
         }
         return false;
      }
      
      private static function _replaceHighlightCurrentLine() : void
      {
         var text:String;
         var lines:Array;
         var start:int;
         var i:int;
         var end:int;
         try
         {
            if(_replaceInput == null)
            {
               return;
            }
            text = _replaceInput.text;
            lines = text.split(/\r\n|\r|\n/);
            start = 0;
            i = 0;
            while(i < _replaceCurrentIndex && i < lines.length)
            {
               start += lines[i].length + 1;
               i++;
            }
            end = start;
            if(_replaceCurrentIndex >= 0 && _replaceCurrentIndex < lines.length)
            {
               end = start + lines[_replaceCurrentIndex].length;
            }
            _replaceInput.setSelection(start,end);
            _replaceInput.scrollV = Math.max(1,_replaceCurrentIndex + 1);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onReplaceRank9(e:MouseEvent) : void
      {
         _doReplaceQuickRank(9,"大乱斗");
      }
      
      private static function _onReplaceRank71(e:MouseEvent) : void
      {
         _doReplaceQuickRank(71,"神魔榜");
      }
      
      private static function _onReplaceRank131(e:MouseEvent) : void
      {
         _doReplaceQuickRank(131,"十字");
      }
      
      private static function _onReplaceRankSky(e:MouseEvent) : void
      {
         _doReplaceQuickMonthRank(0,"天空");
      }
      
      private static function _onReplaceRankBrave(e:MouseEvent) : void
      {
         _doReplaceQuickMonthRank(1,"勇者");
      }
      
      private static function _onReplaceRankKing(e:MouseEvent) : void
      {
         _doReplaceQuickMonthRank(2,"王者");
      }
      
      private static function _onReplaceRankPeak(e:MouseEvent) : void
      {
         _doReplaceQuickMonthRank(3,"巅峰");
      }
      
      private static function _onReplaceRankQin(e:MouseEvent) : void
      {
         _doReplaceQuickMonthRank(4,"无擒");
      }
      
      private static function _onReplaceRankYufeng(e:MouseEvent) : void
      {
         _doReplaceQuickMonthRank(5,"御风");
      }
      
      private static function _doReplaceQuickMonthRank(slot:int, label:String) : void
      {
         var ids:Array;
         try
         {
            ids = _getCurrentMonthRankIds();
            if(ids == null || slot < 0 || slot >= ids.length)
            {
               return;
            }
            _doReplaceQuickRank(int(ids[slot]),label);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _doReplaceQuickRank(rid:int, label:String) : void
      {
         _doReplaceQuickRankFiltered(rid,label);
      }
      
      private static function _doReplaceQuickRankFiltered(rid:int, label:String) : void
      {
         var minV:int;
         var maxV:int;
         try
         {
            _cancelReplaceMailboxFilter();
            if(!_replaceProbeFilterEnabled && !_replaceApplyCurrentNow("快速榜单-" + label))
            {
               return;
            }
            minV = _rankReadCurrentMin();
            maxV = _rankReadCurrentMax();
            _rankImportToReplaceAfterResp = true;
            _rankImportToReplaceLabel = label;
            _rankImportToReplaceFilterAfterResp = _replaceProbeFilterEnabled;
            _replaceStatus("快速榜单查询中：" + label + (_replaceProbeFilterEnabled ? "（过滤开启）" : ""));
            _replaceLog("[quick-rank] " + label + " rankId=" + rid + " min=" + minV + " max=" + maxV + (_replaceProbeFilterEnabled ? "，回包后过滤邮箱" : ""));
            _sendRankQuery(rid,minV,maxV,"[quick-rank] " + label);
         }
         catch(e:Error)
         {
            _replaceStatus("快速榜单失败");
            _replaceLog("[错误] 快速榜单失败：" + e.message);
         }
      }
      
      private static function _onUnifiedRank9(e:MouseEvent) : void
      {
         _doUnifiedQuickRank(9,"大乱斗");
      }
      
      private static function _onUnifiedRank71(e:MouseEvent) : void
      {
         _doUnifiedQuickRank(71,"神魔榜");
      }
      
      private static function _onUnifiedRank131(e:MouseEvent) : void
      {
         _doUnifiedQuickRank(131,"十字");
      }
      
      private static function _onUnifiedRankSky(e:MouseEvent) : void
      {
         _doUnifiedQuickMonthRank(0,"天空");
      }
      
      private static function _onUnifiedRankBrave(e:MouseEvent) : void
      {
         _doUnifiedQuickMonthRank(1,"勇者");
      }
      
      private static function _onUnifiedRankKing(e:MouseEvent) : void
      {
         _doUnifiedQuickMonthRank(2,"王者");
      }
      
      private static function _onUnifiedRankPeak(e:MouseEvent) : void
      {
         _doUnifiedQuickMonthRank(3,"巅峰");
      }
      
      private static function _onUnifiedRankQin(e:MouseEvent) : void
      {
         _doUnifiedQuickMonthRank(4,"无擒");
      }
      
      private static function _onUnifiedRankYufeng(e:MouseEvent) : void
      {
         _doUnifiedQuickMonthRank(5,"御风");
      }
      
      private static function _doUnifiedQuickMonthRank(slot:int, label:String) : void
      {
         var ids:Array;
         try
         {
            ids = _getCurrentMonthRankIds();
            if(ids == null || slot < 0 || slot >= ids.length)
            {
               return;
            }
            _doUnifiedQuickRank(int(ids[slot]),label);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _doUnifiedQuickRank(rid:int, label:String) : void
      {
         var minV:int;
         var maxV:int;
         try
         {
            _clearUnifiedRankScanState();
            _openUnifiedPanel();
            _cancelUnifiedMailboxFilter();
            _cleanupUnifiedListeners(true);
            _resetUnifiedScanRows(false);
            _syncRankMinMaxFromUnified();
            minV = _unifiedReadCurrentMin();
            maxV = _unifiedReadCurrentMax();
            _rankImportToReplaceAfterResp = false;
            _rankImportToReplaceLabel = "";
            _rankImportToReplaceFilterAfterResp = false;
            _rankImportToUnifiedAfterResp = true;
            _rankImportToUnifiedLabel = label;
            _unifiedStatus(label + " 榜单查询中 min=" + minV + " max=" + maxV);
            _setUnifiedLogText("",true);
            _unifiedLog("[大一统] " + label + " rankId=" + rid + " min=" + minV + " max=" + maxV + "，回包后直接勘查，打不开的账号自动跳过");
            _sendRankQuery(rid,minV,maxV,"[unified-rank] " + label);
         }
         catch(err:Error)
         {
            _unifiedLog("[大一统] 榜单启动失败：" + err.message);
         }
      }
      
      private static function _clearUnifiedRankScanState(clearFiltered:Boolean = true) : void
      {
         _unifiedRankScanActive = false;
         _unifiedRankScanQueue = [];
         _unifiedRankScanIndex = 0;
         _unifiedRankScanSeen = {};
         _unifiedRankScanFilterEnabled = false;
         if(clearFiltered)
         {
            _unifiedFilteredRows = [];
            if(_unifiedFilterPanel != null && _unifiedFilterPanel.parent != null)
            {
               _refreshUnifiedFilteredPanel();
            }
         }
      }
      
      private static function _onReplaceProbeToggleClick(e:MouseEvent) : void
      {
         try
         {
            _replaceProbeFilterEnabled = !_replaceProbeFilterEnabled;
            _replaceUpdateProbeToggleBtn();
            if(!_replaceProbeFilterEnabled)
            {
               _cancelReplaceMailboxFilter();
            }
            _replaceStatus("邮箱过滤已" + (_replaceProbeFilterEnabled ? "开启" : "关闭"));
            _replaceLog("[filter] 邮箱过滤已" + (_replaceProbeFilterEnabled ? "开启" : "关闭"));
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _replaceUpdateProbeToggleBtn() : void
      {
         var i:int;
         var tf:TextField;
         try
         {
            if(_replaceProbeToggleBtn == null)
            {
               return;
            }
            i = 0;
            while(i < _replaceProbeToggleBtn.numChildren)
            {
               tf = _replaceProbeToggleBtn.getChildAt(i) as TextField;
               if(tf != null)
               {
                  tf.text = _replaceProbeFilterEnabled ? "过滤邮箱:开" : "过滤邮箱:关";
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _startReplaceMailboxFilter(idsText:String, label:String) : void
      {
         var ids:Array;
         try
         {
            _cancelReplaceMailboxFilter();
            ids = _parseReplaceProbeIds(idsText);
            _openReplacePanel();
            if(ids == null || ids.length == 0)
            {
               _replaceStatus(label + " 无米米号可测试");
               _replaceLog("[filter] " + label + " 无米米号可测试");
               return;
            }
            _cleanupGmailRefreshWatch();
            try
            {
               ModuleManager.closeForName("GmailPanel");
            }
            catch(eClose:Error)
            {
            }
            _replaceProbeQueue = ids;
            _replaceProbePassed = [];
            _replaceProbeIndex = 0;
            _replaceProbeLabel = label;
            _replaceProbeOriginalValue = _currentReplaceValue;
            ++_replaceProbeSeq;
            _replaceProbeActiveSeq = _replaceProbeSeq;
            _replaceStatus(label + " 正在测试邮箱 0 / " + ids.length);
            _replaceLog("[filter] " + label + " 开始测试 " + ids.length + " 个米米号");
            _replaceProbeTimer = setTimeout(_probeNextMailboxCandidate,REPLACE_PROBE_GAP_MS);
         }
         catch(e:Error)
         {
            _replaceStatus("邮箱过滤启动失败");
            _replaceLog("[错误] 邮箱过滤启动失败：" + e.message);
         }
      }
      
      private static function _parseReplaceProbeIds(text:String) : Array
      {
         var lines:Array;
         var i:int;
         var s:String;
         var id:int;
         var key:String;
         var arr:Array = [];
         var seen:Object = {};
         try
         {
            if(text == null)
            {
               return arr;
            }
            lines = text.split(/\r\n|\n|\r|,|;|\s+/);
            i = 0;
            while(i < lines.length)
            {
               s = lines[i];
               if(!(s == null || s.length == 0))
               {
                  id = int(parseInt(s,10));
                  if(!(id <= 0 || isNaN(id)))
                  {
                     key = id;
                     if(!seen[key])
                     {
                        seen[key] = true;
                        arr.push(id);
                     }
                  }
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return arr;
      }
      
      private static function _cancelReplaceMailboxFilter() : void
      {
         try
         {
            _cleanupReplaceMailboxProbeListeners(true);
            if(_replaceProbeQueue != null && _replaceProbeQueue.length > 0 && _replaceProbeIndex < _replaceProbeQueue.length)
            {
               _replaceLog("[filter] 已取消上一轮邮箱测试");
            }
            _replaceProbeQueue = [];
            _replaceProbePassed = [];
            _replaceProbeIndex = 0;
            _replaceProbeLabel = "";
            ++_replaceProbeSeq;
            _replaceProbeActiveSeq = _replaceProbeSeq;
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _probeNextMailboxCandidate() : void
      {
         var id:int;
         try
         {
            _replaceProbeTimer = 0;
            if(_replaceProbeQueue == null || _replaceProbeIndex >= _replaceProbeQueue.length)
            {
               _finishReplaceMailboxFilter();
               return;
            }
            id = int(_replaceProbeQueue[_replaceProbeIndex]);
            _replaceStatus(_replaceProbeLabel + " 测试邮箱 " + (_replaceProbeIndex + 1) + " / " + _replaceProbeQueue.length);
            _replaceLog("[filter] #" + (_replaceProbeIndex + 1) + "/" + _replaceProbeQueue.length + " 测试 " + id);
            _syncRuntimeUserIdForGmail(id);
            _cleanupReplaceMailboxProbeListeners(true);
            Connection.addCommandListener(CommandSet.GET_MAIL_LIST_DATA,_onReplaceMailboxProbeReply);
            Connection.addErrorHandler(CommandSet.GET_MAIL_LIST_DATA,_onReplaceMailboxProbeError);
            Connection.send(CommandSet.GET_MAIL_LIST_DATA,id);
            _replaceProbeTimer = setTimeout(_onReplaceMailboxProbeTimeout,REPLACE_PROBE_TIMEOUT_MS);
         }
         catch(e:Error)
         {
            _finishMailboxProbeOne(false,"send-error");
         }
      }
      
      private static function _onReplaceMailboxProbeReply(e:MessageEvent) : void
      {
         _finishMailboxProbeOne(true,"reply");
      }
      
      private static function _onReplaceMailboxProbeError(e:MessageEvent) : void
      {
         _finishMailboxProbeOne(false,"error");
      }
      
      private static function _onReplaceMailboxProbeTimeout() : void
      {
         _replaceProbeTimer = 0;
         _finishMailboxProbeOne(false,"timeout");
      }
      
      private static function _finishMailboxProbeOne(ok:Boolean, reason:String) : void
      {
         var id:int;
         try
         {
            _cleanupReplaceMailboxProbeListeners(true);
            if(_replaceProbeQueue == null || _replaceProbeIndex >= _replaceProbeQueue.length)
            {
               return;
            }
            id = int(_replaceProbeQueue[_replaceProbeIndex]);
            if(ok)
            {
               _replaceProbePassed.push(id);
               _replaceLog("[filter] " + id + " 可打开");
            }
            else
            {
               _replaceLog("[filter] " + id + " 已过滤(" + reason + ")");
            }
            ++_replaceProbeIndex;
            if(_replaceProbeIndex >= _replaceProbeQueue.length)
            {
               _finishReplaceMailboxFilter();
            }
            else
            {
               _replaceProbeTimer = setTimeout(_probeNextMailboxCandidate,REPLACE_PROBE_GAP_MS);
            }
         }
         catch(e:Error)
         {
            _finishReplaceMailboxFilter();
         }
      }
      
      private static function _cleanupReplaceMailboxProbeListeners(clearTimer:Boolean = true) : void
      {
         try
         {
            Connection.removeCommandListener(CommandSet.GET_MAIL_LIST_DATA,_onReplaceMailboxProbeReply);
         }
         catch(e1:Error)
         {
         }
         try
         {
            Connection.removeErrorHandler(CommandSet.GET_MAIL_LIST_DATA,_onReplaceMailboxProbeError);
         }
         catch(e2:Error)
         {
         }
         if(clearTimer && _replaceProbeTimer != 0)
         {
            try
            {
               clearTimeout(_replaceProbeTimer);
            }
            catch(e3:Error)
            {
            }
            _replaceProbeTimer = 0;
         }
      }
      
      private static function _finishReplaceMailboxFilter() : void
      {
         var total:int;
         var okCount:int;
         var label:String;
         var idsText:String;
         try
         {
            _cleanupReplaceMailboxProbeListeners(true);
            total = _replaceProbeQueue != null ? _replaceProbeQueue.length : 0;
            okCount = _replaceProbePassed != null ? _replaceProbePassed.length : 0;
            label = _replaceProbeLabel;
            if(label == null || label.length == 0)
            {
               label = "快速榜单";
            }
            if(okCount > 0)
            {
               idsText = _replaceIdsToText(_replaceProbePassed);
               if(_replaceLoadValuesFromText(idsText,"quick-rank-filter",true))
               {
                  _replaceLog("[quick-rank-filter] " + label + " 可打开 " + okCount + " / " + total + "，已过滤 " + (total - okCount));
                  _replaceStatus(label + " 可打开 " + okCount + " / " + total);
                  _appendRankLog("[quick-rank-filter] " + label + " 可打开 " + okCount + " / " + total);
               }
            }
            else
            {
               _syncRuntimeUserIdForGmail(_replaceProbeOriginalValue);
               _replaceStatus(label + " 无可打开邮箱");
               _replaceLog("[quick-rank-filter] " + label + " 可打开 0 / " + total + "，列表未替换");
               _appendRankLog("[quick-rank-filter] " + label + " 可打开 0 / " + total);
            }
            _replaceProbeQueue = [];
            _replaceProbePassed = [];
            _replaceProbeIndex = 0;
            _replaceProbeLabel = "";
         }
         catch(e:Error)
         {
            _replaceStatus("邮箱过滤完成异常");
            _replaceLog("[错误] 邮箱过滤完成异常：" + e.message);
         }
      }
      
      private static function _startUnifiedMailboxFilter(idsText:String, label:String) : void
      {
         var ids:Array;
         try
         {
            _cancelUnifiedMailboxFilter();
            _openUnifiedPanel();
            ids = _parseReplaceProbeIds(idsText);
            if(ids == null || ids.length == 0)
            {
               _unifiedStatus(label + " 无米米号可测试");
               _unifiedLog("[quick-rank-filter] " + label + " 无米米号可测试");
               return;
            }
            _cleanupGmailRefreshWatch();
            _cleanupUnifiedListeners(true);
            try
            {
               ModuleManager.closeForName("GmailPanel");
            }
            catch(eClose:Error)
            {
            }
            _unifiedProbeQueue = ids;
            _unifiedProbePassed = [];
            _unifiedProbeIndex = 0;
            _unifiedProbeLabel = label;
            _unifiedStatus(label + " 正在过滤邮箱 0 / " + ids.length);
            _unifiedLog("[quick-rank-filter] " + label + " 开始测试 " + ids.length + " 个米米号");
            _unifiedProbeTimer = setTimeout(_probeNextUnifiedMailboxCandidate,REPLACE_PROBE_GAP_MS);
         }
         catch(e:Error)
         {
            _unifiedStatus("邮箱过滤启动失败");
            _unifiedLog("[quick-rank-filter] 启动失败：" + e.message);
         }
      }
      
      private static function _cancelUnifiedMailboxFilter() : void
      {
         try
         {
            _cleanupUnifiedMailboxProbeListeners(true);
            _unifiedProbeQueue = [];
            _unifiedProbePassed = [];
            _unifiedProbeIndex = 0;
            _unifiedProbeLabel = "";
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _probeNextUnifiedMailboxCandidate() : void
      {
         var id:int;
         try
         {
            _unifiedProbeTimer = 0;
            if(_unifiedProbeQueue == null || _unifiedProbeIndex >= _unifiedProbeQueue.length)
            {
               _finishUnifiedMailboxFilter();
               return;
            }
            id = int(_unifiedProbeQueue[_unifiedProbeIndex]);
            _unifiedStatus(_unifiedProbeLabel + " 过滤邮箱 " + (_unifiedProbeIndex + 1) + " / " + _unifiedProbeQueue.length);
            if(_unifiedProbeIndex % 10 == 0)
            {
               _unifiedLog("[quick-rank-filter] 进度 " + (_unifiedProbeIndex + 1) + " / " + _unifiedProbeQueue.length);
            }
            _syncRuntimeUserIdForGmail(id);
            _cleanupUnifiedMailboxProbeListeners(true);
            Connection.addCommandListener(CommandSet.GET_MAIL_LIST_DATA,_onUnifiedMailboxProbeReply);
            Connection.addErrorHandler(CommandSet.GET_MAIL_LIST_DATA,_onUnifiedMailboxProbeError);
            Connection.send(CommandSet.GET_MAIL_LIST_DATA,id);
            _unifiedProbeTimer = setTimeout(_onUnifiedMailboxProbeTimeout,REPLACE_PROBE_TIMEOUT_MS);
         }
         catch(e:Error)
         {
            _finishUnifiedMailboxProbeOne(false);
         }
      }
      
      private static function _onUnifiedMailboxProbeReply(e:MessageEvent) : void
      {
         _finishUnifiedMailboxProbeOne(true);
      }
      
      private static function _onUnifiedMailboxProbeError(e:MessageEvent) : void
      {
         _finishUnifiedMailboxProbeOne(false);
      }
      
      private static function _onUnifiedMailboxProbeTimeout() : void
      {
         _unifiedProbeTimer = 0;
         _finishUnifiedMailboxProbeOne(false);
      }
      
      private static function _finishUnifiedMailboxProbeOne(ok:Boolean) : void
      {
         var id:int;
         try
         {
            _cleanupUnifiedMailboxProbeListeners(true);
            if(_unifiedProbeQueue == null || _unifiedProbeIndex >= _unifiedProbeQueue.length)
            {
               return;
            }
            id = int(_unifiedProbeQueue[_unifiedProbeIndex]);
            if(ok)
            {
               _unifiedProbePassed.push(id);
            }
            ++_unifiedProbeIndex;
            if(_unifiedProbeIndex >= _unifiedProbeQueue.length)
            {
               _finishUnifiedMailboxFilter();
            }
            else
            {
               _unifiedProbeTimer = setTimeout(_probeNextUnifiedMailboxCandidate,REPLACE_PROBE_GAP_MS);
            }
         }
         catch(e:Error)
         {
            _finishUnifiedMailboxFilter();
         }
      }
      
      private static function _cleanupUnifiedMailboxProbeListeners(clearTimer:Boolean = true) : void
      {
         try
         {
            Connection.removeCommandListener(CommandSet.GET_MAIL_LIST_DATA,_onUnifiedMailboxProbeReply);
         }
         catch(e1:Error)
         {
         }
         try
         {
            Connection.removeErrorHandler(CommandSet.GET_MAIL_LIST_DATA,_onUnifiedMailboxProbeError);
         }
         catch(e2:Error)
         {
         }
         if(clearTimer && _unifiedProbeTimer != 0)
         {
            try
            {
               clearTimeout(_unifiedProbeTimer);
            }
            catch(e3:Error)
            {
            }
            _unifiedProbeTimer = 0;
         }
      }
      
      private static function _finishUnifiedMailboxFilter() : void
      {
         var total:int;
         var okCount:int;
         var label:String;
         try
         {
            _cleanupUnifiedMailboxProbeListeners(true);
            total = _unifiedProbeQueue != null ? _unifiedProbeQueue.length : 0;
            okCount = _unifiedProbePassed != null ? _unifiedProbePassed.length : 0;
            label = _unifiedProbeLabel;
            if(label == null || label.length == 0)
            {
               label = "榜单";
            }
            _unifiedIds = _copyPositiveIds(_unifiedProbePassed);
            _unifiedLog("[quick-rank-filter] " + label + " 可打开 " + okCount + " / " + total + "，已过滤 " + (total - okCount));
            _unifiedStatus(label + " 可打开 " + okCount + " / " + total);
            _unifiedProbeQueue = [];
            _unifiedProbePassed = [];
            _unifiedProbeIndex = 0;
            _unifiedProbeLabel = "";
            if(okCount > 0)
            {
               _startUnifiedSurvey(false);
            }
         }
         catch(e:Error)
         {
            _unifiedStatus("邮箱过滤完成异常");
            _unifiedLog("[quick-rank-filter] 完成异常：" + e.message);
         }
      }
      
      private static function _replaceIdsToText(arr:Array) : String
      {
         var i:int;
         var s:String = "";
         try
         {
            i = 0;
            while(i < arr.length)
            {
               if(i > 0)
               {
                  s += "\n";
               }
               s += arr[i];
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return s;
      }
      
      private static function _onUnifiedOpenClick(e:MouseEvent) : void
      {
         _openUnifiedPanel();
      }
      
      private static function _openUnifiedPanel() : void
      {
         var parent:DisplayObjectContainer;
         try
         {
            parent = _pickRankParent();
            if(parent == null)
            {
               return;
            }
            if(_unifiedPanel == null)
            {
               _unifiedPanel = _buildUnifiedPanel();
            }
            if(_unifiedPanel.parent == null)
            {
               parent.addChild(_unifiedPanel);
            }
            try
            {
               parent.setChildIndex(_unifiedPanel,parent.numChildren - 1);
            }
            catch(eT:Error)
            {
            }
            if(_unifiedPanel.x == 0 && _unifiedPanel.y == 0)
            {
               _unifiedPanel.x = _unifiedReadNumber("panelX",500);
               _unifiedPanel.y = _unifiedReadNumber("panelY",90);
            }
            _syncUnifiedMinMaxFromRank();
            _unifiedStatus("就绪，账号 " + _replaceValues.length + " 个");
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _closeUnifiedPanel(e:MouseEvent = null) : void
      {
         try
         {
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,_onUnifiedLogSbDragMove);
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onUnifiedLogSbDragEnd);
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,_onUnifiedFilterSbDragMove);
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onUnifiedFilterSbDragEnd);
            }
            _unifiedLogSbDragging = false;
            _unifiedFilterSbDragging = false;
            if(_unifiedFilterPanel != null && _unifiedFilterPanel.parent != null)
            {
               _unifiedFilterPanel.parent.removeChild(_unifiedFilterPanel);
            }
            if(_unifiedPanel != null && _unifiedPanel.parent != null)
            {
               _unifiedPanel.parent.removeChild(_unifiedPanel);
            }
         }
         catch(e1:Error)
         {
         }
      }
      
      private static function _buildUnifiedPanel() : Sprite
      {
         var bg:Shape;
         var drag:Sprite;
         var lbg:Shape;
         var f:TextFormat;
         var p:Sprite = new Sprite();
         try
         {
            p.name = "unifiedMailSurveyPanel";
            bg = new Shape();
            bg.graphics.beginFill(463135,0.96);
            bg.graphics.lineStyle(1,2282478,0.7);
            bg.graphics.drawRoundRect(0,0,UNIFIED_PANEL_W,UNIFIED_PANEL_H,6,6);
            bg.graphics.endFill();
            p.addChild(bg);
            drag = new Sprite();
            drag.graphics.beginFill(16777215,0);
            drag.graphics.drawRect(0,0,UNIFIED_PANEL_W - 34,30);
            drag.graphics.endFill();
            drag.addEventListener(MouseEvent.MOUSE_DOWN,_onUnifiedDragStart,false,0,true);
            p.addChild(drag);
            p.addChild(_rankMakeLabel("大一统邮箱勘查",12,7,190,18,16498468,13,true));
            p.addChild(_rankMakeBtn(UNIFIED_PANEL_W - 28,4,22,22,"X",15680580,_closeUnifiedPanel));
            p.addChild(_rankMakeLabel("目标:",14,42,44,20,16498468,12,true));
            _unifiedTargetInput = _rankMakeInput(58,39,92,24);
            _unifiedTargetInput.restrict = "0-9";
            p.addChild(_unifiedTargetInput);
            p.addChild(_rankMakeBtn(160,39,74,24,"勘查全部",2282478,_onUnifiedScanAll));
            p.addChild(_rankMakeBtn(242,39,88,24,"到目标停止",2282478,_onUnifiedScanTarget));
            _unifiedPauseBtn = _rankMakeBtn(338,39,58,24,"暂停",9741240,_onUnifiedPauseClick);
            p.addChild(_unifiedPauseBtn);
            p.addChild(_rankMakeBtn(402,39,58,24,"重置",15680580,_onUnifiedResetClick));
            p.addChild(_rankMakeBtn(466,39,68,24,"领全部",16096779,_onUnifiedClaimAll));
            p.addChild(_rankMakeBtn(542,39,84,24,"领删全部",16096779,_onUnifiedClaimDeleteAll));
            p.addChild(_rankMakeBtn(634,39,84,24,"过滤名单",9741240,_onUnifiedFilteredListClick));
            p.addChild(_rankMakeLabel("类目:",14,73,42,18,9741240,10));
            _unifiedCategoryBtns = [];
            _addUnifiedCategoryBtn(p,"星钻",UNIFIED_MODE_DIAMOND,58,70,46);
            _addUnifiedCategoryBtn(p,"全部",UNIFIED_MODE_SCAN_ALL,108,70,46);
            _addUnifiedCategoryBtn(p,"羽鳞",UNIFIED_MODE_FEATHER,158,70,46);
            _addUnifiedCategoryBtn(p,"黄金箱",UNIFIED_MODE_GOLD_BOX,208,70,58);
            _addUnifiedCategoryBtn(p,"白银箱",UNIFIED_MODE_SILVER_BOX,270,70,58);
            _addUnifiedCategoryBtn(p,"青铜箱",UNIFIED_MODE_BRONZE_BOX,332,70,58);
            _addUnifiedCategoryBtn(p,"空邮件",UNIFIED_MODE_EMPTY,394,70,58);
            _addUnifiedCategoryBtn(p,"所有",UNIFIED_MODE_ALL,456,70,46);
            _addUnifiedCategoryBtn(p,"有内容",UNIFIED_MODE_CONTENT,506,70,58);
            p.addChild(_rankMakeBtn(14,100,90,24,"删空邮件",15680580,_onUnifiedDeleteEmpty));
            p.addChild(_rankMakeBtn(110,100,92,24,"领目标删",2278750,_onUnifiedClaimTargetDelete));
            _unifiedStatusTxt = _rankMakeLabel("状态：就绪",210,104,UNIFIED_PANEL_W - 224,18,9741240,11);
            p.addChild(_unifiedStatusTxt);
            p.addChild(_rankMakeLabel("min:",14,132,30,18,16498468,10,true));
            _unifiedInpMin = _rankMakeInput(46,128,54,22);
            _unifiedInpMin.text = _rankLastMin;
            _unifiedInpMin.restrict = "0-9";
            _unifiedInpMin.addEventListener(Event.CHANGE,_onUnifiedRangeChange,false,0,true);
            p.addChild(_unifiedInpMin);
            p.addChild(_rankMakeLabel("max:",106,132,32,18,16498468,10,true));
            _unifiedInpMax = _rankMakeInput(140,128,58,22);
            _unifiedInpMax.text = _rankLastMax;
            _unifiedInpMax.restrict = "0-9";
            _unifiedInpMax.addEventListener(Event.CHANGE,_onUnifiedRangeChange,false,0,true);
            p.addChild(_unifiedInpMax);
            p.addChild(_rankMakeBtn(206,128,54,22,"导入",16096779,_onUnifiedImportIdsClick));
            p.addChild(_rankMakeBtn(266,128,54,22,"导出",16096779,_onUnifiedExportIdsClick));
            p.addChild(_rankMakeLabel("榜单:",330,132,42,18,9741240,10));
            p.addChild(_rankMakeBtn(372,128,58,22,"大乱斗",2282478,_onUnifiedRank9));
            p.addChild(_rankMakeBtn(434,128,58,22,"神魔榜",2282478,_onUnifiedRank71));
            p.addChild(_rankMakeBtn(496,128,44,22,"十字",2282478,_onUnifiedRank131));
            p.addChild(_rankMakeBtn(544,128,44,22,"天空",16096779,_onUnifiedRankSky));
            p.addChild(_rankMakeBtn(592,128,44,22,"勇者",16096779,_onUnifiedRankBrave));
            p.addChild(_rankMakeBtn(640,128,44,22,"王者",16096779,_onUnifiedRankKing));
            p.addChild(_rankMakeBtn(14,156,44,22,"巅峰",16096779,_onUnifiedRankPeak));
            p.addChild(_rankMakeBtn(62,156,44,22,"无擒",16096779,_onUnifiedRankQin));
            p.addChild(_rankMakeBtn(110,156,44,22,"御风",16096779,_onUnifiedRankYufeng));
            lbg = new Shape();
            lbg.graphics.beginFill(0,0.5);
            lbg.graphics.lineStyle(1,2282478,0.28);
            lbg.graphics.drawRoundRect(10,184,UNIFIED_PANEL_W - 20,UNIFIED_PANEL_H - 196,4,4);
            lbg.graphics.endFill();
            p.addChild(lbg);
            _unifiedLogTxt = new TextField();
            _unifiedLogTxt.x = 16;
            _unifiedLogTxt.y = 190;
            _unifiedLogTxt.width = UNIFIED_PANEL_W - 46;
            _unifiedLogTxt.height = UNIFIED_PANEL_H - 208;
            _unifiedLogTxt.multiline = true;
            _unifiedLogTxt.wordWrap = true;
            _unifiedLogTxt.selectable = true;
            _unifiedLogTxt.mouseWheelEnabled = true;
            _unifiedLogTxt.background = false;
            _unifiedLogTxt.border = false;
            f = new TextFormat();
            f.font = "Consolas";
            f.size = 11;
            f.color = 13761253;
            _unifiedLogTxt.defaultTextFormat = f;
            _unifiedLogTxt.text = "[大一统] 使用当前替换列表账号进行勘查\n";
            p.addChild(_unifiedLogTxt);
            _unifiedLogScrollTrack = new Sprite();
            _unifiedLogScrollTrack.x = UNIFIED_PANEL_W - 24;
            _unifiedLogScrollTrack.y = 190;
            _unifiedLogScrollTrack.graphics.beginFill(16777215,0.04);
            _unifiedLogScrollTrack.graphics.lineStyle(1,2282478,0.18);
            _unifiedLogScrollTrack.graphics.drawRoundRect(0,0,RES_SB_W,UNIFIED_PANEL_H - 208,3,3);
            _unifiedLogScrollTrack.graphics.endFill();
            _unifiedLogScrollTrack.mouseEnabled = false;
            _unifiedLogScrollTrack.mouseChildren = true;
            p.addChild(_unifiedLogScrollTrack);
            _unifiedLogScrollThumb = new Sprite();
            _unifiedLogScrollThumb.x = 1;
            _unifiedLogScrollThumb.y = 0;
            _unifiedLogScrollThumb.buttonMode = true;
            _unifiedLogScrollThumb.useHandCursor = true;
            _unifiedLogScrollThumb.mouseEnabled = true;
            _unifiedLogScrollThumb.addEventListener(MouseEvent.MOUSE_DOWN,_onUnifiedLogSbThumbDown,false,0,true);
            _unifiedLogScrollTrack.addChild(_unifiedLogScrollThumb);
            _unifiedLogTxt.addEventListener(Event.SCROLL,_onUnifiedLogScroll,false,0,true);
            _updateUnifiedLogScrollbar();
            _refreshUnifiedCategoryButtons();
         }
         catch(e:Error)
         {
         }
         return p;
      }
      
      private static function _addUnifiedCategoryBtn(parent:Sprite, label:String, mode:String, x:int, y:int, w:int) : void
      {
         var btn:Sprite = null;
         try
         {
            btn = _rankMakeBtn(x,y,w,22,label,mode == UNIFIED_MODE_DIAMOND ? 2282478 : 16096779,_onUnifiedCategoryClick);
            btn.name = mode;
            parent.addChild(btn);
            _unifiedCategoryBtns.push(btn);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onUnifiedCategoryClick(e:MouseEvent) : void
      {
         try
         {
            if(e == null || e.currentTarget == null)
            {
               return;
            }
            _unifiedCategory = e.currentTarget.name;
            _refreshUnifiedCategoryButtons();
            _refreshUnifiedCategoryRows(true);
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onRankRangeChange(e:Event) : void
      {
         if(_syncingRankRange)
         {
            return;
         }
         _syncUnifiedMinMaxFromRank();
      }
      
      private static function _onUnifiedRangeChange(e:Event) : void
      {
         if(_syncingRankRange)
         {
            return;
         }
         _syncRankMinMaxFromUnified();
      }
      
      private static function _syncUnifiedMinMaxFromRank() : void
      {
         try
         {
            _syncingRankRange = true;
            _rankLastMin = _rankReadCurrentMin();
            _rankLastMax = _rankReadCurrentMax();
            if(_unifiedInpMin != null)
            {
               _unifiedInpMin.text = _rankLastMin;
            }
            if(_unifiedInpMax != null)
            {
               _unifiedInpMax.text = _rankLastMax;
            }
         }
         catch(e:Error)
         {
         }
         _syncingRankRange = false;
      }
      
      private static function _syncRankMinMaxFromUnified() : void
      {
         var minV:int;
         var maxV:int;
         try
         {
            _syncingRankRange = true;
            minV = _unifiedReadCurrentMin();
            maxV = _unifiedReadCurrentMax();
            _rankLastMin = minV;
            _rankLastMax = maxV;
            if(_rankInpMin != null)
            {
               _rankInpMin.text = minV;
            }
            if(_rankInpMax != null)
            {
               _rankInpMax.text = maxV;
            }
         }
         catch(e:Error)
         {
         }
         _syncingRankRange = false;
      }
      
      private static function _unifiedReadCurrentMin() : int
      {
         var n:int;
         try
         {
            if(_unifiedInpMin != null && _unifiedInpMin.text != "")
            {
               n = int(parseInt(_unifiedInpMin.text,10));
               if(!isNaN(n))
               {
                  return n;
               }
            }
         }
         catch(e:Error)
         {
         }
         return _rankReadCurrentMin();
      }
      
      private static function _unifiedReadCurrentMax() : int
      {
         var n:int;
         try
         {
            if(_unifiedInpMax != null && _unifiedInpMax.text != "")
            {
               n = int(parseInt(_unifiedInpMax.text,10));
               if(!isNaN(n))
               {
                  return n;
               }
            }
         }
         catch(e:Error)
         {
         }
         return _rankReadCurrentMax();
      }
      
      private static function _refreshUnifiedCategoryButtons() : void
      {
         var i:int = 0;
         var btn:Sprite = null;
         try
         {
            while(i < _unifiedCategoryBtns.length)
            {
               btn = _unifiedCategoryBtns[i] as Sprite;
               if(btn != null)
               {
                  btn.alpha = btn.name == _unifiedCategory ? 1 : 0.55;
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onUnifiedPauseClick(e:MouseEvent) : void
      {
         try
         {
            if(!_unifiedRunning && !_unifiedPaused && _rankImportToUnifiedAfterResp && _rankBusy)
            {
               _clearRank1521Listeners();
               _rankBusy = false;
               _rankImportToUnifiedAfterResp = false;
               _rankImportToUnifiedLabel = "";
               _clearUnifiedRankScanState(false);
               _unifiedStatus("已暂停榜单查询");
               _unifiedLog("[暂停] 已取消当前榜单查询");
               return;
            }
            if(!_unifiedRunning && !_unifiedPaused)
            {
               _unifiedLog("[暂停] 当前没有运行中的勘查或领取");
               return;
            }
            if(_unifiedPaused)
            {
               if(_unifiedStopAtTarget && _unifiedTarget > 0 && _unifiedTotal >= _unifiedTarget)
               {
                  _unifiedStopAtTarget = false;
                  _unifiedLog("[继续] 已解除本次到目标停止，继续向后勘查");
               }
               _unifiedPaused = false;
               _unifiedRunning = true;
               _updateUnifiedPauseButton();
               _unifiedLog("[继续] 从暂停位置继续");
               _unifiedStatus("继续：" + _unifiedCategoryTitle());
               if(_unifiedPhase == "op")
               {
                  _unifiedTimer = setTimeout(_processUnifiedOpNext,UNIFIED_GAP_MS);
               }
               else if(_unifiedPhase == "list")
               {
                  _unifiedTimer = setTimeout(_unifiedRequestNextAccount,UNIFIED_GAP_MS);
               }
               else
               {
                  _unifiedTimer = setTimeout(_unifiedRequestNextMailDetail,UNIFIED_GAP_MS);
               }
               return;
            }
            _unifiedPaused = true;
            _unifiedRunning = false;
            _cleanupUnifiedListeners(true);
            _updateUnifiedPauseButton();
            _unifiedStatus("已暂停：" + _unifiedCategoryTitle());
            _unifiedLog("[暂停] 已停止后续请求，可点继续或重置");
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onUnifiedResetClick(e:MouseEvent) : void
      {
         _resetUnifiedState(true);
      }
      
      private static function _updateUnifiedPauseButton() : void
      {
         var tf:TextField = null;
         try
         {
            if(_unifiedPauseBtn != null && _unifiedPauseBtn.numChildren > 0)
            {
               tf = _unifiedPauseBtn.getChildAt(_unifiedPauseBtn.numChildren - 1) as TextField;
               if(tf != null)
               {
                  tf.text = _unifiedPaused ? "继续" : "暂停";
               }
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _resetUnifiedState(clearLog:Boolean) : void
      {
         try
         {
            if(_rankImportToUnifiedAfterResp)
            {
               _clearRank1521Listeners();
               _rankBusy = false;
               _rankImportToUnifiedAfterResp = false;
               _rankImportToUnifiedLabel = "";
            }
            _cleanupUnifiedListeners(true);
            _unifiedRunning = false;
            _unifiedPaused = false;
            _unifiedPhase = "";
            _clearUnifiedRankScanState(true);
            _unifiedIds = [];
            _unifiedAllRows = [];
            _unifiedRows = [];
            _unifiedEmptyRows = [];
            _unifiedMailList = [];
            _unifiedOpRows = [];
            _unifiedAccountIndex = 0;
            _unifiedMailIndex = 0;
            _unifiedOpIndex = 0;
            _unifiedTotal = 0;
            _unifiedMailCount = 0;
            _unifiedStopAtTarget = false;
            _unifiedOpDeleteAfter = false;
            _unifiedOpMode = "";
            _updateUnifiedPauseButton();
            _unifiedStatus("已重置：" + _unifiedCategoryTitle());
            if(clearLog)
            {
               _setUnifiedLogText("[重置] 已清空勘查状态，当前类目：" + _unifiedCategoryTitle() + "\n",true);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _resetUnifiedScanRows(clearLog:Boolean) : void
      {
         try
         {
            _cleanupUnifiedListeners(true);
            _unifiedRunning = false;
            _unifiedPaused = false;
            _unifiedPhase = "";
            _clearUnifiedRankScanState();
            _unifiedAllRows = [];
            _unifiedRows = [];
            _unifiedEmptyRows = [];
            _unifiedMailList = [];
            _unifiedOpRows = [];
            _unifiedAccountIndex = 0;
            _unifiedMailIndex = 0;
            _unifiedOpIndex = 0;
            _unifiedTotal = 0;
            _unifiedMailCount = 0;
            _unifiedStopAtTarget = false;
            _unifiedOpDeleteAfter = false;
            _unifiedOpMode = "";
            _updateUnifiedPauseButton();
            if(clearLog)
            {
               _setUnifiedLogText("",true);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onUnifiedDragStart(e:MouseEvent) : void
      {
         try
         {
            if(_unifiedPanel == null)
            {
               return;
            }
            _unifiedPanel.startDrag();
            if(LayerManager.stage != null)
            {
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP,_onUnifiedDragEnd,false,0,true);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onUnifiedDragEnd(e:MouseEvent) : void
      {
         try
         {
            if(_unifiedPanel != null)
            {
               _unifiedPanel.stopDrag();
            }
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onUnifiedDragEnd);
            }
            if(_unifiedPanel != null)
            {
               _unifiedSaveNumber("panelX",_unifiedPanel.x);
               _unifiedSaveNumber("panelY",_unifiedPanel.y);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _unifiedStatus(s:String) : void
      {
         try
         {
            if(_unifiedStatusTxt != null)
            {
               _unifiedStatusTxt.text = "状态：" + s;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _unifiedLog(s:String) : void
      {
         try
         {
            if(_unifiedLogTxt != null)
            {
               _unifiedLogTxt.appendText(s + "\n");
               _unifiedLogTxt.scrollV = _unifiedLogTxt.maxScrollV;
               _updateUnifiedLogScrollbar();
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _setUnifiedLogText(text:String, scrollTop:Boolean = true) : void
      {
         try
         {
            if(_unifiedLogTxt == null)
            {
               return;
            }
            _unifiedLogTxt.text = text;
            _unifiedLogTxt.scrollV = scrollTop ? 1 : _unifiedLogTxt.maxScrollV;
            _updateUnifiedLogScrollbar();
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onUnifiedFilteredListClick(e:MouseEvent) : void
      {
         try
         {
            _openUnifiedFilteredPanel();
            _unifiedStatus("过滤名单 " + _unifiedFilteredRows.length + " 个");
         }
         catch(err:Error)
         {
            _unifiedLog("[过滤名单] 查看失败：" + err.message);
         }
      }
      
      private static function _openUnifiedFilteredPanel() : void
      {
         try
         {
            if(_unifiedPanel == null)
            {
               return;
            }
            if(_unifiedFilterPanel == null)
            {
               _unifiedFilterPanel = _buildUnifiedFilteredPanel();
            }
            if(_unifiedFilterPanel.parent == null)
            {
               _unifiedPanel.addChild(_unifiedFilterPanel);
            }
            try
            {
               _unifiedPanel.setChildIndex(_unifiedFilterPanel,_unifiedPanel.numChildren - 1);
            }
            catch(eI:Error)
            {
            }
            _refreshUnifiedFilteredPanel();
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _closeUnifiedFilteredPanel(e:MouseEvent = null) : void
      {
         try
         {
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,_onUnifiedFilterSbDragMove);
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onUnifiedFilterSbDragEnd);
            }
            _unifiedFilterSbDragging = false;
            if(_unifiedFilterPanel != null && _unifiedFilterPanel.parent != null)
            {
               _unifiedFilterPanel.parent.removeChild(_unifiedFilterPanel);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _buildUnifiedFilteredPanel() : Sprite
      {
         var w:int;
         var h:int;
         var bg:Shape;
         var f:TextFormat;
         var p:Sprite = new Sprite();
         try
         {
            w = 560;
            h = 360;
            p.x = 98;
            p.y = 128;
            bg = new Shape();
            bg.graphics.beginFill(463135,0.98);
            bg.graphics.lineStyle(1,16096779,0.7);
            bg.graphics.drawRoundRect(0,0,w,h,5,5);
            bg.graphics.endFill();
            p.addChild(bg);
            p.addChild(_rankMakeLabel("过滤名单",12,8,160,20,16498468,13,true));
            p.addChild(_rankMakeBtn(w - 28,6,22,22,"X",15680580,_closeUnifiedFilteredPanel));
            _unifiedFilterTxt = new TextField();
            _unifiedFilterTxt.x = 14;
            _unifiedFilterTxt.y = 38;
            _unifiedFilterTxt.width = w - 42;
            _unifiedFilterTxt.height = h - 50;
            _unifiedFilterTxt.multiline = true;
            _unifiedFilterTxt.wordWrap = true;
            _unifiedFilterTxt.selectable = true;
            _unifiedFilterTxt.mouseWheelEnabled = true;
            _unifiedFilterTxt.background = false;
            _unifiedFilterTxt.border = false;
            f = new TextFormat();
            f.font = "Consolas";
            f.size = 11;
            f.color = 14870768;
            _unifiedFilterTxt.defaultTextFormat = f;
            p.addChild(_unifiedFilterTxt);
            _unifiedFilterScrollTrack = new Sprite();
            _unifiedFilterScrollTrack.x = w - 20;
            _unifiedFilterScrollTrack.y = 38;
            _unifiedFilterScrollTrack.graphics.beginFill(16777215,0.04);
            _unifiedFilterScrollTrack.graphics.lineStyle(1,16096779,0.2);
            _unifiedFilterScrollTrack.graphics.drawRoundRect(0,0,RES_SB_W,h - 50,3,3);
            _unifiedFilterScrollTrack.graphics.endFill();
            _unifiedFilterScrollTrack.mouseEnabled = false;
            _unifiedFilterScrollTrack.mouseChildren = true;
            p.addChild(_unifiedFilterScrollTrack);
            _unifiedFilterScrollThumb = new Sprite();
            _unifiedFilterScrollThumb.x = 1;
            _unifiedFilterScrollThumb.y = 0;
            _unifiedFilterScrollThumb.buttonMode = true;
            _unifiedFilterScrollThumb.useHandCursor = true;
            _unifiedFilterScrollThumb.mouseEnabled = true;
            _unifiedFilterScrollThumb.addEventListener(MouseEvent.MOUSE_DOWN,_onUnifiedFilterSbThumbDown,false,0,true);
            _unifiedFilterScrollTrack.addChild(_unifiedFilterScrollThumb);
            _unifiedFilterTxt.addEventListener(Event.SCROLL,_onUnifiedFilterScroll,false,0,true);
         }
         catch(e:Error)
         {
         }
         return p;
      }
      
      private static function _refreshUnifiedFilteredPanel() : void
      {
         var text:String;
         var i:int;
         var row:Object;
         try
         {
            if(_unifiedFilterTxt == null)
            {
               return;
            }
            text = "[过滤名单] 共 " + _unifiedFilteredRows.length + " 个\n";
            i = 0;
            while(i < _unifiedFilteredRows.length)
            {
               row = _unifiedFilteredRows[i];
               text += "  " + (i + 1) + ". " + row.userId + "，来源：" + row.label + "，原因：" + row.reason + "\n";
               i++;
            }
            if(_unifiedFilteredRows.length <= 0)
            {
               text += "  暂无被过滤账号\n";
            }
            _unifiedFilterTxt.text = text;
            _unifiedFilterTxt.scrollV = 1;
            _updateUnifiedFilterScrollbar();
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _updateUnifiedLogScrollbar() : void
      {
         var trackH:Number;
         var maxScroll:int;
         var bottomScroll:int;
         var topScroll:int;
         var totalLines:int;
         var visibleLines:int;
         var ratio:Number;
         var thumbH:Number;
         var travelable:Number;
         var progress:Number;
         try
         {
            if(_unifiedLogTxt == null || _unifiedLogScrollTrack == null || _unifiedLogScrollThumb == null)
            {
               return;
            }
            trackH = _unifiedLogScrollTrack.height;
            maxScroll = _unifiedLogTxt.maxScrollV;
            bottomScroll = _unifiedLogTxt.bottomScrollV;
            topScroll = _unifiedLogTxt.scrollV;
            totalLines = maxScroll + (bottomScroll - topScroll);
            if(totalLines <= 0)
            {
               totalLines = 1;
            }
            visibleLines = bottomScroll - topScroll + 1;
            if(visibleLines < 1)
            {
               visibleLines = 1;
            }
            if(maxScroll <= 1)
            {
               _unifiedLogScrollThumb.visible = false;
               return;
            }
            _unifiedLogScrollThumb.visible = true;
            ratio = visibleLines / totalLines;
            thumbH = trackH * ratio;
            if(thumbH < 18)
            {
               thumbH = 18;
            }
            if(thumbH > trackH)
            {
               thumbH = trackH;
            }
            travelable = trackH - thumbH;
            progress = (topScroll - 1) / (maxScroll - 1);
            if(progress < 0)
            {
               progress = 0;
            }
            if(progress > 1)
            {
               progress = 1;
            }
            _unifiedLogScrollThumb.graphics.clear();
            _unifiedLogScrollThumb.graphics.beginFill(2282478,0.5);
            _unifiedLogScrollThumb.graphics.drawRoundRect(0,0,RES_SB_W - 2,thumbH,3,3);
            _unifiedLogScrollThumb.graphics.endFill();
            _unifiedLogScrollThumb.x = 1;
            _unifiedLogScrollThumb.y = travelable * progress;
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onUnifiedLogScroll(e:Event) : void
      {
         try
         {
            _updateUnifiedLogScrollbar();
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onUnifiedLogSbThumbDown(e:MouseEvent) : void
      {
         try
         {
            if(_unifiedLogScrollThumb == null)
            {
               return;
            }
            _unifiedLogSbDragging = true;
            _unifiedLogSbDragOffsetY = _unifiedLogScrollThumb.parent.mouseY - _unifiedLogScrollThumb.y;
            if(LayerManager.stage != null)
            {
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_MOVE,_onUnifiedLogSbDragMove,false,0,true);
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP,_onUnifiedLogSbDragEnd,false,0,true);
            }
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onUnifiedLogSbDragMove(e:MouseEvent) : void
      {
         var trackH:Number;
         var thumbH:Number;
         var travelable:Number;
         var newY:Number;
         var maxScroll:int;
         var progress:Number;
         var newScroll:int;
         try
         {
            if(!_unifiedLogSbDragging || _unifiedLogScrollThumb == null || _unifiedLogScrollTrack == null || _unifiedLogTxt == null)
            {
               return;
            }
            trackH = _unifiedLogScrollTrack.height;
            thumbH = _unifiedLogScrollThumb.height;
            travelable = trackH - thumbH;
            if(travelable <= 0)
            {
               return;
            }
            newY = _unifiedLogScrollTrack.mouseY - _unifiedLogSbDragOffsetY;
            if(newY < 0)
            {
               newY = 0;
            }
            if(newY > travelable)
            {
               newY = travelable;
            }
            _unifiedLogScrollThumb.y = newY;
            maxScroll = _unifiedLogTxt.maxScrollV;
            if(maxScroll < 1)
            {
               maxScroll = 1;
            }
            progress = newY / travelable;
            newScroll = 1 + Math.round(progress * (maxScroll - 1));
            if(newScroll < 1)
            {
               newScroll = 1;
            }
            if(newScroll > maxScroll)
            {
               newScroll = maxScroll;
            }
            _unifiedLogTxt.scrollV = newScroll;
            e.updateAfterEvent();
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onUnifiedLogSbDragEnd(e:MouseEvent) : void
      {
         try
         {
            _unifiedLogSbDragging = false;
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,_onUnifiedLogSbDragMove);
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onUnifiedLogSbDragEnd);
            }
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _updateUnifiedFilterScrollbar() : void
      {
         var trackH:Number;
         var maxScroll:int;
         var bottomScroll:int;
         var topScroll:int;
         var totalLines:int;
         var visibleLines:int;
         var ratio:Number;
         var thumbH:Number;
         var travelable:Number;
         var progress:Number;
         try
         {
            if(_unifiedFilterTxt == null || _unifiedFilterScrollTrack == null || _unifiedFilterScrollThumb == null)
            {
               return;
            }
            trackH = _unifiedFilterScrollTrack.height;
            maxScroll = _unifiedFilterTxt.maxScrollV;
            bottomScroll = _unifiedFilterTxt.bottomScrollV;
            topScroll = _unifiedFilterTxt.scrollV;
            totalLines = maxScroll + (bottomScroll - topScroll);
            if(totalLines <= 0)
            {
               totalLines = 1;
            }
            visibleLines = bottomScroll - topScroll + 1;
            if(visibleLines < 1)
            {
               visibleLines = 1;
            }
            if(maxScroll <= 1)
            {
               _unifiedFilterScrollThumb.visible = false;
               return;
            }
            _unifiedFilterScrollThumb.visible = true;
            ratio = visibleLines / totalLines;
            thumbH = trackH * ratio;
            if(thumbH < 18)
            {
               thumbH = 18;
            }
            if(thumbH > trackH)
            {
               thumbH = trackH;
            }
            travelable = trackH - thumbH;
            progress = (topScroll - 1) / (maxScroll - 1);
            if(progress < 0)
            {
               progress = 0;
            }
            if(progress > 1)
            {
               progress = 1;
            }
            _unifiedFilterScrollThumb.graphics.clear();
            _unifiedFilterScrollThumb.graphics.beginFill(16096779,0.55);
            _unifiedFilterScrollThumb.graphics.drawRoundRect(0,0,RES_SB_W - 2,thumbH,3,3);
            _unifiedFilterScrollThumb.graphics.endFill();
            _unifiedFilterScrollThumb.x = 1;
            _unifiedFilterScrollThumb.y = travelable * progress;
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onUnifiedFilterScroll(e:Event) : void
      {
         try
         {
            _updateUnifiedFilterScrollbar();
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onUnifiedFilterSbThumbDown(e:MouseEvent) : void
      {
         try
         {
            if(_unifiedFilterScrollThumb == null)
            {
               return;
            }
            _unifiedFilterSbDragging = true;
            _unifiedFilterSbDragOffsetY = _unifiedFilterScrollThumb.parent.mouseY - _unifiedFilterScrollThumb.y;
            if(LayerManager.stage != null)
            {
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_MOVE,_onUnifiedFilterSbDragMove,false,0,true);
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP,_onUnifiedFilterSbDragEnd,false,0,true);
            }
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onUnifiedFilterSbDragMove(e:MouseEvent) : void
      {
         var trackH:Number;
         var thumbH:Number;
         var travelable:Number;
         var newY:Number;
         var maxScroll:int;
         var progress:Number;
         var newScroll:int;
         try
         {
            if(!_unifiedFilterSbDragging || _unifiedFilterScrollThumb == null || _unifiedFilterScrollTrack == null || _unifiedFilterTxt == null)
            {
               return;
            }
            trackH = _unifiedFilterScrollTrack.height;
            thumbH = _unifiedFilterScrollThumb.height;
            travelable = trackH - thumbH;
            if(travelable <= 0)
            {
               return;
            }
            newY = _unifiedFilterScrollTrack.mouseY - _unifiedFilterSbDragOffsetY;
            if(newY < 0)
            {
               newY = 0;
            }
            if(newY > travelable)
            {
               newY = travelable;
            }
            _unifiedFilterScrollThumb.y = newY;
            maxScroll = _unifiedFilterTxt.maxScrollV;
            if(maxScroll < 1)
            {
               maxScroll = 1;
            }
            progress = newY / travelable;
            newScroll = 1 + Math.round(progress * (maxScroll - 1));
            if(newScroll < 1)
            {
               newScroll = 1;
            }
            if(newScroll > maxScroll)
            {
               newScroll = maxScroll;
            }
            _unifiedFilterTxt.scrollV = newScroll;
            e.updateAfterEvent();
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onUnifiedFilterSbDragEnd(e:MouseEvent) : void
      {
         try
         {
            _unifiedFilterSbDragging = false;
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,_onUnifiedFilterSbDragMove);
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onUnifiedFilterSbDragEnd);
            }
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onUnifiedScanAll(e:MouseEvent) : void
      {
         _startUnifiedRankScanByCategory();
      }
      
      private static function _startUnifiedRankScanByCategory() : void
      {
         var queue:Array;
         try
         {
            if(_unifiedRunning || _rankBusy)
            {
               _unifiedLog("[勘查全部] 当前正在运行，请稍候");
               return;
            }
            queue = _buildUnifiedRankScanQueue();
            if(queue == null || queue.length <= 0)
            {
               _clearUnifiedRankScanState();
               _startUnifiedSurvey(false);
               return;
            }
            _openUnifiedPanel();
            _cancelUnifiedMailboxFilter();
            _cleanupUnifiedListeners(true);
            _unifiedIds = [];
            _unifiedAllRows = [];
            _unifiedRows = [];
            _unifiedEmptyRows = [];
            _unifiedMailList = [];
            _unifiedAccountIndex = 0;
            _unifiedMailIndex = 0;
            _unifiedTotal = 0;
            _unifiedMailCount = 0;
            _unifiedOpRows = [];
            _unifiedOpIndex = 0;
            _unifiedOpDeleteAfter = false;
            _unifiedOpMode = "";
            _unifiedTarget = _readUnifiedTarget();
            _unifiedStopAtTarget = _unifiedTarget > 0;
            _unifiedRankScanActive = true;
            _unifiedRankScanQueue = queue;
            _unifiedRankScanIndex = 0;
            _unifiedRankScanSeen = {};
            _unifiedRankScanFilterEnabled = queue.length > 1;
            _unifiedFilteredRows = [];
            if(_unifiedFilterPanel != null && _unifiedFilterPanel.parent != null)
            {
               _refreshUnifiedFilteredPanel();
            }
            _unifiedRunning = false;
            _unifiedPaused = false;
            _unifiedPhase = "rank";
            _updateUnifiedPauseButton();
            _setUnifiedLogText("",true);
            _unifiedLog("[勘查全部] 类目：" + _unifiedCategoryTitle() + "，将按榜单依次勘查：" + _unifiedRankScanQueueLabels(queue) + (_unifiedRankScanFilterEnabled ? "，重复账号将记录到过滤名单" : "，单榜单不启用过滤名单") + (_unifiedStopAtTarget ? "，达到 " + _unifiedTarget + _unifiedCategoryUnit() + " 后暂停" : ""));
            _startNextUnifiedRankScan();
         }
         catch(err:Error)
         {
            _clearUnifiedRankScanState();
            _unifiedLog("[勘查全部] 启动失败：" + err.message);
         }
      }
      
      private static function _buildUnifiedRankScanQueue() : Array
      {
         if(_unifiedCategory == UNIFIED_MODE_DIAMOND)
         {
            return _makeUnifiedMonthRankQueue([0,1,2,3],["天空","勇者","王者","巅峰"]);
         }
         if(_unifiedCategory == UNIFIED_MODE_FEATHER)
         {
            return _makeUnifiedMonthRankQueue([5],["御风"]);
         }
         if(_unifiedCategory == UNIFIED_MODE_GOLD_BOX || _unifiedCategory == UNIFIED_MODE_SILVER_BOX || _unifiedCategory == UNIFIED_MODE_BRONZE_BOX)
         {
            return _makeUnifiedMonthRankQueue([4],["无擒"]);
         }
         if(_unifiedCategory == UNIFIED_MODE_SCAN_ALL)
         {
            return _makeUnifiedMonthRankQueue([0,1,2,3,4,5],["天空","勇者","王者","巅峰","无擒","御风"]);
         }
         return [];
      }
      
      private static function _makeUnifiedMonthRankQueue(slots:Array, labels:Array) : Array
      {
         var ids:Array;
         var i:int;
         var slot:int;
         var queue:Array = [];
         try
         {
            ids = _getCurrentMonthRankIds();
            i = 0;
            while(i < slots.length)
            {
               slot = int(slots[i]);
               if(ids != null && slot >= 0 && slot < ids.length)
               {
                  queue.push({
                     "rankId":int(ids[slot]),
                     "label":labels[i]
                  });
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return queue;
      }
      
      private static function _unifiedRankScanQueueLabels(queue:Array) : String
      {
         var i:int;
         var s:String = "";
         try
         {
            i = 0;
            while(i < queue.length)
            {
               if(i > 0)
               {
                  s += " -> ";
               }
               s += queue[i].label;
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return s;
      }
      
      private static function _startNextUnifiedRankScan() : void
      {
         var item:Object;
         var minV:int;
         var maxV:int;
         try
         {
            if(!_unifiedRankScanActive)
            {
               return;
            }
            if(_unifiedStopAtTarget && _unifiedTarget > 0 && _unifiedTotal >= _unifiedTarget)
            {
               _pauseUnifiedIfTargetReached("已达到目标 " + _unifiedTarget);
               return;
            }
            if(_unifiedRankScanIndex >= _unifiedRankScanQueue.length)
            {
               _clearUnifiedRankScanState(false);
               _finishUnifiedSurvey("榜单勘查完成");
               return;
            }
            item = _unifiedRankScanQueue[_unifiedRankScanIndex];
            ++_unifiedRankScanIndex;
            _syncRankMinMaxFromUnified();
            minV = _unifiedReadCurrentMin();
            maxV = _unifiedReadCurrentMax();
            _rankImportToReplaceAfterResp = false;
            _rankImportToReplaceLabel = "";
            _rankImportToReplaceFilterAfterResp = false;
            _rankImportToUnifiedAfterResp = true;
            _rankImportToUnifiedLabel = item.label;
            _unifiedPhase = "rank";
            _unifiedStatus("勘查全部 " + _unifiedRankScanIndex + "/" + _unifiedRankScanQueue.length + "：" + item.label + " 榜单查询中");
            _unifiedLog("[勘查全部] " + item.label + " rankId=" + int(item.rankId) + " min=" + minV + " max=" + maxV);
            _sendRankQuery(int(item.rankId),minV,maxV,"[unified-scan-all] " + item.label);
         }
         catch(err:Error)
         {
            _unifiedLog("[勘查全部] 榜单推进失败：" + err.message);
            _clearUnifiedRankScanState();
         }
      }
      
      private static function _filterUnifiedRankScanNewIds(ids:Array, currentLabel:String) : Array
      {
         var i:int;
         var id:int;
         var key:String;
         var arr:Array = [];
         try
         {
            if(!_unifiedRankScanFilterEnabled)
            {
               return _copyPositiveIds(ids);
            }
            if(currentLabel == null || currentLabel.length == 0)
            {
               currentLabel = "当前榜单";
            }
            if(_unifiedRankScanSeen == null)
            {
               _unifiedRankScanSeen = {};
            }
            i = 0;
            while(i < ids.length)
            {
               id = int(ids[i]);
               key = id;
               if(id > 0)
               {
                  if(_unifiedRankScanSeen[key] != null)
                  {
                     _unifiedFilteredRows.push({
                        "userId":id,
                        "label":currentLabel,
                        "reason":"在" + _unifiedRankScanSeen[key] + "名单中已勘查过，本次在" + currentLabel + "名单中过滤"
                     });
                     if(_unifiedFilterPanel != null && _unifiedFilterPanel.parent != null)
                     {
                        _refreshUnifiedFilteredPanel();
                     }
                  }
                  else
                  {
                     _unifiedRankScanSeen[key] = currentLabel;
                     arr.push(id);
                  }
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return arr;
      }
      
      private static function _onUnifiedImportIdsClick(e:MouseEvent) : void
      {
         try
         {
            _unifiedFileRef = new FileReference();
            _unifiedFileRef.addEventListener(Event.SELECT,_onUnifiedFileSelected,false,0,true);
            _unifiedFileRef.browse();
         }
         catch(err:Error)
         {
            _unifiedLog("[导入] 打开文件选择失败：" + err.message);
         }
      }
      
      private static function _onUnifiedFileSelected(e:Event) : void
      {
         try
         {
            _unifiedFileRef.removeEventListener(Event.SELECT,_onUnifiedFileSelected);
            _unifiedFileRef.addEventListener(Event.COMPLETE,_onUnifiedFileLoaded,false,0,true);
            _unifiedFileRef.load();
         }
         catch(err:Error)
         {
            _unifiedLog("[导入] 读取文件失败：" + err.message);
         }
      }
      
      private static function _onUnifiedFileLoaded(e:Event) : void
      {
         var text:String;
         var ids:Array;
         try
         {
            _unifiedFileRef.removeEventListener(Event.COMPLETE,_onUnifiedFileLoaded);
            text = _unifiedFileRef.data;
            ids = _parseReplaceProbeIds(text);
            _unifiedIds = ids;
            _unifiedLog("[导入] 米米号 " + ids.length + " 个，已覆盖大一统列表");
            _unifiedStatus("已导入 " + ids.length + " 个账号");
         }
         catch(err:Error)
         {
            _unifiedLog("[导入] 解析失败：" + err.message);
         }
      }
      
      private static function _onUnifiedExportIdsClick(e:MouseEvent) : void
      {
         var ids:Array;
         var ref:FileReference;
         try
         {
            ids = _unifiedSourceIds();
            if(ids == null || ids.length <= 0)
            {
               _unifiedLog("[导出] 没有可导出的米米号");
               return;
            }
            ref = new FileReference();
            ref.save(_replaceIdsToText(ids),"unified_mm_ids.txt");
            _unifiedLog("[导出] 米米号 " + ids.length + " 个");
         }
         catch(err:Error)
         {
            _unifiedLog("[导出] 失败：" + err.message);
         }
      }
      
      private static function _onUnifiedScanTarget(e:MouseEvent) : void
      {
         try
         {
            if(_unifiedRunning || _unifiedPaused)
            {
               _enableUnifiedTargetStop();
               _pauseUnifiedIfTargetReached("已达到目标 " + _unifiedTarget);
               return;
            }
            _startUnifiedSurvey(true);
         }
         catch(err:Error)
         {
            _unifiedLog("[到目标] 设置失败：" + err.message);
         }
      }
      
      private static function _readUnifiedTarget() : int
      {
         var target:int = 0;
         try
         {
            target = int(parseInt(_unifiedTargetInput.text,10));
         }
         catch(eParse:Error)
         {
         }
         if(isNaN(target) || target < 0)
         {
            target = 0;
         }
         return target;
      }
      
      private static function _enableUnifiedTargetStop() : Boolean
      {
         try
         {
            _unifiedTarget = _readUnifiedTarget();
            if(_unifiedTarget <= 0)
            {
               _unifiedLog("[到目标] 请先输入目标数值");
               return false;
            }
            _unifiedStopAtTarget = true;
            _unifiedLog("[到目标] 已启用，当前 " + _unifiedTotal + _unifiedCategoryUnit() + " / 目标 " + _unifiedTarget + _unifiedCategoryUnit());
            _unifiedStatus("到目标停止已启用：" + _unifiedTarget + _unifiedCategoryUnit());
            return true;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      private static function _pauseUnifiedIfTargetReached(reason:String) : Boolean
      {
         try
         {
            if(!_unifiedStopAtTarget || _unifiedTarget <= 0 || _unifiedTotal < _unifiedTarget)
            {
               return false;
            }
            _cleanupUnifiedListeners(true);
            _unifiedRunning = false;
            _unifiedPaused = true;
            _updateUnifiedPauseButton();
            _refreshUnifiedCategoryRows(false);
            _unifiedStatus("已暂停：" + reason);
            _unifiedLog("[到目标] " + reason + "，已暂停，可点继续或重置");
            return true;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      private static function _startUnifiedSurvey(stopAtTarget:Boolean, resetRows:Boolean = true) : void
      {
         try
         {
            if(_unifiedRunning)
            {
               _unifiedLog("[大一统] 正在运行，请稍候");
               return;
            }
            if(resetRows)
            {
               _clearUnifiedRankScanState();
            }
            _cleanupUnifiedListeners(true);
            try
            {
               ModuleManager.closeForName("GmailPanel");
            }
            catch(eClose:Error)
            {
            }
            _unifiedIds = _unifiedSourceIds();
            if(resetRows)
            {
               _unifiedAllRows = [];
               _unifiedRows = [];
               _unifiedEmptyRows = [];
               _unifiedTotal = 0;
               _unifiedMailCount = 0;
            }
            _unifiedMailList = [];
            _unifiedAccountIndex = 0;
            _unifiedMailIndex = 0;
            _unifiedTarget = _readUnifiedTarget();
            if(_unifiedTarget > 0)
            {
               stopAtTarget = true;
            }
            _unifiedStopAtTarget = stopAtTarget;
            if(stopAtTarget && _unifiedTarget <= 0)
            {
               _unifiedLog("[大一统] 请输入目标数值");
               return;
            }
            if(_unifiedIds.length <= 0)
            {
               _unifiedLog("[大一统] 替换列表为空");
               return;
            }
            _unifiedRunning = true;
            _unifiedPaused = false;
            _unifiedPhase = "list";
            _updateUnifiedPauseButton();
            if(resetRows)
            {
               _setUnifiedLogText("",true);
            }
            _unifiedLog("[大一统] 开始勘查账号 " + _unifiedIds.length + " 个，类目：" + _unifiedCategoryTitle() + (stopAtTarget ? "，达到 " + _unifiedTarget + _unifiedCategoryUnit() + " 后暂停" : ""));
            _unifiedTimer = setTimeout(_unifiedRequestNextAccount,UNIFIED_GAP_MS);
         }
         catch(e:Error)
         {
            _unifiedRunning = false;
            _unifiedLog("[错误] 勘查启动失败：" + e.message);
         }
      }
      
      private static function _copyPositiveIds(src:Array) : Array
      {
         var i:int;
         var id:int;
         var arr:Array = [];
         var seen:Object = {};
         try
         {
            i = 0;
            while(i < src.length)
            {
               id = int(src[i]);
               if(!(id <= 0 || seen[id]))
               {
                  seen[id] = true;
                  arr.push(id);
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return arr;
      }
      
      private static function _unifiedSourceIds() : Array
      {
         try
         {
            if(_unifiedIds != null && _unifiedIds.length > 0)
            {
               return _copyPositiveIds(_unifiedIds);
            }
         }
         catch(e:Error)
         {
         }
         return _copyPositiveIds(_replaceValues);
      }
      
      private static function _unifiedRequestNextAccount() : void
      {
         var userId:int;
         try
         {
            _unifiedTimer = 0;
            if(!_unifiedRunning)
            {
               return;
            }
            if(_unifiedPaused)
            {
               return;
            }
            _unifiedPhase = "list";
            if(_unifiedStopAtTarget && _unifiedTarget > 0 && _unifiedTotal >= _unifiedTarget)
            {
               _pauseUnifiedIfTargetReached("已达到目标 " + _unifiedTarget);
               return;
            }
            if(_unifiedAccountIndex >= _unifiedIds.length)
            {
               _finishUnifiedSurvey("勘查完成");
               return;
            }
            userId = int(_unifiedIds[_unifiedAccountIndex]);
            _syncRuntimeUserIdForGmail(userId);
            _unifiedStatus("账号 " + (_unifiedAccountIndex + 1) + "/" + _unifiedIds.length + "：" + userId);
            _unifiedLog("[账号] " + userId + " 读取列表");
            Connection.addCommandListener(CommandSet.GET_MAIL_LIST_DATA,_onUnifiedMailListReply);
            Connection.addErrorHandler(CommandSet.GET_MAIL_LIST_DATA,_onUnifiedMailListError);
            Connection.send(CommandSet.GET_MAIL_LIST_DATA,userId);
            _unifiedTimer = setTimeout(_onUnifiedMailListTimeout,UNIFIED_TIMEOUT_MS);
         }
         catch(e:Error)
         {
            _advanceUnifiedAccount("列表发送失败");
         }
      }
      
      private static function _onUnifiedMailListReply(e:MessageEvent) : void
      {
         var userId:int;
         try
         {
            _cleanupUnifiedListeners(true);
            if(_unifiedPaused)
            {
               return;
            }
            userId = int(_unifiedIds[_unifiedAccountIndex]);
            _unifiedMailList = _prepareUnifiedMailDetailQueue(_parseUnifiedMailList(e.message.getRawData()),userId);
            _unifiedMailIndex = 0;
            _refreshUnifiedCategoryRows(false);
            if(_pauseUnifiedIfTargetReached("已达到目标 " + _unifiedTarget))
            {
               return;
            }
            _unifiedLog("[账号] " + userId + " 需要读取详情 " + _unifiedMailList.length + " 封，目标：" + _unifiedCategoryTitle());
            _unifiedPhase = "detail";
            _unifiedTimer = setTimeout(_unifiedRequestNextMailDetail,UNIFIED_GAP_MS);
         }
         catch(err:Error)
         {
            _advanceUnifiedAccount("列表解析失败");
         }
      }
      
      private static function _parseUnifiedMailList(data:IDataInput) : Array
      {
         var n:int;
         var i:int;
         var row:Object;
         var arr:Array = [];
         try
         {
            n = int(data.readUnsignedInt());
            i = 0;
            while(i < n)
            {
               row = {};
               row.mailId = data.readUnsignedInt();
               row.rawSendTime = data.readUnsignedInt();
               data.readUnsignedInt();
               row.type = data.readUnsignedInt();
               row.attachmentSymble = data.readUnsignedInt() == 1;
               row.senderId = data.readUnsignedInt();
               row.senderName = data.readUTFBytes(data.readUnsignedInt());
               row.mailTitle = data.readUTFBytes(data.readUnsignedInt());
               arr.push(row);
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return arr;
      }
      
      private static function _prepareUnifiedMailDetailQueue(list:Array, userId:int) : Array
      {
         var i:int;
         var mail:Object;
         var queue:Array = [];
         try
         {
            i = 0;
            while(i < list.length)
            {
               mail = list[i];
               if(mail != null)
               {
                  if(mail.attachmentSymble == true)
                  {
                     queue.push(mail);
                  }
                  else if(_unifiedCategory == UNIFIED_MODE_EMPTY || _unifiedCategory == UNIFIED_MODE_ALL || _unifiedCategory == UNIFIED_MODE_SCAN_ALL)
                  {
                     _addUnifiedListOnly(userId,mail);
                  }
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return queue;
      }
      
      private static function _addUnifiedListOnly(userId:int, mail:Object) : void
      {
         var title:String;
         var row:Object;
         try
         {
            title = mail.mailTitle == null ? "" : mail.mailTitle;
            row = {
               "userId":userId,
               "mailId":int(mail.mailId),
               "count":0,
               "diamond":0,
               "feather":0,
               "goldBox":0,
               "silverBox":0,
               "bronzeBox":0,
               "title":title,
               "hasAward":false,
               "excludedRank":_unifiedIsExcludedRankMail(title)
            };
            _unifiedAllRows.push(row);
            _unifiedEmptyRows.push(row);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onUnifiedMailListError(e:MessageEvent) : void
      {
         _advanceUnifiedAccount("列表失败");
      }
      
      private static function _onUnifiedMailListTimeout() : void
      {
         _advanceUnifiedAccount("列表超时");
      }
      
      private static function _unifiedRequestNextMailDetail() : void
      {
         var userId:int;
         var mail:Object;
         try
         {
            _unifiedTimer = 0;
            if(!_unifiedRunning)
            {
               return;
            }
            if(_unifiedPaused)
            {
               return;
            }
            _unifiedPhase = "detail";
            if(_unifiedStopAtTarget && _unifiedTarget > 0 && _unifiedTotal >= _unifiedTarget)
            {
               _pauseUnifiedIfTargetReached("已达到目标 " + _unifiedTarget);
               return;
            }
            if(_unifiedMailIndex >= _unifiedMailList.length)
            {
               _advanceUnifiedAccount("账号完成");
               return;
            }
            userId = int(_unifiedIds[_unifiedAccountIndex]);
            mail = _unifiedMailList[_unifiedMailIndex];
            _syncRuntimeUserIdForGmail(userId);
            Connection.addCommandListener(CommandSet.GET_SINGLE_MAIL_DATA,_onUnifiedMailDetailReply);
            Connection.addErrorHandler(CommandSet.GET_SINGLE_MAIL_DATA,_onUnifiedMailDetailError);
            Connection.send(CommandSet.GET_SINGLE_MAIL_DATA,userId,int(mail.mailId));
            _unifiedTimer = setTimeout(_onUnifiedMailDetailTimeout,UNIFIED_TIMEOUT_MS);
         }
         catch(e:Error)
         {
            _advanceUnifiedMail("详情发送失败");
         }
      }
      
      private static function _onUnifiedMailDetailReply(e:MessageEvent) : void
      {
         var detail:Object;
         try
         {
            _cleanupUnifiedListeners(true);
            if(_unifiedPaused)
            {
               return;
            }
            detail = _parseUnifiedMailDetail(e.message.getRawData());
            _addUnifiedDetail(detail);
            if(_pauseUnifiedIfTargetReached("已达到目标 " + _unifiedTarget))
            {
               return;
            }
            _advanceUnifiedMail("");
         }
         catch(err:Error)
         {
            _advanceUnifiedMail("详情解析失败");
         }
      }
      
      private static function _parseUnifiedMailDetail(data:IDataInput) : Object
      {
         var row:Object = {};
         row.mailId = data.readUnsignedInt();
         row.rawSendTime = data.readUnsignedInt();
         row.type = data.readUnsignedInt();
         row.attachmentSymble = Boolean(data.readUnsignedInt());
         row.senderId = data.readUnsignedInt();
         row.senderName = data.readUTFBytes(data.readUnsignedInt());
         row.mailTitle = data.readUTFBytes(data.readUnsignedInt());
         row.contentTxt = data.readUTFBytes(data.readUnsignedInt());
         row.attachments = [];
         var n:int = int(data.readUnsignedInt());
         var i:int = 0;
         while(i < n)
         {
            var a:Object = {};
            a.itemId = data.readUnsignedInt();
            a.count = data.readUnsignedInt();
            a.flag = data.readUnsignedInt();
            data.readUnsignedInt();
            data.readUnsignedInt();
            row.attachments.push(a);
            i++;
         }
         row.readSymble = data.readUnsignedInt() == 1;
         return row;
      }
      
      private static function _addUnifiedDetail(detail:Object) : void
      {
         var userId:int;
         var diamond:int;
         var feather:int;
         var goldBox:int;
         var silverBox:int;
         var bronzeBox:int;
         var hasAward:Boolean;
         var title:String;
         var row:Object;
         try
         {
            userId = int(_unifiedIds[_unifiedAccountIndex]);
            diamond = _unifiedDiamondCount(detail);
            feather = _unifiedItemCount(detail,[401308]);
            goldBox = _unifiedItemCount(detail,[606739,606946]);
            silverBox = _unifiedItemCount(detail,[606740,606947]);
            bronzeBox = _unifiedItemCount(detail,[606741,606948]);
            hasAward = _unifiedHasAward(detail);
            title = detail.mailTitle == null ? "" : detail.mailTitle;
            row = {
               "userId":userId,
               "mailId":int(detail.mailId),
               "count":diamond,
               "diamond":diamond,
               "feather":feather,
               "goldBox":goldBox,
               "silverBox":silverBox,
               "bronzeBox":bronzeBox,
               "title":title,
               "hasAward":hasAward,
               "excludedRank":_unifiedIsExcludedRankMail(title)
            };
            _unifiedAllRows.push(row);
            if(!hasAward)
            {
               _unifiedEmptyRows.push(row);
            }
            _refreshUnifiedCategoryRows(false);
            if(_unifiedCategoryCount(row,_unifiedCategory) > 0)
            {
               _unifiedLog("[" + _unifiedCategoryTitle() + "] " + userId + " / " + detail.mailId + " = " + _unifiedCategoryCount(row,_unifiedCategory) + _unifiedCategoryUnit() + "，累计 " + _unifiedTotal);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _refreshUnifiedCategoryRows(writeLog:Boolean) : void
      {
         var text:String;
         var i:int = 0;
         var row:Object = null;
         var count:int = 0;
         try
         {
            _unifiedRows = [];
            _unifiedTotal = 0;
            _unifiedMailCount = 0;
            while(i < _unifiedAllRows.length)
            {
               row = _unifiedAllRows[i];
               count = _unifiedCategoryCount(row,_unifiedCategory);
               if(count > 0)
               {
                  row.count = count;
                  _unifiedRows.push(row);
                  _unifiedTotal += count;
                  ++_unifiedMailCount;
               }
               i++;
            }
            _unifiedStatus(_unifiedCategoryTitle() + " " + _unifiedTotal + _unifiedCategoryUnit() + "，邮件 " + _unifiedMailCount + "，空 " + _unifiedEmptyRows.length);
            if(writeLog)
            {
               text = "[类目] " + _unifiedCategoryTitle() + "：共 " + _unifiedMailCount + " 封，合计 " + _unifiedTotal + _unifiedCategoryUnit() + "\n";
               i = 0;
               while(i < _unifiedRows.length)
               {
                  row = _unifiedRows[i];
                  text += "  " + (i + 1) + ". " + row.userId + " / " + row.mailId + " = " + row.count + _unifiedCategoryUnit() + " " + row.title + "\n";
                  i++;
               }
               if(_unifiedRows.length <= 0)
               {
                  text += "  当前类目暂无结果\n";
               }
               _setUnifiedLogText(text,true);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _unifiedCategoryCount(row:Object, mode:String) : int
      {
         if(row == null)
         {
            return 0;
         }
         if(mode == UNIFIED_MODE_SCAN_ALL)
         {
            return row.hasAward == true ? 1 : 0;
         }
         if(mode == UNIFIED_MODE_FEATHER)
         {
            return int(row.feather);
         }
         if(mode == UNIFIED_MODE_GOLD_BOX)
         {
            return int(row.goldBox);
         }
         if(mode == UNIFIED_MODE_SILVER_BOX)
         {
            return int(row.silverBox);
         }
         if(mode == UNIFIED_MODE_BRONZE_BOX)
         {
            return int(row.bronzeBox);
         }
         if(mode == UNIFIED_MODE_EMPTY)
         {
            return row.hasAward == true ? 0 : 1;
         }
         if(mode == UNIFIED_MODE_ALL)
         {
            return 1;
         }
         if(mode == UNIFIED_MODE_CONTENT)
         {
            return row.hasAward == true && row.excludedRank != true ? 1 : 0;
         }
         return int(row.diamond);
      }
      
      private static function _unifiedCategoryTitle() : String
      {
         if(_unifiedCategory == UNIFIED_MODE_SCAN_ALL)
         {
            return "全部";
         }
         if(_unifiedCategory == UNIFIED_MODE_FEATHER)
         {
            return "羽鳞";
         }
         if(_unifiedCategory == UNIFIED_MODE_GOLD_BOX)
         {
            return "黄金箱";
         }
         if(_unifiedCategory == UNIFIED_MODE_SILVER_BOX)
         {
            return "白银箱";
         }
         if(_unifiedCategory == UNIFIED_MODE_BRONZE_BOX)
         {
            return "青铜箱";
         }
         if(_unifiedCategory == UNIFIED_MODE_EMPTY)
         {
            return "空邮件";
         }
         if(_unifiedCategory == UNIFIED_MODE_ALL)
         {
            return "所有邮件";
         }
         if(_unifiedCategory == UNIFIED_MODE_CONTENT)
         {
            return "有内容";
         }
         return "星钻";
      }
      
      private static function _unifiedCategoryUnit() : String
      {
         if(_unifiedCategory == UNIFIED_MODE_SCAN_ALL || _unifiedCategory == UNIFIED_MODE_EMPTY || _unifiedCategory == UNIFIED_MODE_ALL || _unifiedCategory == UNIFIED_MODE_CONTENT)
         {
            return "封";
         }
         if(_unifiedCategory == UNIFIED_MODE_GOLD_BOX || _unifiedCategory == UNIFIED_MODE_SILVER_BOX || _unifiedCategory == UNIFIED_MODE_BRONZE_BOX)
         {
            return "个";
         }
         return _unifiedCategoryTitle();
      }
      
      private static function _unifiedItemCount(detail:Object, ids:Array) : int
      {
         var arr:Array;
         var i:int;
         var a:Object;
         var total:int = 0;
         try
         {
            arr = detail.attachments as Array;
            if(arr == null)
            {
               return 0;
            }
            i = 0;
            while(i < arr.length)
            {
               a = arr[i];
               if(a != null && int(a.flag) == 0 && ids.indexOf(int(a.itemId)) >= 0)
               {
                  total += int(a.count);
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return total;
      }
      
      private static function _unifiedIsExcludedRankMail(title:String) : Boolean
      {
         if(title == null)
         {
            return false;
         }
         return title.indexOf("大乱斗") >= 0 || title.indexOf("精灵大乱斗") >= 0;
      }
      
      private static function _unifiedDiamondCount(detail:Object) : int
      {
         var arr:Array;
         var i:int;
         var a:Object;
         var total:int = 0;
         try
         {
            arr = detail.attachments as Array;
            if(arr == null)
            {
               return 0;
            }
            i = 0;
            while(i < arr.length)
            {
               a = arr[i];
               if(a != null && int(a.flag) == 0)
               {
                  total += _unifiedDiamondValue(int(a.itemId),int(a.count));
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return total;
      }
      
      private static function _unifiedHasAward(detail:Object) : Boolean
      {
         var arr:Array;
         var i:int;
         var a:Object;
         try
         {
            arr = detail.attachments as Array;
            if(arr == null)
            {
               return false;
            }
            i = 0;
            while(i < arr.length)
            {
               a = arr[i];
               if(a != null && int(a.flag) == 0)
               {
                  return true;
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      private static function _unifiedDiamondValue(itemId:int, count:int) : int
      {
         if(count <= 0)
         {
            return 0;
         }
         if(itemId == 9999999 || itemId == 603848 || itemId == 603484)
         {
            return count;
         }
         if(itemId == 603485)
         {
            return count * 5;
         }
         if(itemId == 603486)
         {
            return count * 10;
         }
         if(itemId == 603487)
         {
            return count * 20;
         }
         if(itemId == 603488)
         {
            return count * 100;
         }
         return 0;
      }
      
      private static function _onUnifiedMailDetailError(e:MessageEvent) : void
      {
         _advanceUnifiedMail("详情失败");
      }
      
      private static function _onUnifiedMailDetailTimeout() : void
      {
         _advanceUnifiedMail("详情超时");
      }
      
      private static function _advanceUnifiedMail(reason:String) : void
      {
         try
         {
            _cleanupUnifiedListeners(true);
            if(_unifiedPaused)
            {
               return;
            }
            if(reason != null && reason.length > 0)
            {
               _unifiedLog("[跳过] " + int(_unifiedIds[_unifiedAccountIndex]) + " / " + int(_unifiedMailList[_unifiedMailIndex].mailId) + " " + reason);
            }
            ++_unifiedMailIndex;
            _unifiedTimer = setTimeout(_unifiedRequestNextMailDetail,UNIFIED_GAP_MS);
         }
         catch(e:Error)
         {
            _advanceUnifiedAccount("邮件推进异常");
         }
      }
      
      private static function _advanceUnifiedAccount(reason:String) : void
      {
         try
         {
            _cleanupUnifiedListeners(true);
            if(_unifiedPaused)
            {
               return;
            }
            if(reason != null && reason.length > 0)
            {
               _unifiedLog("[账号] " + int(_unifiedIds[_unifiedAccountIndex]) + " " + reason);
            }
            ++_unifiedAccountIndex;
            _unifiedMailList = [];
            _unifiedMailIndex = 0;
            _unifiedTimer = setTimeout(_unifiedRequestNextAccount,UNIFIED_GAP_MS);
         }
         catch(e:Error)
         {
            _finishUnifiedSurvey("异常结束");
         }
      }
      
      private static function _finishUnifiedSurvey(reason:String) : void
      {
         _cleanupUnifiedListeners(true);
         _unifiedRunning = false;
         _unifiedPaused = false;
         _unifiedPhase = "";
         _updateUnifiedPauseButton();
         _refreshUnifiedCategoryRows(false);
         if(_unifiedRankScanActive && _unifiedRankScanIndex < _unifiedRankScanQueue.length)
         {
            _unifiedPhase = "rank";
            _unifiedStatus("继续下一个榜单：" + _unifiedCategoryTitle() + " " + _unifiedTotal + _unifiedCategoryUnit());
            _unifiedLog("[勘查全部] 当前榜单完成，累计 " + _unifiedTotal + _unifiedCategoryUnit() + "，继续下一个榜单");
            _unifiedTimer = setTimeout(_startNextUnifiedRankScan,UNIFIED_GAP_MS);
            return;
         }
         if(_unifiedRankScanActive)
         {
            _clearUnifiedRankScanState(false);
         }
         _unifiedStatus(reason + "：" + _unifiedCategoryTitle() + " " + _unifiedTotal + _unifiedCategoryUnit() + "，邮件 " + _unifiedRows.length + "，空 " + _unifiedEmptyRows.length);
         _unifiedLog("[完成] " + reason + "，当前类目 " + _unifiedCategoryTitle() + " 合计 " + _unifiedTotal + _unifiedCategoryUnit() + "，邮件 " + _unifiedRows.length + "，空邮件 " + _unifiedEmptyRows.length);
      }
      
      private static function _cleanupUnifiedListeners(clearTimer:Boolean = true) : void
      {
         try
         {
            Connection.removeCommandListener(CommandSet.GET_MAIL_LIST_DATA,_onUnifiedMailListReply);
         }
         catch(e1:Error)
         {
         }
         try
         {
            Connection.removeErrorHandler(CommandSet.GET_MAIL_LIST_DATA,_onUnifiedMailListError);
         }
         catch(e2:Error)
         {
         }
         try
         {
            Connection.removeCommandListener(CommandSet.GET_SINGLE_MAIL_DATA,_onUnifiedMailDetailReply);
         }
         catch(e3:Error)
         {
         }
         try
         {
            Connection.removeErrorHandler(CommandSet.GET_SINGLE_MAIL_DATA,_onUnifiedMailDetailError);
         }
         catch(e4:Error)
         {
         }
         try
         {
            Connection.removeCommandListener(CommandSet.GET_MAIL_AWARD_1257,_onUnifiedAwardReply);
         }
         catch(e5:Error)
         {
         }
         try
         {
            Connection.removeErrorHandler(CommandSet.GET_MAIL_AWARD_1257,_onUnifiedAwardError);
         }
         catch(e6:Error)
         {
         }
         if(clearTimer && _unifiedTimer != 0)
         {
            try
            {
               clearTimeout(_unifiedTimer);
            }
            catch(e7:Error)
            {
            }
            _unifiedTimer = 0;
         }
      }
      
      private static function _onUnifiedClaimAll(e:MouseEvent) : void
      {
         _startUnifiedOp(_unifiedRows,false,"领取全部");
      }
      
      private static function _onUnifiedClaimDeleteAll(e:MouseEvent) : void
      {
         _startUnifiedOp(_unifiedRows,true,"领取并删除全部");
      }
      
      private static function _onUnifiedClaimTargetDelete(e:MouseEvent) : void
      {
         var target:int;
         var pick:Object;
         var rows:Array;
         var sum:int;
         try
         {
            target = _readUnifiedTarget();
            _unifiedTarget = target;
            _unifiedStopAtTarget = false;
            try
            {
               if(_unifiedTargetInput != null)
               {
                  _unifiedTargetInput.text = target > 0 ? target : "";
               }
            }
            catch(eText:Error)
            {
            }
            if(target <= 0)
            {
               _unifiedLog("[领目标] 请先输入目标数量");
               return;
            }
            _refreshUnifiedCategoryRows(false);
            _unifiedLog("[领目标] 使用当前输入目标 " + target + _unifiedCategoryUnit() + "，类目：" + _unifiedCategoryTitle());
            pick = _pickUnifiedRowsForTarget(_unifiedRows,target);
            rows = pick.rows as Array;
            if(rows.length <= 0)
            {
               _unifiedLog("[领目标] 当前类目没有可领取邮件");
               return;
            }
            sum = int(pick.sum);
            if(pick.exact == true)
            {
               _unifiedLog("[领目标] 精确匹配 " + target + _unifiedCategoryUnit() + "，本次处理 " + rows.length + " 封，合计 " + sum + _unifiedCategoryUnit());
               _startUnifiedOp(rows,true,"领取目标并删除");
            }
            else
            {
               _unifiedLog("[领目标] 无法精确凑出 " + target + _unifiedCategoryUnit() + "，最邻近可领取 " + sum + _unifiedCategoryUnit());
               AlertManager.showConfirm("无法精确凑出 " + target + _unifiedCategoryUnit() + "，是否领取并删除最邻近的 " + sum + _unifiedCategoryUnit() + "？",function():void
               {
                  _unifiedLog("[领目标] 已确认领取最邻近 " + sum + _unifiedCategoryUnit() + " / " + rows.length + " 封");
                  _startUnifiedOp(rows,true,"领取目标并删除");
               });
            }
         }
         catch(err:Error)
         {
            _unifiedLog("[领目标] 启动失败：" + err.message);
         }
      }
      
      private static function _onUnifiedDeleteEmpty(e:MouseEvent) : void
      {
         try
         {
            if(_unifiedRunning)
            {
               _unifiedLog("[删除] 勘查/领取运行中，先暂停或等待完成后再删空邮件");
               return;
            }
            _deleteUnifiedRows(_unifiedEmptyRows.concat(),"删除空邮件");
         }
         catch(err:Error)
         {
            _unifiedLog("[删除] 启动失败：" + err.message);
         }
      }
      
      private static function _startUnifiedOp(rows:Array, deleteAfter:Boolean, mode:String) : void
      {
         try
         {
            if(_unifiedRunning)
            {
               _unifiedLog("[操作] 勘查中，稍候再操作");
               return;
            }
            if(rows == null || rows.length <= 0)
            {
               _unifiedLog("[操作] 没有可处理邮件，请先勘查");
               return;
            }
            _cleanupUnifiedListeners(true);
            _unifiedOpRows = _copyUnifiedClaimRows(rows);
            if(_unifiedOpRows.length <= 0)
            {
               _unifiedLog("[操作] 当前类目没有可领取附件");
               return;
            }
            _unifiedOpIndex = 0;
            _unifiedOpDeleteAfter = deleteAfter;
            _unifiedOpMode = mode;
            _unifiedRunning = true;
            _unifiedPaused = false;
            _unifiedPhase = "op";
            _updateUnifiedPauseButton();
            _unifiedLog("[操作] " + mode + " " + _unifiedOpRows.length + " 封");
            _unifiedTimer = setTimeout(_processUnifiedOpNext,UNIFIED_GAP_MS);
         }
         catch(e:Error)
         {
            _unifiedRunning = false;
            _unifiedLog("[错误] 操作启动失败：" + e.message);
         }
      }
      
      private static function _copyUnifiedClaimRows(rows:Array) : Array
      {
         var i:int;
         var arr:Array = [];
         try
         {
            i = 0;
            while(i < rows.length)
            {
               if(rows[i] != null && rows[i].hasAward == true)
               {
                  arr.push(rows[i]);
               }
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return arr;
      }
      
      private static function _pickUnifiedRowsForTarget(rows:Array, target:int) : Object
      {
         var maxItem:int;
         var total:int;
         var i:int;
         var c:int;
         var limit:int;
         var reachable:Array;
         var prevSum:Array;
         var prevIndex:Array;
         var s:int;
         var best:int;
         var chosen:Array;
         var arr:Array = _copyUnifiedClaimRows(rows);
         var result:Object = {
            "rows":[],
            "sum":0,
            "exact":false
         };
         try
         {
            if(arr.length <= 0 || target <= 0)
            {
               return result;
            }
            arr.sortOn("count",Array.NUMERIC);
            maxItem = 0;
            total = 0;
            i = 0;
            while(i < arr.length)
            {
               c = int(arr[i].count);
               if(c > maxItem)
               {
                  maxItem = c;
               }
               total += c;
               i++;
            }
            if(total < target)
            {
               result.rows = arr.concat();
               result.sum = total;
               result.exact = false;
               return result;
            }
            limit = target + maxItem;
            if(limit > total)
            {
               limit = total;
            }
            reachable = [];
            prevSum = [];
            prevIndex = [];
            reachable[0] = true;
            i = 0;
            while(i < arr.length)
            {
               c = int(arr[i].count);
               s = limit - c;
               while(s >= 0)
               {
                  if(reachable[s] == true && reachable[s + c] != true)
                  {
                     reachable[s + c] = true;
                     prevSum[s + c] = s;
                     prevIndex[s + c] = i;
                  }
                  s--;
               }
               i++;
            }
            best = target;
            while(best <= limit && reachable[best] != true)
            {
               best++;
            }
            if(best > limit)
            {
               result.rows = arr.concat();
               result.sum = total;
               result.exact = false;
               return result;
            }
            chosen = [];
            s = best;
            while(s > 0)
            {
               i = int(prevIndex[s]);
               if(isNaN(i) || i < 0 || i >= arr.length)
               {
                  break;
               }
               chosen.push(arr[i]);
               s = int(prevSum[s]);
            }
            result.rows = chosen;
            result.sum = best;
            result.exact = best == target;
         }
         catch(e:Error)
         {
         }
         return result;
      }
      
      private static function _sumUnifiedRows(rows:Array) : int
      {
         var i:int;
         var total:int = 0;
         try
         {
            i = 0;
            while(i < rows.length)
            {
               total += int(rows[i].count);
               i++;
            }
         }
         catch(e:Error)
         {
         }
         return total;
      }
      
      private static function _processUnifiedOpNext() : void
      {
         var row:Object;
         try
         {
            _unifiedTimer = 0;
            if(!_unifiedRunning)
            {
               return;
            }
            if(_unifiedPaused)
            {
               return;
            }
            _unifiedPhase = "op";
            if(_unifiedOpIndex >= _unifiedOpRows.length)
            {
               _unifiedRunning = false;
               _unifiedPaused = false;
               _unifiedPhase = "";
               _updateUnifiedPauseButton();
               _unifiedStatus(_unifiedOpMode + "完成");
               _unifiedLog("[操作] " + _unifiedOpMode + "完成");
               return;
            }
            row = _unifiedOpRows[_unifiedOpIndex];
            _syncRuntimeUserIdForGmail(int(row.userId));
            _unifiedStatus(_unifiedOpMode + " " + (_unifiedOpIndex + 1) + "/" + _unifiedOpRows.length);
            Connection.addCommandListener(CommandSet.GET_MAIL_AWARD_1257,_onUnifiedAwardReply);
            Connection.addErrorHandler(CommandSet.GET_MAIL_AWARD_1257,_onUnifiedAwardError);
            Connection.send(CommandSet.GET_MAIL_AWARD_1257,int(row.userId),int(row.mailId));
            _unifiedTimer = setTimeout(_onUnifiedAwardTimeout,UNIFIED_TIMEOUT_MS);
         }
         catch(e:Error)
         {
            _advanceUnifiedOp("发送失败");
         }
      }
      
      private static function _onUnifiedAwardReply(e:MessageEvent) : void
      {
         var row:Object;
         try
         {
            _cleanupUnifiedListeners(true);
            if(_unifiedPaused)
            {
               return;
            }
            row = _unifiedOpRows[_unifiedOpIndex];
            row.hasAward = false;
            row.diamond = 0;
            row.feather = 0;
            row.goldBox = 0;
            row.silverBox = 0;
            row.bronzeBox = 0;
            if(_unifiedOpDeleteAfter)
            {
               _deleteUnifiedRows([row],"领后删除");
            }
            else
            {
               if(_unifiedEmptyRows.indexOf(row) < 0)
               {
                  _unifiedEmptyRows.push(row);
               }
               _refreshUnifiedCategoryRows(false);
            }
            _unifiedLog("[领取] " + row.userId + " / " + row.mailId + " 成功");
            _advanceUnifiedOp("");
         }
         catch(err:Error)
         {
            _advanceUnifiedOp("领取回包异常");
         }
      }
      
      private static function _onUnifiedAwardError(e:MessageEvent) : void
      {
         _advanceUnifiedOp("领取失败");
      }
      
      private static function _onUnifiedAwardTimeout() : void
      {
         _advanceUnifiedOp("领取超时");
      }
      
      private static function _advanceUnifiedOp(reason:String) : void
      {
         var row:Object;
         try
         {
            _cleanupUnifiedListeners(true);
            if(_unifiedPaused)
            {
               return;
            }
            row = _unifiedOpRows[_unifiedOpIndex];
            if(reason != null && reason.length > 0 && row != null)
            {
               _unifiedLog("[跳过] " + row.userId + " / " + row.mailId + " " + reason);
            }
            ++_unifiedOpIndex;
            _unifiedTimer = setTimeout(_processUnifiedOpNext,UNIFIED_GAP_MS);
         }
         catch(e:Error)
         {
            _unifiedRunning = false;
         }
      }
      
      private static function _deleteUnifiedRows(rows:Array, prefix:String) : void
      {
         var ids:Object;
         var i:int;
         var row:Object;
         var data:LittleEndianByteArray;
         try
         {
            if(rows == null || rows.length <= 0)
            {
               _unifiedLog("[删除] 没有可删除邮件");
               return;
            }
            ids = {};
            i = 0;
            while(i < rows.length)
            {
               row = rows[i];
               ids[row.userId + ":" + row.mailId] = true;
               _syncRuntimeUserIdForGmail(int(row.userId));
               data = new LittleEndianByteArray();
               data.writeUnsignedInt(int(row.userId));
               data.writeUnsignedInt(1);
               data.writeUnsignedInt(int(row.mailId));
               Connection.send(CommandSet.DELETE_MAIL_ON_SERVER,data);
               i++;
            }
            _removeUnifiedDeletedRows(ids);
            _refreshUnifiedCategoryRows(false);
            _unifiedLog("[" + prefix + "] 已发送删除 " + rows.length + " 封");
         }
         catch(e:Error)
         {
            _unifiedLog("[错误] 删除失败：" + e.message);
         }
      }
      
      private static function _removeUnifiedDeletedRows(ids:Object) : void
      {
         var i:int = 0;
         var row:Object = null;
         try
         {
            i = _unifiedAllRows.length - 1;
            while(i >= 0)
            {
               row = _unifiedAllRows[i];
               if(ids[row.userId + ":" + row.mailId] == true)
               {
                  _unifiedAllRows.splice(i,1);
               }
               i--;
            }
            i = _unifiedEmptyRows.length - 1;
            while(i >= 0)
            {
               row = _unifiedEmptyRows[i];
               if(ids[row.userId + ":" + row.mailId] == true)
               {
                  _unifiedEmptyRows.splice(i,1);
               }
               i--;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _replaceStatus(s:String) : void
      {
         try
         {
            if(_replaceStatusTxt != null)
            {
               _replaceStatusTxt.text = "状态：" + s;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _replaceLog(s:String) : void
      {
         try
         {
            if(_replaceLogTxt != null)
            {
               _replaceLogTxt.appendText(s + "\n");
               _replaceLogTxt.scrollV = _replaceLogTxt.maxScrollV;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onReplacePanelMouseDown(e:MouseEvent) : void
      {
         try
         {
            if(e != null)
            {
               if(e.target is TextField)
               {
                  return;
               }
               if(e.target is Sprite && e.target != _replacePanel && e.target.name != "replaceDragHandle")
               {
                  return;
               }
            }
            _onReplacePanelDragStart(e);
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onReplacePanelDragStart(e:MouseEvent) : void
      {
         var sw:Number;
         var sh:Number;
         try
         {
            if(_replacePanel == null)
            {
               return;
            }
            sw = LayerManager.stage != null ? LayerManager.stage.stageWidth : 1280;
            sh = LayerManager.stage != null ? LayerManager.stage.stageHeight : 720;
            _replacePanel.startDrag(false,new Rectangle(-REPLACE_PANEL_W / 2,0,sw,sh - 28));
            if(LayerManager.stage != null)
            {
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP,_onReplacePanelDragEnd,false,0,true);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onReplacePanelDragEnd(e:MouseEvent) : void
      {
         try
         {
            if(_replacePanel != null)
            {
               _replacePanel.stopDrag();
            }
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onReplacePanelDragEnd);
            }
            if(_replacePanel != null)
            {
               _replaceSaveNumber("panelX",_replacePanel.x);
               _replaceSaveNumber("panelY",_replacePanel.y);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _replaceSharedObject() : SharedObject
      {
         try
         {
            return SharedObjectManager.getUserSharedObject("runtimeReplacePanel");
         }
         catch(e1:Error)
         {
         }
         try
         {
            return SharedObject.getLocal("runtimeReplacePanel","/");
         }
         catch(e2:Error)
         {
         }
         return null;
      }
      
      private static function _replaceReadNumber(key:String, def:Number) : Number
      {
         var so:SharedObject;
         var n:Number;
         try
         {
            so = _replaceSharedObject();
            if(so != null && so.data != null && so.data[key] != undefined)
            {
               n = Number(so.data[key]);
               if(!isNaN(n))
               {
                  return n;
               }
            }
         }
         catch(e:Error)
         {
         }
         return def;
      }
      
      private static function _replaceSaveNumber(key:String, val:Number) : void
      {
         var so:SharedObject;
         try
         {
            so = _replaceSharedObject();
            if(so == null)
            {
               return;
            }
            so.data[key] = val;
            SharedObjectManager.flush(so);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _unifiedSharedObject() : SharedObject
      {
         try
         {
            return SharedObjectManager.getUserSharedObject("unifiedMailboxSurveyPanel");
         }
         catch(e1:Error)
         {
         }
         try
         {
            return SharedObject.getLocal("unifiedMailboxSurveyPanel","/");
         }
         catch(e2:Error)
         {
         }
         return null;
      }
      
      private static function _unifiedReadNumber(key:String, def:Number) : Number
      {
         var so:SharedObject;
         var n:Number;
         try
         {
            so = _unifiedSharedObject();
            if(so != null && so.data != null && so.data[key] != undefined)
            {
               n = Number(so.data[key]);
               if(!isNaN(n))
               {
                  return n;
               }
            }
         }
         catch(e:Error)
         {
         }
         return def;
      }
      
      private static function _unifiedSaveNumber(key:String, val:Number) : void
      {
         var so:SharedObject;
         try
         {
            so = _unifiedSharedObject();
            if(so == null)
            {
               return;
            }
            so.data[key] = val;
            SharedObjectManager.flush(so);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _rankSharedObject() : SharedObject
      {
         try
         {
            return SharedObjectManager.getUserSharedObject("rank1521Panel");
         }
         catch(e1:Error)
         {
         }
         try
         {
            return SharedObject.getLocal("rank1521Panel","/");
         }
         catch(e2:Error)
         {
         }
         return null;
      }
      
      private static function _rankReadNumber(key:String, def:Number) : Number
      {
         var so:SharedObject;
         var n:Number;
         try
         {
            so = _rankSharedObject();
            if(so != null && so.data != null && so.data[key] != undefined)
            {
               n = Number(so.data[key]);
               if(!isNaN(n))
               {
                  return n;
               }
            }
         }
         catch(e:Error)
         {
         }
         return def;
      }
      
      private static function _rankSaveNumber(key:String, val:Number) : void
      {
         var so:SharedObject;
         try
         {
            so = _rankSharedObject();
            if(so == null)
            {
               return;
            }
            so.data[key] = val;
            SharedObjectManager.flush(so);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _openRankPanel() : void
      {
         var parent:DisplayObjectContainer;
         var wasAttached:Boolean;
         var sw:Number;
         var sh:Number;
         try
         {
            parent = _pickRankParent();
            if(parent == null)
            {
               return;
            }
            wasAttached = _rankPanel != null && _rankPanel.parent != null;
            if(_rankPanel == null)
            {
               _rankPanel = _buildRankPanel();
            }
            if(_rankPanel.parent == null)
            {
               parent.addChild(_rankPanel);
            }
            try
            {
               parent.setChildIndex(_rankPanel,parent.numChildren - 1);
            }
            catch(eT:Error)
            {
            }
            if(!wasAttached)
            {
               try
               {
                  sw = LayerManager.stage != null ? LayerManager.stage.stageWidth : 1280;
                  sh = LayerManager.stage != null ? LayerManager.stage.stageHeight : 720;
                  _rankPanel.x = _rankReadNumber("panelX",(sw - RANK_PANEL_W) / 2);
                  _rankPanel.y = _rankReadNumber("panelY",(sh - RANK_PANEL_H) / 2);
               }
               catch(eP:Error)
               {
               }
            }
            _rankPanelMounted = true;
            _setRankStatus("就绪");
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _closeRankPanel() : void
      {
         try
         {
            if(_rankPanel != null && _rankPanel.parent != null)
            {
               _rankPanel.parent.removeChild(_rankPanel);
            }
            _rankPanelMounted = false;
         }
         catch(e:Error)
         {
         }
         try
         {
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,_onRankSbDragMove);
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onRankSbDragEnd);
            }
            _rankSbDragging = false;
         }
         catch(_:Error)
         {
         }
      }
      
      private static function _buildRankPanel() : Sprite
      {
         var bg:Shape;
         var dragHandle:Sprite;
         var sep:Shape;
         var rbg:Shape;
         var fmt:TextFormat;
         var sbX:int;
         var ly:int;
         var lbg:Shape;
         var lf:TextFormat;
         var p:Sprite = new Sprite();
         try
         {
            bg = new Shape();
            bg.graphics.beginFill(658970,0.96);
            bg.graphics.lineStyle(1,54527,0.55);
            bg.graphics.drawRoundRect(0,0,RANK_PANEL_W,RANK_PANEL_H,8,8);
            bg.graphics.endFill();
            bg.graphics.beginFill(54527,0.08);
            bg.graphics.drawRect(1,1,RANK_PANEL_W - 2,28);
            bg.graphics.endFill();
            p.addChild(bg);
            dragHandle = new Sprite();
            dragHandle.graphics.beginFill(16777215,0);
            dragHandle.graphics.drawRect(0,0,RANK_PANEL_W - 32,28);
            dragHandle.graphics.endFill();
            dragHandle.x = 0;
            dragHandle.y = 0;
            dragHandle.buttonMode = true;
            dragHandle.useHandCursor = false;
            dragHandle.mouseEnabled = true;
            dragHandle.addEventListener(MouseEvent.MOUSE_DOWN,_onPanelDragStart,false,0,true);
            p.addChild(dragHandle);
            p.addChild(_rankMakeLabel("1521 排名查询",10,6,RANK_PANEL_W - 80,18,2282478,12,true));
            p.addChild(_rankMakeBtn(RANK_PANEL_W - 28,4,22,22,"X",15680580,_onRankBtnClose));
            p.addChild(_rankMakeLabel("rankId:",12,42,60,18,9741240,11));
            _rankInpId = _rankMakeInput(70,40,70,22);
            _rankInpId.text = "9";
            p.addChild(_rankInpId);
            p.addChild(_rankMakeLabel("min:",150,42,40,18,9741240,11));
            _rankInpMin = _rankMakeInput(190,40,70,22);
            _rankInpMin.text = _rankLastMin;
            _rankInpMin.addEventListener(Event.CHANGE,_onRankRangeChange,false,0,true);
            p.addChild(_rankInpMin);
            p.addChild(_rankMakeLabel("max:",270,42,40,18,9741240,11));
            _rankInpMax = _rankMakeInput(310,40,70,22);
            _rankInpMax.text = _rankLastMax;
            _rankInpMax.addEventListener(Event.CHANGE,_onRankRangeChange,false,0,true);
            p.addChild(_rankInpMax);
            p.addChild(_rankMakeBtn(395,40,80,22,"查询",2278750,_onRankQueryClick));
            p.addChild(_rankMakeLabel("预设:",12,72,40,18,9741240,10));
            p.addChild(_rankMakeBtn(50,70,90,22,"大乱斗 9",54527,_onRankPreset9));
            p.addChild(_rankMakeBtn(150,70,90,22,"神魔榜 71",54527,_onRankPreset71));
            p.addChild(_rankMakeBtn(250,70,90,22,"十字 131",54527,_onRankPreset131));
            p.addChild(_rankMakeLabel("月榜:",345,72,32,18,9741240,10));
            p.addChild(_rankMakeBtn(381,70,38,22,"天空",16096779,_onRankMonthSky));
            p.addChild(_rankMakeBtn(421,70,38,22,"勇者",16096779,_onRankMonthBrave));
            p.addChild(_rankMakeBtn(461,70,38,22,"王者",16096779,_onRankMonthKing));
            p.addChild(_rankMakeBtn(501,70,38,22,"巅峰",16096779,_onRankMonthPeak));
            p.addChild(_rankMakeBtn(541,70,38,22,"无擒",16096779,_onRankMonthQin));
            p.addChild(_rankMakeBtn(581,70,38,22,"御风",16096779,_onRankMonthYufeng));
            p.addChild(_rankMakeBtn(12,100,80,22,"复制全部",2278750,_onRankCopyAll));
            p.addChild(_rankMakeBtn(100,100,90,22,"复制米米号",2278750,_onRankCopyIds));
            p.addChild(_rankMakeBtn(198,100,90,22,"导出 txt",16096779,_onRankExport));
            p.addChild(_rankMakeBtn(296,100,118,22,"导出TXT(米米号)",16096779,_onRankExportIds));
            p.addChild(_rankMakeBtn(422,100,80,22,"清空",9741240,_onRankClear));
            p.addChild(_rankMakeBtn(510,100,118,22,"将数据导入到替换",16096779,_onRankImportToReplace));
            _rankStatusTxt = _rankMakeLabel("就绪",12,128,RANK_PANEL_W - 24,16,9741240,10);
            p.addChild(_rankStatusTxt);
            sep = new Shape();
            sep.graphics.lineStyle(1,2282478,0.18);
            sep.graphics.moveTo(10,144);
            sep.graphics.lineTo(RANK_PANEL_W - 10,144);
            p.addChild(sep);
            rbg = new Shape();
            rbg.graphics.beginFill(0,0.45);
            rbg.graphics.lineStyle(1,2278750,0.22);
            rbg.graphics.drawRoundRect(10,146,RANK_PANEL_W - 20,RANK_PANEL_H - 240,4,4);
            rbg.graphics.endFill();
            p.addChild(rbg);
            _rankResultTxt = new TextField();
            _rankResultTxt.x = 14;
            _rankResultTxt.y = 148;
            _rankResultTxt.width = RANK_PANEL_W - 28 - RES_SB_W - RES_SB_GAP;
            _rankResultTxt.height = RANK_PANEL_H - 244;
            _rankResultTxt.multiline = true;
            _rankResultTxt.wordWrap = false;
            _rankResultTxt.background = false;
            _rankResultTxt.border = false;
            _rankResultTxt.type = TextFieldType.INPUT;
            _rankResultTxt.selectable = true;
            _rankResultTxt.mouseWheelEnabled = true;
            fmt = new TextFormat();
            fmt.font = "Consolas";
            fmt.size = 11;
            fmt.color = 14870768;
            _rankResultTxt.defaultTextFormat = fmt;
            _rankResultTxt.text = "↑ 输入 rankId / min / max 后点[查询]";
            p.addChild(_rankResultTxt);
            sbX = RANK_PANEL_W - 14 - RES_SB_W;
            _rankResultScrollTrack = new Sprite();
            _rankResultScrollTrack.x = sbX;
            _rankResultScrollTrack.y = 148;
            _rankResultScrollTrack.graphics.beginFill(16777215,0.04);
            _rankResultScrollTrack.graphics.lineStyle(1,2282478,0.18);
            _rankResultScrollTrack.graphics.drawRoundRect(0,0,RES_SB_W,RANK_PANEL_H - 244,3,3);
            _rankResultScrollTrack.graphics.endFill();
            _rankResultScrollTrack.mouseEnabled = false;
            _rankResultScrollTrack.mouseChildren = true;
            p.addChild(_rankResultScrollTrack);
            _rankResultScrollThumb = new Sprite();
            _rankResultScrollThumb.x = 1;
            _rankResultScrollThumb.y = 0;
            _rankResultScrollThumb.buttonMode = true;
            _rankResultScrollThumb.useHandCursor = true;
            _rankResultScrollThumb.mouseEnabled = true;
            _rankResultScrollThumb.addEventListener(MouseEvent.MOUSE_DOWN,_onRankSbThumbDown,false,0,true);
            _rankResultScrollTrack.addChild(_rankResultScrollThumb);
            _updateRankResultScrollbar();
            _rankResultTxt.addEventListener(Event.SCROLL,_onRankResultScroll,false,0,true);
            ly = RANK_PANEL_H - 88;
            lbg = new Shape();
            lbg.graphics.beginFill(0,0.45);
            lbg.graphics.lineStyle(1,54527,0.22);
            lbg.graphics.drawRoundRect(10,ly,RANK_PANEL_W - 20,72,4,4);
            lbg.graphics.endFill();
            p.addChild(lbg);
            _rankLogTxt = new TextField();
            _rankLogTxt.x = 14;
            _rankLogTxt.y = ly + 4;
            _rankLogTxt.width = RANK_PANEL_W - 28;
            _rankLogTxt.height = 64;
            _rankLogTxt.multiline = true;
            _rankLogTxt.wordWrap = true;
            _rankLogTxt.background = false;
            _rankLogTxt.border = false;
            _rankLogTxt.type = TextFieldType.DYNAMIC;
            _rankLogTxt.selectable = true;
            _rankLogTxt.mouseWheelEnabled = true;
            lf = new TextFormat();
            lf.font = "Consolas";
            lf.size = 10;
            lf.color = 9741240;
            _rankLogTxt.defaultTextFormat = lf;
            _rankLogTxt.text = "[log] 面板已初始化\n";
            p.addChild(_rankLogTxt);
         }
         catch(e:Error)
         {
         }
         return p;
      }
      
      private static function _rankMakeLabel(txt:String, x:int, y:int, w:int, h:int, color:uint, size:int, bold:Boolean = false) : TextField
      {
         var tf:TextField = new TextField();
         tf.x = x;
         tf.y = y;
         tf.width = w;
         tf.height = h;
         tf.selectable = false;
         tf.mouseEnabled = false;
         tf.background = false;
         tf.border = false;
         var f:TextFormat = new TextFormat();
         f.size = size;
         f.color = color;
         f.bold = bold;
         tf.defaultTextFormat = f;
         tf.text = txt;
         return tf;
      }
      
      private static function _rankMakeInput(x:int, y:int, w:int, h:int) : TextField
      {
         var tf:TextField = new TextField();
         tf.x = x;
         tf.y = y;
         tf.width = w;
         tf.height = h;
         tf.type = TextFieldType.INPUT;
         tf.selectable = true;
         tf.background = true;
         tf.backgroundColor = 0;
         tf.border = true;
         tf.borderColor = 2278750;
         tf.restrict = "\\-0-9";
         var f:TextFormat = new TextFormat();
         f.font = "Consolas";
         f.size = 12;
         f.color = 14870768;
         tf.defaultTextFormat = f;
         tf.text = "";
         return tf;
      }
      
      private static function _rankMakeBtn(x:int, y:int, w:int, h:int, label:String, color:uint, handler:Function) : Sprite
      {
         var btn:Sprite = new Sprite();
         btn.x = x;
         btn.y = y;
         btn.buttonMode = true;
         btn.useHandCursor = true;
         btn.mouseChildren = false;
         var bg:Shape = new Shape();
         bg.graphics.beginFill(color,0.1);
         bg.graphics.lineStyle(1,color,0.55);
         bg.graphics.drawRoundRect(0,0,w,h,4,4);
         bg.graphics.endFill();
         btn.addChild(bg);
         var lbl:TextField = new TextField();
         lbl.width = w;
         lbl.height = h;
         lbl.selectable = false;
         lbl.mouseEnabled = false;
         var f:TextFormat = new TextFormat();
         f.size = 11;
         f.color = color;
         f.bold = true;
         f.align = "center";
         lbl.defaultTextFormat = f;
         lbl.text = label;
         lbl.y = (h - 16) / 2;
         btn.addChild(lbl);
         btn.addEventListener(MouseEvent.CLICK,handler,false,0,true);
         return btn;
      }
      
      private static function _setRankStatus(s:String) : void
      {
         try
         {
            if(_rankStatusTxt != null)
            {
               _rankStatusTxt.text = s;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _appendRankLog(s:String) : void
      {
         try
         {
            if(_rankLogTxt != null)
            {
               _rankLogTxt.appendText(s + "\n");
               _rankLogTxt.scrollV = _rankLogTxt.maxScrollV;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onRankBtnClose(e:MouseEvent) : void
      {
         try
         {
            _closeRankPanel();
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onRankPreset9(e:MouseEvent) : void
      {
         _doRankPresetQuery(9,"大乱斗");
      }
      
      private static function _onRankPreset71(e:MouseEvent) : void
      {
         _doRankPresetQuery(71,"神魔榜");
      }
      
      private static function _onRankPreset131(e:MouseEvent) : void
      {
         _doRankPresetQuery(131,"十字");
      }
      
      private static function _doRankPresetQuery(rid:int, label:String) : void
      {
         try
         {
            if(_rankInpId == null)
            {
               return;
            }
            _rankInpId.text = rid;
            _appendRankLog("[预设] " + label + " -> rankId=" + rid);
            _onRankQueryClick(null);
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _getCurrentMonthDateKey() : String
      {
         var now:Date;
         var y:int;
         var m:int;
         try
         {
            now = new Date();
            y = now.fullYear;
            m = now.month + 1;
            return y + (m < 10 ? "0" + m : m);
         }
         catch(e:Error)
         {
            return "202605";
         }
      }
      
      private static function _getCurrentMonthRankIds() : Array
      {
         var now:Date;
         try
         {
            now = new Date();
            return _getMonthRankIdsByYearMonth(now.fullYear,now.month + 1);
         }
         catch(e:Error)
         {
            return [156,157,158,159,160,161];
         }
      }
      
      private static function _getMonthRankIdsByYearMonth(y:int, m:int) : Array
      {
         var key:String;
         var table:Object;
         var base5:Array;
         try
         {
            key = y + (m < 10 ? "0" + m : m);
            table = {
               "202601":[132,133,134,135,136],
               "202602":[138,139,140,141,142],
               "202603":[144,145,146,147,148],
               "202604":[150,151,152,153,154],
               "202605":[156,157,158,159,160],
               "202606":[162,163,164,165,166],
               "202607":[168,169,170,171,172],
               "202608":[174,175,176,177,178],
               "202609":[180,181,182,183,184],
               "202610":[186,187,188,189,190],
               "202611":[192,193,194,195,196],
               "202612":[198,199,200,201,202],
               "202701":[204,205,206,207,208],
               "202702":[210,211,212,213,214],
               "202703":[216,217,218,219,220],
               "202704":[222,223,224,225,226],
               "202705":[228,229,230,231,232],
               "202706":[234,235,236,237,238],
               "202707":[240,241,242,243,244],
               "202708":[246,247,248,249,250],
               "202709":[252,253,254,255,256],
               "202710":[258,259,260,261,262],
               "202711":[264,265,266,267,268],
               "202712":[270,271,272,273,274],
               "202801":[276,277,278,279,280],
               "202802":[282,283,284,285,286],
               "202803":[288,289,290,291,292],
               "202804":[294,295,296,297,298],
               "202805":[300,301,302,303,304],
               "202806":[306,307,308,309,310],
               "202807":[312,313,314,315,316],
               "202808":[318,319,320,321,322],
               "202809":[324,325,326,327,328],
               "202810":[330,331,332,333,334],
               "202811":[336,337,338,339,340],
               "202812":[342,343,344,345,346],
               "202901":[348,349,350,351,352],
               "202902":[354,355,356,357,358],
               "202903":[360,361,362,363,364],
               "202904":[366,367,368,369,370],
               "202905":[372,373,374,375,376],
               "202906":[378,379,380,381,382],
               "202907":[384,385,386,387,388],
               "202908":[390,391,392,393,394],
               "202909":[396,397,398,399,400],
               "202910":[402,403,404,405,406],
               "202911":[408,409,410,411,412],
               "202912":[414,415,416,417,418],
               "203001":[420,421,422,423,424],
               "203002":[426,427,428,429,430],
               "203003":[432,433,434,435,436],
               "203004":[438,439,440,441,442],
               "203005":[444,445,446,447,448],
               "203006":[450,451,452,453,454],
               "203007":[456,457,458,459,460],
               "203008":[462,463,464,465,466],
               "203009":[468,469,470,471,472],
               "203010":[474,475,476,477,478],
               "203011":[480,481,482,483,484],
               "203012":[486,487,488,489,490]
            };
            base5 = table[key] as Array;
            if(base5 == null)
            {
               if(y >= 2031)
               {
                  base5 = _calcMonthRankBase5ByFormula(y,m);
               }
               else
               {
                  base5 = table["202601"] as Array;
               }
            }
            return [base5[0],base5[1],base5[2],base5[3],base5[4],int(base5[4]) + 1];
         }
         catch(e:Error)
         {
            return [156,157,158,159,160,161];
         }
      }
      
      private static function _calcMonthRankBase5ByFormula(y:int, m:int) : Array
      {
         var monthIndex:int = (y - 2026) * 12 + (m - 1);
         var first:int = 132 + monthIndex * 6;
         return [first,first + 1,first + 2,first + 3,first + 4];
      }
      
      private static function _doRankMonthQuery(slot:int, label:String) : void
      {
         var ids:Array;
         var rid:int;
         var dateKey:String;
         try
         {
            if(_rankInpId == null)
            {
               return;
            }
            ids = _getCurrentMonthRankIds();
            if(ids == null || slot < 0 || slot >= ids.length)
            {
               return;
            }
            rid = int(ids[slot]);
            _rankInpId.text = rid;
            dateKey = _getCurrentMonthDateKey();
            _appendRankLog("[月榜] " + label + " " + dateKey + " -> rankId=" + rid);
            _onRankQueryClick(null);
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onRankMonthSky(e:MouseEvent) : void
      {
         _doRankMonthQuery(0,"天空竞技场");
      }
      
      private static function _onRankMonthBrave(e:MouseEvent) : void
      {
         _doRankMonthQuery(1,"太空-勇者");
      }
      
      private static function _onRankMonthKing(e:MouseEvent) : void
      {
         _doRankMonthQuery(2,"太空-王者");
      }
      
      private static function _onRankMonthPeak(e:MouseEvent) : void
      {
         _doRankMonthQuery(3,"太空-巅峰");
      }
      
      private static function _onRankMonthQin(e:MouseEvent) : void
      {
         _doRankMonthQuery(4,"无擒战");
      }
      
      private static function _onRankMonthYufeng(e:MouseEvent) : void
      {
         _doRankMonthQuery(5,"御风");
      }
      
      private static function _onRankClear(e:MouseEvent) : void
      {
         try
         {
            _rankLastResultText = "";
            _rankLastUserIds = "";
            if(_rankResultTxt != null)
            {
               _rankResultTxt.text = "";
            }
            try
            {
               if(_rankResultTxt != null)
               {
                  _rankResultTxt.scrollV = 1;
               }
            }
            catch(_eS:Error)
            {
            }
            _updateRankResultScrollbar();
            _setRankStatus("已清空");
            _appendRankLog("[clear] 结果已清空");
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onRankQueryClick(e:MouseEvent) : void
      {
         var rankId:int;
         var minV:int;
         var maxV:int;
         try
         {
            rankId = int(parseInt(_rankInpId.text,10));
            minV = int(parseInt(_rankInpMin.text,10));
            maxV = int(parseInt(_rankInpMax.text,10));
            _rankImportToReplaceAfterResp = false;
            _rankImportToReplaceLabel = "";
            _rankImportToReplaceFilterAfterResp = false;
            _rankImportToUnifiedAfterResp = false;
            _rankImportToUnifiedLabel = "";
            _sendRankQuery(rankId,minV,maxV,"[req]");
         }
         catch(e2:Error)
         {
            try
            {
               _setRankStatus("异常: " + e2.message);
            }
            catch(_e:Error)
            {
            }
         }
      }
      
      private static function _rankReadCurrentMin() : int
      {
         var n:int;
         try
         {
            if(_rankInpMin != null && _rankInpMin.text != "")
            {
               n = int(parseInt(_rankInpMin.text,10));
               if(!isNaN(n))
               {
                  return n;
               }
            }
         }
         catch(e:Error)
         {
         }
         return _rankLastMin;
      }
      
      private static function _rankReadCurrentMax() : int
      {
         var n:int;
         try
         {
            if(_rankInpMax != null && _rankInpMax.text != "")
            {
               n = int(parseInt(_rankInpMax.text,10));
               if(!isNaN(n))
               {
                  return n;
               }
            }
         }
         catch(e:Error)
         {
         }
         return _rankLastMax;
      }
      
      private static function _sendRankQuery(rankId:int, minV:int, maxV:int, logPrefix:String) : void
      {
         try
         {
            if(_rankBusy)
            {
               _appendRankLog("[替换] 取消上一次未完成的请求, 发起新请求");
               _clearRank1521Listeners();
               _rankBusy = false;
            }
            if(isNaN(rankId) || rankId <= 0)
            {
               _setRankStatus("rankId 必须是正整数");
               return;
            }
            if(isNaN(minV) || isNaN(maxV))
            {
               _setRankStatus("min / max 必须是整数");
               return;
            }
            if(maxV < minV)
            {
               _setRankStatus("max 必须 >= min");
               return;
            }
            if(maxV - minV > RANK_MAX_BATCH)
            {
               _appendRankLog("[warn] 区间过大, 已收窄到 " + RANK_MAX_BATCH);
               maxV = minV + RANK_MAX_BATCH;
               try
               {
                  if(_rankInpMax != null)
                  {
                     _rankInpMax.text = maxV;
                  }
               }
               catch(eMax:Error)
               {
               }
            }
            _rankLastRankId = rankId;
            _rankLastMin = minV;
            _rankLastMax = maxV;
            try
            {
               if(_rankInpId != null)
               {
                  _rankInpId.text = rankId;
               }
            }
            catch(eId:Error)
            {
            }
            try
            {
               if(_rankInpMin != null)
               {
                  _rankInpMin.text = minV;
               }
            }
            catch(eMin:Error)
            {
            }
            try
            {
               if(_rankInpMax != null)
               {
                  _rankInpMax.text = maxV;
               }
            }
            catch(eMax2:Error)
            {
            }
            try
            {
               if(_unifiedInpMin != null)
               {
                  _unifiedInpMin.text = minV;
               }
               if(_unifiedInpMax != null)
               {
                  _unifiedInpMax.text = maxV;
               }
            }
            catch(eUM:Error)
            {
            }
            _rankBusy = true;
            _rankT0 = getTimer();
            _setRankStatus("发送 1521  rankId=" + rankId + " min=" + minV + " max=" + maxV + " ...");
            _appendRankLog(logPrefix + " rankId=" + rankId + " min=" + minV + " max=" + maxV);
            try
            {
               Connection.addCommandListener(CommandSet.GET_RANK_LIST_1521,_onRank1521Resp);
               Connection.addErrorHandler(CommandSet.GET_RANK_LIST_1521,_onRank1521Err);
               Connection.send(CommandSet.GET_RANK_LIST_1521,rankId,minV,maxV);
            }
            catch(errSend:Error)
            {
               _clearRank1521Listeners();
               _rankBusy = false;
               _setRankStatus("发送异常: " + errSend.message);
               _appendRankLog("[err] send 异常: " + errSend.message);
               return;
            }
            _rankTimeoutId = setTimeout(_onRank1521Timeout,RANK_TIMEOUT_MS);
         }
         catch(e2:Error)
         {
            try
            {
               _setRankStatus("异常: " + e2.message);
            }
            catch(_e:Error)
            {
            }
         }
      }
      
      private static function _clearRank1521Listeners() : void
      {
         try
         {
            Connection.removeCommandListener(CommandSet.GET_RANK_LIST_1521,_onRank1521Resp);
         }
         catch(e1:Error)
         {
         }
         try
         {
            Connection.removeErrorHandler(CommandSet.GET_RANK_LIST_1521,_onRank1521Err);
         }
         catch(e2:Error)
         {
         }
         if(_rankTimeoutId != 0)
         {
            try
            {
               clearTimeout(_rankTimeoutId);
            }
            catch(e3:Error)
            {
            }
            _rankTimeoutId = 0;
         }
      }
      
      private static function _onRank1521Resp(e:MessageEvent) : void
      {
         var elapsed:int;
         var p:Parser_1521;
         var qLabel:String;
         var uLabel:String;
         var rawCount:int;
         try
         {
            elapsed = getTimer() - _rankT0;
            _clearRank1521Listeners();
            _rankBusy = false;
            p = null;
            try
            {
               p = new Parser_1521(e.message.getRawDataCopy());
            }
            catch(errP:Error)
            {
               _setRankStatus("解析失败: " + errP.message);
               _appendRankLog("[err] 解析失败");
               return;
            }
            _renderRankResult(p,elapsed);
            if(_rankImportToReplaceAfterResp)
            {
               qLabel = _rankImportToReplaceLabel;
               if(qLabel == null || qLabel.length == 0)
               {
                  qLabel = "快速榜单";
               }
               _rankImportToReplaceAfterResp = false;
               _rankImportToReplaceLabel = "";
               if(_rankImportToReplaceFilterAfterResp && _rankLastUserIds.length > 0)
               {
                  _replaceLoadValuesFromText(_rankLastUserIds,"quick-rank-raw",false);
                  _replaceStatus(qLabel + " 已载入原始榜单，正在过滤邮箱");
               }
               if(_rankImportToReplaceFilterAfterResp)
               {
                  _rankImportToReplaceFilterAfterResp = false;
                  _startReplaceMailboxFilter(_rankLastUserIds,qLabel);
                  return;
               }
               _rankImportToReplaceFilterAfterResp = false;
               _openReplacePanel();
               if(_rankLastUserIds.length > 0 && _replaceLoadValuesFromText(_rankLastUserIds,"quick-rank",true))
               {
                  _replaceLog("[quick-rank] " + qLabel + " -> 替换 " + _replaceValues.length + " 行");
                  _replaceStatus(qLabel + " 已覆盖替换列表");
                  _appendRankLog("[quick-rank] " + qLabel + " -> 替换 " + _replaceValues.length + " 行");
               }
               else
               {
                  _replaceStatus(qLabel + " 无米米号可导入");
                  _replaceLog("[quick-rank] " + qLabel + " 无米米号可导入");
               }
            }
            if(_rankImportToUnifiedAfterResp)
            {
               uLabel = _rankImportToUnifiedLabel;
               if(uLabel == null || uLabel.length == 0)
               {
                  uLabel = "榜单";
               }
               _rankImportToUnifiedAfterResp = false;
               _rankImportToUnifiedLabel = "";
               _openUnifiedPanel();
               if(_rankLastUserIds.length > 0)
               {
                  _unifiedIds = _parseReplaceProbeIds(_rankLastUserIds);
                  if(_unifiedRankScanActive)
                  {
                     rawCount = _unifiedIds.length;
                     _unifiedIds = _filterUnifiedRankScanNewIds(_unifiedIds,uLabel);
                     if(_unifiedIds.length > 0)
                     {
                        _unifiedLog("[勘查全部] " + uLabel + " 原始 " + rawCount + " 行，新增 " + _unifiedIds.length + " 行，重复账号跳过，开始勘查");
                        _startUnifiedSurvey(false,false);
                     }
                     else
                     {
                        _unifiedLog("[勘查全部] " + uLabel + " 原始 " + rawCount + " 行均已勘查过，跳过并继续下一个榜单");
                        _startNextUnifiedRankScan();
                     }
                  }
                  else
                  {
                     _unifiedLog("[unified-rank] " + uLabel + " 导入 " + _unifiedIds.length + " 行，直接开始勘查，打不开的账号自动跳过");
                     _startUnifiedSurvey(false);
                  }
               }
               else
               {
                  _unifiedStatus(uLabel + " 无米米号可导入");
                  if(_unifiedRankScanActive)
                  {
                     _unifiedLog("[勘查全部] " + uLabel + " 无米米号可导入，继续下一个榜单");
                     _startNextUnifiedRankScan();
                  }
                  else
                  {
                     _unifiedLog("[unified-rank] " + uLabel + " 无米米号可导入");
                  }
               }
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onRank1521Err(e:MessageEvent) : void
      {
         var code:int;
         try
         {
            _clearRank1521Listeners();
            _rankBusy = false;
            _rankImportToReplaceAfterResp = false;
            _rankImportToReplaceLabel = "";
            _rankImportToReplaceFilterAfterResp = false;
            _rankImportToUnifiedAfterResp = false;
            _rankImportToUnifiedLabel = "";
            code = -1;
            try
            {
               code = int(e.message.statusCode);
            }
            catch(_e:Error)
            {
            }
            if(_unifiedRankScanActive)
            {
               _unifiedLog("[勘查全部] 榜单协议错误 status=" + code + "，继续下一个榜单");
               _startNextUnifiedRankScan();
               return;
            }
            _setRankStatus("协议错误 status=" + code);
            _appendRankLog("[err] 协议错误 status=" + code);
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onRank1521Timeout() : void
      {
         try
         {
            _clearRank1521Listeners();
            _rankBusy = false;
            _rankImportToReplaceAfterResp = false;
            _rankImportToReplaceLabel = "";
            _rankImportToReplaceFilterAfterResp = false;
            _rankImportToUnifiedAfterResp = false;
            _rankImportToUnifiedLabel = "";
            if(_unifiedRankScanActive)
            {
               _unifiedLog("[勘查全部] 榜单查询超时，继续下一个榜单");
               _startNextUnifiedRankScan();
               return;
            }
            _setRankStatus("超时 8s 无响应, listener 已清理");
            _appendRankLog("[timeout] 8s 无响应");
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _padLeft(s:String, n:int) : String
      {
         while(s.length < n)
         {
            s = " " + s;
         }
         return s;
      }
      
      private static function _padRight(s:String, n:int) : String
      {
         while(s.length < n)
         {
            s += " ";
         }
         return s;
      }
      
      private static function _repeatChar(c:String, n:int) : String
      {
         var s:String = "";
         var k:int = 0;
         while(k < n)
         {
            s += c;
            k++;
         }
         return s;
      }
      
      private static function _renderRankResult(p:Parser_1521, elapsedMs:int) : void
      {
         var i:int;
         var r:RankServerInfo;
         var widestId:int;
         var idStr:String;
         var SEQ_W:int;
         var SCORE_W:int;
         var TIME_W:int;
         var NICK_W:int;
         var DIV:String;
         var dashSeq:String;
         var dashId:String;
         var dashScore:String;
         var dashTime:String;
         var dashNick:String;
         var sb:String;
         var ids:String;
         var seqNo:int;
         try
         {
            i = 0;
            r = null;
            widestId = 12;
            i = 0;
            while(i < p.rankInfoList.length)
            {
               r = p.rankInfoList[i];
               idStr = r != null && r.userId != null ? r.userId : "";
               if(idStr.length > widestId)
               {
                  widestId = idStr.length;
               }
               i++;
            }
            SEQ_W = 4;
            SCORE_W = 9;
            TIME_W = 17;
            NICK_W = 8;
            DIV = "------------------------------------------------------------------";
            dashSeq = _repeatChar("-",SEQ_W);
            dashId = _repeatChar("-",widestId);
            dashScore = _repeatChar("-",SCORE_W);
            dashTime = _repeatChar("-",TIME_W);
            dashNick = _repeatChar("-",NICK_W);
            sb = "";
            sb += "[查询] rankId=" + _rankLastRankId + "  min=" + _rankLastMin + "  max=" + _rankLastMax + "  耗时=" + elapsedMs + "ms\n";
            sb += "[调试] maxId=" + p.maxId + "  midId=" + p.midId + "  minId=" + p.minId + "  count=" + p.rankInfoList.length + "\n";
            sb += DIV + "\n";
            sb += _padRight("序号",SEQ_W) + "  " + _padRight("米米号",widestId) + "  " + _padRight("分数",SCORE_W) + "  " + _padRight("刷分时间",TIME_W) + "  " + "昵称\n";
            sb += dashSeq + "  " + dashId + "  " + dashScore + "  " + dashTime + "  " + dashNick + "\n";
            ids = "";
            i = 0;
            while(i < p.rankInfoList.length)
            {
               r = p.rankInfoList[i];
               seqNo = i + 1;
               sb += _padLeft(seqNo,SEQ_W) + "  " + _padLeft(r.userId,widestId) + "  " + _padLeft(r.score,SCORE_W) + "  " + _padRight(_rankFmtTime(r.scoreTime),TIME_W) + "  " + (r.nick != null ? r.nick : "") + "\n";
               ids += r.userId + "\n";
               i++;
            }
            sb += DIV + "\n";
            _rankLastResultText = sb;
            _rankLastUserIds = ids;
            if(_rankResultTxt != null)
            {
               _rankResultTxt.text = sb;
            }
            try
            {
               if(_rankResultTxt != null)
               {
                  _rankResultTxt.scrollV = 1;
               }
            }
            catch(_eS:Error)
            {
            }
            _updateRankResultScrollbar();
            _setRankStatus("成功 count=" + p.rankInfoList.length + " 耗时 " + elapsedMs + "ms");
            _appendRankLog("[ok] count=" + p.rankInfoList.length);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _rankFmtTime(secs:Number) : String
      {
         var d:Date;
         try
         {
            if(isNaN(secs) || secs <= 0)
            {
               return "-";
            }
            d = new Date(secs * 1000);
            return d.fullYear + "-" + _rankPad2(d.month + 1) + "-" + _rankPad2(d.date) + " " + _rankPad2(d.hours) + ":" + _rankPad2(d.minutes);
         }
         catch(e:Error)
         {
            return "-";
         }
      }
      
      private static function _rankPad2(n:int) : String
      {
         return n < 10 ? "0" + n : "" + n;
      }
      
      private static function _onPanelDragStart(e:MouseEvent) : void
      {
         var sw:Number;
         var sh:Number;
         var bounds:Rectangle;
         try
         {
            if(_rankPanel == null)
            {
               return;
            }
            sw = LayerManager.stage != null ? LayerManager.stage.stageWidth : 1280;
            sh = LayerManager.stage != null ? LayerManager.stage.stageHeight : 720;
            bounds = new Rectangle(-RANK_PANEL_W / 2,0,sw,sh - 28);
            _rankPanel.startDrag(false,bounds);
            if(LayerManager.stage != null)
            {
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP,_onPanelDragEnd,false,0,true);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onPanelDragEnd(e:MouseEvent) : void
      {
         try
         {
            if(_rankPanel != null)
            {
               _rankPanel.stopDrag();
            }
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onPanelDragEnd);
            }
            if(_rankPanel != null)
            {
               _rankSaveNumber("panelX",_rankPanel.x);
               _rankSaveNumber("panelY",_rankPanel.y);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private static function _onRankCopyAll(e:MouseEvent) : void
      {
         try
         {
            if(_rankBusy)
            {
               _setRankStatus("查询中, 请稍候");
               return;
            }
            if(_rankLastResultText.length == 0)
            {
               _setRankStatus("无可复制结果");
               return;
            }
            System.setClipboard(_rankLastResultText);
            _setRankStatus("已复制全部结果 (" + _rankLastResultText.length + " 字)");
            _appendRankLog("[copy] 全部结果, 长度=" + _rankLastResultText.length);
         }
         catch(err:Error)
         {
            try
            {
               _setRankStatus("复制失败: " + err.message);
            }
            catch(_e:Error)
            {
            }
         }
      }
      
      private static function _onRankCopyIds(e:MouseEvent) : void
      {
         try
         {
            if(_rankBusy)
            {
               _setRankStatus("查询中, 请稍候");
               return;
            }
            if(_rankLastUserIds.length == 0)
            {
               _setRankStatus("无可复制米米号");
               return;
            }
            System.setClipboard(_rankLastUserIds);
            _setRankStatus("已复制米米号列表");
            _appendRankLog("[copy-ids]");
         }
         catch(err:Error)
         {
            try
            {
               _setRankStatus("复制失败: " + err.message);
            }
            catch(_e:Error)
            {
            }
         }
      }
      
      private static function _onRankImportToReplace(e:MouseEvent) : void
      {
         try
         {
            if(_rankBusy)
            {
               _setRankStatus("查询中, 请稍候");
               return;
            }
            if(_rankLastUserIds.length == 0)
            {
               _setRankStatus("无可导入米米号, 请先查询");
               return;
            }
            _openReplacePanel();
            if(_replacePanel == null)
            {
               _setRankStatus("替换面板未就绪");
               return;
            }
            if(_replaceLoadValuesFromText(_rankLastUserIds,"import->replace panel",true))
            {
               _setRankStatus("已导入 " + _replaceValues.length + " 行到替换面板");
               _appendRankLog("[import->replace panel] " + _replaceValues.length + " 行数据已导入");
            }
         }
         catch(err:Error)
         {
            try
            {
               _setRankStatus("导入替换面板失败: " + err.message);
            }
            catch(_e:Error)
            {
            }
         }
      }
      
      private static function _rankExportTimestamp() : String
      {
         var d:Date;
         var months:Array;
         try
         {
            d = new Date();
            months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
            return d.fullYear + months[d.month] + _rankPad2(d.date) + "_" + _rankPad2(d.hours) + _rankPad2(d.minutes) + _rankPad2(d.seconds);
         }
         catch(e:Error)
         {
            return "2026May19_000000";
         }
      }
      
      private static function _onRankExport(e:MouseEvent) : void
      {
         var name:String;
         var fr:FileReference;
         try
         {
            if(_rankBusy)
            {
               _setRankStatus("查询中, 请稍候");
               return;
            }
            if(_rankLastResultText.length == 0)
            {
               _setRankStatus("无可导出结果, 请先查询");
               return;
            }
            name = "rank_1521_" + _rankExportTimestamp() + ".txt";
            fr = new FileReference();
            fr.save(_rankLastResultText,name);
            _setRankStatus("已弹出保存对话框 (默认名: " + name + ")");
            _appendRankLog("[export] " + name);
         }
         catch(err:Error)
         {
            try
            {
               _setRankStatus("导出失败: " + err.message);
            }
            catch(_e:Error)
            {
            }
         }
      }
      
      private static function _onRankExportIds(e:MouseEvent) : void
      {
         var name:String;
         var fr:FileReference;
         var lines:Array;
         var count:int;
         var i:int;
         try
         {
            if(_rankBusy)
            {
               _setRankStatus("查询中, 请稍候");
               return;
            }
            if(_rankLastUserIds.length == 0)
            {
               _setRankStatus("无可导出米米号, 请先查询");
               return;
            }
            name = "mm_ids_" + _rankExportTimestamp() + ".txt";
            fr = new FileReference();
            fr.save(_rankLastUserIds,name);
            lines = _rankLastUserIds.split(/\r\n|\r|\n/);
            count = 0;
            i = 0;
            while(i < lines.length)
            {
               if(lines[i].length > 0)
               {
                  count++;
               }
               i++;
            }
            _setRankStatus("已弹出米米号保存对话框 (默认名: " + name + ")");
            _appendRankLog("[export-ids] 米米号 " + count + " 行 -> " + name);
         }
         catch(err:Error)
         {
            try
            {
               _setRankStatus("导出米米号失败: " + err.message);
            }
            catch(_e:Error)
            {
            }
         }
      }
      
      private static function _updateRankResultScrollbar() : void
      {
         var trackH:Number;
         var maxScroll:int;
         var bottomScroll:int;
         var topScroll:int;
         var totalLines:int;
         var visibleLines:int;
         var ratio:Number;
         var thumbH:Number;
         var travelable:Number;
         var progress:Number;
         var thumbY:Number;
         try
         {
            if(_rankResultTxt == null || _rankResultScrollTrack == null || _rankResultScrollThumb == null)
            {
               return;
            }
            trackH = _rankResultScrollTrack.height;
            maxScroll = _rankResultTxt.maxScrollV;
            bottomScroll = _rankResultTxt.bottomScrollV;
            topScroll = _rankResultTxt.scrollV;
            totalLines = maxScroll + (bottomScroll - topScroll);
            if(totalLines <= 0)
            {
               totalLines = 1;
            }
            visibleLines = bottomScroll - topScroll + 1;
            if(visibleLines < 1)
            {
               visibleLines = 1;
            }
            if(maxScroll <= 1)
            {
               _rankResultScrollThumb.visible = false;
               return;
            }
            _rankResultScrollThumb.visible = true;
            ratio = visibleLines / totalLines;
            thumbH = trackH * ratio;
            if(thumbH < 16)
            {
               thumbH = 16;
            }
            if(thumbH > trackH)
            {
               thumbH = trackH;
            }
            travelable = trackH - thumbH;
            progress = maxScroll <= 1 ? 0 : (topScroll - 1) / (maxScroll - 1);
            if(progress < 0)
            {
               progress = 0;
            }
            if(progress > 1)
            {
               progress = 1;
            }
            thumbY = travelable * progress;
            _rankResultScrollThumb.graphics.clear();
            _rankResultScrollThumb.graphics.beginFill(2282478,0.45);
            _rankResultScrollThumb.graphics.drawRoundRect(0,0,RES_SB_W - 2,thumbH,3,3);
            _rankResultScrollThumb.graphics.endFill();
            _rankResultScrollThumb.x = 1;
            _rankResultScrollThumb.y = thumbY;
         }
         catch(e:Error)
         {
         }
      }
      
      private static function _onRankResultScroll(e:Event) : void
      {
         try
         {
            _updateRankResultScrollbar();
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onRankSbThumbDown(e:MouseEvent) : void
      {
         try
         {
            if(_rankResultScrollThumb == null)
            {
               return;
            }
            _rankSbDragging = true;
            _rankSbDragOffsetY = _rankResultScrollThumb.parent.mouseY - _rankResultScrollThumb.y;
            if(LayerManager.stage != null)
            {
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_MOVE,_onRankSbDragMove,false,0,true);
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP,_onRankSbDragEnd,false,0,true);
            }
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onRankSbDragMove(e:MouseEvent) : void
      {
         var trackH:Number;
         var thumbH:Number;
         var travelable:Number;
         var newY:Number;
         var maxScroll:int;
         var progress:Number;
         var newScroll:int;
         try
         {
            if(!_rankSbDragging || _rankResultScrollThumb == null || _rankResultScrollTrack == null || _rankResultTxt == null)
            {
               return;
            }
            trackH = _rankResultScrollTrack.height;
            thumbH = _rankResultScrollThumb.height;
            travelable = trackH - thumbH;
            if(travelable <= 0)
            {
               return;
            }
            newY = _rankResultScrollTrack.mouseY - _rankSbDragOffsetY;
            if(newY < 0)
            {
               newY = 0;
            }
            if(newY > travelable)
            {
               newY = travelable;
            }
            _rankResultScrollThumb.y = newY;
            maxScroll = _rankResultTxt.maxScrollV;
            if(maxScroll < 1)
            {
               maxScroll = 1;
            }
            progress = travelable <= 0 ? 0 : newY / travelable;
            newScroll = 1 + Math.round(progress * (maxScroll - 1));
            if(newScroll < 1)
            {
               newScroll = 1;
            }
            if(newScroll > maxScroll)
            {
               newScroll = maxScroll;
            }
            _rankResultTxt.scrollV = newScroll;
            e.updateAfterEvent();
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onRankSbDragEnd(e:MouseEvent) : void
      {
         try
         {
            _rankSbDragging = false;
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,_onRankSbDragMove);
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onRankSbDragEnd);
            }
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onRankBtnMouseDown(e:MouseEvent) : void
      {
         var sw:Number;
         var sh:Number;
         var bw:Number;
         var bh:Number;
         var bounds:Rectangle;
         try
         {
            if(_rankBtn == null)
            {
               return;
            }
            _rankBtnDownX = _rankBtn.x;
            _rankBtnDownY = _rankBtn.y;
            _rankBtnDownTime = getTimer();
            _rankBtnDragging = false;
            sw = LayerManager.stage != null ? LayerManager.stage.stageWidth : 1280;
            sh = LayerManager.stage != null ? LayerManager.stage.stageHeight : 720;
            bw = _rankBtn.width;
            bh = _rankBtn.height;
            bounds = new Rectangle(0,0,sw - bw,sh - bh);
            _rankBtn.startDrag(false,bounds);
            if(LayerManager.stage != null)
            {
               LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP,_onRankBtnStageMouseUp,false,0,true);
            }
         }
         catch(_e:Error)
         {
         }
      }
      
      private static function _onRankBtnMouseUp(e:MouseEvent) : void
      {
         _finishRankBtnGesture();
      }
      
      private static function _onRankBtnStageMouseUp(e:MouseEvent) : void
      {
         _finishRankBtnGesture();
      }
      
      private static function _finishRankBtnGesture() : void
      {
         var dx:Number;
         var dy:Number;
         var dist:Number;
         var dt:int;
         try
         {
            if(_rankBtn == null)
            {
               return;
            }
            try
            {
               _rankBtn.stopDrag();
            }
            catch(_es:Error)
            {
            }
            if(LayerManager.stage != null)
            {
               LayerManager.stage.removeEventListener(MouseEvent.MOUSE_UP,_onRankBtnStageMouseUp);
            }
            dx = _rankBtn.x - _rankBtnDownX;
            dy = _rankBtn.y - _rankBtnDownY;
            dist = Math.sqrt(dx * dx + dy * dy);
            dt = getTimer() - _rankBtnDownTime;
            _rankSaveNumber("btnX",_rankBtn.x);
            _rankSaveNumber("btnY",_rankBtn.y);
            if(dist < RANK_BTN_CLICK_DIST && dt < RANK_BTN_CLICK_MS)
            {
               _onRankBtnClick(null);
            }
            else
            {
               _rankBtnDragging = true;
            }
         }
         catch(_e:Error)
         {
         }
      }
      
      override public function start() : void
      {
         SkyFightManager.getInstance().addListener();
         ActivityManager.refreshActivity();
         StatisticsManager.setup();
         RarePetManager.setup();
         MolecularPasswordController.setup();
         RightToolbarConter.instance.initEvent();
         FishingMatchManager.getInstance().setup();
         LoginAwardManager.isShowPanel(LoginInfo.isShowLoginAwardPanel);
         LocalMsgManager.getInstance().setup();
         MorphUpdate.updateMorph();
         MeshBeastReviveManager.instance.setup();
         WorshipStoneCupAct.getInstance().setup();
         XeggHome.setup();
         WorshipPhenixAct.getInstance().setup();
         PlanetManager.setup();
         DeliciousFoodOnePickup.setup();
         WaitNewYearSetup.setup();
         YiXingFindAndFightAct.getInstance().setup();
         PetItemUpdate.setup();
         MysteryNpcManager.setup();
         Quest1InitNono.setup();
         PetTeamActivity.setup();
         RubbishCommon.setup();
         OffLineExpSystem.setup();
         FightPrevManager.startFightPrev();
         DiluManager.setup();
         DreamMapManager.setup();
         DiamondTaskNewManager.setup();
         MiKaAndContractAct.setup();
         LeiYiWingFirstComeAct.setup();
         SLianYuAct.setup();
         PkKingCallAct.setup();
         EvilBodyAct.setup();
         NpcPosHandle.setup();
         ActivityAnniversaryParade.instance.setup();
         LihuaAct.init();
         BingyiteSuperAct.init();
         ItemManager.requestItemList(function():void
         {
            if(YiTeEndingGetInfo.getInstance().hasGetInfo == 0)
            {
               YiTeEndingGetInfo.getInstance().getRankInfo();
            }
         });
         finish();
         Logger.isDebug = false;
         if(Logger.isDebug)
         {
            LayerManager.stage.addEventListener("OverMaxSize",this.alertMaxSize);
         }
         this.mountRankToolSafe();
         this.setupGmailRefreshBridge();
      }
      
      protected function alertMaxSize(param1:SyncEvent) : void
      {
         var _loc2_:String = param1.changeList[0];
         AlertManager.showAlert("素材大小:" + param1.changeList[1] + "k\nurl:" + param1.changeList[0]);
      }
      
      public function refreshGmailPanel() : void
      {
         _scheduleGmailPanelRefresh(_currentReplaceValue);
      }
      
      public function replaceTestValue(newValue:int) : void
      {
         _scheduleReplaceTestValue(newValue);
      }
      
      private function setupGmailRefreshBridge() : void
      {
         try
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.addCallback("refreshGmailPanel",this.refreshGmailPanel);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function mountRankToolSafe() : void
      {
         _rankToolMounted = true;
      }
   }
}

